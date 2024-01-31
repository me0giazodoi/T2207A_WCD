package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import wcd.jpa.entities.Classes;
import wcd.jpa.entities.Student;
import wcd.jpa.entities.Subject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(value = "/edit-student")
public class StudentEditController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try{
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        List<Classes> classesList = new ArrayList<>();
        List<Subject> subjectList = new ArrayList<>();
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Student student = session.get(Student.class,Integer.parseInt(entityId));
            classesList = session.createQuery("FROM Classes",Classes.class).getResultList();
            subjectList = session.createQuery("FROM Subject", Subject.class).getResultList();
            session.getTransaction().commit();
            if (student != null){
                req.setAttribute("student",student);
                req.setAttribute("classes",classesList);
                req.setAttribute("subjectList",subjectList);
                req.getRequestDispatcher("student/editStudent.jsp").forward(req,resp);
            }else
                resp.setStatus(404);
        }catch (Exception e){
            resp.setStatus(404);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()){
            session.beginTransaction();
            Student student = session.get(Student.class,Integer.parseInt(entityId));
            if (student != null){
                student.setName(req.getParameter("name"));
                student.setEmail(req.getParameter("email"));
                student.setAddress(req.getParameter("address"));
                // find Classes
                int classID = Integer.parseInt(req.getParameter("class_id"));
                Classes c = session.find(Classes.class,classID);
                student.setClasses(c);
                // find subjects
                List<Integer> s_ids = Arrays.stream(req.getParameterValues("subject_id[]"))
                        .map(Integer::parseInt).collect(Collectors.toList());
                Query<Subject> query = session.createQuery("FROM Subject WHERE id IN (:ids)", Subject.class);
                query.setParameter("ids", s_ids);
                List<Subject> subjects = query.getResultList();
                student.setSubjects(subjects);

                //update to DB
                session.update(student);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-student");
        }catch (Exception e){
            resp.setStatus(404);
        }
    }
}
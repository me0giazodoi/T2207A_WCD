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
import wcd.jpa.entities.Employee;
import wcd.jpa.entities.Student;
import wcd.jpa.entities.Subject;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(value = "/edit-employee")
public class EmployeeEditController extends HttpServlet {
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
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Employee student = session.get(Employee.class,Integer.parseInt(entityId));
            session.getTransaction().commit();
            if (student != null){
                req.setAttribute("employee",student);
                req.getRequestDispatcher("employee/editEmployee.jsp").forward(req,resp);
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
            Employee employee = session.get(Employee.class,Integer.parseInt(entityId));
            if (employee != null){
                employee.setEmployee_name(req.getParameter("name"));
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                LocalDate birthday = LocalDate.parse(req.getParameter("birthday"), formatter);
                employee.setBirthday(java.sql.Date.valueOf(birthday));

                employee.setPhone_number(req.getParameter("phone_number"));
                employee.setEmail(req.getParameter("email"));
                session.update(employee);
            }
            session.getTransaction().commit();
            resp.sendRedirect("list-employee");
        }catch (Exception e){
            resp.setStatus(404);
        }
    }
}

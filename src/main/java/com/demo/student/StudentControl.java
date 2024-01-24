package com.demo.student;

import com.dao.StudentDAO;
import com.entities.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value ="/student")
public class StudentControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        //query students
        StudentDAO sd = new StudentDAO();
        List<Student> list = sd.get();
        req.setAttribute("students",list);

        RequestDispatcher dispatcher = req.getRequestDispatcher("student/list.jsp");
        dispatcher.forward(req,resp);
    }
}

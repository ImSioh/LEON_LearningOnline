/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ViewListExerciseController", urlPatterns = {"/teacher/class/exercise", "/student/class/exercise"})
public class ViewListExerciseController extends HttpServlet {

    ClassObjectDAO COD = new ClassObjectDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");
            String search = request.getParameter("search");

            ClassObject classObject = COD.getClassByCode(classCode);

            request.setAttribute("classObject", classObject);
            request.setAttribute("search", search);
            request.setAttribute("activeEX", "active");

            request.getRequestDispatcher("/view-list-exercise.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

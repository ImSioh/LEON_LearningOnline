/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.ClassObjectDAO;
import dao.TestDAO;
import dto.Account;
import dto.ClassObject;
import dto.Test;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet(name = "ViewListExerciseController", urlPatterns = {"/teacher/class/exercise", "/student/class/exercise"})
public class ViewListExerciseController extends HttpServlet {

    ClassObjectDAO COD = new ClassObjectDAO();
    TestDAO TD = new TestDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Account account = (Account) request.getAttribute("account");
            String classCode = request.getParameter("code");
            String search = request.getParameter("search");

            ClassObject classObject = COD.getClassByCode(classCode);
            UUID cid = classObject.getClassId();

            ArrayList<Test> viewTest = new ArrayList<>();
            viewTest = TD.viewListTest(cid);

            for (Test test : viewTest) {
                if (test.getDescription().length() > 30) {
                    test.setDescription(test.getDescription().substring(0, 30) + "...");
                }
            }

            request.setAttribute("classObject", classObject);
            request.setAttribute("search", search);
            request.setAttribute("activeEX", "active");
            request.setAttribute("listExercise", viewTest);

            if (account.getRole() == 1) {
                request.setAttribute("teacher", account);
            }

            request.getRequestDispatcher("/view-list-exercise.jsp").forward(request, response);
        } catch (Exception e) {
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}

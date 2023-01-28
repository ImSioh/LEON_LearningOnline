/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import helpers.FormValidator;
import helpers.Util;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Anh
 */
@WebServlet(name = "JoinClassController", urlPatterns = {"/join"})
public class JoinClassController extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        req.getRequestDispatcher("/student/Enter_ClassCode.jsp").forward(req, resp);
        
    }
       

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        String code = req.getParameter("classCode");
//        ArrayList<ClassObject> classObj = new ClassObjectDAO().getListClassByAccId(id);
//        for (ClassObject CO : classObj) {
//            if(CO.getCode() == code) {
                req.getRequestDispatcher("/student/InsideClass_S.jsp").forward(req, resp);
//            }
//        }
        
    }



}

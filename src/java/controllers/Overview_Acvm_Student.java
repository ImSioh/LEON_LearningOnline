
package controllers;

import dao.ClassObjectDAO;
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


@WebServlet(name = "Overview_Acvm_Student", urlPatterns = {"/overview-achievement"})
public class Overview_Acvm_Student extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        ArrayList<ClassObject> classObj = new ClassObjectDAO().getListClassByAccId(id);
//        req.setAttribute("classObjList", classObj);
        req.getRequestDispatcher("student/AchievementS.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
    }



}

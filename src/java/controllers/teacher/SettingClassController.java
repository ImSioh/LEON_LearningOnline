package controllers.teacher;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.EnrollmentDAO;
import dto.Account;
import dto.ClassObject;
import helpers.FormValidator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SettingClassInfo", urlPatterns = {"/teacher/class/setting"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 15
)
public class SettingClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String classCode = req.getParameter("code");
        try {
            Account account = (Account) req.getAttribute("account");
            ClassObject classobj = new ClassObjectDAO().getClassByCode(classCode);
            if (!account.getAccountId().equals(classobj.getAccountId())) {
                resp.sendRedirect(req.getContextPath());
                return;
            }
            req.setAttribute("classObject", classobj);
            req.setAttribute("activeST", "active");
            if (account.getRole() == 1) {
                req.setAttribute("teacher", account);
            } else {
                req.setAttribute("teacher", new AccountDAO().getAccountById(classobj.getAccountId()));
            }
            req.getRequestDispatcher("/teacher/setting.jsp").forward(req, resp);
        } catch (Exception ex) {
            Logger.getLogger(SettingClassController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 
        Account account = (Account) req.getAttribute("account");

        String classCode = req.getParameter("code");

        Part classPicture = req.getPart("txtImg2");
        boolean txtStudentApprove = "on".equalsIgnoreCase(req.getParameter("txtStudentApprove"));
        boolean txtHideClass = "on".equalsIgnoreCase(req.getParameter("txtHideClass"));
        String name = req.getParameter("txtName");
        // picture
        FormValidator formValidator = new FormValidator(req);
        boolean validForm = formValidator.isValid();
        if (classPicture.getSize() > 5 * 1024 * 1024) {
            validForm = false;
            req.setAttribute("class_picture-error", "File size must be less than 5 Mb");
        }

        try {
            ClassObject classobj = new ClassObjectDAO().getClassByCode(classCode);

            ClassObject clob = new ClassObject();

            String urlToDB = null;
            if (classPicture.getSize() > 0) {
                String fileName = classPicture.getSubmittedFileName();
                String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                String urlImg = "/class/" + classobj.getClassId().toString() + fileExtension;
                classPicture.write(System.getProperty("leon.updir") + urlImg);
                urlToDB = "/files" + urlImg;
                if (fileExtension != null
                        && (fileExtension.equalsIgnoreCase(".jpg")
                        || fileExtension.equalsIgnoreCase(".jpeg")
                        || fileExtension.equalsIgnoreCase(".png"))) {
                    clob.setClassPicture(urlToDB);
                }

            } else {
                clob.setClassPicture(classobj.getClassPicture());
            }

            clob.setAccountId(account.getAccountId());
            clob.setClassId(classobj.getClassId());
            clob.setCode(classCode);
            clob.setCreateTime(classobj.getCreateTime());
            if (txtStudentApprove == true) {
                clob.setEnrollApprove(true);
            } else {
                clob.setEnrollApprove(false);
                int updateErm = new EnrollmentDAO().updateEnrollment(classobj.getClassId());
            }

            if (txtHideClass == true) {
                clob.setHidden(true);
            } else {
                clob.setHidden(false);
            }

            if ((name.trim().equals(""))) {
                clob.setName(classobj.getName());
            } else {
                clob.setName(name);
            }
            if (account.getRole() == 1) {
                req.setAttribute("teacher", account);
            } else {
                req.setAttribute("teacher", new AccountDAO().getAccountById(classobj.getAccountId()));
            }
            int clo = new ClassObjectDAO().updateClass(clob);
            req.setAttribute("classObject", classobj);
//            req.getRequestDispatcher("/newfeed.jsp").forward(req, resp);
            resp.sendRedirect(req.getContextPath() + "/teacher/class/newfeed?code=" + classCode);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        // checkbox 

    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dao.AccountDAO;
import dto.Account;
import helpers.FormValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


@WebServlet(name = "EditProfileController", urlPatterns = {"/student/profile/edit", "/teacher/profile/edit"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 15
)
public class EditProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            Part profilePicture = request.getPart("txtImg");
            AccountDAO accountDAO = new AccountDAO();
            FormValidator formValidator = new FormValidator(request);
            Account account = (Account) request.getAttribute("account");

            formValidator.setCheckParam(
                    "txtName",
                    true,
                    String.class,
                    a -> a.length() <= (40),
                    "Please enter no more than 40 characters"
            );

            formValidator.setCheckParam(
                    "txtBD",
                    false,
                    Date.class,
                    (a, b) -> ((Date) b).before(new Date(System.currentTimeMillis())),
                    "Birth of date must before present"
            );

            formValidator.setCheckParam("txtAddress", false, String.class);

            formValidator.setCheckParam("txtSchool", false, String.class);
            
            formValidator.setCheckParam(
                    "txtPhone",
                    false,
                    String.class,
                    a -> a.matches("^(84|0[3|5|7|8|9])+([0-9]{8})$"),
                    "Invalid phone number"
            );
            formValidator.addCheckFunction(
                    "txtPhone",
                    (a, b) -> {
                        try {
                            if (a.equals(account.getPhoneNumber())) {
                                return true;
                            } else {
                                return accountDAO.getAccountByPhone(a) == null;
                            }
                        } catch (Exception e) {
                        }
                        return false;
                    },
                    "Account with phone number %txtPhone% is existed"
            );

            boolean validForm = formValidator.isValid();
            if (profilePicture.getSize() > 5 * 1024 * 1024) {
                validForm = false;
            }

            if (validForm) {
                String name = (String) formValidator.get("txtName");
                Date dob = (Date) formValidator.get("txtBD");
                String address = (String) formValidator.get("txtAddress");
                String school = (String) formValidator.get("txtSchool");
                String phoneNumber = (String) formValidator.get("txtPhone");
//                boolean gender = ((String) formValidator.get("gender")).equalsIgnoreCase("male");
                boolean gender = Boolean.parseBoolean(request.getParameter("txtGender"));

                if (phoneNumber.trim().isEmpty()) {
                    phoneNumber = null;
                }

                account.setName(name);
                account.setPhoneNumber(phoneNumber);
                account.setBirthDate(dob);
                account.setAddress(address);
                account.setSchool(school);
                account.setGender(gender);

                String urlToDB = null;
                if (profilePicture.getSize() > 0) {
                    String fileName = profilePicture.getSubmittedFileName();
                    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
                    String urlImg = "/profile/" + account.getAccountId().toString() + fileExtension;
                    profilePicture.write(System.getProperty("leon.updir") + urlImg);
                    urlToDB = "/files" + urlImg;
                    account.setProfilePicture(urlToDB);
                }

                int status = new AccountDAO().editAccount(account);

                if (status > 0) {
                    if (account.getRole() == 1) {
                        response.sendRedirect(request.getContextPath() + "/teacher/profile");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/student/profile");
                    }

                } else {
                    validForm = false;
                }

            }
            if (!validForm) {
                request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(EditProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

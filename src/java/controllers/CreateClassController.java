package controllers;

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
import java.sql.Timestamp;
import java.util.UUID;

@WebServlet(name = "CreateClassController", urlPatterns = {"/teacher/class/create"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 15
)
public class CreateClassController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/teacher/create-class.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            FormValidator formValidator = new FormValidator(req);
            formValidator.setCheckParam("name", true, String.class);
            formValidator.setCheckParam("enroll_approve", true, Boolean.class);
            boolean validForm = formValidator.isValid();

            Part classPicture = null;
            String classPictureFileName = null;
            String classPictureExtension = null;
            if (validForm) {
                classPicture = req.getPart("class_picture");
                if (classPicture != null) {
                    classPictureFileName = classPicture.getSubmittedFileName();
                    try {
                        classPictureExtension = classPictureFileName.substring(classPictureFileName.lastIndexOf("."));
                    } catch (Exception e) {
                        classPictureExtension = null;
                    }
                    
                    if (classPicture.getSize() > (1024 * 1024 * 5)) {
                        validForm = false;
                        req.setAttribute("class_picture-error", "File size must be less than 5 Mb");
                    }
                    
                    if (classPictureExtension == null
                            || !(classPictureExtension.equalsIgnoreCase(".jpg")
                            || classPictureExtension.equalsIgnoreCase(".jpeg")
                            || classPictureExtension.equalsIgnoreCase(".png"))) {
                        validForm = false;
                        req.setAttribute("class_picture-error", "Class picture must be .jpg .jpeg .png");
                    }
                }
            }

            if (validForm) {
                String classPicturePath = null;
                UUID classId = UUID.randomUUID();
                if (classPicture != null) {
                    classPicturePath = "/class/" + classId.toString() + classPictureExtension;
                    String fullPart = System.getProperty("leon.updir") + classPicturePath;
                    classPicture.write(fullPart);
                }
                ClassObject classObject = new ClassObject(
                        classId,
                        account.getAccountId(),
                        (String) formValidator.get("name"),
                        "",
                        (boolean) formValidator.get("enroll_approve"),
                        classPicturePath,
                        false,
                        new Timestamp(System.currentTimeMillis())
                );
                System.out.println(classObject);
            }
        } catch (IOException e) {
            throw new IOException(e);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

}

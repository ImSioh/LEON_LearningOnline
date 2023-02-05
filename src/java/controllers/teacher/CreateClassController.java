package controllers.teacher;

import dao.ClassObjectDAO;
import dto.Account;
import dto.ClassObject;
import helpers.FormValidator;
import helpers.Util;
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

            Part classPicture = req.getPart("class_picture");
            String classPictureExtension = null;
            long classPictureSize = classPicture.getSize();
            
            if (validForm && classPictureSize > 0) {
                try {
                    String classPictureFileName = classPicture.getSubmittedFileName();
                    classPictureExtension = classPictureFileName.substring(classPictureFileName.lastIndexOf("."));
                    if (classPictureExtension == null
                            || !(classPictureExtension.equalsIgnoreCase(".jpg")
                            || classPictureExtension.equalsIgnoreCase(".jpeg")
                            || classPictureExtension.equalsIgnoreCase(".png"))) {
                        validForm = false;
                        req.setAttribute("class_picture-error", "Class picture must be .jpg .jpeg .png");
                    }
                } catch (Exception e) {
                    classPictureExtension = null;
                }
            }
            
            if (validForm && classPictureSize > (1024 * 1024 * 5)) {
                validForm = false;
                req.setAttribute("class_picture-error", "File size must be less than 5 Mb");
            }

            if (validForm) {
                UUID classId = UUID.randomUUID();
                String classPictureUrl = null;

                if (classPictureSize > 0) {
                    String classPictureNewPath = "/class/" + classId.toString() + classPictureExtension;
                    classPictureUrl = "/files" + classPictureNewPath;
                    String fullPart = System.getProperty("leon.updir") + classPictureNewPath;
                    classPicture.write(fullPart);
                }
                
                ClassObjectDAO classObjectDAO = new ClassObjectDAO();
                String classCode = null;
                do {                    
                    classCode = Util.randomString(5).toUpperCase();
                } while (classObjectDAO.isCodeExist(classCode));

                ClassObject classObject = new ClassObject(
                        classId,
                        account.getAccountId(),
                        (String) formValidator.get("name"),
                        classCode,
                        (boolean) formValidator.get("enroll_approve"),
                        classPictureUrl,
                        false,
                        new Timestamp(System.currentTimeMillis())
                );
                
                int result = classObjectDAO.insertClass(classObject);
                if (result > 0) {
                    resp.sendRedirect(req.getContextPath() + "/teacher/class/" + classCode + "/newfeed");
                } else {
                    resp.sendError(500);
                }
            } else {
                req.getRequestDispatcher("/teacher/create-class.jsp").forward(req, resp);
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw new IOException(e);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

}

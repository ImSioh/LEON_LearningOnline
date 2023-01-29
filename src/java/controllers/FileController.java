package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;

@WebServlet(name="FileController", urlPatterns={"/files/*"})
public class FileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String relativePath = req.getPathInfo();
        if (relativePath == null || !relativePath.matches("^\\/(class|profile|resource|thumbnail)\\/[^\\/]+$")) {
            resp.sendError(404, "Files not found");
            return;
        }
        
        String upDir = System.getProperty("leon.updir");
        File file = new File(upDir + relativePath);
        if (!file.isFile()) {
            resp.sendError(404, "Files not found");
            return;
        }
        
        String mimeType = req.getServletContext().getMimeType(file.getAbsolutePath());
        resp.setContentType(mimeType != null ? mimeType : "application/octet-stream");
        resp.setContentLength((int) file.length());
        
        FileInputStream fileInputStream = new FileInputStream(file);
        ServletOutputStream servletOutputStream = resp.getOutputStream();
        byte[] bufferData = new byte[1024];
        int read=0;
        while((read = fileInputStream.read(bufferData))!= -1){
            servletOutputStream.write(bufferData, 0, read);
        }
        servletOutputStream.flush();
        servletOutputStream.close();
        fileInputStream.close();
    }
    
}

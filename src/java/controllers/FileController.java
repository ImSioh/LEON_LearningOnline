package controllers;

import com.google.gson.Gson;
import dao.ResourceDAO;
import dto.Account;
import dto.Resource;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.UUID;
import javax.imageio.ImageIO;

@WebServlet(name = "FileController", urlPatterns = {"/files/*"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1)
public class FileController extends HttpServlet {

    private static final int BUFFER_SIZE = 10240;
    private static final String MULTIPART_BOUNDARY = "MULTIPART_BYTERANGES";
    private static ArrayList<String> rasterType = new ArrayList<>();
    private static final int THUMBNAIL_SIZE = 150;

    @Override
    public void init() throws ServletException {
        rasterType.add("image/png");
        rasterType.add("image/jpeg");
        rasterType.add("image/bmp");
        rasterType.add("image/tiff");
        rasterType.add("image/webp");
        rasterType.add("image/avif");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Account account = (Account) req.getAttribute("account");
            if (account == null) {
                throw new ServletException();
            }
            Part part = req.getPart("file");

            String fileName = part.getSubmittedFileName().replaceAll("[#\"\\\\\\/:|<>*?]+", "");
            UUID resourceId = UUID.randomUUID();
            String relativePath = "/resource/" + resourceId.toString() + "/" + fileName;
            String fileUrl = "/files" + relativePath;
            String savePath = System.getProperty("leon.updir") + relativePath;
            System.out.println(part.getContentType());
            new File(System.getProperty("leon.updir") + "/resource/" + resourceId.toString()).mkdirs();
            part.write(savePath);

            String mimeType = part.getContentType();
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }
            Resource resource = new Resource(resourceId, account.getAccountId(), fileUrl, null, mimeType, false);

            if (rasterType.contains(part.getContentType())) {
                BufferedImage resizedImg = resizeImage(new File(savePath));
                if (resizedImg != null) {
                    String thumbnailPath = "/thumbnail/" + resourceId.toString() + "/" + fileName;
                    new File(System.getProperty("leon.updir") + "/thumbnail/" + resourceId.toString()).mkdirs();
                    ImageIO.write(resizedImg, fileName.substring(fileName.lastIndexOf('.') + 1), new File(System.getProperty("leon.updir") + thumbnailPath));
                    resource.setThumbnail("/files" + thumbnailPath);
                }
            }
            int result = new ResourceDAO().setResource(resource);
            if (result > 0) {
                resp.setContentType("application/json");
                resp.setCharacterEncoding("utf-8");
                Gson gson = new Gson();
                resp.getWriter().print(gson.toJson(resource));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    private BufferedImage resizeImage(File file) throws IOException {
        try {
            BufferedImage img = ImageIO.read(file);
            int width = img.getWidth();
            int height = img.getHeight();
            if (height > width) {
                width = width * THUMBNAIL_SIZE / height;
                height = THUMBNAIL_SIZE;
            } else {
                height = height * THUMBNAIL_SIZE / width;
                width = THUMBNAIL_SIZE;
            }
            BufferedImage scaledImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            scaledImg.createGraphics().drawImage(img.getScaledInstance(width, height, Image.SCALE_FAST), 0, 0, null);
            return scaledImg;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String relativePath = req.getPathInfo();
        if (relativePath == null || !relativePath.matches("^\\/(class|profile|resource|thumbnail)\\/.+$")) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Files not found");
            return;
        }

        String upDir = System.getProperty("leon.updir");
        File file = new File(upDir + relativePath);
        if (!file.isFile()) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Files not found");
            return;
        }

        long fileLength = file.length();
        Range fullRange = new Range(0, fileLength - 1);
        ArrayList<Range> ranges = new ArrayList<>();

        String rangeHeader = req.getHeader("Range");
        if (rangeHeader != null) {
            if (!rangeHeader.matches("^bytes=\\d*-\\d*(,\\d*-\\d*)*$")) {
                resp.setHeader("Content-Range", "bytes */" + fileLength);
                resp.sendError(HttpServletResponse.SC_REQUESTED_RANGE_NOT_SATISFIABLE, "Wrong range header format");
                return;
            }

            String[] reqRanges = rangeHeader.substring(6).split(",");
            for (String reqRange : reqRanges) {
                long start = convertLong(reqRange.substring(0, reqRange.indexOf("-")));
                long end = convertLong(reqRange.substring(reqRange.indexOf("-") + 1, reqRange.length()));

                if (start == -1) {
                    start = fileLength - end;
                    end = fileLength - 1;
                } else if (end == -1 || end > fileLength - 1) {
                    end = fileLength - 1;
                }

                if (start > end) {
                    resp.setHeader("Content-Range", "bytes */" + fileLength);
                    resp.sendError(HttpServletResponse.SC_REQUESTED_RANGE_NOT_SATISFIABLE, "Wrong range header format");
                    return;
                }

                ranges.add(new Range(start, end));
            }
        }

        if (ranges.size() == 0) {
            ranges.add(fullRange);
        }

        String mimeType = req.getServletContext().getMimeType(file.getAbsolutePath());

        RandomAccessFile randomAccessFile = new RandomAccessFile(file, "r");
        ServletOutputStream servletOutputStream = resp.getOutputStream();

        try {
            if (ranges.size() == 1) {
                Range range = ranges.get(0);

                if (range == fullRange) {
                    resp.setContentType(mimeType != null ? mimeType : "application/octet-stream");
                } else {
                    resp.setHeader("Content-Range", "bytes " + range.start + "-" + range.end + "/" + fileLength);
                    resp.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
                }

                resp.setContentLengthLong(fileLength);
                writeFileData(randomAccessFile, servletOutputStream, range);
            } else {
                resp.setContentType("multipart/byteranges; boundary=" + MULTIPART_BOUNDARY);
                resp.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);

                for (Range range : ranges) {
                    writeFileData(randomAccessFile, servletOutputStream, range);
                }
            }
        } catch (Exception e) {
        } finally {
            servletOutputStream.flush();
            servletOutputStream.close();
            randomAccessFile.close();
        }
    }

    private static void writeFileData(RandomAccessFile randomAccessFile, ServletOutputStream servletOutputStream, Range range) throws Exception {
        byte[] bufferData = new byte[BUFFER_SIZE];
        int read = 0;

        if (randomAccessFile.length() == range.length) {
            while ((read = randomAccessFile.read(bufferData)) != -1) {
                servletOutputStream.write(bufferData, 0, read);
            }
        } else {
            randomAccessFile.seek(range.start);
            long remain = range.length;

            while ((read = randomAccessFile.read(bufferData)) != -1) {
                if (remain > read) {
                    servletOutputStream.write(bufferData, 0, read);
                } else {
                    servletOutputStream.write(bufferData, 0, (int) remain);
                    break;
                }
                remain -= read;
            }
        }
    }

    private static long convertLong(String str) {
        return str.isEmpty() ? -1 : Long.parseLong(str);
    }

    private class Range {

        long start;
        long end;
        long length;

        public Range(long start, long end) {
            this.start = start;
            this.end = end;
            this.length = end - start + 1;
        }
    }

}

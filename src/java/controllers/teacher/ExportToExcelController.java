package controllers.teacher;


import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.DoTestDAO;
import dao.EnrollmentDAO;
import dao.TestDAO;
import dto.Account;

import dto.ClassObject;
import dto.DoTest;
import dto.Enrollment;
import dto.Test;
import helpers.FormValidator;
import helpers.Util;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.util.ArrayList;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Workbook;


@WebServlet(name="ExportToExcelController", urlPatterns={"/teacher/class/export"})
public class ExportToExcelController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
    try {
            String classCode = req.getParameter("code");

            ClassObject classobj2 = new ClassObjectDAO().getClassByCode(classCode);
            ArrayList<Test> t = new TestDAO().getListTitle(classobj2.getClassId());
            ArrayList<Account> aa = new AccountDAO().getListStudentByCode(classCode);
            ArrayList<DoTest> dtt = new ArrayList<>();
            
            resp.setContentType("application/vnd.ms-excel");
            resp.setHeader("Content-Disposition", "attachment;filename=ListScoreInClass.xls");
            
            HSSFWorkbook workbook = new HSSFWorkbook();            
            HSSFSheet sheet = workbook.createSheet("Score");

            int rowNo = 0;
            int cellnum = 0;

            //name cell 1
            HSSFRow rowhead = sheet.createRow(rowNo++);
            HSSFCell cell = rowhead.createCell(cellnum);
            cell.setCellValue("Name");
            cellnum++;
            
            //name cell 2 ->
            for (Test tt : t) {
                cell = rowhead.createCell(cellnum++);
                cell.setCellValue(tt.getTitle());
            }

            for (Account a : aa) {
                //data of cell 1
                cellnum = 0;
                rowhead = sheet.createRow(rowNo++);
                cell = rowhead.createCell(cellnum++);
                cell.setCellValue(a.getName());
                
                // data of cell 2 ->
                dtt = new DoTestDAO().getListDoTest(classobj2.getClassId(), a.getAccountId());                
                for (DoTest dttt : dtt) {                   
                    cell = rowhead.createCell(cellnum++);
                    cell.setCellValue(dttt.getScore());
                }
            }

            workbook.write(resp.getOutputStream());
            workbook.close();
            return;
        } catch (Exception e) {
        }
    } 

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        
    }


}

package controllers.teacher;

import dao.AccountDAO;
import dao.ClassObjectDAO;
import dao.DoTestDAO;
import dao.TestDAO;
import dto.Account;

import dto.ClassObject;
import dto.DoTest;
import dto.Test;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

@WebServlet(name = "ExportToExcelController", urlPatterns = {"/teacher/class/export"})
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

            // biểu thị sự hiện diện của Microsoft Excel
            // vnd : câu trúc nhà cung câp -> sanpham duoc cong khai
            // application : kieu chinh , sau dau / la kieu phu : ms-excel
            resp.setContentType("application/vnd.ms-excel");
            //tieu de phan hoi - duoi dang tep tin dinh kem
            resp.setHeader("Content-Disposition", "attachment;filename=ListScore.xlsx");          

            Workbook workbook = new XSSFWorkbook();           
            //create sheet name
            Sheet sheet = workbook.createSheet("Score");           

            int rowNo = 0;
            int cellnum = 0;

            //name cell 1
            Row rowhead = sheet.createRow(rowNo++);
            Cell cell = rowhead.createCell(cellnum);
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
                dtt = new DoTestDAO().getListDoTestByAIdAndCId(classobj2.getClassId(), a.getAccountId());
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

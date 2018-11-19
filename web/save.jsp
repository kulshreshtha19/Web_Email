<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet" %><%--
  Created by IntelliJ IDEA.
  User: Radhey Jangid
  Date: 31-10-2018
  Time: 01:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    private static Workbook wb;
    private static Sheet sh;
    private static FileInputStream fis;
    private static FileOutputStream fos;
    private static Row row;
    private static Cell cell;
%>
<%

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    out.println(username);
    FileInputStream inputStream=new FileInputStream(new File("E:\\Email_web\\value.xlsx"));
    Workbook workbook=  WorkbookFactory.create(inputStream);
    Sheet sheet=workbook.getSheetAt(0);
    int rowcount=sheet.getLastRowNum();
    Row row=sheet.createRow(++rowcount);
    int columncount=0;

    Cell cell=row.createCell(columncount);
    cell.setCellValue(rowcount);

    Cell cell1=row.createCell(++columncount);
    cell1.setCellValue(username);

    Cell cell2=row.createCell(++columncount);
    cell2.setCellValue(email);

    Cell cell3=row.createCell(++columncount);
    cell3.setCellValue(password);

      /*String time=new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
      Cell cell4=row.createCell(++columncount);
      cell4.setCellValue(time);*/

    inputStream.close();

    FileOutputStream outputStream=new FileOutputStream(new File("E:\\Email_web\\value.xlsx"));
    workbook.write(outputStream);
    outputStream.close();



%>


<%
    /*fis =new FileInputStream("f:\\email\\username.xlsx");
    wb = WorkbookFactory.create(fis);
    sh = wb.getSheet("Employee");
    int noOfRows = sh.getLastRowNum();
    System.out.println(noOfRows);*/

        /*row = sh.createRow(1);
        cell = row.createCell(0);*/

    String sheetname = request.getParameter("username");

        XSSFWorkbook workbook00 = new XSSFWorkbook();

      XSSFSheet spreadsheet = workbook00.createSheet("Employee Info");
      FileOutputStream output = new FileOutputStream(new File("E:\\Email_web\\"+sheetname+".xlsx"));
      workbook00.write(output);
      output.close();


    FileInputStream inputStream0=new FileInputStream(new File("E:\\Email_web\\"+sheetname+".xlsx"));
    XSSFWorkbook workbook0= (XSSFWorkbook) WorkbookFactory.create(inputStream0);
    Sheet sheet0=workbook0.getSheetAt(0);
    int rowcount0=sheet0.getLastRowNum();
    Row row0=sheet0.createRow(rowcount0);
    int columncount0=0;

    Cell cell0=row0.createCell(columncount0);
    cell0.setCellValue("s no");

    Cell cell01=row0.createCell(++columncount0);
    cell01.setCellValue("from");

    Cell cell02=row0.createCell(++columncount0);
    cell02.setCellValue("subject");

    Cell cell03=row0.createCell(++columncount0);
    cell03.setCellValue("body");

    //String time=new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
    Cell cell04=row0.createCell(++columncount0);
    cell04.setCellValue("time");
    inputStream0.close();

    FileOutputStream outputStream0=new FileOutputStream(new File("E:\\Email_web\\"+sheetname+".xlsx"));
    workbook0.write(outputStream0);
    outputStream0.close();
    response.sendRedirect("http://localhost:8080/index.jsp");
%>

</body>
</html>

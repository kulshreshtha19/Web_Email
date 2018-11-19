<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.poi.ss.usermodel.Sheet" %>
<%@ page import="org.apache.poi.ss.usermodel.Row" %>
<%@ page import="org.apache.poi.ss.usermodel.Cell" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>save</title>
</head>
<body>
<%
    String from =request.getParameter("user");
    String to=request.getParameter("to");
    String subject=request.getParameter("subject");
    String body=request.getParameter("body");

    FileInputStream inputStream=new FileInputStream(new File("E:\\Email_web\\"+to+".xlsx"));
      XSSFWorkbook workbook= (XSSFWorkbook) WorkbookFactory.create(inputStream);
      Sheet sheet=workbook.getSheetAt(0);
      int rowcount=sheet.getLastRowNum();
      Row row=sheet.createRow(++rowcount);
      int columncount=0;

      Cell cell=row.createCell(columncount);
      cell.setCellValue(rowcount);

      Cell cell1=row.createCell(++columncount);
      cell1.setCellValue(from);

      Cell cell2=row.createCell(++columncount);
      cell2.setCellValue(subject);

      Cell cell3=row.createCell(++columncount);
      cell3.setCellValue(body);

      String time=new SimpleDateFormat("dd/MM/yyyy HH.mm.ss").format(new Date());
      Cell cell4=row.createCell(++columncount);
      cell4.setCellValue(time);

      inputStream.close();

      FileOutputStream outputStream=new FileOutputStream(new File("E:\\Email_web\\"+to+".xlsx"));
      workbook.write(outputStream);
      outputStream.close();
      response.sendRedirect("http://localhost:8080/inbox.jsp?user="+request.getParameter("user"));
%>
</body>
</html>

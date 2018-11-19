<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFRow" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFCell" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: Radhey Jangid
  Date: 02-11-2018
  Time: 01:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    private static Row row;
    private static Cell cell;

%>

<%

    String user = request.getParameter("emailid");
    String typePassword = request.getParameter("typePassword");

    String excelFilePath = "E:\\Email_web\\value.xlsx";
    FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

    Workbook workbook = new XSSFWorkbook(inputStream);
    Sheet firstSheet = workbook.getSheetAt(0);
    Iterator<Row> iterator = firstSheet.iterator();
    ArrayList<String> username=new ArrayList<>();
    ArrayList<String> password=new ArrayList<>();

    while (iterator.hasNext()) {
        Row nextRow = iterator.next();
        Iterator<Cell> cellIterator = nextRow.cellIterator();

        while (cellIterator.hasNext()) {
            Cell cell = cellIterator.next();

            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_STRING:
                    if(cell.getColumnIndex()==1 && !cell.getStringCellValue().equals("username"))
                    {
                        username.add(cell.getStringCellValue());
                    }

                    else if(cell.getColumnIndex()==3 && !cell.getStringCellValue().equals("password")){
                        password.add(cell.getStringCellValue());
                    }
                    break;
            }
        }
    }

    inputStream.close();
//    out.println(user);
//    out.println(typePassword);
//    out.println(username.get(1));
//    out.println(password.get(1));

    boolean flag=false;
    for(int i=0;i<username.size();i++)
    {
        if(user.equals(username.get(i)) && typePassword.equals(password.get(i))) {
            HttpSession session1=request.getSession();
            session1.setAttribute("username",user);
            response.sendRedirect("http://localhost:8080/inbox.jsp?user="+user);
            flag=true;
            break;
        }
    }

    if(flag==false)
    {
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

        out.println("<font color=red>Either user name or password is wrong.</font>");

        rd.include(request, response);
    }
%>
</body>
</html>

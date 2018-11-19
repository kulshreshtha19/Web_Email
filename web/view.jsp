<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import="org.apache.poi.ss.usermodel.Sheet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://select2.github.io/dist/css/select2.min.css" rel="stylesheet">
    <script src="https://select2.github.io/dist/js/select2.full.js"></script>
</head>
<body>
    <%
        if(session.getAttribute("username")==null)
        {
            response.sendRedirect("index.jsp");
        }


        else {
        int value=Integer.parseInt(request.getParameter("Name"));
        String user=request.getParameter("username");
        FileInputStream inputStream=new FileInputStream(new File("E:\\Email_web\\"+user+".xlsx"));
        XSSFWorkbook workbook=(XSSFWorkbook)WorkbookFactory.create(inputStream);
        Sheet sheet=workbook.getSheetAt(0);
    %>
    <div class="container" style="margin-top: 50px;margin-left: 17%">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body message">
                    <p class="text-center" style="font-weight: bold"><%= sheet.getRow(value).getCell(1)%> on <%= sheet.getRow(value).getCell(4)%></p>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="cc" class="col-sm-1 control-label">subject:</label>
                            <div class="col-sm-11">
                                <input type="text" class="form-control select2-offscreen" id="cc" placeholder="Subject" tabindex="-1" name="subject" value="<%= sheet.getRow(value).getCell(2)%>" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="message" name="body" rows="12" disabled><%= sheet.getRow(value).getCell(3)%></textarea>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
</body>
</html>
<%}%>
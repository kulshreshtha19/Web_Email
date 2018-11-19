<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.ss.usermodel.Sheet" %>
<%@ page import="org.apache.poi.ss.usermodel.WorkbookFactory" %>
<%@ page import="org.apache.poi.ss.usermodel.Row" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFRow" %>
<%@ page import="org.apache.poi.ss.usermodel.Cell" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="inbox.css">

<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");

    if(session.getAttribute("username")==null)
    {
        response.sendRedirect("index.jsp");
    }

    else {
        String userv=request.getParameter("user");
        FileInputStream inputStream=new FileInputStream(new File("E:\\Email_web\\"+userv+".xlsx"));
        XSSFWorkbook workbook= (XSSFWorkbook) WorkbookFactory.create(inputStream);
        Sheet sheet=workbook.getSheetAt(0);
        int rowcount=sheet.getLastRowNum();
        Iterator<Row> rowIterator=sheet.iterator();
        ArrayList<String> from=new ArrayList<>();
        ArrayList<String> sub=new ArrayList<>();
        ArrayList<String> body=new ArrayList<>();
        ArrayList<String> time=new ArrayList<>();
        XSSFRow row;

        while (rowIterator.hasNext()){
            row=(XSSFRow)rowIterator.next();
            Iterator<Cell> cellIterable=row.cellIterator();
            while (cellIterable.hasNext()){
                Cell cell=cellIterable.next();
                switch (cell.getCellType()) {
                    case Cell.CELL_TYPE_STRING:
                        if(cell.getColumnIndex()==1 && !cell.getStringCellValue().equals("from")) {
                            from.add(cell.getStringCellValue());
                        }

                        else if (cell.getColumnIndex()==2 && !cell.getStringCellValue().equals("subject")){
                            sub.add(cell.getStringCellValue());
                        }

                        else if (cell.getColumnIndex()==3 && !cell.getStringCellValue().equals("body")){
                            body.add(cell.getStringCellValue());
                        }

                        else if (cell.getColumnIndex()==4 && !cell.getStringCellValue().equals("time")){
                            time.add(cell.getStringCellValue());
                        }

                        break;
                }
            }

        }
%>
<div class="container">
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
    <div class="mail-box">
        <aside class="sm-side">
            <div class="user-head">
                <div class="user-name">
                    <h5>Welcome <a href="#"></a><%= userv%>!</h5>
                </div>
                <a class="mail-dropdown pull-right" href="javascript:;">
                    <i class="fa fa-chevron-down"></i>
                </a>
            </div>
            <div class="inbox-body">
                <a href="compose.jsp?user=<%= userv%>" data-toggle="modal"  title="Compose" class="btn btn-compose">
                    Compose
                </a>
            </div>
            <ul class="inbox-nav inbox-divider">
                <li class="active">
                    <a href="#"><i class="fa fa-inbox"></i> Inbox <span class="label label-danger pull-right"><%= rowcount%></span></a>
                </li>
            </ul>
        </aside>
        <aside class="lg-side">
            <div class="inbox-head">
                <h3>Inbox</h3>
                <div style="margin-left: 740px; position: relative;">
                    <form action="Logout" method="post">
                        <button style="text-align: right;" type="submit" value="Logout" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-log-out"></span> Log out
                        </button>
                        <%--<input type="submit" value="Logout">--%>
                    </form>
                </div>
            </div>
            <div class="inbox-body">
                <table class="table table-inbox table-hover">
                    <tbody>
                    <% for(int i=0;i<rowcount;i++){ %>
                    <tr class="unread" onclick="JavaScript:window.location='view.jsp?Name='+ <%= rowcount-i%>+'&username=<%=userv%>'">
                        <td class="view-message  dont-show"><%= from.get(rowcount-i-1)%></td>
                        <td class="view-message "><%= sub.get(rowcount-i-1)%></td>
                        <td class="view-message  text-right"><%= time.get(rowcount-i-1)%></td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </aside>
    </div>
</div>
<%}%>
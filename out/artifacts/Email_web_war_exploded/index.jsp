<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFSheet" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Login</title>
    <style>
    form {
    margin:0 auto;
    width:300px
    }
    input {
    margin-bottom:3px;
    padding:10px;
    width: 100%;
    border:1px solid #CCC
    }
    button {
    padding:10px
    }
    label {
    cursor:pointer
    }
    #form-switch {
    display:none
    }
    #register-form {
    display:none
    }
    #form-switch:checked~#register-form {
    display:block
    }
    #form-switch:checked~#login-form {
    display:none
    }
    </style>
  </head>
  <body>
  <input type='checkbox' id='form-switch'>
  <form id='login-form' action="search.jsp" method='post'>
    <input type="text" name="emailid" placeholder="Username" required>
    <input type="password" name="typePassword" placeholder="Password" required>
    <input type='submit'>
    <label for='form-switch'><span>Register</span></label>
  </form>
  <form id='register-form' action="save.jsp" method='post'>
    <input type="text" name="username" placeholder="Username" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="password" name="repassword" placeholder="Re Password" required>
    <input onclick="" type="submit">


    <label for='form-switch'>Already Member ? Sign In Now..</label>
  </form>
  </body>
</html>

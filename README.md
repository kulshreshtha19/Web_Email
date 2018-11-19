# Web_Email

DISCRIPTION: It is simple web Email system for exchanging messages among users.

FUNCTIONALITY: 
  1. Simple client - server based mail system
  2. User registration & login
  3. Sending and recieving, displaying of mails

TECHNICAL REQUIREMENT:  
  LANGUAGE:
    JSP,HTML, CSS, Bootstrap
  
  ADDITIONAL JAVA LIBRARY: 
    Apache POI version 3.9
  
  SERVER PLATFORM:
    Tomcat server library
  
  DATABASE: 
    1.Excel Sheets
    2.For User registration details: value.xlsx
    3.Separate Excel sheets for inbox of each users
    
BREIF DETAIL: 
  1.FRONT PAGE: 
    Registration & Login page Where user will register through required field, these details will saved in excel sheet(value.xlsx) and will     create a different excel sheet for inbox of that particular user.
    In login option typed details(username & password) will be matched in excel sheet(value.xlsx), if found, will be redirected to inbox.
  
  2.INBOX PAGE:  
      a.Can compose mails
      b.View recieved mails
      c.Logout and logins are session protected.

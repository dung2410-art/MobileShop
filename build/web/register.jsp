<%-- 
    Document   : register
    Created on : Apr 26, 2022, 11:22:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <title>Login</title>
        <style>
            body{
                background: grey !important;
            }
            
            #login-title{
                height: 40px;
                background: #160146;
                color: #de22ad;                
                padding: 10px;
                font-size: 20px;
                font-weight: bold;
                border-radius: 10px 10px 0 0;
                text-align: center;
            }
            
            #login-container{              
                margin: 60px auto;
                width: 500px;
                height: 600px;
                display: flex;
                flex-direction: column;
                align-items: stretch;
                background: white;
                border-radius: 10px;
            }
            
            </style>
    </head>
    <body>
        <div id="login-container">
            <form name="Register" action="register" method="POST">
                <div id="login-title">Register</div>
                <div class="m-t-10"><input name="email" class="input-box" placeholder="email" type="text"/></div>
                <div class="m-t-10"><input name="name" class="input-box" placeholder="name" type="text"/></div>
                <div class="m-t-10"><input name="phone" class="input-box" placeholder="phone" type="text"/></div>
                <div class="m-t-10"><input name="address" class="input-box" placeholder="address" type="text"/></div>
                <div class="m-t-10"><input name="password" class="input-box" placeholder="password" type="password"/></div>
                <div class="m-t-10"><input name="repassword" class="input-box" placeholder="repassword" type="password"/></div>
                <div class="m-10-a p-10 error-msg">${errorMessage}</div>
                <div class="m-10-a"><button class="primary-button m-10-a-db" type="submit">Register</button></div>
                <div class="m-10-a"><button class="scd-button m-10-a-db" type="button" onclick="window.document.location='/mobileshop'">Return</button></div>
            </form>    
    </body>
</html>

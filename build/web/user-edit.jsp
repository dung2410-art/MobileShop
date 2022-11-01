<%-- 
    Document   : user-edit
    Created on : Apr 26, 2022, 5:26:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="models.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/mobileshop/css/main.css">
        <link rel="stylesheet" type="text/css" href="/mobileshop/font-awesome-4.7.0/css/font-awesome.min.css">
        <title>User Edit</title>
        <style>
            .edit-input{
                border-left: none;
                border-right: none;
                border-top: none;
                border-bottom: solid 2px #de22ad;
                color: #de22ad;
            }
        </style>
    </head>
    <body>        
        <div id="main">          
            <jsp:include page="/header-admin.jsp" />
            <div class="center-pane">
                <jsp:include page="/left-menu-admin.jsp" />
                <div id="content">
                    <div class="mn-list">
                    <%
                    User user = (User)request.getAttribute("UserInfo");                    
                    if(user!=null){
                    %>
                        <form name="EditForm" action="edit" method="POST">
                            <div class='details-card'">
                                <div class='details-info'>
                                    <div class='details-text'><input name="id" class="edit-input" type="hidden" value="<%=user.getId()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Name:</span><input name="name" class="edit-input" type="text" value="<%=user.getName()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Role_Id:</span><input name="roleId" class="edit-input" type="text" value="<%=user.getRole()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Phone:</span><input name="phone" class="edit-input" type="text" value="<%=user.getPhone()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Email:</span><input name="email" class="edit-input" type="text" value="<%=user.getEmail()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Address:</span><input name="address" class="edit-input" type="text" value="<%=user.getAddress()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Password:</span><input name="password" class="edit-input" type="text" value="<%=user.getPassword()%>"/></div>                                
                                    <div class='action-panel'><!-- comment -->
                                        <button class='primary-button' type='submit'>Edit</button>
                                    </div>
                                </div>                            
                            </div> 
                        </form>        
                    <%                           
                    }
                    %>
                    <div class="m-10-a p-10 error-msg">${errorMessage}</div>
                    </div>
                </div>
            </div>        
            <jsp:include page="/footer-admin.jsp" />
        </div>       
    </body>
</html>

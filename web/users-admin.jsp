<%-- 
    Document   : users-admin
    Created on : Apr 26, 2022, 9:37:47 AM
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
        <title>Users Management</title>
        <style>            
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
                    ArrayList<User> listUser = (ArrayList<User>)request.getAttribute("userlist");
                    int count =0;
                    if(listUser != null){
                        %>
                        <div class="mn-title">Users List</div>
                        <div class="mn-list-item mn-header">
                            <div class="mn-list-cell"></div>
                            <div class="mn-list-cell">Name</div>
                            <div class="mn-list-cell">RoleId</div>
                            <div class="mn-list-cell">Email</div>
                            <div class="mn-list-cell"></div>
                        </div>    
                        <%
                        for(User user: listUser){
                            count++;
                        %>
                            <div class="mn-list-item">
                                <div class="mn-list-cell">#<%=count %></div>
                                <div class="mn-list-cell"><%=user.getName()%></div>
                                <div class="mn-list-cell"><%=user.getRole()%></div>
                                <div class="mn-list-cell"><%=user.getEmail()%></div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;
                                <div class="mn-list-cell"><i class="fa fa-pencil" onclick="window.document.location='/mobileshop/admin/users/edit?id=<%=user.getId()%>'"></i></div>
                                <div class="mn-list-cell"><i class="fa fa-trash"></i></div>
                            </div>                        
                        <%                            
                        }
                    }
                    %>
                    </div>
                </div>
            </div>        
            <jsp:include page="/footer-admin.jsp" />
        </div> 
    </body>
</html>

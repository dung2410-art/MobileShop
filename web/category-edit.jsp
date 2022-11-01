<%-- 
    Document   : category-edit
    Created on : Nov 1, 2022, 1:17:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/mobileshop/css/main.css">
        <link rel="stylesheet" type="text/css" href="/mobileshop/font-awesome-4.7.0/css/font-awesome.min.css">
        <title>Category Edit</title>
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
                    Category cate = (Category)request.getAttribute("cateInfo");                    
                    if(cate!=null){
                    %>
                        <form name="EditForm" action="edit" method="POST">
                            <div class='details-card'">
                                <div class='details-info'>
                                    <div class='details-text'><input name="cid" class="edit-input" type="hidden" value="<%=cate.getCid()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Name:</span><input name="name" class="edit-input" type="text" value="<%=cate.getCname()%>"/></div>                                 
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

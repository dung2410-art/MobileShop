<%-- 
    Document   : index
    Created on : Apr 14, 2022, 2:42:26 PM
    Author     : Dung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jakarta.servlet.RequestDispatcher"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/mobileshop/css/main.css">
        <link rel="stylesheet" type="text/css" href="/mobileshop/font-awesome-4.7.0/css/font-awesome.min.css">
        <title>Product Edit</title>
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
                    Product prod = (Product)request.getAttribute("productInfo");                    
                    if(prod!=null){
                    %>
                        <form name="EditForm" action="edit" method="POST">
                            <div class='details-card'">
                                <div class='details-info'>
                                    <div class='details-text'><input name="id" class="edit-input" type="hidden" value="<%=prod.getId()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Name:</span><input name="name" class="edit-input" type="text" value="<%=prod.getName()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Price:</span>VND <input name="price" class="edit-input" type="text" value="<%=prod.getPrice()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Size:</span><input name="size" class="edit-input" type="text" value="<%=prod.getSize()%>"/></div>
                                    <div class='details-text'><span class='details-header'>In stock:</span><input name="quantity" class="edit-input" type="text" value="<%=prod.getQuantity()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Brand:</span><input name="brand" class="edit-input" type="text" value="<%=prod.getBrand()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Model:</span><input name="model" class="edit-input" type="text" value="<%=prod.getModel()%>"/></div>
                                    <div class='details-text'><span class='details-header'>Description:</span><input name="description" class="edit-input" type="text" value="<%=prod.getDescription()%>"/></div>                                    
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

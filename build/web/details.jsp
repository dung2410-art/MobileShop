<%-- 
    Document   : details
    Created on : Apr 19, 2022, 5:16:18 PM
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
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <title>Product Page</title>
        <style>                     
        </style>
    </head>
    <body>        
        <div id="main">          
            <jsp:include page="/header.jsp" />
            <div class="center-pane">
                <jsp:include page="/left-menu.jsp" />
                <div id="content">                
                    <div class="details-container">
                     <%
                    List<Product> pdts = (List<Product>)request.getAttribute("productList");
                    int count =0;
                    if(pdts!=null){
                        for(Product prod: pdts){
                            count++;
                        %>
                            <div class='details-card'">
                                <div><img class='details-image' src='images/mobile_example.jpg'/></div>
                                <div class='details-info'>
                                    <div class='details-title'><%=prod.getName()%></div>
                                    <div class='details-text'><span class='details-header'>Price:</span>VND <%=prod.getPrice()%></div>
                                    <div class='details-text'><span class='details-header'>Size:</span><%=prod.getSize()%></div>
                                    <div class='details-text'><span class='details-header'>In stock:</span><%=prod.getQuantity()%></div>
                                    <div class='details-text'><span class='details-header'>Brand:</span><%=prod.getBrand()%></div>
                                    <div class='details-text'><span class='details-header'>Model:</span><%=prod.getModel()%></div>
                                    <div class='details-text'><span class='details-header'>Description:</span><%=prod.getDescription()%></div>
                                    <div class='action-panel'><!-- comment -->
                                        <button class='primary-button' type='button'>Add to Cart</button>
                                    </div>
                                </div>                            
                            </div>                        
                        <%                        
                        }
                    }
                    %>
                    </div>
                </div>
            </div>        
            <jsp:include page="/footer.jsp" />
        </div>       
    </body>
</html>
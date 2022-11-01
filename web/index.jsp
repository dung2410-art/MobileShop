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
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <title>Home</title>
        <style>            
        </style>
    </head>
    <body>        
        <div id="main">          
            <jsp:include page="/header.jsp" />
            <div class="center-pane">
                <jsp:include page="/left-menu.jsp" />
                <div id="content">                
                    <div class="product-container">
                    <%
                    
                    ArrayList<Product> pdts = (ArrayList<Product>)request.getAttribute("productList");
                    int count =0;
                    if(pdts!=null){
                        for(Product prod: pdts){
                            count++;
                        %>
                            <div class="product-card" onclick="window.document.location='details?id=<%=prod.getId()%>'">
                            <div><img class="product-image" src="images/mobile_example.jpg"/></div>
                            <div class="desc-text"><%=prod.getName()%></div>
                            <div class="desc-text">VND <%=prod.getPrice()%></div>
                            <div class="desc-text"><%=prod.getSize()%></div>
                            </div>                        
                        <%
                            if(count!=1 && count%4==0){
                                out.println("</div>");
                                out.println("<div class='product-container'>");
                            }  
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

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
        <title>Products Management</title>
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
                        List<Product> pdts = (List<Product>)request.getAttribute("productList");
                        int count =0;
                        if(pdts!=null){
                        %>
                        <div class="mn-title">Products List</div>
                       <a href="/mobileshop/admin/products/add">AddNew</a>
                        <div class="mn-list-item mn-header">
                            <div class="mn-list-cell"></div>
                            <div class="mn-list-cell">Name</div>
                            <div class="mn-list-cell">Brand</div>
                            <div class="mn-list-cell">Price (VND)</div>
                            <div class="mn-list-cell">Model</div>
                            <div class="mn-list-cell">Size</div>
                            <div class="mn-list-cell"></div>
                            <div class="mn-list-cell"></div>
                        </div>    
                        <%
                        for(Product prod: pdts){
                            count++;
                        %>
                        <div class="mn-list-item">
                            <div class="mn-list-cell">#<%=count %></div>
                            <div class="mn-list-cell"><%=prod.getName()%></div>
                            <div class="mn-list-cell"><%=prod.getBrand()%></div>
                            <div class="mn-list-cell"><%=prod.getPrice()%></div>
                            <div class="mn-list-cell"><%=prod.getModel()%></div>
                            <div class="mn-list-cell"><%=prod.getSize()%></div>
                            <div class="mn-list-cell"><i class="fa fa-pencil" onclick="window.document.location = '/mobileshop/admin/products/edit?id=<%=prod.getId()%>'"></i></div>
                            <div class="mn-list-cell"><i class="fa fa-trash"  onclick="window.document.location = '/mobileshop/admin/products/delete?id=<%=prod.getId()%>'"></i></div>
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
        <script>
            function doDelete(id) {
                if (confirm("are you sure delete id " + id + "?")) {
                    window.document.location = "mobileshop/admin/categories/delete?id=" + id;
                }
            }
        </script>
    </body>
</html>

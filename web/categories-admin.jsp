<%-- 
    Document   : categories-admin.jsp
    Created on : Oct 31, 2022, 11:07:20 PM
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
        <title>Categories Management</title>
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
                    List<Category> listcate = (List<Category>)request.getAttribute("categoryList");
                    int count =0;
                    if(listcate!=null){
                    %>
                    <div class="mn-title">Categories List</div>
                    <a href="/mobileshop/admin/categories/add">AddNew</a>
                    <div class="mn-list-item mn-header">
                        <div class="mn-list-cell"></div>
                        <div class="mn-list-cell">Name</div>
                        <div class="mn-list-cell"></div>
                        <div class="mn-list-cell"></div>
                    </div>    
                    <%
                   for (Category category: listcate) {
                        count++;
                    %>
                    <div class="mn-list-item">
                        <div class="mn-list-cell">#<%=count %></div>
                        <div class="mn-list-cell"><%=category.getCname()%></div>
                        <div class="mn-list-cell"><i class="fa fa-pencil" onclick="window.document.location = '/mobileshop/admin/categories/edit?id=<%=category.getCid()%>'"></i></div>
                        <div class="mn-list-cell"><i class="fa fa-trash" onclick="window.document.location = '/mobileshop/admin/categories/delete?id=<%=category.getCid()%>'"></i></div>
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

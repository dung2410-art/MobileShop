<%-- 
    Document   : AddNewProduct
    Created on : Oct 29, 2022, 8:16:16 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/mobileshop/css/main.css">
        <link rel="stylesheet" type="text/css" href="/mobileshop/font-awesome-4.7.0/css/font-awesome.min.css">
        <title>Products Add</title>
        <style>
            .input-add{
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
                        <h1 style="text-align: center">Add a new Product</h1>
                        <h3 style="color: red">${requestScope.error}</h3>
                        <form action="/mobileshop/admin/products/add" method="post" style="text-align: center; margin: 0 auto">
                            enter name:<input class="input-add" type="text" name="name" required="required"/><br/><br/>
                            enter price:<input class="input-add" type="number" name="price" required="required"/><br/><br/>
                            enter size:<input class="input-add" type="text" name="size" required="required"/><br/><br/>
                            enter quantity:<input class="input-add" type="number" name="quantity" required="required"/><br/><br/>
                            enter describe:<input class="input-add" type="text" name="description"required="required"/><br/><br/>
                            enter model:<input class="input-add" type="text" name="model" required="required"/><br/><br/>
                            enter brand:<input class="input-add" type="text" name="brand" required="required"/><br/><br/>
                            <input type="submit" value="Save"/>
                        </form>
                    </div>
                </div>        
            </div>   
            <jsp:include page="/footer-admin.jsp" />
    </body>
</html>

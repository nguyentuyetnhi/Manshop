<%-- 
    Document   : admin
    Created on : Mar 12, 2023, 4:41:13 PM
    Author     : ACER NITRO 5
--%>

<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dao.DBContext"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User admin = (User) request.getSession().getAttribute("admin");
    List<Product> products = null;
    if (admin != null) {
        request.setAttribute("auth", admin);
        ProductDao productDao = new ProductDao(DBContext.getConnection());
        products = productDao.getAllProducts();
    }else{
        response.sendRedirect("login.jsp");
    }
 
    


%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/header.jsp"%>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="/includes/admin-navbar.jsp"%>
        <div class="container">
            <div class="card-header my-3">All Products</div>
            <div class="row">
 
                <%
                        if (products!=null) {
                        for (Product p : products) {     
                %>
                <div class="col-md-3 my-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img src="product-img/<%= p.getImage()%>" class="card-img-top" alt="ao len">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName() %></h5>
                            <h6 class="price">Price: <%= p.getPrice() %></h6>
                            <h6 class="category">Category: <%= p.getCategory()%></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="update-product?id=<%= p.getId() %>" class="btn btn-primary">Update</a>
                                <a href="delete-product?id=<%=p.getId()%>" class="btn btn-secondary">Delete</a>

                            </div>
                        </div>
                    </div>
                </div>
                <%
                }
                }
                
                %>
        
        <%@include file="/includes/footer.jsp"%>

    </body>
</html>

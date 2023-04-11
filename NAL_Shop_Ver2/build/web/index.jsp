<%-- 
    Document   : index
    Created on : Mar 11, 2023, 7:27:44 PM
    Author     : ACER NITRO 5
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.DBContext"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
 
    ProductDao productDao = new ProductDao(DBContext.getConnection());
    List<Product> products = productDao.getAllProducts();
    ArrayList<Cart> cart_list =(ArrayList<Cart>) session.getAttribute("cart-list");
    if(cart_list !=null){
        request.setAttribute("cart_list", cart_list);
    }
    List<Product> searchProduct = (List<Product> )request.getAttribute("search-product");

%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/header.jsp"%>
<!--        <link href="../css/slide-show.css" rel="stylesheet" type="text/css">
         <script src="/js/slide-show.js"></script>-->


        <title>NAL SHOP</title>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>
        
    
        <div class="container">
            <div class="card-header my-3">All Products</div>
            <div class="row">
                <%
                    if(searchProduct!=null){
                        for (Product p : searchProduct) {
                %>
                <div class="col-md-3 my-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img src="product-img/<%= p.getImage()%>" class="card-img-top" alt="ao len">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName() %></h5>
                            <h6 class="price">Price: <%= p.getPrice() %></h6>
                            <h6 class="category">Category: <%= p.getCategory()%></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-primary">Add to Cart</a>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-secondary">Buy Now</a>

                            </div>
                        </div>
                    </div>
                </div>
                
                <%
                    }     
                    }else    
                        if (!products.isEmpty()) {
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
                                <a href="add-to-cart?id=<%= p.getId() %>" class="btn btn-primary">Add to Cart</a>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-secondary">Buy Now</a>

                            </div>
                        </div>
                    </div>
                </div>
                <%
                }
                }
                
                %>
                

            </div>
        </div>
                

        <%@include file="/includes/footer.jsp"%>

    </body>
</html>

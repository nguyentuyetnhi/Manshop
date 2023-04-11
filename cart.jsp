<%-- 
    Document   : cart
    Created on : Mar 11, 2023, 10:44:43 PM
    Author     : ACER NITRO 5
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.DBContext"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao productDao = new ProductDao(DBContext.getConnection());
        cartProduct = productDao.getCartProducts(cart_list);
        double total = productDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/header.jsp"%>
        <title>Cart</title>
        <style type="text/css">

            .table tbody td{
                vertical-align: middle;
            }
            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size: 25px;
            }
        </style>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>

        <div class="container">
            <div class="d-flex py-3">
                <h3>Total Price: $ ${(total>0)?dcf.format(total):0}</h3>
                <a class="ms-3 btn btn-primary" href="check-out">
                    Check Out
                </a>
            </div>
            <table class="table table-loght">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Buy Now</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <%                        if (cart_list != null) {
                            for (Cart c : cartProduct) {

                    %>
                    <tr>
                        <td> <%= c.getName()%></td>
                        <td> <%= c.getCategory()%></td>
                        <td> <%= dcf.format(c.getPrice())%>$</td>
                        <td>
                            <form action="order-now" method="get" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">

                                <div class="form-group d-flex justify-content-between" >
                                    <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%= c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" class="form-control"  value="<%= c.getQuantity()%>" readonly> 
                                    <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%= c.getId()%>"><i class="fas fa-plus-square"></i></a> 

                                </div>
                                <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                            </form>
                        </td>
                        <td><a href="remove-cart?id=<%= c.getId()%>" class="btn btn-sm btn-danger">Remove</a></td>
                        <td></td>

                    </tr>
                    <%
                            }
                        }
                    %>

                </tbody>
            </table>
        </div>
        <%@include file="/includes/footer.jsp"%>

    </body>
</html>

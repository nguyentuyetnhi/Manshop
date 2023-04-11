<%-- 
    Document   : login
    Created on : Mar 11, 2023, 8:10:34 PM
    Author     : ACER NITRO 5
--%>

<%@page import="model.User"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User admin = (User) request.getSession().getAttribute("admin");
    if (admin != null) {
        request.setAttribute("auth", admin);
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Design by foolishdeveloper.com -->
        <title>Login</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
        <!--Stylesheet-->
        <style media="screen">
            *,
            *:before,
            *:after{
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }
            body{
                background-color: #080710;
            }
            .background{
                width: 430px;
                height: 520px;
                position: absolute;
                transform: translate(-50%,-50%);
                left: 50%;
                top: 50%;
            }
            .background .shape{
                height: 200px;
                width: 200px;
                position: absolute;
                border-radius: 50%;
            }
            .shape:first-child{
                background: linear-gradient(
                    #1845ad,
                    #23a2f6
                    );
                left: -80px;
                top: -80px;
            }
            .shape:last-child{
                background: linear-gradient(
                    to right,
                    #ff512f,
                    #f09819
                    );
                right: -30px;
                bottom: -80px;
            }
            form{
                height: 850px;
                width: 500px;
                background-color: rgba(255,255,255,0.13);
                position: absolute;
                transform: translate(-50%,-50%);
                top: 50%;
                left: 50%;
                border-radius: 10px;
                backdrop-filter: blur(10px);
                border: 2px solid rgba(255,255,255,0.1);
                box-shadow: 0 0 40px rgba(8,7,16,0.6);
                padding: 50px 35px;
            }
            form *{
                font-family: 'Poppins',sans-serif;
                color: #ffffff;
                letter-spacing: 0.5px;
                outline: none;
                border: none;
            }
            form h3{
                font-size: 32px;
                font-weight: 500;
                line-height: 42px;
                text-align: center;
            }

            label{
                display: block;
                margin-top: 30px;
                font-size: 16px;
                font-weight: 500;
            }
            input{
                display: block;
                height: 50px;
                width: 100%;
                background-color: rgba(255,255,255,0.07);
                border-radius: 3px;
                padding: 0 10px;
                margin-top: 8px;
                font-size: 14px;
                font-weight: 300;
            }
            ::placeholder{
                color: #e5e5e5;
            }
            button{
                margin-top: 50px;
                width: 100%;
                background-color: #ffffff;
                color: #080710;
                padding: 15px 0;
                font-size: 18px;
                font-weight: 600;
                border-radius: 5px;
                cursor: pointer;
            }
            .social{
                margin-top: 30px;
                display: flex;
            }
            .social div{
                background: red;
                width: 150px;
                border-radius: 3px;
                padding: 5px 10px 10px 5px;
                background-color: rgba(255,255,255,0.27);
                color: #eaf0fb;
                text-align: center;
            }
            .social div:hover{
                background-color: rgba(255,255,255,0.47);
            }
            .social .fb{
                margin-left: 25px;
            }
            .social i{
                margin-right: 4px;
            }

        </style>
    </head>
    <body>

        <%
            if (admin != null) {
                Product product = (Product) request.getAttribute("product");

        %>

        <div class="background">
            <div class="shape"></div>
            <div class="shape"></div>
        </div>
        <form action="update-product?id=<%= product.getId()%>" method="POST">
            <h3>Update Product</h3>

            <label for="name">Name</label>
            <input type="text" name="name" placeholder="Product name" id="name" value="<%= product.getName()%>" readonly/>

            <label for="category">Category</label>
            <input type="text" name="category" placeholder="Category" id="category" value="<%= product.getCategory()%>" readonly/>

            <label for="price">Price</label>
            <input type="text" name="price" placeholder="Price" id="price" value="<%= product.getPrice()%>"/>

            <label for="image">Image URL</label>
            <input type="text" name="image" placeholder="image URL" id="image" value="<%= product.getImage()%>" readonly>

            <label for="quantity">Quantity</label>
            <input type="text" name="quantity" placeholder="Quantity" id="quantity" value="<%= product.getTotal()%>" >

            <button type="submit" class="btn btn-primary">Update</button>

            <div class="social">
                <div class="go"><a href="admin.jsp">Home</a></div>
            </div>

        </form>
        <%
            }

        %>
    </body>
</html>


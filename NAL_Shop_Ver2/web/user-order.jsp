<%-- 
    Document   : user-order
    Created on : Mar 12, 2023, 9:19:23 PM
    Author     : ACER NITRO 5
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Order"%>
<%@page import="java.util.List"%>
<%@page import="dao.DBContext"%>
<%@page import="dao.OrderDao"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    List<Order> orders=null;
    User admin = (User) request.getSession().getAttribute("admin");
    if (admin != null) {
        request.setAttribute("admin", admin);
        OrderDao dao = new OrderDao(DBContext.getConnection());
         orders = dao.getAllOrders();
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/header.jsp"%>
        <title>User Order</title>
    </head>
    <body>
        <%@include file="/includes/admin-navbar.jsp"%>

        <div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
                                        <th scope="col">User ID</th>
					<th scope="col">Product Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Total</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
                                                <td><%=o.getUserId()%></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQuantity()%></td>
						<td><%=dcf.format(o.getPrice()) %></td>
                                                <td><%=dcf.format(o.getPrice()*o.getQuantity()) %></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
        



        <%@include file="/includes/footer.jsp"%>
    </body>
</html>

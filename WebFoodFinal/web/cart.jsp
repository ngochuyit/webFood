<%@page import="connection.DBConnect"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    List<Cart> cartProduct = null;
    if (cart_list != null) {
        ProductDao pDao = new ProductDao(DBConnect.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="/includes/head.jsp"%>
        <title>E-Commerce Cart</title>
        <style type="text/css">
            body{
                background: url('image/backcart.jpg') no-repeat;
                background-size: cover;
            }
            .table tbody td{
                vertical-align: middle;
            }
            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size: 25px;
            }
            #danger{
                margin-left: 50px;
            }
            #total{
               margin-left: 750px;
            }
        </style>
    </head>
    <body>
        <%@include file="/includes/navbar.jsp"%>

        <div class="container my-3">

            <table class="table table-light">
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
                        <td><%=c.getName()%></td>
                        <td><%=c.getCategory()%></td>
                        <td><%= dcf.format(c.getPrice())%></td>
                        <td>
                            <form action="order-now" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                <div class="form-group d-flex justify-content-between w-50">
                                    <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 
                                    <input type="text" name="quantity" class="form-control w-50"  value="<%=c.getQuantity()%>" readonly> 
                                    <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm">Buy</button>
                            </form>
                        </td>
                        <td><a href="remove-from-cart?id=<%=c.getId()%>" class="btn btn-sm btn-warning">
                                <img src="image/trash.png" width="30px" height="25px" alt="alt"/>
                            </a></td>
                    </tr>

                    <%
                            }
                        }%>
                </tbody>
            </table>
                <hr><!-- comment -->
            <div class="d-flex py-3" id="total"><h3>Total: $ ${(total>0)?dcf.format(total):0} </h3>
                <button type="button" class="btn btn-danger" href="cart-check-out" id="danger">check out</button>
            </div>
        </div>

        <%@include file="/includes/footer.jsp"%>
    </body>
</html>
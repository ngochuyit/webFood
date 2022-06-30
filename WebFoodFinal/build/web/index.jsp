<%@page import="connection.DBConnect"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("person", auth);
    }
    ProductDao pd = new ProductDao(DBConnect.getConnection());
    List<Product> products = pd.getAllProducts();
    ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html >
    <head>
        <%@include file="/includes/head.jsp"%>
        <title>FastFood</title>
    </head>
    <style>
        
    </style>
    <body>
        <%@include file="/includes/navbar.jsp"%>

        <section class="menu" id="menu">
            <div class="card-header my-3">All Products</div>
            <div class="box-container">
            <div class="row">
                <%                            if (!products.isEmpty()) {
                        for (Product p : products) {
                %>
                <div class="col-md-4 my-4">
                    <div class="image">
                        <img src="image/<%=p.getImage()%>"><!-- comment -->
                        <a href="#" class="fas fa-heart"></a>
                    </div>
                    <div class="content">
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                        <h6><%=p.getName()%><h6>
                        <h6 class="category">Category: <%=p.getCategory()%><h6>
                                <h6>This is a wonderful food of VietNam</h6>  
                                <h6 class="price">Price: $<%=p.getPrice()%></h6>
                                <a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-success">Add to Cart</a>
                                <a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-primary">Buy</a>
                                
                                </div>
                                </div>

                                <%
                                        }
                                    } else {
                                        out.println("There is no proucts");
                                    }
                                %>
                                </div>
        </section>
            <%@include file="/includes/footer.jsp"%>                    

</body>
</html>
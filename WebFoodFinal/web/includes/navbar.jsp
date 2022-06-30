<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome-free-6.1.1-web/5.15.4/css/all.min.css">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><img src="image/logo.png" width="50px" height="50px" alt="alt"/>FastFood</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <form class="form-inline my-2 my-lg-2" id="search">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit" >Search</button>
            </form>
            
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="cart.jsp"><img src="image/icons-cart.png" width="30px" height="30px" alt="alt"/> <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
                    <%
                        if (auth!= null) {
                    %>
                <li class="nav-item"><a class="nav-link" href="orders.jsp">Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
                    <%
                    } else {
                    %>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <%
                        }
                    %>
            </ul>
            
        </div>
    </div>
</nav>
<%@ page import="com.example.btl_web_book.model.User" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.example.btl_web_book.model.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.btl_web_book.dao.OrderDao" %>
<%@ page import="com.example.btl_web_book.connection.JDBCConnect" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.example.btl_web_book.model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    OrderDao orderDao  = null;
    try {
        orderDao = new OrderDao(JDBCConnect.getConnection());
    } catch (ClassNotFoundException | SQLException e) {
        throw new RuntimeException(e);
    }
    if (auth != null) {
        request.setAttribute("person", auth);
        orders = orderDao.userOrders(auth.getId());
    }else{
        response.sendRedirect("login.jsp");
    }
    double totalPrice = 0;
    if(orders != null){
        for(Order o : orders){
            totalPrice += o.getPrice();
        }
    }
    request.setAttribute("totalPrice", totalPrice);
    List<Cart> cartArrayList = (ArrayList<Cart>) session.getAttribute("cart-list");
    if(cartArrayList != null){
        request.setAttribute("cartArrayList", cartArrayList);
    }
%>

<html>
<head>
    <title>Title</title>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" href="CSS/nav-bar.css">
    <link rel="stylesheet" href="CSS/footer.css">
    <link rel="stylesheet" href="CSS/index.css">
    <link rel="stylesheet" href="CSS/orders.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css">
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--%>
</head>
<body>
    <header>
        <%@include file="includes/navBar.jsp"%>
    </header>
    <tbody>
        <div class="order-title">
            <div class="titleIcon">
                <svg width="33px" height="33px" viewBox="0 0 512 512" id="Layer_1" version="1.1" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <style type="text/css"> .st0{fill:#263A29;} .st1{fill:#41644A;} </style> <g> <path class="st0" d="M499.2,275.1c-1.9-3.4-6.1-4.6-9.5-2.8L452,293.1c0,0,0,0,0,0l-14.8,8.2L280,387.7 c-10.5,5.8-23.7,1.9-29.4-8.5c-2.8-5.1-3.4-10.9-1.8-16.5c1.6-5.6,5.3-10.2,10.4-12.9c0,0,0,0,0,0l193-106.1c0,0,0,0,0,0l16.8-9.2 c3.4-1.9,4.6-6.1,2.8-9.5c-1.9-3.4-6.1-4.6-9.5-2.8l-8.5,4.7l-24.6-114.9c-1.2-6.2-5.2-11.4-11-14.1c-5.8-2.7-12.3-2.5-17.9,0.6 L157.1,232l-33.9-34.8c-2.2-2.3-5.6-2.8-8.4-1.3l-41.4,22.8c-3.4,1.9-4.6,6.1-2.8,9.5c1.9,3.4,6.1,4.6,9.5,2.8l36.8-20.2l33.8,34.8 l0,0l94.4,97.1c-4.6,4.3-8,9.8-9.8,16.1c-2.7,9.2-1.6,18.8,3,27.1c6.5,11.8,18.7,18.5,31.3,18.5c5.8,0,11.7-1.4,17.1-4.4l11.6-6.4 c0.6,1.8,1.4,3.6,2.3,5.3c4.3,7.8,11.4,13.5,19.9,15.9c3.1,0.9,6.2,1.3,9.3,1.3c5.5,0,11-1.4,16-4.1c7.8-4.3,13.5-11.3,15.9-19.9 c2.5-8.5,1.5-17.5-2.8-25.3c-0.9-1.7-2-3.3-3.2-4.8l54.1-29.7c0.6,1.8,1.4,3.6,2.3,5.3c4.3,7.8,11.4,13.5,19.9,15.9 c3.1,0.9,6.2,1.3,9.3,1.3c5.5,0,11-1.4,16-4.1c7.8-4.3,13.5-11.3,15.9-19.9c2.5-8.5,1.5-17.5-2.8-25.3c-0.9-1.7-2-3.3-3.2-4.8 l29.2-16C499.9,282.7,501.1,278.5,499.2,275.1z M394.7,138.2c3.8-0.8,7.5,1.6,8.3,5.4l16.3,75.9c0.8,3.8-1.6,7.5-5.4,8.3 c-0.5,0.1-1,0.2-1.5,0.2c-3.2,0-6.1-2.2-6.8-5.5l-16.3-75.9C388.5,142.7,390.9,139,394.7,138.2z"></path> <path class="st1" d="M99.4,266.5c0-3.9-3.1-7-7-7H18.9c-3.9,0-7,3.1-7,7s3.1,7,7,7h73.5C96.3,273.5,99.4,270.4,99.4,266.5z"></path> <path class="st1" d="M91.6,363.7c0,3.9,3.1,7,7,7h90.7c3.9,0,7-3.1,7-7s-3.1-7-7-7H98.6C94.7,356.7,91.6,359.8,91.6,363.7z"></path> <path class="st1" d="M39.6,323.5c0,3.9,3.1,7,7,7h122.7c3.9,0,7-3.1,7-7s-3.1-7-7-7H46.6C42.7,316.5,39.6,319.6,39.6,323.5z"></path> <path class="st1" d="M155.8,299.4c3.9,0,7-3.1,7-7s-3.1-7-7-7h-32.9c-3.9,0-7,3.1-7,7s3.1,7,7,7H155.8z"></path> <path class="st1" d="M211.9,328h-15.3c-3.9,0-7,3.1-7,7s3.1,7,7,7h15.3c3.9,0,7-3.1,7-7S215.8,328,211.9,328z"></path> <path class="st1" d="M211.9,388h-58c-3.9,0-7,3.1-7,7s3.1,7,7,7h58c3.9,0,7-3.1,7-7S215.8,388,211.9,388z"></path> <path class="st1" d="M116.3,388H72.6c-3.9,0-7,3.1-7,7s3.1,7,7,7h43.7c3.9,0,7-3.1,7-7S120.1,388,116.3,388z"></path> <path class="st1" d="M51.2,353.5h-23c-3.9,0-7,3.1-7,7s3.1,7,7,7h23c3.9,0,7-3.1,7-7S55.1,353.5,51.2,353.5z"></path> <path class="st1" d="M72.6,299.4c3.9,0,7-3.1,7-7s-3.1-7-7-7H60.9c-3.9,0-7,3.1-7,7s3.1,7,7,7H72.6z"></path> </g> </g></svg>
            </div>
            <div class="titleName">All Orders</div>
        </div>
        <div class="container">
            <div class="table-cart">
                <div class="table-head">
                    <div class="item-date">Date</div>
                    <div class="item-name">Name</div>
                    <div class="item-category">Category</div>
                    <div class="item-quantity">Quantity</div>
                    <div class="item-price">Price</div>
                    <div class="item-cancel">Cancel</div>
                </div>
                <div class="list_items">
                    <%
                        if(orders != null){
                            for(Order o:orders){%>
                    <div class="item">
                        <div class="item-date"><%=o.getDate() %></div>
                        <div class="item-name"><%=o.getName() %></div>
                        <div class="item-category"><%=o.getCategory() %></div>
                        <div class="item-quantity">x<%=o.getQuantity() %></div>
                        <div class="item-price">$<%=dcf.format(o.getPrice()) %></div>
                        <div class="item-cancel">
                            <a class="btn-cancel" href="cancel-order?id=<%=o.getOrderId()%>">
                                Cancel Order
                            </a>
                        </div>
                    </div>
                    <%}
                    }
                    %>
                </div>
            </div>
        </div>
        <script>
            const buyBtn = document.querySelector('.js-buy');
            const modal = document.querySelector('.js-modal');
            const modalClose = document.querySelector('.js-modal-close');
            function showBuy(){
                //alert("Show")
                modal.classList.add('open')
            }
            function hideBuy(){
                modal.classList.remove('open')
            }
            buyBtn.addEventListener('click', showBuy);
            modal.addEventListener('click', hideBuy);
            modalClose.addEventListener('click', hideBuy);
        </script>
    </tbody>
    <footer>
        <%@include file="/includes/footer.jsp"%>
    </footer>
</body>
</html>

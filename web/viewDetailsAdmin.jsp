
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController">
            <h1>View Details For Admin</h1>



            <c:if test="${(sessionScope.LOGIN == null) or (sessionScope.LOGIN.isAdmin ne true)}">
                <c:redirect url="login.html"/>
            </c:if>
            <c:if test="${(sessionScope.LOGIN != null) or (sessionScope.LOGIN.isAdmin eq true)}">
                Hello, ${sessionScope.LOGIN.fullname}
                <br>
                <button name="action" value="Logout">Logout</button>
                <button name="action" value ="ViewOrderAdmin">View All Order</button>
                <a href="MainController?action=AdminHomePage">Return Home</a>
                <br>
            </c:if>



            <c:if test="${sessionScope.LIST_ORDER_DETAILS_ADMIN != null}">
                <c:if test="${not empty sessionScope.LIST_ORDER_DETAILS_ADMIN}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>name Product</th>
                                <th>product ID</th>
                                <th>quantity</th>
                                <th>price</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="o" items="${sessionScope.LIST_ORDER_DETAILS_ADMIN}"><tr>
                            <form action="MainController">
                                <td>
                                    <input type="text" name="orderID" value="${o.orderID}"  readonly=""/>
                                </td>   

                                <td>
                                    <input type="text" name="productName" value="${o.productName}"  readonly="">
                                </td>

                                <td>
                                    <input type="text" name="prooductID" value="${o.productID}"readonly="" >
                                </td>
                                <td>
                                    <input type="text" name="quantity" value="${o.quantity}"readonly="" >
                                </td>
                                <td>
                                    <input type="text" name="price" value="${o.price}"readonly="" >
                                </td>

                                </tr>
                            </form>    
                        </c:forEach>


                        </tbody>
                    </table>

                </c:if>
            </c:if>
        </form>


    </body>
</html>

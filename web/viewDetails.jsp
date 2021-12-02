
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is View Order Page</h1>
        <form action="MainController">

            <c:if test="${sessionScope.LOGIN == null}">
                <button name="action" value="LoginPage">
                    Login
                </button>
            </c:if>

            <c:if test="${(sessionScope.LOGIN != null)}">

                <c:if test="${sessionScope.LOGIN.isAdmin eq false}">
                    Welcome, ${sessionScope.LOGIN.fullname}

                    <button name="action" value="ViewOrder">
                        View Order
                    </button>
                    <br>
                    <button name="action" value="Logout">
                        Logout
                    </button>
                </c:if>

                <c:if test="${sessionScope.LOGIN.isAdmin eq true}">
                    <c:redirect url="home.jsp"/>
                </c:if>

            </c:if>
            <button name="action" value="ViewCart">View Cart</button>
            <a href="MainController?action=HomePage">Continue to Shopping</a>
        </form>



        <h1>View order</h1>

        <c:if test="${sessionScope.LISTORDER_DETAILS != null}">
            <c:if test="${not empty sessionScope.LISTORDER_DETAILS}">
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
                        <c:forEach var="o" items="${sessionScope.LISTORDER_DETAILS}"><tr>
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

</body>
</html>

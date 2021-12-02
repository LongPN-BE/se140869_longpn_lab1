
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
            <h1>View Order For Admin</h1>
            
            
            
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
        </form>


        
        <c:if test="${sessionScope.LIST_ORDER_ADMIN != null}">
        <c:if test="${not empty sessionScope.LIST_ORDER_ADMIN}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>full name</th>
                        <th>phone</th>
                        <th>email</th>
                        <th>address</th>
                        <th>date Order</th>
                        <th>total</th>
                        <th>Action</th>
                       
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="o" items="${sessionScope.LIST_ORDER_ADMIN}"><tr>
                    <form action="MainController">
                        <td>
                            <input type="text" name="orderID" value="${o.orderID}"  readonly=""/>
                        </td>                                                           
                        <td>
                            <input type="text" name="fullname" value="${o.fullname}"  readonly="">
                        </td>
                        <td>
                            <input type="text" name="phoneNumber" value="${o.phoneNumber}"  readonly="">
                        </td>
                        <td>
                            <input type="text" name="email" value="${o.email}" readonly="">
                        </td>
                        <td> 
                            <input type="text" name="address" value="${o.address}"readonly="">
                        </td>
                        <td>
                            <input type="datetime" name="dateOrder" value="${o.dateOrder}" readonly="">
                        </td>
                        <td>
                            <input type="text" name="total" value="${o.total}"readonly="" >
                        </td>
                        
                        <td>
                            <button name="action" value="ViewDetailsAdmin">View Details</button>
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

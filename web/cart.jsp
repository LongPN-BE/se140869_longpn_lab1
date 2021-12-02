
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is cart Page</h1>
        
        
         

            <c:if test="${(sessionScope.LOGIN != null)}">

                    Welcome, ${sessionScope.LOGIN.fullname}
                    
                    
            </c:if>
        
        <form action="MainController">
            <button name="action" value="HomePage">Return Home Page</button>

            <c:if test="${sessionScope.CARTITEM != null}">
                <c:if test="${not empty sessionScope.CARTITEM}">
                    <table border="1">
                        <c:if test="${not empty requestScope.DELETE_MSG }">
                            <p style="color: red">${requestScope.DELETE_MSG}</p>
                        </c:if>
                        <c:if test="${not empty requestScope.UPDATE_MSG }">
                            <p style="color: red">${requestScope.UPDATE_MSG}</p>
                        </c:if>

                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="c" items="${sessionScope.CARTITEM}">
                            <form action="MainController">
                                <tr>
                                    <td>
                                        <input type="text" name="productID" value="${c.productID}" readonly="">
                                    </td>
                                    <td> 
                                        <input type="text" name="productName" value="${c.nameProduct}" readonly="">
                                    </td>
                                    <td>
                                        <input type="text" name="price" value="${c.price}" readonly="" >
                                    </td>
                                    <td> 
                                        <input type="number" name="quantity" value="${c.quantity}">
                                    </td>
                                    <td> 
                                        <button name="action" value="deleteCart" onclick="return confirm('Are you sure delete Item?')">Delete</button>
                                    </td>
                                    <td> 
                                        <button name="action" value="updateCart">Update</button>
                                    </td>
                                </tr>

                            </form>
                        </c:forEach>
                        <tr>
                            <th>
                                -----------------------------
                            </th>
                        </tr>
                        <tr>
                            <th>
                                Total:
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <form action="MainController">
                                    ${sessionScope.TOTAL}
                                    <input type="hidden" name="totalValue" value="${sessionScope.TOTAL}" />
                                </form>
                            </th>
                        </tr>
                        <tr> 

                            <th>
                               <button name="action" value="checkOutCart">check out</button>
                            </th>

                        </tr>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
            
        </form>
    </body>
</html>

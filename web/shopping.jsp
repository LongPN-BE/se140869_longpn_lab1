
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>  
    <body>

        <h1>This is Shopping page for User</h1>
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

        </form>



        <h1>Shopping page</h1>
        <form action="MainController" method="POST">
            <input type="text" name="search" value="${param.search}"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <br><h4>Category</h4>
        <a href="SearchCategoryController?category=1">Category 1</a>
        <a href="SearchCategoryController?category=2">Category 2</a>

        <br><h4>Price</h4>
        <a href="#">Price Ascending</a>
        <a href="#">Price Descending</a>
        
        <br><h4>Page</h4>
        <c:if test="${requestScope.LIST_PRODUCT != null}">
            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Created</th>
                            <th>Expiration</th>                          
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cake" items="${requestScope.LIST_PRODUCT}" varStatus="count"><tr>
                        <form action="MainController">
                            <td>${count.count}</td>
                            <td>
                                ${cake.productID}
                                <input type="hidden" name="productID" value="${cake.productID}" />
                            </td>                                                           
                            <td>
                                <input type="text" name="nameProduct" value="${cake.nameProduct}"  readonly="">
                            </td>
                            <td> <img width="170" height="100" src=${cake.image} alt="" readonly=""/>  
                            </td>
                            <td>
                                <input type="text" name="description" value="${cake.description}" readonly="">
                            </td>
                            <td> 
                                <input type="text" name="price" value="${cake.price}"readonly="">
                            </td>
                            <td>
                                <input type="date" name="createDate" value="${cake.createDate}" readonly="">
                            </td>
                            <td>
                                <input type="date" name="expirationDate" value="${cake.expirationDate}"readonly="" >
                            </td>
                            <td>
                                <button name="action" value="addToCart">Add To Cart</button>
                            </td>

                            </tr>
                        </form>    
                    </c:forEach>
                    <c:forEach begin="1" end="${requestScope.page}" var="i">
                        <a href="MainController?action=Search&page=${i}&search=">${i} </a> 
                    </c:forEach>

                </tbody>
            </table>

        </c:if>
    </c:if>
    <c:url var="logoutLink" value="MainController">
        <c:param name="action" value="Logout"></c:param>
    </c:url>
</tbody>
</table>
</body>
</html>

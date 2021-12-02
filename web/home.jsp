
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>

        <form action="MainController">
            <h1>This is home For Admin</h1>
            <%-- Add --%>
            <h2>Add a session for news</h2>
            <c:if test="${sessionScope.LAST_UPDATE != null}">
                <h2 style="color: red">
                    ${sessionScope.LAST_UPDATE.username} have been  ${sessionScope.LAST_UPDATE.action} at 
                    ${sessionScope.LAST_UPDATE.lastDate}
                </h2>
            </c:if>


            <c:if test="${(sessionScope.LOGIN == null) or (sessionScope.LOGIN.isAdmin ne true)}">
                <c:redirect url="login.html"/>
            </c:if>
            <c:if test="${(sessionScope.LOGIN != null) or (sessionScope.LOGIN.isAdmin eq true)}">
                Hello, ${sessionScope.LOGIN.fullname}
                <br>
                <button name="action" value="Logout">Logout</button>
                <button name="action" value ="ViewOrderAdmin">View All Order</button>
                <br>
            </c:if>
        </form>


        <form action="MainController" method="POST">
            <input type="text" name="search" value="${param.search}"/>
            <input type="submit" name="action" value="Search"/>
            <button name="action" value="insertPage">Insert</button>
        </form>
        <c:if test="${requestScope.LIST_PRODUCT != null}">
            <c:if test="${not empty requestScope.LIST_PRODUCT}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Created</th>
                            <th>Expiration</th>
                            <th>Quantity</th>
                            <th>Category</th>
                            <th>Status</th>
                            <!--                            <th>Delete</th>-->
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cake" items="${requestScope.LIST_PRODUCT}"><tr>
                        <form action="MainController">
                            <td>${cake.productID}</td>                                                           
                            <td>
                                <input type="text" name="nameProduct" value="${cake.nameProduct}" >
                            </td>
                            <td width="170" height="100"> <img width="170" height="100" src=${cake.image} alt=""/>  
                                <input type="text" name="image" value="${cake.image}">
                            </td>
                            <td>
                                <input type="text" name="description" value="${cake.description}" >
                            </td>
                            <td> 
                                <input type="text" name="price" value="${cake.price}">
                            </td>
                            <td>
                                <input type="date" name="createDate" value="${cake.createDate}" >
                            </td>
                            <td>
                                <input type="date" name="expirationDate" value="${cake.expirationDate}" >
                            </td>
                            <td>
                                <input type="number" name="quantity" value="${cake.quantity}" >                        
                            </td>
                            <td>
                                 <center>${cake.categoryID}</center>
                                <select name="categoryID">                                       
                                    <option value="1"> 1 egg</option>
                                    <option value="2"> 2 egg</option>
                                </select>                             
                            </td>                                                   
                            <td>
                            <center>${cake.status}</center>
                                <select name="status">                                       
                                    <option value="true"> True</option>
                                    <option value="false">False</option>
                                </select>                         
                            </td>

                            <!--                            <td>
                                                            <a href="MainController?action=Delete&productID=${cake.productID}&search=${param.search}" onclick="return confirm('Are you sure delete Item?')" >Delete</a>
                                                        </td>-->
                            <td>
                                <input type="submit" name="action" value="Update" />
                                <input type="hidden" name="productID" value="${cake.productID}"/>
                                <input type="hidden" name="search" value="${param.search}"/>
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


</body>
</html>

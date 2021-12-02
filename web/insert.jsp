
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
    </head>
    <body>
    <c:if test="${(sessionScope.LOGIN == null) or (sessionScope.LOGIN.isAdmin ne true)}">
        <c:redirect url="login.html"/>
    </c:if>
    <a href="MainController?action=AdminHomePage">Return Home</a>
    <h1>Insert Product!</h1>
    <form action="MainController">
        Name<input type="text" name="nameProduct" required/></br>
        <%--add err --%>
        Image<input type="text" name="image" required/></br>
        <%--add err --%>
        Description<input type="text" name="description" required/></br>
        <%--add err --%>
        Price<input type="number" name="price" required/></br>
        <%--add err --%>
        Created<input type="date" name="createDate" required/></br>
        <%--add err --%>
        Expiration<input type="date" name="expirationDate" required/></br>
        <%--add err --%>
        Quantity<input type="number" name="quantity" required/></br>
        <%--add err --%>
        <!--        Category<input type="text" name="categoryID"/></br>-->
        Category <select name="categoryID">                                      
            <option value="1"> 1 egg</option>
            <option value="2"> 2 egg</option>
        </select></br>
        <input type="submit" name="action" value="Insert" onclick="return confirm('Are you sure Insert Item?')"/>
        <input type="reset" value="Reset">
    </form>
</body>
</html>

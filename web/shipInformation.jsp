
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is Shipping Information Page</h1>
        <form action="MainController" method="POST">
            <c:set var="errors" value="${requestScope.ERRO_MSG}"/>
            Full Name:<input type="text" name="fullname"/> *</br>
            <c:if test="${not empty errors.fullnameLenghtViolent}">
                <font color="red">
                ${errors.fullnameLenghtViolent}
                </font></br>
            </c:if>
            Phone:<input type="text" name="phoneNumber"/>*</br>
            <c:if test="${not empty errors.phoneNumberLenghtViolent}">
                <font color="red">
                ${errors.phoneNumberLenghtViolent}
                </font></br>
            </c:if>
            Email:<input type="text" name="email"/>*</br>
            <c:if test="${not empty errors.emailLenghtViolent}">
                <font color="red">
                ${errors.emailLenghtViolent}
                </font></br>
            </c:if>
            Address:<input type="text" name="address"/>*</br>
            <c:if test="${not empty errors.addressLenghtViolent}">
                <font color="red">
                ${errors.addressLenghtViolent}
                </font></br>
            </c:if>
            <input type="submit" name="action" value="CheckOutNotLog"/>
        </form>
    </body>
</html>

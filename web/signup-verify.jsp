<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--==================== UNICONS ====================-->
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

        <!--==================== SWIPER CSS ====================-->
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">

        <!--==================== CSS ====================-->
        <link rel="stylesheet" href="assets/css/styles.css">
        <!-- Icon -->
        <link rel="icon" href="assets/img/icon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Shub VietNam</title>
    </head>

    <body>
        <!--==================== HEADER ====================-->
        <header class="header" id="header">
            <nav class="nav container">
                <a href="<c:url value="/"/>" class="nav__logo">
                    <div id="leon-logo"></div>
                </a>
            </nav>
        </header>

    <body>

        <div class="content">
            <div class="content--left--signup" style="margin-top: 120px;">
                <c:if test="${verified}">
                    <div class="content--left--title">Account has been verified</div>
                    <a href="<c:url value="/signin"/>">
                        <button class="btn btn-primary">Go to signin</button>
                    </a>
                </c:if>
                <c:if test="${!verified}">
                    <div class="content--left--title">Email verification</div>
                    <form method="POST" action="<c:url value="/signup-verify"/>" class="verify-form">
                        <input type="hidden" name="id" value="${accountId}">
                        <input type="hidden" name="email" value="${email}">
                        <label>Verification code has been sent to ${email}, please enter here.</label><br/>
                        <label style="color: red">${message}</label><br/>
                        <c:remove var="accountId"/>
                        <c:remove var="email"/>
                        <c:remove var="message"/>
                        <input name="verify-code" class="input--email" type="text"/><br/>
                        <div class="d-grid gap-2" style="margin-top: 16px;width: 450px;">
                            <input class="btn btn-primary btn--signin" type="submit" value="Submit" style="margin-top: 4px">     
                        </div>
                    </form>
                </c:if>
            </div>
            <div class="content--right">
                <img src="./assets/img/signin.svg" alt="">
            </div>
        </div>
    </div>
</body>

</html>
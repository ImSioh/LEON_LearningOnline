<%-- 
    Document   : ClassCode
    Created on : Jan 14, 2023, 9:41:46 PM
    Author     : Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>LE.ON</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <% String path = request.getContextPath();%>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="<c:url value="/student/assets/css/styleClassCode.css"/>">

    </head>
    <body>
        <c:if test="${verified}">
            <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-7 col-lg-5">
                            <div class="wrap">
                                <div class="img" style="background-image: url(assets/img/logo.svg);"></div>
                                <div class="login-wrap p-4 p-md-5">
                                    <div class="d-flex">
                                        <div class="w-100">
                                            <h3 class="mb-4" >JOIN CLASS</h3>
                                        </div>

                                    </div>
                                    <form action="<%=path%>/student/join" class="signin-form" method="POST">
                                        <div class="form-group mt-3">
                                            <input type="text" class="form-control" name="classCode" required>
                                            <label class="form-control-placeholder" for="username">Code</label>
                                        </div>

                                        <div class="form-group">
                                            <button type="submit" class="form-control btn btn-primary rounded submit px-3">Join</button>
                                        </div>

                                    </form>
                                    <p class="text-center"><a href="<%=path%>/student/overview">Go back homepage</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>
        <c:if test="${!verified}">
            <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-7 col-lg-5">
                            <div class="wrap">
                                <div class="img" style="background-image: url(assets/img/logo.svg);"></div>
                                <div class="login-wrap p-4 p-md-5">
                                    <div class="d-flex">
                                        <div class="w-100">
                                            <h3 class="mb-4" >JOIN CLASS</h3>
                                        </div>

                                    </div>
                                    <form action="<%=path%>/student/join" class="signin-form" method="POST">
                                        <div class="form-group mt-3">
                                            <input type="text" class="form-control" name="classCode" required>
                                            <label class="form-control-placeholder" for="username">Code</label>
                                        </div>
                                        <div style="color: red">(◕‿◕) Please input others code (◕‿◕)</div>
                                        <div class="form-group">
                                            <button type="submit" class="form-control btn btn-primary rounded submit px-3">Join</button>
                                        </div>

                                    </form>
                                    <p class="text-center"><a href="<%=path%>/student/overview">Go back homepage</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>

        <script src="<c:url value="/student/assets/js/jquery.min2.js"/>"></script>
        <script src="<c:url value="/student/assets/js/popper2.js"/>"></script>
        <script src="<c:url value="/student/assets/js/bootstrap.min2.js"/>"></script>
        <script src="<c:url value="/student/assets/js/main2.js"/>"></script>

    </body>
</html>



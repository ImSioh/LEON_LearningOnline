<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="assets/css/styles.css">
        <!-- Icon -->
        <link rel="icon" href="assets/img/icon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>LE.ON</title>
        <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    </head>

    <body>
        <!--==================== HEADER ====================-->
        <header class="header" id="header">
            <nav class="nav container">
                <a href="<c:url value="/"/>" class="nav__logo">
                    <div id="leon-logo"></div>
                </a>
        </header>

    <body>

        <div class="content">
            <div class="content--left--signup">
                <div class="content--left--title">Sign Up</div>
                <form method="POST" action="<c:url value="/signup"/>" class="signin" id="signup-form">
                    <label>Name</label>
                    <input name="name" class="input--email" type="text" value="${requestScope["name"]}"/>
                    <label class="error">${requestScope["name-error"]}</label>

                    <label>Date of birth</label>
                    <input name="dob" class="input--email" type="date" value="${requestScope["dob"]}"/>
                    <label class="error">${requestScope["dob-error"]}</label>

                    <label>Address</label>
                    <input name="address" class="input--email" type="text" value="${requestScope["address"]}"/>
                    <label class="error">${requestScope["address-error"]}</label>

                    <label>Email</label>
                    <input name="email" class="input--email" type="text" value="${requestScope["email"]}"/>
                    <label class="error">${requestScope["email-error"]}</label>

                    <label>Password</label>
                    <input name="password" class="input--password" type="password" id="password"/> 
                    <label class="error">${requestScope["password-error"]}</label>

                    <label>Confirm Password</label>
                    <input name="confirm-password" class="input--password" type="password"/> 
                    <label class="error">${requestScope["confirm-password-error"]}</label>

                    <div class="d-grid gap-2" style="margin-top: 16px">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="role" id="role1" value="1" <c:if test="${requestScope['role'] == null || requestScope['role'] == '1'}">checked</c:if>>
                            <label class="form-check-label" for="role1">
                                I'm a teacher
                                
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="role" id="role2" value="2" <c:if test="${requestScope['role'] == '2'}">checked</c:if>>
                            <label class="form-check-label" for="role2">
                                I'm a student
                            </label>
                        </div>
                        <input class="btn btn-primary btn--signin" type="submit" value="Sign up" style="margin-top: 4px">
                    </div>
                </form>
                <div class="signin--account" style="justify-content: center;gap: 4px;">Have a account ?<a class="btn--signup" href="<c:url value="/signin"/>"> Signin</a></div>
            </div>
            <div class="content--right">
                <img src="./assets/img/signin.svg" alt="">
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('#signup-form').validate({
                rules: {
                    name: {
                        required: true,
                    },
                    dob: {
                        date: true,
                    },
                    email: {
                        required: true,
                        email: true,
                    },
                    password: {
                        required: true,
                    },
                    'confirm-password': {
                        required: true,
                        equalTo: '#password',
                    }
                },
                messages: {
                    name: {
                        required: 'Please enter name',
                    },
                    dob: {
                        date: 'Date of birth does not meet date structure',
                    },
                    email: {
                        email: 'Email does not meet email structure',
                    },
                    'confirm-password': {
                        equalTo: 'Password and Confirm password does not match'
                    }
                }
            })
        })
    </script>
</body>

</html>
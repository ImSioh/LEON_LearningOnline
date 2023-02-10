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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js" integrity="sha512-rstIgDs0xPgmG6RX1Aba4KV5cWJbAMcvRCVmglpam9SoHZiUCyQVDdH2LPlxoHtrv17XWblE/V/PP+Tr04hbtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
            <div class="content--left--signup">
                <div class="content--left--title">Sign Up</div>
                <form method="POST" action="<c:url value="/signup"/>" class="signin" id="signup-form">
                    <label>Name</label>
                    <input name="name" class="input--email" type="text" value="${requestScope["name"]}"/>
                    <label id="name-error" class="error" for="name">${requestScope["name-error"]}</label>

                    <label>Date of birth</label>
                    <input id="dob" name="dob" class="input--email" type="date" value="${requestScope["dob"]}"/>
                    <label id="dob-error" class="error" for="dob">${requestScope["dob-error"]}</label>

                    <div style="display: flex; margin-top: 16px; gap: 3rem">
                        <label>Gender:</label>
                        <div class="form-check">
                            <input class="form-check-input" id="gender-male" type="radio" name="gender" value="male" checked>
                            <label class="form-check-label" for="gender-male">
                                Male
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" id="gender-female" type="radio" name="gender" value="male" checked>
                            <label class="form-check-label" for="gender-female">
                                Female
                            </label>
                        </div>
                    </div>

                    <label>School</label>
                    <input id="schoold" name="school" class="input--email" type="text" value="${requestScope["schoold"]}"/>
                    <label id="schoold-error" class="error" for="dob">${requestScope["schoold-error"]}</label>

                    <label>Address</label>
                    <input name="address" class="input--email" type="text" value="${requestScope["address"]}"/>

                    <label>Phone number</label>
                    <input name="phone" class="input--email" type="text" value="${requestScope["phone"]}"/>
                    <label id="phone-error" class="error" for="phone">${requestScope["phone-error"]}</label>

                    <label>Email</label>
                    <input name="email" class="input--email" type="text" value="${requestScope["email"]}"/>
                    <label id="email-error" class="error" for="email">${requestScope["email-error"]}</label>

                    <label>Password <span style="font-size: 0.9rem;color: graytext">(Password length must in range 8-30)</span></label>
                    <input name="password" class="input--password" type="password" id="password"/> 
                    <label id="password-error" class="error" for="password">${requestScope["password-error"]}</label>

                    <label>Confirm Password</label>
                    <input name="confirm-password" class="input--password" type="password"/> 
                    <label id="confirm-password-error" class="error" for="confirm-password">${requestScope["confirm-password-error"]}</label>

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
            $.validator.addMethod('validatePhoneNumber', function (value, element) {
                return this.optional(element) || /^(84|0[3|5|7|8|9])+([0-9]{8})$/.test(value)
            }, 'Invalid phone number')
            $.validator.addMethod('validateDob', function (value, element) {
                const present = new Date()
                const birthOfDate = new Date(value)
                return this.optional(element)
                        || birthOfDate.getFullYear() < present.getFullYear()
                        || birthOfDate.getMonth() < present.getMonth()
                        || birthOfDate.getDate() < present.getDate()
            }, 'Birth of date must before present')
            $('#signup-form').validate({
                rules: {
                    name: {
                        required: true,
                        maxlength: 100,
                    },
                    dob: {
                        date: true,
                        validateDob: true,
                    },
                    phone: {
                        validatePhoneNumber: true
                    },
                    email: {
                        required: true,
                        email: true,
                    },
                    password: {
                        required: true,
                        minlength: 8,
                        maxlength: 30,
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
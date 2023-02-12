<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file= "/template/header.jsp" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
        <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">
        <link rel="stylesheet" href="<c:url value="/assets/css/styles.css"/>">  
        <link rel="icon" href="assets/img/leon-icon.png">
        <script src="assets/js/swiper-bundle.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>


        <title>LE.ON VietNam</title>
    </head>
    <body>
        <div class="main">
            <div id="header" class="fixed-top" style="top: 0;">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-light ${account.getRole() == 1 ? "bg-info" : "bg-light"}"">
                    <!-- Container wrapper -->
                    <div class="container-fluid">
                        <!-- Toggle button -->
                        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>

                        <!-- Collapsible wrapper -->
                        <div class="collapse navbar-collapse " id="navbarSupportedContent">
                            <!-- Navbar brand -->


                            <c:choose>
                                <c:when test="${account.getRole() == 1 }">
                                    <a href="<c:url value="/teacher/class"/>" class="navbar-brand mt-2 mt-lg-0 text-light">LE.ON - Teacher </a>
                                </c:when>    
                                <c:otherwise>
                                    <a href="<c:url value="/student/overview"/>" class="navbar-brand mt-2 mt-lg-0">LE.ON -Student </a>
                                </c:otherwise>
                            </c:choose>



                            <!-- Collapsible wrapper -->

                            <!-- Left links -->

                            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 ">
                                <li class="nav-item navbariteam">
                                    <c:choose>
                                        <c:when test="${account.getRole() == 2}">
                                            <a class="nav-link " href="<%=path%>/student/sendfeedback" style="color: white !important; font-size: 15px;">Send Feedback</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="nav-link " href="<%=path%>/teacher/sendfeedback" style=" color: white !important;font-size: 15px;">Send Feedback</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="nav-item navbariteam">
                                     <c:choose>
                                        <c:when test="${account.getRole() == 2}">
                                            <a class="nav-link " href="<%=path%>/student/viewfeedback" style="color:#1e88e5 !important; font-size: 15px;">View Feedback</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="nav-link " href="<%=path%>/teacher/viewfeedback" style=" font-size: 15px;">View Feedback</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>

                        </div>
                        <!--Right elements--> 
                        <div class="d-flex align-items-center">


                            <!--Notifications--> 
                            <div class="dropdown" style="margin-right: 15px;">
                                <a class="text-reset me-3 dropdown-toggle hidden-arrow" href="#" id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-bell" style="font-size: 22px; text-decoration: none; color: ${account.getRole() == 1 ? "white" : "black"}"; margin-left: 14px;"></i>
                                    <span class="badge rounded-pill badge-notification bg-danger">9</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                                    <a href="<c:url value="/${account.getRole() == 1 ? 'teacher' : 'student'}/profile"/>" style="font-size: 16px;text-decoration: none">
                                        <div class="d-flex bd-highlight dropdown-item">
                                            <span class="p-2 flex-shrink-1 bd-highlight">
                                                <i class="far fa-user"></i>
                                            </span>
                                            <span class="p-2 w-100 bd-highlight" style="color: #6e6e6e;">
                                                Profile
                                            </span>
                                        </div>
                                    </a>

                                    <a href="<c:url value="/${account.getRole() == 1 ? 'teacher' : 'student'}/sendfeedback"/>" style="font-size: 16px;text-decoration: none">
                                        <div class="d-flex bd-highlight dropdown-item">
                                            <span class="p-2 flex-shrink-1 bd-highlight">
                                                <i class="far fa-paper-plane"></i>
                                            </span>
                                            <span class="p-2 w-100 bd-highlight" style="color: #6e6e6e;">
                                                Send feedback
                                            </span>
                                        </div>
                                    </a>

                                    <a href="<c:url value="/logout"/>" style="font-size: 16px;text-decoration: none">
                                        <div class="d-flex bd-highlight dropdown-item">
                                            <span class="p-2 flex-shrink-1 bd-highlight">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </span>
                                            <span class="p-2 w-100 bd-highlight" style="color: #6e6e6e;">
                                                Log Out
                                            </span>
                                        </div>
                                    </a>
                                </ul>
                            </div>
                            <!--Avatar--> 
                            <div class="dropdown">
                                <span class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#" id="navbarDropdownMenuAvatar" role="button" data-mdb-toggle="dropdown" aria-expanded="false" style="text-decoration: none;">
                                    <i class="far fa-user-circle" style="font-size: 24px; text-decoration: none; color: ${account.getRole() == 1 ? "white" : "black"}"; margin-left: 10px;"></i>
                                </span>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                                    <a href="<c:url value="/${account.getRole() == 1 ? 'teacher' : 'student'}/profile"/>" style="font-size: 16px;text-decoration: none">
                                        <div class="d-flex bd-highlight dropdown-item">
                                            <span class="p-2 flex-shrink-1 bd-highlight">
                                                <i class="far fa-user"></i>
                                            </span>
                                            <span class="p-2 w-100 bd-highlight" style="color: #6e6e6e;">
                                                Profile
                                            </span>
                                        </div>
                                    </a>

                                    <a href="<c:url value="/${account.getRole() == 1 ? 'teacher' : 'student'}/sendfeedback"/>" style="font-size: 16px;text-decoration: none">
                                        <div class="d-flex bd-highlight dropdown-item">
                                            <span class="p-2 flex-shrink-1 bd-highlight">
                                                <i class="far fa-paper-plane"></i>
                                            </span>
                                            <span class="p-2 w-100 bd-highlight" style="color: #6e6e6e;">
                                                Send feedback
                                            </span>
                                        </div>
                                    </a>

                                    <a href="<c:url value="/logout"/>" style="font-size: 16px;text-decoration: none">
                                        <div class="d-flex bd-highlight dropdown-item">
                                            <span class="p-2 flex-shrink-1 bd-highlight">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </span>
                                            <span class="p-2 w-100 bd-highlight" style="color: #6e6e6e;">
                                                Log Out
                                            </span>
                                        </div>
                                    </a>
                                </ul>
                            </div>
                        </div>
                        <!--Right elements--> 
                    </div>
                    <!-- Container wrapper -->
                </nav>
                <!-- Navbar -->
            </div>
            <div class="content" style="margin-top: 50px;">


                <section class="contact section" id="contact" style="padding-top: 100px">
                    <h2 class="section__title">Feedback</h2>
                    <span class="section__subtitle">Support by LE.ON</span>

                    <div class="contact__container container grid">
                        <div>
                            <div class="contact__information">
                                <i class="uil uil-phone contact__icon"></i>

                                <div>
                                    <h3 class="contact__title">Phone Number</h3>
                                    <span class="contact__subtitle">0912345678</span>

                                </div>
                            </div>

                            <div class="contact__information">
                                <i class="uil uil-envelope-heart contact__icon"></i>

                                <div>
                                    <h3 class="contact__title">Email</h3>
                                    <span class="contact__subtitle">leoneduservice@gmail.com</span>

                                </div>
                            </div>


                            <div class="contact__information">
                                <i class="uil uil-map-marker contact__icon"></i>

                                <div>
                                    <h3 class="contact__title">Location</h3>
                                    <span class="contact__subtitle">Hoa Lac,Ha Noi,Viet Nam</span>

                                </div>
                            </div>
                        </div>

                        <form action="<c:url value="/${account.getRole() == 1 ? 'teacher' : 'student'}/sendfeedback"/>" method="post" class="contact__form" id="contact-form">
                            <div class="contact__inputs grid">
                                <div class="contact__content">
                                    <label for="" class="contact__label">Title</label>
                                    <input value="${feedbackTitle}" name="feedbackTitle" type="text" class="contact__input" id="contact-name">
                                </div>
                                <div class="contact__content">
                                    <label for="" class="contact__label">Content</label>
                                    <textarea name="feedbackContent" id="contact-message" class="contact__input" id="" cols="0" rows="7">${feedbackContent}</textarea>
                                </div>
                                <p class="contact__mess" id="contact-mess"></p>
                                <div style="color : red">${msg}</div>
                                <div>
                                    <button class="button button--flex" style="border : none ; font-size: medium ; margin-bottom: 20px">
                                        Send Feedback
                                        <i class="uil uil-envelope-send button__icon"></i>
                                    </button>
                                </div>

                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>

        <div class="footer">

        </div>
    </div>

</body>




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
                                <c:when test="${account.getRole() == 1}">
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
                                            <a  class="nav-link " href="<%=path%>/student/sendfeedback" style=" font-size: 15px;">Send Feedback</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="nav-link " href="<%=path%>/teacher/sendfeedback" style=" font-size: 15px;">Send Feedback</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li class="nav-item navbariteam">
                                    <c:choose>
                                        <c:when test="${account.getRole() == 2}">
                                            <a  class="nav-link " href="<%=path%>/student/viewfeedback" style="font-size: 15px;">View Feedback</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a  class="nav-link " href="<%=path%>/teacher/viewfeedback" style=" font-size: 15px;">View Feedback</a>
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
            <table style="margin-top: 70px !important ; position: fixed !important;" class="table">
                <thead>
                    <tr>
                        <th scope="col">Title</th>
                        <th scope="col">Response</th>
                        <th scope="col">Submit Time</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listFeedback}" var="listFB" >
                        <tr>
                            <td scope="row">${listFB.getTitle()}</td>
                            <c:if test="${listFB.getResponse()== ''}" >
                                <td>Admin will response later</td>
                            </c:if>
                            <c:if test="${listFB.getResponse()!= ''}" >
                                <td>  <a href="<c:url value="/${account.getRole() == 1 ? 'teacher' : 'student'}/view-response?Id=${listFB.getFeedbackId()}"/>">View</a></td>
                            </c:if>
                            <td>${listFB.getCreateTime()}</td>
                        </tr>
                    </c:forEach>


                </tbody>
            </table>
    </body>

   
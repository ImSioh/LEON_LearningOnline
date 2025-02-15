<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <!--CSS-->
        <link rel="stylesheet" href="<c:url value="/admin/assets/css/style.css"/>">

        <link rel="icon" href="<c:url value="/assets/img/leon-icon.png"/>"/>

        <title>LE.ON VietNam</title>

    </head>

    <body>
        <div class="main">
            <div id="header" class="top" style="top: 0">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <!-- Container wrapper -->
                    <div class="container-fluid">
                        <!-- Toggle button -->
                        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse"
                                data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>

                        <!-- Collapsible wrapper -->

                        <a href="feedback-list" class="navbar-brand mt-2 mt-lg-0">LE.ON - Admin</a>

                        <!-- Left links -->
                        <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="feedback-list"
                                   style="color: #1e88e5; font-size: 15px;">Feedback</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="teacher-account-list"
                                   style="color: #1e88e5; font-size: 15px;">Teacher</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="student-account-list"
                                   style="color: #1e88e5; font-size: 15px;">Student</a>
                            </li>
                        </ul>
                        <!-- Left links -->
                    </div>
                    <!-- Collapsible wrapper -->

                    <!-- Right elements -->
                    <div class="d-flex align-items-center">


                        <!-- Notifications -->
<!--                        <div class="dropdown">
                            <a class="text-reset me-3 dropdown-toggle hidden-arrow" href="#" id="navbarDropdownMenuLink"
                               role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                                <i class="far fa-bell" style="font-size: 24px; "></i>
                                <span class="badge rounded-pill badge-notification bg-danger">5</span>
                            </a>
                        </div>-->
                        <!-- Avatar -->
                        <div class="dropdown">
                            <a class="dropdown-toggle d-flex align-items-center hidden-arrow" href="<c:url value="/admin"/>"
                               id="navbarDropdownMenuAvatar" role="button" data-mdb-toggle="dropdown"
                               aria-expanded="false" style="text-decoration: none;">
                                <i class="far fa-user-circle"
                                   style="font-size: 24px; color: black; margin-left: 10px;"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                                <div class="d-flex bd-highlight dropdown-item">
                                    <li class="p-2 flex-shrink-1 bd-highlight">
                                        <i class="fas fa-sign-out-alt"></i>
                                    </li>
                                    <li class="p-2 w-100 bd-highlight">
                                        <a href="<c:url value="/logout"/>" style="color: #6e6e6e; font-size: 16px;text-decoration: none">Log Out</a>
                                    </li>
                                </div>
                            </ul>
                        </div>
                    </div>
                    <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->
    </div>

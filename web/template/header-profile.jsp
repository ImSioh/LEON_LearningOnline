<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="controllers.*" %>
<%@page import="dto.*" %>
<%@page import="java.util.ArrayList" %>
<% String path =request.getContextPath();%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min1.css" rel="stylesheet" >
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous" />

        <title>LE.ON</title>

        <style>
            body {
                min-height: 100vh;
            }
            .sidebarnav a {
                text-transform: unset !important;
                font-size: 1rem !important;

            }

            .sidebarnav a.active{
                color: #1e88e5 !important;
                background-color: #e3f2fd !important;
                border-radius: 8px !important;
            }

        </style>


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
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <!-- Navbar brand -->

                            <c:choose>
                                <c:when test="${account.getRole() == 1 }">
                                    <a href="<c:url value="/teacher/class"/>" class="navbar-brand mt-2 mt-lg-0" style="color: white;">LE.ON - Teacher </a>
                                </c:when>    
                                <c:otherwise>
                                    <a href="<c:url value="/student/overview"/>" class="navbar-brand mt-2 mt-lg-0">LE.ON -Student </a>
                                </c:otherwise>
                            </c:choose>


                        </div>
                        <!-- Collapsible wrapper -->

                        <!--Right elements--> 
                        <div class="d-flex align-items-center">


                            <!--Notifications--> 
                            <div class="dropdown">
                                <a class="text-reset me-3 dropdown-toggle hidden-arrow" href="#" id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-bell" style="font-size: 22px; text-decoration: none; color: ${account.getRole() == 1 ? "white" : "black"}";"></i>
                                    <span class="badge rounded-pill badge-notification bg-danger">1</span>
                                </a>

                            </div>
                            <!--Avatar--> 
                            <div class="dropdown">
                                <a class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#" id="navbarDropdownMenuAvatar" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                                    <i class="far fa-user-circle" style="font-size: 24px; text-decoration: none; color: ${account.getRole() == 1 ? "white" : "black"}"; margin-left: 10px;"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                                    <div class="d-flex bd-highlight dropdown-item">
                                        <li class="p-2 flex-shrink-1 bd-highlight">
                                            <i class="far fa-user"></i>
                                        </li>
                                        <li class="p-2 w-100 bd-highlight">
                                            <c:choose>
                                                <c:when test="${account.getRole() == 1 }">
                                                    <a href="<c:url value="/teacher/profile"/>" style="color: #6e6e6e; font-size: 16px;text-decoration: none">Profile</a>

                                                </c:when>    
                                                <c:otherwise>
                                                    <a href="<c:url value="/student/profile"/>" style="color: #6e6e6e; font-size: 16px;text-decoration: none">Profile</a>

                                                </c:otherwise>
                                            </c:choose>
                                        </li>
                                    </div>

                                    <div class="d-flex bd-highlight dropdown-item">
                                        <li class="p-2 flex-shrink-1 bd-highlight">
                                            <i class="far fa-paper-plane"></i>
                                        </li>
                                        <li class="p-2 w-100 bd-highlight">
                                            <a href="<c:url value="/SendFeedback"/>" style="color: #6e6e6e; font-size: 16px;text-decoration: none">Send feedback</a>
                                        </li>
                                    </div>

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
                        <!--Right elements--> 
                    </div>
                    <!-- Container wrapper -->
                </nav>
                <!-- Navbar -->
            </div>


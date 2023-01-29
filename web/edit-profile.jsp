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
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <!-- Container wrapper -->
                    <div class="container-fluid">
                        <!-- Toggle button -->
                        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars"></i>
                        </button>

                        <!-- Collapsible wrapper -->
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <!-- Navbar brand -->

                            <a href="<%=path%>/overview-incomplete" class="navbar-brand mt-2 mt-lg-0">LE.ON - Student</a>


                        </div>
                        <!-- Collapsible wrapper -->

                        <!--Right elements--> 
                        <div class="d-flex align-items-center">


                            <!--Notifications--> 
                            <div class="dropdown">
                                <a class="text-reset me-3 dropdown-toggle hidden-arrow" href="#" id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-bell"></i>
                                    <span class="badge rounded-pill badge-notification bg-danger">1</span>
                                </a>

                            </div>
                            <!--Avatar--> 
                            <div class="dropdown">
                                <a class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#" id="navbarDropdownMenuAvatar" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                                    <i class="far fa-user-circle" style="font-size: 24px; text-decoration: none; color: black; margin-left: 10px;"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                                    <div class="d-flex bd-highlight dropdown-item">
                                        <li class="p-2 flex-shrink-1 bd-highlight">
                                            <i class="far fa-user"></i>
                                        </li>
                                        <li class="p-2 w-100 bd-highlight">
                                            <a href="<c:url value="/profile"/>" style="color: #6e6e6e; font-size: 16px;text-decoration: none">Profile</a>
                                        </li>
                                    </div>

                                    <div class="d-flex bd-highlight dropdown-item">
                                        <li class="p-2 flex-shrink-1 bd-highlight">
                                            <i class="far fa-paper-plane"></i>
                                        </li>
                                        <li class="p-2 w-100 bd-highlight">
                                            <a href="#" style="color: #6e6e6e; font-size: 16px;text-decoration: none">Send feedback</a>
                                        </li>
                                    </div>

                                    <div class="d-flex bd-highlight dropdown-item">
                                        <li class="p-2 flex-shrink-1 bd-highlight">
                                            <i class="fas fa-sign-out-alt"></i>
                                        </li>
                                        <li class="p-2 w-100 bd-highlight">
                                            <a href="#" style="color: #6e6e6e; font-size: 16px;text-decoration: none">Log Out</a>
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


            <div class="content"style="margin-top: 50px;">
                <section style="background-color: rgb(209, 209, 209);">
                    <div class="container py-5 ">
                        <div class="row">
                            <div class="col">
                                <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                    <ol class="breadcrumb mb-0">
                                        <li class="breadcrumb-item"><a href="HomeS.jsp" style="text-decoration: none;">Home</a></li>
                                        <li class="breadcrumb-item"><a href="<c:url value="/profile"/>" style="text-decoration: none;">Profile</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-evenly">
                            <div class="col-md-3 border-right card">
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://www.shareicon.net/data/128x128/2016/09/15/829459_man_512x512.png">
                                    <span class="font-weight-bold">Le Duc Phi</span><span class="text-black-50">leducphi195002@gmail.com</span><span> </span>
                                </div>
                            </div>

                            <div class="col-md-8 border-right card">
                                <div class="p-3 py-5 col-md-9">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4 class="text-right">Edit Profile</h4>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12"><label class="labels">Name</label><input type="text" class="form-control" placeholder="Name" value=""></div>
                                        <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" class="form-control" placeholder="enter phone number" value=""></div>
                                        <div class="col-md-12"><label class="labels">Date of birth</label><input type="date" class="form-control" placeholder="Date of birth" value=""></div>
                                        <div class="col-md-12"><label class="labels">Address</label><input type="text" class="form-control" placeholder="Address" value=""></div>
                                        <div class="col-md-12"><label class="labels">Email</label><input type="text" class="form-control" placeholder="" value="leducphi195002@gmail.com" disabled>
                                        </div>

                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-6"><label class="labels">Class</label><input type="text" class="form-control" placeholder="SE641" value=""></div>
                                        <div class="col-md-6"><label class="labels">School</label><input type="text" class="form-control" value="" placeholder="FPT University"></div>
                                    </div>
                                    <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="button">Save Profile</button></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

            </div>
        </div>
    </div>
</div>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>

</body>

</html>
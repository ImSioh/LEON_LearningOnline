<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!-- CSS -->
        <link rel="stylesheet" href="assets/css/bootstrap4.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min1.css" rel="stylesheet" >
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous" />
        <link href="../assets/css/style.css" rel="stylesheet" type="text/css"/>
        <title>LE.ON</title>
    </head>

    <body>
        <div class="main">
            <div id="header">
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

                            <a href="../index.jsp" class="navbar-brand mt-2 mt-lg-0">LE.ON - Student</a>

                            <!-- Left links -->
                            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link" href="#" style="color: #6e6e6e; font-size: 15px;">Overview</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#" style="color: #6e6e6e; font-size: 15px;">Class</a>
                                </li>
                            </ul>
                            <!-- Left links -->
                        </div>
                        <!-- Collapsible wrapper -->

                        <!-- Right elements -->
                        <div class="d-flex align-items-center">


                            <!-- Notifications -->
                            <div class="dropdown">
                                <a class="text-reset me-3 dropdown-toggle hidden-arrow" href="#" id="navbarDropdownMenuLink" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-bell"></i>
                                    <span class="badge rounded-pill badge-notification bg-danger">1</span>
                                </a>

                            </div>
                            <!-- Avatar -->
                            <div class="dropdown">
                                <a class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#" id="navbarDropdownMenuAvatar" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                                    <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="rounded-circle" height="25" alt="Black and White Portrait of a Man" loading="lazy" />
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                                    <div class="d-flex bd-highlight dropdown-item">
                                        <li class="p-2 flex-shrink-1 bd-highlight">
                                            <img src="assets/img/profile.jpg" style="width: 100%; width: 30px" alt="" />
                                        </li>
                                        <li class="p-2 w-100 bd-highlight">
                                            <a href="profile.jsp" style="color: #6e6e6e; font-size: 16px;">Profile</a>
                                        </li>
                                    </div>

                                    <div class="d-flex bd-highlight dropdown-item">
                                        <li class="p-2 flex-shrink-1 bd-highlight">
                                            <img src="assets/img/2165310.png" style="width: 100%; width: 30px" alt="" />
                                        </li>
                                        <li class="p-2 w-100 bd-highlight">
                                            <a href="#" style="color: #6e6e6e; font-size: 16px;">Send feedback</a>
                                        </li>
                                    </div>

                                    <div class="d-flex bd-highlight dropdown-item">
                                        <li class="p-2 flex-shrink-1 bd-highlight">
                                            <img src="assets/img/7612790.png" style="width: 100%; width: 30px" alt="" />
                                        </li>
                                        <li class="p-2 w-100 bd-highlight">
                                            <a href="#" style="color: #6e6e6e; font-size: 16px;">Log Out</a>
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
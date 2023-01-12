<%@include file= "./template/header.jsp" %>
<div class="content" style="margin-top: 50px;">
    <section style="background-color: rgb(209, 209, 209);">
        <div class="container py-5">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="teacher/HomeT.jsp" style="text-decoration: none;">Home</a></li>
                            <li class="breadcrumb-item"><a href="<c:url value="profile"/>" style="text-decoration: none;">User</a></li>
                            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <img src="https://scontent.fhan5-9.fna.fbcdn.net/v/t39.30808-6/322963265_1507772549717693_9216502814355368796_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=qnXNsNUZDgIAX8VYZ5i&_nc_ht=scontent.fhan5-9.fna&oh=00_AfBqA-YEfz-wfkpOGXgvfTlT-rjDczlhsPuXtWuYyN0epA&oe=63C0A2A0"
                                 alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                            <h5 class="my-3">${account.getName()}</h5>
                            <p class="text-muted mb-1">Teacher</p>
                            <p class="text-muted mb-4">Ha Noi, Viet Nam</p>
                            <div class="d-flex justify-content-center mb-2">
                                <a type="button" class="btn btn-primary" href="change-password.jsp">Change
                                    Password</a>
                                <a type="button" class="btn btn-outline-primary ms-1" href="<%=path%>edit-profile.jsp">Edit Profile</a>
                            </div>
                        </div>
                    </div>
                    <div class="card mb-4 mb-lg-0">
                        <div class="card-body p-0">
                            <ul class="list-group list-group-flush rounded-3">
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fas fa-globe fa-lg text-warning"></i>
                                    <p class="mb-0">https://github.com/leducphy</p>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fab fa-github fa-lg" style="color: #333333;"></i>
                                    <p class="mb-0">https://github.com/leducphy</p>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fab fa-twitter fa-lg" style="color: #55acee;"></i>
                                    <p class="mb-0">@leducphi</p>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fab fa-instagram fa-lg" style="color: #ac2bac;"></i>
                                    <p class="mb-0">leducphi_</p>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center p-3">
                                    <i class="fab fa-facebook-f fa-lg" style="color: #3b5998;"></i>
                                    <p class="mb-0">Phi02</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Full Name</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${account.getName()}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Email</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${account.getEmail()}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Date of Birth</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${account.getBirthDate()}</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Mobile</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">0862779990</p>
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <p class="mb-0">Address</p>
                                </div>
                                <div class="col-sm-9">
                                    <p class="text-muted mb-0">${account.getAddress()}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card mb-4 mb-md-0">
                                <div class="card-body">
                                    <p class="mb-4"><span class="text-primary font-italic"></span> CLASSES
                                    </p>
                                    <ul class="list-group list-group-light">
                                        <li class="list-group-item">
                                            <i class="fas fa-users" style="margin-right: 16px"></i>
                                            SE1641
                                        </li>
                                        <li class="list-group-item">
                                            <i class="fas fa-users" style="margin-right: 16px"></i>
                                            SE1641
                                        </li>
                                        <li class="list-group-item">
                                            <i class="fas fa-users" style="margin-right: 16px"></i>
                                            SE1641
                                        </li>
                                        <li class="list-group-item">
                                            <i class="fas fa-users" style="margin-right: 16px"></i>
                                            SE1641
                                        </li>
                                        <li class="list-group-item">
                                            <i class="fas fa-users" style="margin-right: 16px"></i>
                                            SE1641
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<div class="footer">

</div>
</div>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>

</body>

</html>
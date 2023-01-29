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
                            <img src="https://www.shareicon.net/data/128x128/2016/09/15/829459_man_512x512.png"
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
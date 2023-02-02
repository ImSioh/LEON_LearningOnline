<%@include file= "/template/header-profile.jsp" %>
            <div class="content"style="margin-top: 50px;">
                <section style="background-color: rgb(209, 209, 209);">
                    <div class="container py-5 ">
                        <div class="row">
                            <div class="col">
                                <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                    <ol class="breadcrumb mb-0">
                                        <c:choose>
                                            <c:when test="${account.getRole() == 1 }">
                                                <li class="breadcrumb-item"><a href="<c:url value="/teacher/class"/>" style="text-decoration: none;">Home</a></li>
                                                <li class="breadcrumb-item"><a href="<c:url value="/teacher/profile"/>" style="text-decoration: none;">Profile</a></li>
                                                </c:when>    
                                                <c:otherwise>
                                                <li class="breadcrumb-item"><a href="<c:url value="/student/overvew"/>" style="text-decoration: none;">Home</a></li>
                                                <li class="breadcrumb-item"><a href="<c:url value="/student/profile"/>" style="text-decoration: none;">Profile</a></li>
                                                </c:otherwise>
                                            </c:choose>


                                        <li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-evenly">
                            <div class="col-md-3 border-right card">
                                <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://www.shareicon.net/data/128x128/2016/09/15/829459_man_512x512.png">
                                    <span class="font-weight-bold">${account.getName()}</span><span class="text-black-50">${account.getEmail()}</span><span> </span>
                                </div>
                            </div>

                            <div class="col-md-8 border-right card">
                                <form action="<c:url value="/profile/edit"/>" method="post">
                                    <div class="p-3 py-5 col-md-9">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4 class="text-right">Edit Profile</h4>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-12">
                                                <label class="labels">Name</label>
                                                <input type="text" class="form-control" placeholder="${account.getName()}" value="${account.getName()}" name="txtName">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Mobile Number</label>
                                                <input type="text" class="form-control" placeholder="${account.getPhoneNumber()}" value="${account.getPhoneNumber()}" name="txtPhone">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Date of birth</label>
                                                <input type="date" class="form-control" placeholder="${account.getBirthDate()}" value="${account.getBirthDate()}" name="txtBD">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Address</label>
                                                <input type="text" class="form-control" placeholder="${account.getAddress()}" value="${account.getAddress()}" name="txtAddress">
                                            </div>
                                            <div class="col-md-12">
                                                <label class="labels">Email</label>
                                                <input type="text" class="form-control" placeholder="${account.getEmail()}" value="${account.getEmail()}" disabled name="txtMail">
                                            </div>
                                            <div class="col-md-12">
                                                <input type="hidden" class="form-control" placeholder="${account.getAccountId()}" value="${account.getAccountId()}" name="txtUUID">
                                            </div>
                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-md-6"><label class="labels">Class</label><input type="text" class="form-control" placeholder="SE641" value=""></div>
                                            <div class="col-md-6"><label class="labels">School</label><input type="text" class="form-control" value="" placeholder="FPT University"></div>
                                        </div>
                                        <div class="mt-5 text-center">
                                            <input class="btn btn-primary profile-button" type="submit" value="Save Profile"></input>
                                        </div>
                                    </div>
                                </form>
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
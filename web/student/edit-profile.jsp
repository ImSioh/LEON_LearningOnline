<%@include file= "./template/header.jsp" %>

<div class="content">
    <section style="background-color: rgb(209, 209, 209);">
        <div class="container py-5 ">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="HomeS.jsp">Home</a></li>
                            <li class="breadcrumb-item"><a href="profile.jsp">User</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="row d-flex justify-content-evenly">
                <div class="col-md-3 border-right card">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://scontent.fhan5-9.fna.fbcdn.net/v/t39.30808-6/322963265_1507772549717693_9216502814355368796_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=qnXNsNUZDgIAX8VYZ5i&_nc_ht=scontent.fhan5-9.fna&oh=00_AfBqA-YEfz-wfkpOGXgvfTlT-rjDczlhsPuXtWuYyN0epA&oe=63C0A2A0">
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

<%@include file= "/template/header.jsp" %>
<div class="content"style="margin-top: 50px;">
    <section style="background-color: rgba(209, 209, 209, 0.5); min-height: 100vh; max-height: fit-content;">
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
                <div class="col-md-3 border-right card" style=" border-radius: 15px; overflow: hidden;">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <p id="msg-error" style="display: none;">Your upload file must less than 5MB</p>
                        <label for="uploadImgProfile" id="change-img-profile" style="cursor: pointer;width: 150px; height: 150px; overflow: hidden;" class="rounded-circle mt-5 position-relative" >
                            <!--<img id="profile-img" class="rounded-circle" width="150px" height="150px" src="https://www.shareicon.net/data/128x128/2016/09/15/829459_man_512x512.png">-->
                            <div id="profile-img" style="
                                 width: 100%;
                                 height: 0;
                                 padding-bottom: 100%;
                                 background-image: url(<c:url value="${account.getProfilePicture()==null ? '/assets/img/ava.png' :account.getProfilePicture()}"/>);
                                 background-position: center;
                                 background-repeat: no-repeat;
                                 background-size: cover;
                                 ">
                            </div>
                            <div class="position-absolute" style=" top:0; left: 0; background-color: rgba(0, 0, 0, 0.3); display: none; width: 100%; height: 100%;">
                                <p class="text-light text-center" style=" overflow-wrap: break-word; font-weight: bold;">Click here to <br> change image</p>
                            </div>
                        </label>

                        <span class="font-weight-bold">${account.getName()}</span><span class="text-black-50">${account.getEmail()}</span><span> </span>
                    </div>
                </div>

                <div class="col-md-8 border-right card" style=" border-radius: 15px; overflow: hidden;">
                    <form action="<c:url value="${account.getRole() == 1 ? '/teacher': '/student'}/profile/edit"/>" method="post" enctype="multipart/form-data">
                        <div class="p-3 py-5 col-md-9">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Edit Profile</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12">
                                    <label class="labels">Name</label>
                                    <input type="text" class="form-control" placeholder="${account.getName()}" value="${account.getName()}" name="txtName">
                                    <label id="name-error" class="error text-danger" for="name">${requestScope["txtName-error"]}</label>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Mobile Number</label>
                                    <input type="text" class="form-control" placeholder="${account.getPhoneNumber()}" value="${account.getPhoneNumber()}" name="txtPhone">
                                    <label id="name-error" class="error text-danger" for="name">${requestScope["txtPhone-error"]}</label>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Date of birth</label>
                                    <input type="date" class="form-control" placeholder="${account.getBirthDate()}" value="${account.getBirthDate()}" name="txtBD">
                                    <label id="name-error" class="error text-danger" for="name">${requestScope["txtBD-error"]}</label>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">School</label>
                                    <input type="text" class="form-control" placeholder="${account.getSchool()}" value="${account.getSchool()}" name="txtSchool">
                                    <label id="name-error" class="error text-danger" for="name">${requestScope["txtSchool-error"]}</label>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Address</label>
                                    <input type="text" class="form-control" placeholder="${account.getAddress()}" value="${account.getAddress()}" name="txtAddress">
                                    <label id="name-error" class="error text-danger" for="name">${requestScope["txtAddress-error"]}</label>
                                </div>
                                <div class="col-md-12">
                                    <label class="labels">Gender</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="txtGender" ${account.isGender() eq "true" ? "checked" : ""} value="true"/>
                                        <label class="form-check-label" for="flexRadioDefault1"> Male </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="txtGender" ${account.isGender() eq "false" ? "checked" : ""} value="false"/>
                                        <label class="form-check-label" for="flexRadioDefault2"> Female </label>
                                    </div>

                                </div>
                                <div class="d-none">
                                    <input type="file" class="form-control" id="uploadImgProfile" name="txtImg" accept="image/png, image/jpeg" />
                                </div>

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

<script>
    const uploadImgProfile = document.getElementById('uploadImgProfile');
    const profileimg = document.getElementById('profile-img');
    const msg = document.getElementById('msg-error');
    var tmpImg = profileimg.style.backgroundImage;
    tmpImg = tmpImg.substring(5, tmpImg.length - 2);

    uploadImgProfile.addEventListener('change', function (e) {
        var fileupload = e.target.files[0];
        if (fileupload) {
            if (fileupload.size > 5 * 1024 * 1024) {
                msg.style.display = 'block';
                return;
            }
            if (!fileupload.type.startsWith("image/")) {
                return 
            }
            msg.style.display = 'none';
            var tmp = URL.createObjectURL(fileupload);
            profileimg.style.backgroundImage = 'url("' + tmp + '")';

        } else {
            profileimg.style.backgroundImage = 'url("' + tmpImg + '")';
        }
    });
</script>
<c:import url="/template/footer.jsp"/>
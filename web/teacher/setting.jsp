<%@include file="../template/header.jsp" %>

<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 50px;">
    <%@include file="../template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container" style="margin-left: 250px;">
        <div class="card col-md-9 mt-4 "  >

            <div class="card-body">
                <div class="signup-form">
                    <h2 class="form-title">Setting</h2>

                    <form method="POST" action="<c:url value="/teacher/class/setting?code=${param.code}"/>" enctype="multipart/form-data">
                        <div class="form-group">
                            <label class="labels" style=" font-weight: bold !important; margin: 30px 0px 5px 0px!important">Name class</label>
                            <input type="text" class="form-control" placeholder="${classObject.name}" name="txtName">
                        </div>
                        <div class=" form-switch form-check" style="padding-left: 0px !important; font-weight: bold !important; margin: 10px 0px !important">
                            <label class="form-check-label" >Student approve</label>
                            <input class="form-check-input" style="float: right !important" name="txtStudentApprove" <c:if test="${classObject.isEnrollApprove() == true}">checked</c:if> type="checkbox" >
                            </div>
                            <div class=" form-switch form-check" style="padding-left: 0px !important; font-weight: bold !important; margin: 10px 0px 0px 0px !important">
                                <label class="form-check-label" >Hidden class</label>
                                <input class="form-check-input"  style="float: right !important" name="txtHideClass" <c:if test="${classObject.isHidden() == true}">checked</c:if> type="checkbox">
                            </div>                           
                            <div>                                
                                <p id="msg-error" style="display: none;">Your upload file must less than 5MB</p>
                                <label for="uploadImgProfile" id="change-img-profile" class="rounded-circle mt-5 position-relative " >
                                    <div id="profile-img" style="
                                         overflow: hidden; width: 100% ; width: 930px; height: 100%;height: 208px; background-position: center;
                                         background-repeat: no-repeat;
                                         background-size: cover;
                                         background-image: url(<c:url value="${classObject.getClassPicture() == null ? '/assets/img/Common_picture.png' : classObject.getClassPicture()}"/>);
                                    ">
                                </div>
                                <div class="position-absolute" style=" top:0; left: 0; background-color: rgba(0, 0, 0, 0.3); display: none; width: 100%; height: 100%;">
                                    <p class="text-light text-center" style=" overflow-wrap: break-word; font-weight: bold;">Click here to <br> change image</p>
                                </div>
                            </label>
                            </div>
                        </div>

                        <input type="file" class="form-control d-none" id="uploadImgProfile" name="txtImg" />
                        <div class="form-group form-button d-flex justify-content-center mt-4 row m-5">
                            <button class="btn btn-primary" type="submit">Save</button>
                        </div>
                    </form>
                </div>

            </div>
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
            msg.style.display = 'none';
            var tmp = URL.createObjectURL(fileupload);
            profileimg.style.backgroundImage = 'url("' + tmp + '")';

        } else {
            profileimg.style.backgroundImage = 'url("' + tmpImg + '")';
        }
    });
</script>
<c:import url="../template/footer.jsp" />
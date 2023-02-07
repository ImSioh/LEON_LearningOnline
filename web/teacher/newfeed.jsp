<%@include file="../template/header.jsp" %>

<div class="content main-container d-flex" style="background-color: rgb(209, 209, 209 , 50%);  margin-top: 50px;">
    <%@include file="../template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container">

        <div class="card col-md-7 mt-4 " style="height: 330px;">
            <div class="card-header">Create Post</div>
            <div class="card-body">
                <h5 class="card-title">
                    <div class="form-outline">
                        <input type="text" id="form12" class="form-control" />
                        <label class="form-label" for="form12">Tittle</label>
                    </div>
                </h5>
                <p class="card-text">
                <div class="form-outline" style="height: 50px;">
                    <input type="text" id="form12" class="form-control"  />
                    <label class="form-label" for="form12">Content</label>
                </div>
                </p>
                <label class="form-label" for="customFile">Upload file</label>
                <input type="file" class="form-control" id="customFile" />
            </div>
            <div class="card-footer text-muted ">
                <a href="#" class="btn btn-primary ">Post</a>
            </div>
        </div>

        <div class="card col-md-7 mt-4">
            <div class="card-header">Teacher Post</div>
            <div class="card-body">
                <h5 class="card-title">
                    HomeWork
                </h5>
                <p class="card-text">
                <div class="form-outline" style="height: 50px;">
                    here is your homework for to night, have a good night!
                </div>
                </p>
            </div>
            <div class="card-footer text-muted ">
                Comment this post here
            </div>
        </div>

        <div class="card col-md-7 mt-4 ">
            <div class="card-header">Teacher Post</div>
            <div class="card-body">
                <h5 class="card-title">
                    HomeWork
                </h5>
                <p class="card-text">
                <div class="form-outline" style="height: 50px;">
                    here is your homework for to night, have a good night!
                </div>
                </p>
            </div>
            <div class="card-footer text-muted ">
                Comment this post here
            </div>
        </div>
        <div class="card col-md-7 mt-4 ">
            <div class="card-header">Teacher Post</div>
            <div class="card-body">
                <h5 class="card-title">
                    HomeWork
                </h5>
                <p class="card-text">
                <div class="form-outline" style="height: 50px;">
                    here is your homework for to night, have a good night!
                </div>
                </p>
            </div>
            <div class="card-footer text-muted ">
                Comment this post here
            </div>
        </div>


    </div>
</div>
<!--</div>-->
<c:import url="../template/footer.jsp" />
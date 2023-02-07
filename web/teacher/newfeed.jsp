<%@include file="../template/header.jsp" %>

<div class="content main-container d-flex" style="background-color: rgb(209, 209, 209 , 50%);  margin-top: 50px;">
    <%@include file="../template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container">

        <div class="card col-md-7 mt-4 "  >
            <div class="card-header">Create Post</div>
            <div class="card-body">
                <p class="card-text">
                <div class="form-outline">
                    <div class="form-floating" style="padding: 0;">
                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 90px" ></textarea>
                        <label for="floatingTextarea2">Create a post</label>
                    </div>
                </div>
                </p>

            </div>
            <div class="card-footer text-muted ">

                <div style="float: right;">
                    <div class="file btn btn-primary ml-2" style="position: relative; overflow: hidden;">
                        Attack file
                        <input type="file" style=" position: absolute; opacity: 0; right: 0; top: 0;"/>
                    </div>
                    <a href="#" class="btn btn-primary" >Post</a>
                </div>
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
<%@include file="../template/header.jsp" %>

<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 50px;">
    <%@include file="../template/sidebar.jsp" %>


    <div class="content-main  d-flex justify-content-center container position-relative">

        <div class="card col-md-7 mt-4" style="height: 320px;" >
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

        <!--//for 1 post-->

        <div class="card col-md-7 mt-4" style="height: 320px; " >
            <div class="card-header">Post</div>
            <div class="card-body">
                <p class="card-text">

                </p>

            </div>

        </div>

        <div class="card col-md-7 mt-4" style="height: 320px; " >
            <div class="card-header">Post</div>
            <div class="card-body">
                <p class="card-text">

                </p>

            </div>

        </div><!-- comment -->        
        <div class="card col-md-7 mt-4" style="height: 320px; " >
            <div class="card-header">Post</div>
            <div class="card-body">
                <p class="card-text">

                </p>

            </div>

        </div>



    </div>

    <div class="row position-fixed" style="top:0; bottom: 0; right: 0;" >
        <div style="background-color: white; width: 300px; height: 100vh; margin-top: 50px;">
            <h1>NOTIFICATION</h1>
            <hr class="h-color mx-2">
        </div>
    </div>

</div>
<c:import url="../template/footer.jsp" />
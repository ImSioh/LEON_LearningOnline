<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/header.jsp" %>

<style>
    .card {
        border-radius: 0.5rem;
    }
</style>
<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">
    <%@include file="/template/sidebar.jsp" %>
    <div class="content-main  d-flex justify-content-center container position-relative">

        <div class="card col-md-7 mt-4" style="height: fit-content;" >
            <div class="card-header">Create Post</div>
            <div class="card-body">
                <p class="card-text">
                <div class="form-outline">
                    <div class="form-floating" style="padding: 0;">
                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100%; resize: none;" rows="5" ></textarea>
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

        <div class="newfeed-post card col-md-7 mt-4" style="height: 320px; " >
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

    <%@include file="/template/notificationbar.jsp" %>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<c:import url="/template/footer.jsp" />
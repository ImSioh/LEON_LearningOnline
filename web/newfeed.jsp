<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/header.jsp" %>

<style>
    .card {
        border-radius: 0.5rem;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .post {
        padding: 1rem;
        background-color: white;
        border-radius: 8px;
    }

    .post-header {
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .post-header p {
        margin: 0;
    }

    .post-profile-picture {
        background-size: cover;
        background-position: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
    }

    .post-owner {
        font-weight: 500;
    }

    .post-time {
        user-select: none;
        font-size: 0.85rem;
        opacity: 0.5;
    }

    .post-body {
        padding-bottom: 1rem;
    }

    .post-body > textarea[name=content] {
        outline: none;
        border: none;
        resize: none;
        width: 100%;
        height: fit-content;
        padding-top: 1rem;
        display: flex;
        flex-direction: column;
    }

    .post-body > textarea[name=content]::placeholder {
        opacity: 0.5;
    }

    .post-footer {
        padding: 1rem 1rem 0;
        display: flex;
        justify-content: flex-end;
        border-top: 1px solid rgb(216, 220, 240);
        align-items: center;
    }

    .post:not(#create-post) > .post-footer {
        padding-top: 0.5rem;
    }

    .post-footer p {
        margin: 0;
        padding-left: 0.5rem;
    }

    .post-footer button {
        font-weight: 500;
        text-transform: capitalize;
        border: none;
    }

    #add-resource {
        color: #1e88e5;
        box-shadow: none;
        border-right: 1px solid rgb(216, 220, 240);
        margin-right: 1rem;
        border-radius: unset;
    }

    .image-box {
        margin-top: 1rem;
        position: relative;
        width: 100%;
        height: 0;
        padding-top: 60%;
    }

    .image-box > div {
        display: flex;
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        border-radius: 8px;
        overflow: hidden;
    }

    .image-box .image-column {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
    }

    .image-box .image-item {
        width: 100%;
        flex-grow: 1;
        background-size: cover;
        background-position: center;
        cursor: pointer;
    }

    .image-box .image-more {
        content: "+2";
        color: white;
        font-size: 4rem;
        font-weight: 500;
        position: absolute;
        width: 50%;
        height: 50%;
        right: 0;
        bottom: 0;
        background-color: rgba(0, 0, 0, 0.6);
        justify-content: center;
        align-items: center;
        display: none;
        cursor: pointer;
    }

    .image-box.more .image-more {
        display: flex;
    }

    .document-box {
        margin-top: 1rem;
        border-radius: 8px;
        overflow: hidden;
        border: 2px solid rgb(216, 220, 240);
    }

    .document-item {
        font-weight: 500;
        cursor: pointer;
        padding: 0.5rem 1rem;
        border-top: 1px solid rgb(216, 220, 240);
    }

    .document-item:hover {
        background-color: aliceblue;
    }

    .document-item:first-child {
        border: none;
    }

    .comment-item {
        padding-top: 0.5rem;
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .comment-item > .comment-input {
        flex-grow: 1;
        border-radius: 20px;
        padding: 6px 1rem;
        outline: none;
        border: 2px solid #bdbdbd;
    }

    .comment-item > .comment-input::placeholder {
        opacity: 0.5;
    }

    .comment-item > .comment-input:focus {
        border: 2px solid #3b71ca;
    }

    #image-carousel {
        width: 100%;
        height: 200px;
        overflow-x: scroll;
        overflow-y: hidden;
        padding-bottom: 8px;
        border-radius: 8px;
    }

    #image-carousel::-webkit-scrollbar {
        height: 8px;
    }

    #image-carousel::-webkit-scrollbar-thumb {
        background-color: #bbb;
        border-radius: 4px;
    }

    #image-carousel:hover::-webkit-scrollbar-thumb {
        background-color: #aaa;
    }

    #image-carousel::-webkit-scrollbar-track {
        background-color: #eee;
        border-radius: 4px;
    }

    #carousel-wrapper {
        height: 100%;
        display: flex;
        gap: 0.5rem;
    }

    .carousel-img-item {
        height: 100%;
        position: relative;
    }

    #image-carousel img {
        border-radius: 8px;
        height: 100%;
        user-select: none;
        cursor: pointer;
    }
</style>
<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">
    <%@include file="/template/sidebar.jsp" %>
    <div class="content-main  d-flex justify-content-center container position-relative">
        <div class="col-md-7 mt-4 post" id="create-post">
            <div class="post-header">
                <div class="post-profile-picture" style="background-image: url(https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg)"></div>
                <div>
                    <p class="post-owner">
                        Maggi Buckberry
                    </p>
                </div>
            </div>
            <div class="post-body">
                <textarea placeholder="Enter post content here" rows="3" name="content"></textarea>
                <div id="image-carousel">
                    <div id="carousel-wrapper">
                        <div class="carousel-img-item">
                            <img draggable="false" src="https://images.unsplash.com/photo-1604998103924-89e012e5265a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFuc2NhcGV8ZW58MHx8MHx8&w=1000&q=80">
                        </div>
                        <div class="carousel-img-item">
                            <img draggable="false" src="https://i.pinimg.com/564x/56/bd/ee/56bdee62e5dfb18c83b9ab7745124d3d.jpg">
                        </div>
                        <div class="carousel-img-item">
                            <img draggable="false" src="https://wallpaperaccess.com/full/7092222.jpg">
                        </div>
                        <div class="carousel-img-item">
                            <img draggable="false" src="https://konachan.com/jpeg/f83287626389a6028a9003d6bfabdc68/Konachan.com%20-%20352889%20asu_%28sinsekai%29%20kuronoiparoma%20sinsekai_studio.jpg">
                        </div>
                        <div class="carousel-img-item">
                            <img draggable="false" src="https://images.unsplash.com/photo-1604998103924-89e012e5265a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFuc2NhcGV8ZW58MHx8MHx8&w=1000&q=80">
                        </div>
                        <div class="carousel-img-item">
                            <img draggable="false" src="https://i.pinimg.com/564x/56/bd/ee/56bdee62e5dfb18c83b9ab7745124d3d.jpg">
                        </div>
                        <div class="carousel-img-item">
                            <img draggable="false" src="https://wallpaperaccess.com/full/7092222.jpg">
                        </div>
                        <div class="carousel-img-item">
                            <img draggable="false" src="https://konachan.com/jpeg/f83287626389a6028a9003d6bfabdc68/Konachan.com%20-%20352889%20asu_%28sinsekai%29%20kuronoiparoma%20sinsekai_studio.jpg">
                        </div>
                    </div>
                </div>
                <div class="document-box">
                    <div class="document-item">Slot 11-Assemblies .NET.pptx</div>
                    <div class="document-item">Assignment2_MusicStoreWin.docx</div>
                    <div class="document-item">Guides_MVC.rar</div>
                </div>
            </div>
            <div class="post-footer">
                <button id="add-resource" class="btn">Add image, video, document...</button>
                <button id="post-btn" class="btn btn-primary">Post</button>
            </div>
        </div>
        <div class="col-md-7 mt-4 post">
            <div class="post-header">
                <div class="post-profile-picture" style="background-image: url(https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg)"></div>
                <div>
                    <p class="post-owner">Maggi Buckberry</p>
                    <p class="post-time">Class Code: FQQBS</p>
                </div>
            </div>
            <div class="post-body">
                <div class="image-box more">
                    <div>
                        <div class="image-more">+5</div>
                        <div class="image-column">
                            <div class="image-item" style="background-image: url(https://images.unsplash.com/photo-1604998103924-89e012e5265a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFuc2NhcGV8ZW58MHx8MHx8&w=1000&q=80);"></div>
                            <div class="image-item" style="background-image: url(https://images.unsplash.com/photo-1604998103924-89e012e5265a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bGFuc2NhcGV8ZW58MHx8MHx8&w=1000&q=80);"></div>
                        </div>
                        <div class="image-column">
                            <div class="image-item" style="background-image: url(https://c4.wallpaperflare.com/wallpaper/997/891/658/photography-nature-landscape-lake-wallpaper-preview.jpg);"></div>
                            <div class="image-item" style="background-image: url(https://w0.peakpx.com/wallpaper/1009/8/HD-wallpaper-golden-sunset-sunset-river-lanscape.jpg);"></div>
                        </div>
                    </div>
                </div>
                <div class="document-box">
                    <div class="document-item">Slot 11-Assemblies .NET.pptx</div>
                    <div class="document-item">Assignment2_MusicStoreWin.docx</div>
                    <div class="document-item">Guides_MVC.rar</div>
                </div>
            </div>
            <div class="post-footer">
                <i class="fa-regular fa-comment"></i>
                <p>12 comments</p>
            </div>
            <div class="post-comment">
                <div class="comment-item">
                    <div class="post-profile-picture" style="background-image: url(https://c4.wallpaperflare.com/wallpaper/997/891/658/photography-nature-landscape-lake-wallpaper-preview.jpg);"></div>
                    <input class="comment-input" placeholder="Enter your comment here" type="text">
                </div>
                <div class="comment-list">
                    <div class="comment-item">
                        <div class="post-profile-picture" style="background-image: url(https://c4.wallpaperflare.com/wallpaper/997/891/658/photography-nature-landscape-lake-wallpaper-preview.jpg);"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="/template/notificationbar.jsp" %>
</div>
<script>
    const createPostInput = document.querySelector("#create-post textarea[name=content]")
    createPostInput.onfocus = () => {
        createPostInput.onfocus = null
        const initHeight = createPostInput.scrollHeight
        createPostInput.addEventListener('input', () => {
            createPostInput.style.height = '0'
            if (createPostInput.scrollHeight > initHeight) {
                createPostInput.style.height = createPostInput.scrollHeight + 'px'
            } else {
                createPostInput.style.height = initHeight + 'px'
            }
        })
    }

    const addResourceBtn = document.getElementById('add-resource')
    const postBtn = document.getElementById('post-btn')
    const imageList = []
    const others = []

    addResourceBtn.addEventListener('click', () => {
        const inputElement = document.createElement('input')
        const rasterType = [
            'image/png',
            'image/jpeg',
            'image/bmp',
            'image/gif',
            'image/tiff',
            'image/webp',
            'image/avif'
        ]
        inputElement.type = 'file'
        inputElement.multiple = true
        inputElement.addEventListener('change', () => {
            [...inputElement.files].forEach(file => {
                if (rasterType.includes(file.type)) {
                    imageList.push({
                        file,
                        element: (() => {
                        })
                    })
                } else {
                    others.push(file)
                }
            })
        })
        inputElement.click()
    })
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<c:import url="/template/footer.jsp" />
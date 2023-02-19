<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/template/header.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<style>
    .card {
        border-radius: 0.5rem;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    textarea {
        resize: none;
    }

    .post {
        padding: 1rem;
        background-color: white;
        border-radius: 8px;
        height: fit-content;
    }

    .post-header {
        display: flex;
        align-items: center;
        position: relative;
        gap: 1rem;
    }

    .post-header p {
        margin: 0;
    }

    .post-header > .dropdown {
        margin-left: auto;
    }

    .post-header .open-menu {
        font-size: 1.5rem;
        width: 36px;
        height: 36px;
        border: none;
        background-color: unset;
        text-align: center;
        border-radius: 50%;
        cursor: pointer;
    }

    .post-header .open-menu:hover {
        background-color: rgba(0, 0, 0, 0.1);
    }

    .post-profile-picture {
        background-size: cover;
        background-position: center;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        flex-shrink: 0;
    }

    .post-header .post-owner {
        font-weight: 500;
    }

    .post-header .post-time {
        user-select: none;
        font-size: 0.85rem;
        opacity: 0.5;
    }

    .post-body {
        padding-bottom: 1rem;
    }

    .post-body > .post-content {
        padding-top: 1rem;
        white-space: pre-wrap;
        word-break: break-word;
    }

    .post-body > textarea[name=content] {
        outline: none;
        border: none;
        width: 100%;
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

    .post-footer button  {
        font-weight: 500;
        text-transform: capitalize;
    }

    #choose-resource-modal .message {
        margin: 0.5rem 1rem 0;
    }

    .no-bg-btn {
        color: #1e88e5;
        box-shadow: none !important;
        margin-right: 1rem;
        border-radius: unset;
    }

    #add-resource {
        border-right: 1px solid rgb(216, 220, 240);
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
        cursor: pointer;
        overflow: hidden;
    }

    .image-box .image-item > div {
        width: 100%;
        height: 100%;
        background-size: cover;
        background-position: center;
        transition: transform ease 0.2s;
    }

    .image-box .image-item > div:hover {
        transform: scale(1.03);
    }

    .image-box .image-more {
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
        pointer-events: none;
        z-index: 100;
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

    .document-box > a {
        text-decoration: none;
        color: black;
    }

    .document-box > a:hover {
        color: #0d6efd !important;
    }

    .document-item {
        font-weight: 500;
        cursor: pointer;
        padding: 0.5rem 1rem;
        border-top: 1px solid rgb(216, 220, 240);
        position: relative;
    }

    #create-post .document-item {
        display: flex;
        justify-content: space-between;
    }

    .document-item > i {
        font-size: 1.5rem;
        padding: 0 0.3rem;
    }

    .document-item:hover {
        background-color: aliceblue;
    }

    .document-box > a:first-child .document-item {
        border: none;
    }

    .comment-list {
        display: flex;
        flex-direction: column;
    }

    .comment-item {
        padding-top: 1rem;
        display: flex;
        align-items: flex-start;
        gap: 1rem;
    }

    .comment-item > .comment-input-wrapper {
        flex-grow: 1;
        display: flex;
        flex-direction: column;
    }

    .comment-item .comment-input {
        width: 100%;
        height: 40px;
        border-radius: 20px;
        padding: 6px 1rem;
        outline: none;
        border: 1px solid #bdbdbd;
        overflow-y: hidden;
    }

    .comment-item .comment-input::placeholder {
        opacity: 0.5;
    }

    .comment-item .comment-input:focus {
        border: 1px solid #3b71ca;
    }

    .comment-item > .comment-btn {
        height: 40px;
        width: 54px;
        font-size: 1.2rem;
        display: flex;
        justify-content: center;
        border-radius: 20px;
        cursor: pointer;
        padding: 0;
        align-items: center;
    }

    .comment-image {
        margin-top: 1rem;
        padding-top: 50%;
        background-size: cover;
        background-repeat: no-repeat;
        background-position: left;
        position: relative;
        border-radius: 8px;
        cursor: pointer;
    }

    .comment-document {
        margin-top: 1rem;
        border-radius: 8px;
        overflow: hidden;
        font-weight: 500;
        cursor: pointer;
        padding: 0.5rem 1rem;
        border: 2px solid rgb(216, 220, 240);
    }

    #image-carousel {
        width: 100%;
        height: 200px;
        overflow-x: scroll;
        overflow-y: hidden;
        padding-top: 1rem;
        padding-bottom: 8px;
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

    .carousel-img-item img {
        border-radius: 8px;
        height: 100%;
        user-select: none;
        cursor: pointer;
    }

    .carousel-img-item i {
        font-size: 2rem;
        position: absolute;
        top: 0;
        right: 0;
        padding: 0.5rem;
        width: 48px;
        height: 48px;
        text-align: center;
        color: white;
        filter: drop-shadow(0 0 3px black);
        border-top-right-radius: 8px;
        border-bottom-left-radius: 16px;
        cursor: pointer;
    }

    .carousel-img-item i:hover {
        background-color: rgba(0, 0, 0, 0.4);
    }

    .dropdown-item {
        cursor: pointer;
    }

    .modal-dialog {
        max-width: unset;
        background-color: white;
    }

    #choose-resource-modal .modal-dialog {
        padding: 1rem;
        width: 60vw;
    }

    .resource-list-wrapper {
        height: 40vh;
        overflow-y: scroll;
        margin-right: -0.5rem;
        padding-right: 0.5rem;
        position: relative
    }

    .resource-list-wrapper::-webkit-scrollbar {
        width: 8px;
    }

    .resource-list-wrapper::-webkit-scrollbar-thumb {
        background-color: #ccc;
        border-radius: 4px;
    }

    .resource-list-wrapper::-webkit-scrollbar-thumb:hover {
        background-color: #aaa;
    }

    .resource-list-wrapper > .resource-loading {
        position: absolute;
        top: 50%;
        left: 50%;
        font-size: 6rem;
        transform: translate(-50%, -50%);
    }

    #resource-list {
        position: relative;
        display: grid;
        grid-template-columns: repeat(6, minmax(0, 1fr));
        gap: 0.5rem;
    }

    .resource-item {
        cursor: pointer;
    }

    .resource-item > div {
        width: 100%;
        height: 0;
        padding-top: 100%;
        position: relative;
    }

    .resource-item > div > .loading-icon {
        position: absolute;
        width: 80%;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 0.9rem;
        display: none;
        text-align: center;
    }

    .resource-item.loading > div > .loading-icon {
        display: block;
    }

    .resource-item img {
        position: absolute;
        top: 50%;
        left: 50%;
        max-width: 100%;
        max-height: 100%;
        transform: translate(-50%, -50%);
        border-radius: 4px;
        border-style: solid;
        border-width: 0;
        transition: all linear 0.1s;
    }

    .resource-item.selected img {
        border-width: 3px;
        border-color: #0d6efd;
    }

    .resource-item.deleting img {
        border-width: 3px;
        border-color: #dc3545;
    }

    .resource-item .order {
        display: block;
        opacity: 0;
        pointer-events: none;
        position: absolute;
        top: 0;
        right: 0;
        background-color: white;
        border-style: solid;
        border-width: 3px;
        padding: 0 5px;
        margin: 4px;
        min-width: 30px;
        text-align: center;
        font-weight: 800;
        border-top-left-radius: 99px;
        border-top-right-radius: 99px;
        border-bottom-left-radius: 99px;
        border-bottom-right-radius: 99px;
    }

    .resource-item.selected .order {
        color: #0d6efd;
        border-color: #0d6efd;
        opacity: 1;
    }

    .resource-item.deleting .order {
        color: #dc3545;
        border-color: #dc3545;
        opacity: 1;
    }

    .resource-item > .resource-name {
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow-x: hidden;
        text-align: center;
        font-size: 0.8rem;
    }

    .resource-item.selected > .resource-name {
        font-weight: 500;
        color: #0d6efdp;
    }

    #choose-resource-modal .post-footer {
        justify-content: space-between;
    }

    .swiper {
        width: 100%;
        height: 100%;
        position: fixed;
        z-index: 2000;
        top: 100%;
        left: 0;
        background-color: rgba(0, 0, 0, 0.8);
        transition: top ease 0.2s;
    }

    .swiper.open {
        top: 0;
    }

    .swiper-button-prev {
        margin-left: 1rem;
    }

    .swiper-button-next {
        margin-right: 1rem;
    }

    .swiper-button-next::after, .swiper-button-prev::after {
        padding: 0.5rem;
        box-sizing: initial;
        font-size: 4rem;
    }

    .swiper-slide {
        text-align: center;
        font-size: 18px;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 2rem;
    }

    .swiper-slide img {
        display: block;
        max-width: 100%;
        max-height: 100%;
    }

    .swiper-pagination-bullet:not(.swiper-pagination-bullet-active) {
        background-color: white;
    }

    .swiper-close-btn {
        position: absolute;
        top: 0;
        right: 0;
        width: 4rem;
        height: 4rem;
        z-index: 10;
        margin: 1rem;
        border: none;
        border-radius: 50%;
        font-size: 2rem;
    }

    .comment-owner {
        font-weight: 500;
    }

    .comment-owner > span {
        user-select: none;
        font-size: 0.85rem;
        opacity: 0.5;
        padding-left: 1rem;
    }

    .comment-content {
        margin-top: 0.5rem;
        padding: 0.5rem 1rem;
        background-color: #eeeeee;
        border-radius: 20px;
        white-space: pre-wrap;
        word-break: break-word;
    }

    .view-comment {
        border-top-left-radius: 99px;
        border-top-right-radius: 99px;
        border-bottom-left-radius: 99px;
        border-bottom-right-radius: 99px;
        margin: 1rem auto 0;
        display: flex;
        align-items: center;
        gap: 1rem;
    }

    .view-comment > i {
        font-size: 1.5rem;
    }
</style>
<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">
    <div class="swiper" id="image-swipper">
        <button class="swiper-close-btn">
            <i class="fa-solid fa-xmark"></i>
        </button>
        <div class="swiper-wrapper"></div>
        <div class="swiper-pagination"></div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
    <%@include file="/template/sidebar.jsp" %>
    <div class="content-main align-content-start d-flex justify-content-center container position-relative">
        <div class="modal fade" id="choose-resource-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-content">
                <div class="resource-list-wrapper">
                    <div id="resource-list"></div>
                    <div class="resource-loading">
                        <i class="fas fa-spinner fa-spin"></i>
                    </div>
                </div>
                <div class="post-footer">
                    <div class="btn-group me-3">
                        <button class="btn btn-outline-secondary upload-btn">Upload image, video, document...</button>
                        <button class="btn btn-outline-secondary delete-btn">Delete</button>
                    </div>
                    <button class="btn btn-danger btn-sm active comfirm-delete-btn" style="margin-right: auto">Confirm delete</button>
                    <button data-bs-dismiss="modal" class="btn btn-primary main-btn">Close</button>
                </div>
                <p class="message alert-danger"></p>
            </div>
        </div>
        <div class="col-md-7 mt-4 post" id="create-post">
            <div class="post-header">
                <div class="post-profile-picture" style="background-image: url(<c:url value="${account.profilePicture == null ? '/assets/img/ava.png' : account.profilePicture}"/>);"></div>
                <div>
                    <p class="post-owner">${account.name}</p>
                </div>
            </div>
            <div class="post-body">
                <textarea placeholder="Enter post content here" rows="3" name="content"></textarea>
                <div id="post-image-slot"></div>
            </div>
            <div class="post-footer">
                <button id="add-resource" class="btn main-btn no-bg-btn" >Add image, video, document...</button>
                <button id="post-btn" class="btn btn-primary">Post</button>
            </div>
        </div>
        <div id="post-list" class="col-md-7"></div>
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
    const postImageSlot = document.getElementById('post-image-slot')
    const createPostBody = document.querySelector("#create-post > div.post-body")
    const resourceModal = document.querySelector('#choose-resource-modal')
    const resourceModalBootstrap = new bootstrap.Modal(resourceModal, {
        keyboard: false
    })

    function createElement(element) {
        const parent = document.createElement(element.tagName)
        mergeObject(element, parent)
        if (Array.isArray(element.children))
            element.children.forEach(child => parent.append(createElement(child)))
        return parent
    }

    function mergeObject(source, target) {
        Object.entries(source).forEach(attr => {
            if (attr[0] === 'children' || attr[0] === 'tagName')
                return
            if (attr[0] === 'bind') {
                attr[1][0][attr[1][1]] = target
            }
            if (Object.prototype.toString.call(attr[1]) === '[object Object]') {
                mergeObject(attr[1], target[attr[0]])
            } else if (Array.isArray(attr[1]) && typeof target[attr[0]] === 'function') {
                target[attr[0]](...attr[1])
            } else {
                target[attr[0]] = attr[1]
            }
        })
    }

    const swiper = new Swiper('#image-swipper', {
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
        },
        keyboard: {
            enabled: true
        }
    })

    const rasterType = [
        'image/png',
        'image/jpeg',
        'image/bmp',
        'image/gif',
        'image/tiff',
        'image/webp',
        'image/avif'
    ]
    const postList = document.getElementById('post-list')
    const imageSwiper = document.querySelector('.swiper')
    document.querySelector('.swiper-close-btn').addEventListener('click', () => imageSwiper.classList.remove('open'))

    function addPost(post) {
        newfeedPosts.push(post)
        const bindList = {}
        const postElement = createElement({
            tagName: 'div',
            className: 'mt-4 post',
            id: post.postId,
            children: [
                {
                    tagName: 'div',
                    className: 'post-header',
                    children: [
                        {
                            tagName: 'div',
                            className: 'post-profile-picture',
                            style: 'background-image: url("' + <c:url value="/"/> + (post.account.profilePicture ? post.account.profilePicture : '/assets/img/ava.png').substring(1) + '");'
                        },
                        {
                            tagName: 'div',
                            children: [
                                {
                                    tagName: 'p',
                                    className: 'post-owner',
                                    textContent: post.account.name
                                },
                                {
                                    tagName: 'p',
                                    className: 'post-time',
                                    textContent: post.createTime
                                }
                            ]
                        },
                        {
                            tagName: 'div',
                            className: 'dropdown',
                            children: [
                                {
                                    tagName: 'button',
                                    className: 'open-menu',
                                    children: [{
                                            tagName: 'i',
                                            className: 'fa-solid fa-ellipsis'
                                        }]
                                },
                                {
                                    tagName: 'ul',
                                    classname: 'dropdown-menu dropdown-menu-end',
                                    style: 'position: absolute; inset: 0px 0px auto auto; margin: 0px; transform: translate(0px, 38px);'
                                }
                            ]
                        }
                    ]
                },
                {
                    tagName: 'div',
                    className: 'post-body',
                    bind: [bindList, 'postBody'],
                    children: [
                        {
                            tagName: 'p',
                            className: 'post-content',
                            textContent: post.content
                        },
                        {
                            tagName: 'div',
                            className: 'image-box',
                            bind: [bindList, 'imageBox'],
                            children: [{
                                    tagName: 'div',
                                    bind: [bindList, 'imageList'],
                                    children: [
                                        {
                                            tagName: 'div',
                                            className: 'image-more',
                                            bind: [bindList, 'extraCount']
                                        }
                                    ]
                                }]
                        }
                    ]
                },
                {
                    tagName: 'div',
                    className: 'post-footer',
                    children: [
                        {
                            tagName: 'i',
                            className: 'fa-regular fa-comment'
                        },
                        {
                            tagName: 'p',
                            bind: [bindList, 'commentNumber'],
                            textContent: '0 comment'
                        }
                    ]
                },
                {
                    tagName: 'div',
                    className: 'post-comment',
                    children: [
                        {
                            tagName: 'div',
                            className: 'comment-item',
                            children: [
                                {
                                    tagName: 'div',
                                    className: 'post-profile-picture',
                                    style: 'background-image: url("<c:url value="${account.profilePicture == null ? '/assets/img/ava.png' : account.profilePicture}"/>");'
                                },
                                {
                                    tagName: 'div',
                                    className: 'comment-input-wrapper',
                                    bind: [bindList, 'commentInputWrapper'],
                                    children: [
                                        {
                                            tagName: 'textarea',
                                            className: 'comment-input',
                                            placeholder: 'Enter your comment here',
                                            rows: 1,
                                            bind: [bindList, 'commentInput'],
                                        },
                                    ]
                                },
                                {
                                    tagName: 'button',
                                    className: 'comment-btn btn btn-outline-secondary',
                                    bind: [bindList, 'addResourceBtn'],
                                    children: [{
                                            tagName: 'i',
                                            className: 'fa-solid fa-file'
                                        }]
                                },
                                {
                                    tagName: 'button',
                                    className: 'comment-btn btn btn-outline-secondary',
                                    bind: [bindList, 'commentSendBtn'],
                                    children: [{
                                            tagName: 'i',
                                            className: 'fa-solid fa-paper-plane'
                                        }]
                                }
                            ]
                        },
                        {
                            tagName: 'div',
                            className: 'comment-list',
                            bind: [bindList, 'commentList'],
                            children: [{
                                    tagName: 'button',
                                    className: 'view-comment btn btn-outline-secondary',
                                    bind: [bindList, 'viewComment'],
                                    textContent: 'View comments',
                                    children: [{
                                            tagName: 'i',
                                            className: 'fa-sharp fa-solid fa-caret-down'
                                        }]
                                }]
                        }
                    ]
                }
            ]
        });

        const imageL = []
        const otherL = []
        post.resources.forEach(r => {
            if (r.thumbnail) {
                imageL.push(r)
            } else {
                otherL.push(r)
            }
        })
        function getPreview(index) {
            if (!post.imgCarousel[index]) {
                post.imgCarousel[index] = createElement({
                    tagName: 'div',
                    className: 'swiper-slide',
                    children: [{
                            tagName: 'img',
                            loading: 'lazy',
                            className: 'swiper-lazy',
                            src: '<c:url value="/"/>' + imageL[index].url.substring(1)
                        }]
                })
            }
            return post.imgCarousel[index]
        }
        if (imageL.length == 0)
            bindList.imageBox.remove()
        else {
            let ePos = 0
            for (let i = 0; i < Math.min(2, imageL.length); i++) {
                const imageColumn = createElement({
                    tagName: 'div',
                    className: 'image-column'
                })
                const end = ePos + Math.ceil(Math.min(4, imageL.length - ePos + i) / 2)
                for (ePos; ePos < end; ePos++) {
                    const tmpPos = ePos
                    const imgEl = createElement({
                        tagName: 'div',
                        className: 'image-item',
                        children: [{
                                tagName: 'div',
                                style: 'background-image: url("<c:url value="/"/>' + imageL[ePos].url.substring(1) + '")'
                            }]
                    })
                    imageColumn.append(imgEl)
                    imgEl.addEventListener('click', () => {
                        swiper.removeAllSlides()
                        if (!post.imgCarousel) {
                            post.imgCarousel = Array(imageL.length)
                        }
                        swiper.appendSlide(getPreview(tmpPos))
                        imageSwiper.classList.add('open')
                        setTimeout(() => {
                            let i = tmpPos - 1, j = tmpPos + 1
                            while (i >= 0 || j < imageL.length) {
                                if (i >= 0)
                                    swiper.prependSlide(getPreview(i--))
                                if (j < imageL.length)
                                    swiper.appendSlide(getPreview(j++))
                            }
                        }, 200)
                    })
                }
                bindList.imageList.append(imageColumn)
            }
            if (imageL.length > 4) {
                bindList.imageBox.classList.add('more')
                bindList.extraCount.textContent = '+' + (imageL.length - 4)
            }
        }
        if (otherL.length > 0) {
            const documentBox = createElement({
                tagName: 'div',
                className: 'document-box'
            })
            otherL.forEach(d => {
                documentBox.append(createElement({
                    tagName: 'a',
                    href: '<c:url value="/"/>' + d.url.substring(1),
                    download: d.url.split('/').pop(),
                    children: [{
                            tagName: 'div',
                            className: 'document-item text-truncate',
                            textContent: d.url.split('/').pop()
                        }]
                }))
            })
            bindList.postBody.append(documentBox)
        }
        let initHeight
        bindList.commentInput.addEventListener('input', () => {
            bindList.commentSendBtn.disabled = !bindList.commentInput.value.trim() && rsList.length === 0
            bindList.commentInput.style.height = '0'
            if (bindList.commentInput.scrollHeight > initHeight) {
                bindList.commentInput.style.height = bindList.commentInput.scrollHeight + 'px'
            } else {
                bindList.commentInput.style.height = initHeight + 'px'
            }
        })
        const rsList = []
        const commentImageBox = createElement({
            tagName: 'div',
            className: 'comment-image'
        })
        const commentDocumentBox = createElement({
            tagName: 'div',
            className: 'comment-document'
        })
        bindList.commentSendBtn.disabled = true
        bindList.commentSendBtn.addEventListener('click', () => {
            sendComment(post, bindList.commentInput, rsList[0])
            rsList.length = 0
            commentImageBox.remove()
            commentDocumentBox.remove()
            bindList.commentInput.value = null
            bindList.commentInput.style.height = '0'
            bindList.commentInput.style.height = (bindList.commentInput.scrollHeight + 2) + 'px'
        })
        bindList.addResourceBtn.addEventListener('click', () => {
            resourceManage.selected = rsList
            resourceManage.resetup = () => {
                rsList.forEach((r, i) => {
                    r.order.innerHTML = '<i class="fa-solid fa-check"></i>'
                })
                deleteBtn.disabled = rsList.length > 0
            }
            resourceManage.callback = resource => {
                if (rsList[0] !== resource) {
                    const rel = rsList.pop()
                    if (rel) {
                        rel.element.classList.remove('selected')
                        rsList.length = 0
                    }
                    if (rasterType.includes(resource.mimeType)) {
                        commentDocumentBox.remove()
                        if (!commentImageBox.isConnected)
                            bindList.commentInputWrapper.append(commentImageBox)
                        commentImageBox.style.backgroundImage = 'url("<c:url value="/"/>' + resource.url.substring(1) + '")'
                    } else {
                        commentImageBox.remove()
                        if (!commentDocumentBox.isConnected)
                            bindList.commentInputWrapper.append(commentDocumentBox)
                        commentDocumentBox.textContent = resource.url.split('/').pop()
                    }
                    resource.order.innerHTML = '<i class="fa-solid fa-check"></i>'
                    resource.element.classList.add('selected')
                    rsList.push(resource)
                    console.log(rsList)
                } else {
                    commentImageBox.remove()
                    commentDocumentBox.remove()
                    resource.element.classList.remove('selected')
                    rsList.length = 0
                }
                bindList.commentSendBtn.disabled = !bindList.commentInput.value.trim() && rsList.length === 0
            }
            resourceModalBootstrap.show()
        })
        let commentListExpanded = false
        post.addComment = comment => {
            const commentBind = {}
            bindList.commentList.insertBefore(createElement({
                tagName: 'div',
                className: 'comment-item',
                children: [
                    {
                        tagName: 'div',
                        className: 'post-profile-picture',
                        style: 'background-image: url("' + <c:url value="/"/> + (comment.account.profilePicture ? comment.account.profilePicture : '/assets/img/ava.png').substring(1) + '");'
                    },
                    {
                        tagName: 'div',
                        className: 'comment-input-wrapper',
                        bind: [commentBind, 'commentWrapper'],
                        children: [
                            {
                                tagName: 'p',
                                className: 'comment-owner',
                                textContent: comment.account.name,
                                children: [{
                                        tagName: 'span',
                                        textContent: comment.createTime
                                    }]
                            },
                        ]
                    }
                ]
            }), bindList.commentList.children[0])
            if (comment.content.trim()) {
                commentBind.commentWrapper.append(createElement({
                    tagName: 'p',
                    className: 'comment-content',
                    textContent: comment.content
                }))
            }
            post.commentCount += 1
            bindList.commentNumber.textContent = post.commentCount + (post.commentCount > 1 ? ' comments' : ' comment')
            if (!comment.resource)
                return
            if (rasterType.includes(comment.resource.mimeType)) {
                let imgCarousel = null
                const cmtImg = createElement({
                    tagName: 'div',
                    className: 'comment-image',
                    style: 'background-image: url("<c:url value="/"/>' + comment.resource.url.substring(1) + '")'
                })
                cmtImg.addEventListener('click', () => {
                    if (!imgCarousel) {
                        imgCarousel = createElement({
                            tagName: 'div',
                            className: 'swiper-slide',
                            children: [{
                                    tagName: 'img',
                                    src: '<c:url value="/"/>' + comment.resource.url.substring(1)
                                }]
                        })
                    }
                    swiper.removeAllSlides()
                    swiper.appendSlide(imgCarousel)
                    imageSwiper.classList.add('open')
                })
                commentBind.commentWrapper.append(cmtImg)
            } else {
                commentBind.commentWrapper.append(createElement({
                    tagName: 'div',
                    className: 'document-box',
                    children: [{
                            tagName: 'a',
                            className: 'text-decoration-none text-black text-truncate',
                            href: '<c:url value="/"/>' + comment.resource.url.substring(1),
                            download: comment.resource.url.split('/').pop(),
                            children: [{
                                    tagName: 'div',
                                    className: 'document-item text-truncate',
                                    textContent: comment.resource.url.split('/').pop()
                                }]
                        }]
                }))
            }
        }
        bindList.commentNumber.textContent = post.commentCount + (post.commentCount > 1 ? ' comments' : ' comment')
        bindList.viewComment.addEventListener('click', async () => {
            bindList.viewComment.disabled = true
            const response = await fetch('<c:url value="/${account.role == 1 ? 'teacher' : 'student'}/class/comment"/>?postId=' + post.postId)
            if (response.ok) {
                commentListExpanded = true
                bindList.commentList.textContent = ''
                const json = await response.json()
                json.forEach(cmt => post.addComment(cmt))
            } else {
                bindList.viewComment.disabled = false
            }
        })
        postList.insertBefore(postElement, postList.children[0])
        initHeight = bindList.commentInput.scrollHeight + 2
        return postElement
    }

    async function sendComment(post, input, resource) {
        if (!input.value.trim() && !resource)
            return
        const formData = new FormData()
        formData.append('classId', classId)
        formData.append('postId', post.postId)
        formData.append('content', input.value.trim())
        if (resource)
            formData.append('resourceId', resource.resourceId)
        const response = await fetch('<c:url value="/${account.role == 1 ? 'teacher' : 'student'}/class/comment"/>', {
            method: 'POST',
            body: formData
        })
        console.log(response)
    }

    generalWS.on('new-post', newPost => addPost(newPost))
    generalWS.on('new-comment', newComment => {
        const p = newfeedPosts.find(post => post.postId === newComment.postId)
        p.addComment(newComment)
    })

    function b64DecodeUnicode(str) {
        return decodeURIComponent(atob(str).split('').map(function (c) {
            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
        }).join(''));
    }

    const urlHash = location.hash ? location.hash.substring(1) : null
    const newfeedPosts = []
    fetch('<c:url value="/${account.role == 1 ? 'teacher' : 'student'}/class/post"/>?classId=' + classId)
            .then(response => response.json())
            .then(json => {
                let planToScroll = null
                json.forEach(post => {
                    const el = addPost(post)
                    if (post.postId === urlHash) {
                        planToScroll = el.getBoundingClientRect().top - document.querySelector('#header > nav').clientHeight - 16 + window.scrollY
                    }
                })
                if (planToScroll) {
                    window.scroll({
                        top: planToScroll,
                        behavior: 'smooth'
                    });
                }
            })

    const imageCarousel = createElement({
        tagName: 'div',
        id: 'image-carousel'
    })
    const carouselWrapper = createElement({
        tagName: 'div',
        id: 'carousel-wrapper'
    })
    imageCarousel.append(carouselWrapper)

    const documentBox = createElement({
        tagName: 'div',
        classList: {
            add: ['document-box']
        }
    })

    const uploadBtn = document.querySelector('#choose-resource-modal .upload-btn')
    uploadBtn.disabled = true
    const deleteBtn = document.querySelector('#choose-resource-modal .delete-btn')
    deleteBtn.disabled = true
    const confirmDeleteBtn = document.querySelector('#choose-resource-modal .comfirm-delete-btn')
    confirmDeleteBtn.disabled = true
    confirmDeleteBtn.style.display = 'none'
    const resourceList = document.getElementById('resource-list')
    const allResources = []
    const resourceManage = {
        selected: [],
        callback: null,
        resetup: null
    }
    const deletingResources = []
    const xhrQueue = []
    let requesting = false
    let deletingMode = false

    async function loadResource() {
        resourceModal.removeEventListener('show.bs.modal', loadResource)
        resourceModal.addEventListener('show.bs.modal', () => {
            resourceManage.selected.forEach(r => {
                r.element.classList.add('selected')
            })
            if (resourceManage.resetup)
                resourceManage.resetup()
            if (resourceManage.selected.length > 0) {
                deleteBtn.disabled = true
            }
        })
        const response = await fetch('<c:url value="/resource"/>')
        const json = await response.json()
        json.forEach(r => {
            let thumbnail = '<c:url value="/assets/img/default-thumb.png"/>'
            if (r.thumbnail)
                thumbnail = '<c:url value="/"/>' + r.thumbnail.substring(1)

            const resourceElement = createElement({
                tagName: 'div',
                className: 'resource-item',
                children: [
                    {
                        tagName: 'div',
                        children: [
                            {
                                tagName: 'img',
                                src: thumbnail
                            },
                            {
                                tagName: 'p',
                                className: 'order',
                                textContent: '0'
                            }
                        ]
                    },
                    {
                        tagName: 'p',
                        className: 'resource-name',
                        textContent: r.url.split('/').pop()
                    }
                ]
            })
            const rs = {
                element: resourceElement,
                order: resourceElement.querySelector('.order'),
                ...r
            }
            allResources.push(rs)
            setSelectable(rs)
            resourceList.append(resourceElement)
        })
        document.querySelector('.resource-list-wrapper > .resource-loading').remove()
        uploadBtn.disabled = false
        deleteBtn.disabled = false
    }

    function deselectAllSelected() {
        resourceManage.selected.forEach(r => {
            r.element.classList.remove('selected')
        })
        resourceManage.selected = null
        deleteBtn.disabled = false
    }

    resourceModal.addEventListener('show.bs.modal', loadResource)
    resourceModal.addEventListener('hidden.bs.modal', () => {
        resourceManage.callback = null
        resourceManage.resetup = null
        deselectAllSelected()
        if (deletingMode) {
            deleteBtn.click()
        }
    })

    const selectedResources = []
    addResourceBtn.addEventListener('click', () => {
        resourceManage.selected = selectedResources
        resourceManage.resetup = () => {
            selectedResources.forEach((r, i) => {
                r.order.textContent = i + 1
            })
        }
        resourceManage.callback = resource => {
            if (!selectedResources.includes(resource)) {
                selectedResources.push(resource)
                resource.order.textContent = selectedResources.length
                resource.element.classList.add('selected')
                if (!resource.preview) {
                    if (rasterType.includes(resource.mimeType)) {
                        resource.preview = createElement({
                            tagName: 'div',
                            classList: {
                                add: ['carousel-img-item']
                            },
                            children: [
                                {
                                    tagName: 'img',
                                    draggable: false,
                                    src: '<c:url value="/"/>' + resource.url.substring(1)
                                },
                                {
                                    tagName: 'i',
                                    onclick: () => {
                                        const index = selectedResources.indexOf(resource)
                                        selectedResources.splice(index, 1)
                                        resource.element.classList.remove('selected')
                                        resource.preview.remove()
                                        if (carouselWrapper.children.length == 0) {
                                            imageCarousel.remove()
                                        }
                                    },
                                    className: 'fa-solid fa-xmark'
                                }
                            ]
                        })
                    } else {
                        resource.preview = createElement({
                            tagName: 'div',
                            classList: {
                                add: ['document-item']
                            },
                            textContent: resource.url.split('/').pop(),
                            onclick: null,
                            children: [{
                                    tagName: 'i',
                                    onclick: () => {
                                        const index = selectedResources.indexOf(resource)
                                        selectedResources.splice(index, 1)
                                        resource.element.classList.remove('selected')
                                        resource.preview.remove()
                                        if (documentBox.children.length == 0) {
                                            documentBox.remove()
                                        }
                                    },
                                    className: 'fa-solid fa-xmark'
                                }]
                        })
                    }
                }
                if (rasterType.includes(resource.mimeType)) {
                    carouselWrapper.append(resource.preview)
                    if (!imageCarousel.isConnected)
                        postImageSlot.append(imageCarousel);
                } else {
                    documentBox.append(resource.preview)
                    if (!documentBox.isConnected)
                        createPostBody.append(documentBox)
                }
            } else {
                const index = selectedResources.indexOf(resource)
                selectedResources.splice(index, 1)
                resource.element.classList.remove('selected')
                selectedResources.forEach((r, i) => {
                    r.order.textContent = i + 1
                })
                resource.preview.remove()
                if (carouselWrapper.children.length == 0) {
                    imageCarousel.remove()
                }
                if (documentBox.children.length == 0) {
                    documentBox.remove()
                }
            }
        }
        resourceModalBootstrap.show()
    })

    function setSelectable(resource) {
        resource.element.addEventListener('click', () => {
            if (deletingMode) {
                if (!deletingResources.includes(resource)) {
                    resource.order.innerHTML = '<i class="fa-solid fa-trash"></i>'
                    resource.element.classList.add('deleting')
                    deletingResources.push(resource)
                } else {
                    resource.element.classList.remove('deleting')
                    resource.order.textContent = ''
                    const index = deletingResources.indexOf(resource)
                    deletingResources.splice(index, 1)
                }
                confirmDeleteBtn.disabled = deletingResources.length === 0
            } else {
                if (resourceManage.callback)
                    resourceManage.callback(resource)
                deleteBtn.disabled = selectedResources.length !== 0
            }
        })
    }

    deleteBtn.addEventListener('click', () => {
        deletingMode = !deletingMode
        confirmDeleteBtn.style.display = deletingMode ? 'block' : 'none'
        deleteBtn.classList.toggle('btn-outline-secondary', !deletingMode)
        deleteBtn.classList.toggle('btn-danger', deletingMode)
        if (!deletingMode) {
            deletingResources.forEach(rs => {
                rs.element.classList.remove('deleting')
                rs.order.textContent = '0'
            })
            deletingResources.length = 0
            confirmDeleteBtn.disabled = true
        }
        uploadBtn.disabled = deletingMode
    })

    let deleteTimer
    confirmDeleteBtn.addEventListener('click', async () => {
        const rsList = deletingResources.map(rs => 'rId=' + rs.resourceId)
        const url = '<c:url value="/resource"/>' + '?' + rsList.join('&')
        const response = await fetch(url, {
            method: 'DELETE'
        })
        if (response.ok) {
            const json = await response.json()
            if (json.succeed.length > 0) {
                const tmp = []
                allResources.forEach(rs => {
                    if (json.succeed.includes(rs.resourceId)) {
                        rs.order.remove()
                        rs.element.remove()
                    } else {
                        tmp.push(rs)
                    }
                })
                allResources.length = 0
                allResources.push(...tmp)
            }
            if (json.failed.length > 0) {
                const messageEl = document.querySelector('#choose-resource-modal .message')
                if (deleteTimer)
                    clearTimeout(deleteTimer)
                deleteTimer = setTimeout(() => messageEl.textContent = '', 5000)
                messageEl.textContent = 'Cannot delete ' + allResources.filter(rs => json.failed.includes(rs.resourceId)).map(rs => rs.url.split('/').pop()).join(', ') + ' because it was used in other post'
            }
        }
    })

    uploadBtn.addEventListener('click', async () => {
        const inputElement = document.createElement('input')
        inputElement.type = 'file'
        inputElement.multiple = true
        inputElement.addEventListener('change', () => {
            [...inputElement.files].forEach(async file => {
                const formData = new FormData();
                formData.append('file', file)

                const resourceElement = createElement({
                    tagName: 'div',
                    className: 'resource-item',
                    children: [
                        {
                            tagName: 'div',
                            children: [
                                {
                                    tagName: 'img'
                                },
                                {
                                    tagName: 'p',
                                    className: 'order',
                                    textContent: '0'
                                },
                                {
                                    tagName: 'div',
                                    className: 'loading-icon',
                                    children: [
                                        {
                                            tagName: 'span'
                                        },
                                        {
                                            tagName: 'div',
                                            className: 'progress',
                                            children: [{
                                                    tagName: 'div',
                                                    className: 'progress-bar progress-bar-striped progress-bar-animated',
                                                    style: 'width: 0;'
                                                }]
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            tagName: 'p',
                            className: 'resource-name'
                        }
                    ]
                })
                const imgElement = resourceElement.querySelector('img')
                const resourceName = resourceElement.querySelector('.resource-name')
                const selectedOrder = resourceElement.querySelector('.order')
                const loadingIcon = resourceElement.querySelector('.loading-icon')
                const progressPercent = resourceElement.querySelector('span')
                const progressBar = resourceElement.querySelector('.progress-bar')

                resourceName.textContent = file.name

                const xhr = new XMLHttpRequest()
                xhr.open('POST', '<c:url value="/files"/>', true)

                xhr.upload.addEventListener('progress', e => {
                    const percent = Math.round(e.loaded * 100 / e.total) + '%'
                    progressPercent.textContent = percent
                    progressBar.style.width = percent
                })

                xhr.upload.addEventListener('loadstart', e => {
                    resourceElement.classList.add('loading')
                    resourceList.append(resourceElement)
                })

                xhr.upload.addEventListener('loadend', e => {
                    resourceElement.classList.remove('loading')
                    loadingIcon.remove()
                    if (xhrQueue.length !== 0) {
                        xhrQueue.shift().start()
                    } else {
                        requesting = false
                    }
                })

                xhr.addEventListener('load', e => {
                    const json = JSON.parse(xhr.responseText)

                    const rs = {
                        element: resourceElement,
                        order: selectedOrder,
                        ...json
                    }
                    allResources.push(rs)

                    if (json.thumbnail)
                        imgElement.src = '<c:url value="/"/>' + json.thumbnail.substring(1)
                    else
                        imgElement.src = '<c:url value="/assets/img/default-thumb.png"/>'
                    setSelectable(rs)
                })

                xhr.start = () => {
                    xhr.send(formData)
                }

                xhrQueue.push(xhr)
                if (!requesting) {
                    requesting = true
                    xhrQueue.shift().start()
                }
            })
        })
        inputElement.click()
    })

    postBtn.addEventListener('click', async () => {
        if (createPostInput.value.trim() === '' && selectedResources.length === 0)
            return
        const rsList = selectedResources.map(rs => rs.resourceId)
        const formData = new FormData()
        formData.append('classId', classId)
        formData.append('content', createPostInput.value.trim())
        formData.append('resources', JSON.stringify(rsList))
        const response = await fetch('<c:url value="/${account.role == 1 ? 'teacher' : 'student'}/class/post"/>', {
            method: 'POST',
            body: formData
        })
        if (response.ok) {
            createPostInput.value = ''
            createPostInput.style.height = '0'
            createPostInput.style.height = createPostInput.scrollHeight + 'px'
            selectedResources.forEach(r => {
                r.element.classList.remove('selected')
                r.preview.remove()
            })
            selectedResources.length = 0
            imageCarousel.remove()
            documentBox.remove()
            deleteBtn.disabled = false
        }
    })
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<c:import url="/template/footer.jsp" />
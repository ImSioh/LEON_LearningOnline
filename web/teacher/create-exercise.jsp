<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../template/header.jsp"/>
<style>
    * {
        margin: 0;
        padding: 0;
    }

    button {
        height: fit-content;
    }

    .inputbox {
        padding: .375rem .75rem;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: .25rem;
        border: 1px solid #ced4da;
        transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    }

    .inputbox:focus {
        color: #212529;
        background-color: #fff;
        border-color: #86b7fe;
        outline: 0;
        box-shadow: 0 0 0 0.25rem rgba(13,110,253,.25);
    }

    .main-container {
        padding-top: 56px;
        height: 100vh;
        display: flex;
        justify-content: center;
    }

    .main-container textarea {
        resize: none;
    }

    .main-container:not(.has-paper) #question-paper {
        width: 0;
    }

    #question-paper {
        background-color: gray;
        width: 60%;
        height: 100%;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        transition: width ease 0.2s;
    }

    .test-time-info {
        display: grid;
        grid-template-columns: repeat(1, minmax(0, 1fr));
    }

    .main-container:not(.has-paper) .test-time-info {
        gap: 1.5rem;
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .main-container.has-paper > .test-info-area {
        width: 40%;
        overflow-y: auto;
    }

    .test-info-area {
        max-width: 1200px;
        width: 80%;
        transition: width ease 0.2s;
    }

    .btn {
        text-transform: unset;
        font-weight: 500;
    }

    #question-list {
        position: relative;
        padding: 0 1.5rem 5.5rem !important;
        box-shadow: inset 0 0 0.5rem 0 #00000040;
        background-image: linear-gradient( -45deg, rgba(204, 204, 204, 0.3) 12.5%, #0000 12.5%, #0000 50%, rgba(204, 204, 204, 0.3) 50%, rgba(204, 204, 204, 0.3) 62.5%, #0000 62.5%, #0000 100% );
        background-size: 8px 8px;
    }

    #add-question {
        width: fit-content;
        height: fit-content;
        position: absolute;
        left: 1.5rem;
        bottom: 1.5rem;
    }

    .question {
        box-shadow: 0 0.25rem 1rem 0 #00000040;
        position: relative;
    }

    .validate-fail {
        outline: 4px solid #dc3545;
        background-color: #dc354540 !important;
    }

    .question-order {
        color: #939bb4;
        position: absolute;
        margin: 0;
        background-color: #3caea3;
        color: white;
        padding: 0.15rem 0;
        width: 8rem;
        text-align: center;
        border-radius: 0.375rem;
        top: -0.7rem;
        left: 1rem;
        font-weight: 500;
    }

    .question .img-resource {
        padding-top: 40%;
        margin-top: 0.5rem;
        border-radius: .25rem;
        background-position: center;
        background-size: cover;
    }

    .question-answer-list {
        display: grid;
        margin-top: 1rem;
        gap: 1rem;
        grid-template-columns: repeat(1, minmax(0, 1fr));
    }

    .question-answer {
        /*border: 0.125rem solid #edeff4;*/
        border-radius: .25rem;
        position: relative;
        height: fit-content;
        transition: all ease 0.2s;
        box-shadow: inset 0 0 0.5rem 0 #00000040;
        background-color: #f8f9fa;
    }

    .question-answer.true {
        background-color: #a8e4deaa;
        box-shadow: inset 0 0 0.5rem 0 #05676640;
        /*        border: 2px solid #056766;*/
    }

    .correct-badge {
        opacity: 0;
        margin: 0;
        position: absolute;
        background-color: #056766;
        color: white;
        padding: 0.2rem 0.8rem;
        font-size: 0.8rem;
        border-top-left-radius: 99px;
        border-top-right-radius: 99px;
        border-bottom-left-radius: 99px;
        border-bottom-right-radius: 99px;
        top: -0.7rem;
        left: -0.5rem;
        pointer-events: none;
        transition: all ease 0.2s;
    }

    .question-answer.true > .correct-badge {
        opacity: 1;
    }

    .answer-order {
        background-color: #f6d55c;
        font-weight: 500;
        position: absolute;
        margin: 0;
        line-height: 2.5rem;
        width: 2.5rem;
        text-align: center;
        border-radius: 50%;
        top: -1.25rem;
        left: 50%;
        transform: translateX(-50%);
        cursor: pointer;
        transition: all ease 0.2s;
        border: 2px solid transparent;
        box-sizing: content-box;
    }

    .validate-fail > .answer-order {
        outline: 4px solid #dc3545;
    }

    .question-answer.true > .answer-order {
        border: 2px solid #056766;
    }

    .question-answer > .img-resource {
        margin-top: 0;
        margin-bottom: 0.5rem;
    }

    .answer-counter {
        width: 6rem;
    }

    .document-resource {
        margin-top: 1rem;
        border-radius: 8px;
        overflow: hidden;
        font-weight: 500;
        cursor: pointer;
        padding: 0.5rem 1rem;
        border: 2px solid rgb(216, 220, 240);
    }

    @media only screen and (min-width: 992px) {
        .main-container:not(.has-paper) .question-answer-list {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    .question-deleter {
        position: absolute;
        margin: 0;
        background-color: #dc3545;
        color: white;
        padding: 0.15rem 0;
        width: 3rem;
        text-align: center;
        border-radius: 0.375rem;
        top: -0.7rem;
        left: 9.5rem;
        font-weight: 500;
        cursor: pointer;
    }

    .question-deleter:hover {
        background-color: #bb2d3b;
    }

    .sub-label {
        color: crimson;
        font-weight: 600;
    }

    .disable-input .form-control {
        display: none;
    }

    .disable-sub-label .sub-label {
        display: none;
    }

    @media only screen and (min-width: 1200px) {
        .test-time-info {
            gap: 1.5rem;
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }
</style>
<div class="main-container">
    <div id="message-modal" class="modal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <p>Modal body text goes here.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="choose-resource-modal" tabindex="-1" aria-hidden="true">
        <style>
            #choose-resource-modal .modal-dialog {
                padding: 1rem;
                width: 60vw;
                margin: 0;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translateX(-50%) translateY(-50%) !important;
                max-width: unset;
                background-color: white;
            }

            .resource-list-wrapper {
                height: 40vh;
                overflow-y: scroll;
                margin-right: -0.5rem;
                padding-right: 0.5rem;
                position: relative;
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

            .post-footer {
                padding: 1rem 1rem 0;
                display: flex;
                justify-content: flex-end;
                border-top: 1px solid rgb(216, 220, 240);
                align-items: center;
            }

            #choose-resource-modal .post-footer {
                justify-content: space-between;
            }

            #choose-resource-modal .message {
                margin: 0.5rem 1rem 0;
            }

            #resource-list {
                position: relative;
                display: grid;
                grid-template-columns: repeat(6, minmax(0, 1fr));
                gap: 0.5rem;
            }

            .post-footer button {
                font-weight: 500;
                text-transform: capitalize;
            }

            .resource-item {
                cursor: pointer;
            }

            .resource-item.hide {
                display: none;
            }

            .resource-item.selected img {
                border-width: 3px;
                border-color: #0d6efd;
            }

            .resource-item.deleting img {
                border-width: 3px;
                border-color: #dc3545;
            }

            .resource-item.deleting .order {
                color: #dc3545;
                border-color: #dc3545;
                opacity: 1;
            }

            .resource-item > div {
                width: 100%;
                height: 0;
                padding-top: 100%;
                position: relative;
            }

            .resource-item > .resource-name {
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow-x: hidden;
                text-align: center;
                font-size: 0.8rem;
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

            .question-file-group-btn > .btn {
                width: calc(50% - 0.5rem);
            }
        </style>
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
    <div id="question-paper"></div>
    <div class="test-info-area p-4">
        <p style="font-size: 1.4rem;margin: 0;font-weight: 500;text-align: center;">
            Create exercise for class ${classObject.name}
        </p>
        <div class="test-time-info p-4 border rounded-3 bg-light">
            <div>
                <div class="mb-3 d-flex flex-wrap disable-sub-label">
                    <div class="form-check form-switch d-inline-block">
                        <input class="form-check-input" id="start-time-toggle" type="checkbox">
                    </div>
                    <label for="start-time" class="form-label">
                        Start time
                        <span class="sub-label">
                            (Exercise will start now)
                        </span>
                    </label>
                    <input type="datetime-local" class="form-control" name="start-time" id="start-time">
                </div>
                <div class="mb-3 d-flex flex-wrap disable-input">
                    <div class="form-check form-switch d-inline-block">
                        <input class="form-check-input" id="end-time-toggle" type="checkbox">
                    </div>
                    <label for="end-time" class="form-label">End time</label>
                    <input type="datetime-local" class="form-control" name="end-time" id="end-time">
                </div>
                <div class="mb-3 d-flex flex-wrap">
                    <div class="form-check form-switch d-inline-block">
                        <input class="form-check-input" id="review-toggle" type="checkbox">
                    </div>
                    <label class="form-label">Prevent student from viewing finished exercise</label>
                </div>
            </div>
            <div>
                <div class="mb-3 d-flex flex-wrap disable-input">
                    <div class="form-check form-switch d-inline-block">
                        <input class="form-check-input" id="test-time-toggle" type="checkbox">
                    </div>
                    <label for="test-time" class="form-label">Exercise duration (minute)</label>
                    <input spellcheck="false" type="number" class="form-control" value="15" name="test-time" id="test-time">
                </div>
                <div class="mb-3 d-flex flex-wrap">
                    <div class="form-check form-switch d-inline-block">
                        <input class="form-check-input" id="question-file-toggle" type="checkbox">
                    </div>
                    <label for="question-file" class="form-label">Question file</label>
                    <div class="w-100 question-file-group-btn d-flex justify-content-between">
                        <button id="question-file-add" class="btn btn-primary">
                            Add file
                        </button>
                        <button id="question-file-remove" class="btn btn-danger">
                            Remove file
                        </button>
                    </div>
                    <div id="rs-box" class="w-100"></div>
                </div>
            </div>
        </div>
        <div class="test-detail mt-4 p-4 border rounded-3 bg-light">
            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input spellcheck="false" type="text" class="form-control" name="title" id="title">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="d-block w-100 inputbox" spellcheck="false" rows="1" name="description" id="description"></textarea>
            </div>
        </div>
        <div class="test-detail mt-4 border rounded-3 bg-light" id="question-list">
            <button class="btn btn-primary" id="add-question">Add question</button>
        </div>
        <button  class="btn btn-primary w-100 mt-3 mb-5" id="create-exercise">
            Create exercise
        </button>
    </div>
</div>
<script src="<c:url value="/assets/js/pdf.min.js"/>"></script>
<script src="<c:url value="/assets/js/jszip.min.js"/>"></script>
<script src="<c:url value="/assets/js/docx-preview.min.js"/>"></script>
<script>
    async function loadResource() {
        resourceModal.removeEventListener('show.bs.modal', loadResource)
        function setupNew() {
            resourceManage.selected.forEach(r => {
                r.element.classList.add('selected')
            })
            if (resourceManage.resetup) {
                resourceManage.resetup()
            }
            if (resourceManage.accept) {
                allResources.forEach(rs => {
                    rs.element.classList.toggle('hide', !resourceManage.accept(rs))
                })
            }
            if (resourceManage.selected.length > 0) {
                deleteBtn.disabled = true
            }
        }
        resourceModal.addEventListener('show.bs.modal', setupNew)
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
        setupNew()
    }

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
                deleteBtn.disabled = resourceManage.selected.length !== 0
            }
        })
    }

    function deselectAllSelected() {
        resourceManage.selected.forEach(r => {
            r.element.classList.remove('selected')
        })
        allResources.forEach(r => {
            r.element.classList.remove('hide')
        })
        resourceManage.selected = null
        deleteBtn.disabled = false
    }

    const resourceModal = document.querySelector('#choose-resource-modal')
    const resourceModalBootstrap = new bootstrap.Modal(resourceModal, {
        keyboard: false
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
        resetup: null,
        accept: null,
        fileAccept: null
    }
    const deletingResources = []
    const xhrQueue = []
    let requesting = false
    let deletingMode = false

    resourceModal.addEventListener('show.bs.modal', loadResource)
    resourceModal.addEventListener('hidden.bs.modal', () => {
        resourceManage.callback = null
        resourceManage.resetup = null
        resourceManage.accept = null
        resourceManage.fileAccept = null
        deselectAllSelected()
        if (deletingMode) {
            deleteBtn.click()
        }
    })

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
        if (resourceManage.fileAccept) {
            inputElement.accept = resourceManage.fileAccept
        }
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
</script>
<script>
    function createElement(element) {
        if (element instanceof HTMLElement) {
            return element
        }
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

    function textAreaResize(extraHeight) {
        extraHeight = extraHeight || 0
        return function () {
            this.style.height = 0
            this.style.height = this.scrollHeight + extraHeight + 'px'
        }
    }

    async function renderPage(page, parent) {
        const initWidth = Math.min(Math.max(720, parent.clientWidth - 60), questionPaper.clientHeight)
        const scale = (initWidth * 1.5) / page.getViewport({scale: 1}).width
        const viewport = page.getViewport({scale: scale})
        const canvas = document.createElement('canvas')
        canvas.height = viewport.height
        canvas.width = viewport.width
        canvas.style.width = initWidth + 'px'
        const renderContext = {
            canvasContext: canvas.getContext('2d'),
            viewport: viewport
        }
        const renderTask = await page.render(renderContext)
        parent.append(createElement({
            tagName: 'div',
            className: 'd-flex',
            style: 'box-shadow: 0 0 10px rgb(0 0 0 / 50%); margin-top: ' + (page.pageNumber != 1 ? 30 : 0) + 'px;',
            children: [canvas]
        }))
    }

    function renderPdf(data) {
        rendering = true
        pdfjsLib.getDocument(data).promise.then(async pdf => {
            const totalPages = pdf.numPages
            const pdfWrapper = createElement({
                tagName: 'div',
                className: 'd-flex flex-column align-items-center w-100',
                style: 'padding: 30px;'
            })
            questionPaper.append(pdfWrapper)
            for (var i = 1; i <= totalPages; i++) {
                await renderPage(await pdf.getPage(i), pdfWrapper)
            }
            questionFileRemove.disabled = false
            questionFileRemove.onclick = () => {
                pdf.destroy()
                clearSelectedFile()
            }
            rendering = false
        }).catch(reason => {
            console.warn(reason)
            rendering = false
        })
    }

    function clearSelectedFile() {
        questionFileRemove.disabled = true
        questionFileRemove.onclick = null
        questionPaper.innerHTML = null
    }

    function renderDocx(data) {
        rendering = true
        docx.renderAsync(data, questionPaper).then(x => {
            questionFileRemove.disabled = false
            questionFileRemove.onclick = clearSelectedFile
            rendering = false
        });
    }

    function openResourceSelector(wrapper, rsList, imageBox, documentBox) {
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
                    documentBox.remove()
                    if (!imageBox.isConnected)
                        wrapper.append(imageBox)
                    imageBox.style.backgroundImage = 'url("<c:url value="/"/>' + resource.url.substring(1) + '")'
                } else {
                    imageBox.remove()
                    if (!documentBox.isConnected)
                        wrapper.append(documentBox)
                    documentBox.textContent = resource.url.split('/').pop()
                }
                wrapper.dataset.id = resource.resourceId
                resource.order.innerHTML = '<i class="fa-solid fa-check"></i>'
                resource.element.classList.add('selected')
                rsList.push(resource)
            } else {
                delete wrapper.dataset.id
                imageBox.remove()
                documentBox.remove()
                resource.element.classList.remove('selected')
                rsList.length = 0
            }
        }
    }

    function numberToLetter(num) {
        if (num <= 26) {
            return String.fromCharCode(64 + num);
        } else {
            let quotient = Math.floor((num - 1) / 26);
            let remainder = (num - 1) % 26 + 1;
            return numberToLetter(quotient) + numberToLetter(remainder);
        }
    }

    async function loadFile() {
        const file = rsTest[0]
        if (!file || !(file.mimeType === 'application/pdf' || file.mimeType === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')) {
            return
        }
        clearSelectedFile()
        const response = await fetch('<c:url value="/"/>' + file.url.substring(1))
        const data = await response.arrayBuffer()
        if (file.mimeType === 'application/pdf') {
            if (!pdfjsLib.GlobalWorkerOptions.workerSrc) {
                pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://unpkg.com/pdfjs-dist@3.4.120/build/pdf.worker.min.js'
            }
            renderPdf(data)
        } else if (file.mimeType === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document') {
            renderDocx(data)
        }
    }

    const createExerciseButton = document.getElementById('create-exercise')
    createExerciseButton.disabled = true
    const testTimeToggle = document.getElementById('test-time-toggle')
    const startTimeToggle = document.getElementById('start-time-toggle')
    startTimeToggle.checked = true
    const startTimeLabel = startTimeToggle.parentElement.nextElementSibling
    const endTimeToggle = document.getElementById('end-time-toggle')
    const reviewToggle = document.getElementById('review-toggle')
    const questionFileToggle = document.getElementById('question-file-toggle')
    const testTimeInput = document.getElementById('test-time')
    const startTimeInput = document.getElementById('start-time')
    const endTimeInput = document.getElementById('end-time')
    const questionFileAdd = document.getElementById('question-file-add')
    questionFileAdd.disabled = true
    const questionFileRemove = document.getElementById('question-file-remove')
    questionFileRemove.disabled = true
    const descriptionInput = document.getElementById('description')
    const addQuestionBtn = document.getElementById('add-question')
    const questionPaper = document.getElementById('question-paper')
    const questionList = document.getElementById('question-list')
    const mainContainer = document.querySelector('.main-container')
    const testRsBox = document.getElementById('rs-box')
    const rasterType = [
        'image/png',
        'image/jpeg',
        'image/bmp',
        'image/gif',
        'image/tiff',
        'image/webp',
        'image/avif'
    ]
    let rendering = false

    testTimeToggle.addEventListener('click', () => {
        testTimeInput.parentElement.classList.toggle('disable-input', !testTimeToggle.checked)
    })

    let testTime = 15
    testTimeInput.addEventListener('change', () => {
        if (!testTimeInput.value.match(/^\d+$/g)) {
            testTimeInput.value = testTime
            testTimeInput.dispatchEvent(new Event('change'))
        }
        testTime = testTimeInput.valueAsNumber
        if (testTime <= 0) {
            testTimeInput.value = 1
            testTimeInput.dispatchEvent(new Event('change'))
        }
    })

    const startTimeSubLabel = createElement({
        tagName: 'span',
        className: 'sub-label',
        textContent: ' (Exercise will start now)'
    })
    startTimeToggle.addEventListener('click', () => {
        startTimeInput.parentElement.classList.toggle('disable-sub-label', startTimeToggle.checked)
        startTimeInput.parentElement.classList.toggle('disable-input', !startTimeToggle.checked)
    })

    endTimeToggle.addEventListener('click', () => {
        endTimeInput.parentElement.classList.toggle('disable-input', !endTimeToggle.checked)
    })

    questionFileToggle.addEventListener('click', () => {
        questionFileAdd.disabled = !questionFileToggle.checked
        mainContainer.classList.toggle('has-paper', questionFileToggle.checked)
    })

    descriptionInput.addEventListener('input', textAreaResize(2))
    const rsTest = []
    const testDocumentBox = createElement({
        tagName: 'div',
        className: 'document-resource text-truncate bg-white'
    })
    questionFileAdd.addEventListener('click', () => {
        resourceManage.fileAccept = 'application/pdf, application/vnd.openxmlformats-officedocument.wordprocessingml.document'
        resourceManage.accept = rs => ['application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/pdf'].includes(rs.mimeType)
        openResourceSelector(testRsBox, rsTest, null, testDocumentBox)

        resourceManage.selected = rsTest
        resourceManage.resetup = () => {
            rsTest.forEach(r => {
                r.order.innerHTML = '<i class="fa-solid fa-check"></i>'
            })
            deleteBtn.disabled = rsTest.length > 0
        }
        resourceManage.callback = resource => {
            if (rsTest[0] !== resource) {
                const rel = rsTest.pop()
                if (rel) {
                    rel.element.classList.remove('selected')
                    rsTest.length = 0
                }
                if (!testDocumentBox.isConnected)
                    testRsBox.append(testDocumentBox)
                testDocumentBox.textContent = resource.url.split('/').pop()
                testRsBox.dataset.id = resource.resourceId
                resource.order.innerHTML = '<i class="fa-solid fa-check"></i>'
                resource.element.classList.add('selected')
                rsTest.push(resource)
                loadFile()
            } else {
                questionFileRemove.click()
            }
        }
        resourceModalBootstrap.show()
    })
    questionFileRemove.addEventListener('click', () => {
        delete testRsBox.dataset.id
        if (testDocumentBox)
            testDocumentBox.remove()
        if (rsTest[0])
            rsTest[0].element.classList.remove('selected')
        rsTest.length = 0
    })

    addQuestionBtn.addEventListener('click', () => {
        const bindList = {}
        const rsList = []
        const imageBox = createElement({
            tagName: 'div',
            className: 'img-resource',
        })
        const documentBox = createElement({
            tagName: 'div',
            className: 'document-resource text-truncate bg-white'
        })
        const order = questionList.children.length
        const newQuestion = createElement({
            tagName: 'div',
            className: 'question p-3 pt-4 rounded-3 bg-white mt-5',
            setAttribute: ['order', order],
            children: [
                {
                    tagName: 'p',
                    className: 'question-order user-select-none',
                    textContent: 'Question ' + order
                },
                {
                    tagName: 'p',
                    className: 'question-deleter user-select-none',
                    bind: [bindList, 'removeQuestion'],
                    innerHTML: '<i class="fa-solid fa-xmark"></i>'
                },
                {
                    tagName: 'div',
                    className: 'question-body',
                    children: [
                        {
                            tagName: 'div',
                            className: 'question-term d-flex flex-column',
                            bind: [bindList, 'questionTerm'],
                            children: [
                                {
                                    tagName: 'div',
                                    className: 'd-flex',
                                    children: [
                                        {
                                            tagName: 'textarea',
                                            className: 'content inputbox w-100',
                                            rows: 1,
                                            spellcheck: false,
                                            placeholder: 'Enter question content here',
                                            addEventListener: ['input', textAreaResize(2)]
                                        },
                                        {
                                            tagName: 'button',
                                            className: 'btn flex-shrink-0 btn-primary ms-2',
                                            innerHTML: '<i class="fa-sharp fa-solid fa-file"></i>',
                                            addEventListener: ['click', () => {
                                                    openResourceSelector(bindList.questionTerm, rsList, imageBox, documentBox)
                                                    resourceModalBootstrap.show()
                                                }]
                                        }
                                    ]
                                }
                            ]
                        },
                        {
                            tagName: 'div',
                            className: 'd-flex gap-1 justify-content-center mt-3',
                            children: [
                                {
                                    tagName: 'button',
                                    className: 'btn btn-secondary',
                                    innerHTML: '<i class="fa-solid fa-plus"></i>',
                                    addEventListener: ['click', increaseAnswer]
                                },
                                {
                                    tagName: 'input',
                                    className: 'answer-counter inputbox',
                                    bind: [bindList, 'answerCounter'],
                                    type: 'number'
                                },
                                {
                                    tagName: 'button',
                                    className: 'btn btn-secondary',
                                    innerHTML: '<i class="fa-solid fa-minus"></i>',
                                    addEventListener: ['click', decreaseAnswer]
                                }
                            ]
                        },
                        {
                            tagName: 'div',
                            className: 'question-answer-list',
                            bind: [bindList, 'answerList']
                        }
                    ]
                }
            ]
        })
        let answerCount = 2
        const answerObjectList = []
        function increaseAnswer() {
            answerCount++
            bindList.answerCounter.value = answerCount
            bindList.answerCounter.dispatchEvent(new Event('change'))
        }
        function decreaseAnswer() {
            answerCount--
            if (answerCount < 1) {
                answerCount = 1
            }
            bindList.answerCounter.value = answerCount
            bindList.answerCounter.dispatchEvent(new Event('change'))
        }
        function addAnswer() {
            const answerBindList = {}
            const answerImageBox = createElement({
                tagName: 'div',
                className: 'img-resource',
            })
            const answerDocumentBox = createElement({
                tagName: 'div',
                className: 'document-resource text-truncate bg-white'
            })
            const answerRsList = []
            const newAnswer = createElement({
                tagName: 'div',
                className: 'question-answer p-3 pt-4 mt-3',
                children: [
                    {
                        tagName: 'p',
                        className: 'answer-order user-select-none',
                        textContent: numberToLetter(answerObjectList.length + 1),
                        bind: [answerBindList, 'changeState']
                    },
                    {
                        tagName: 'p',
                        className: 'user-select-none correct-badge',
                        textContent: 'Marked as correct'
                    },
                    {
                        tagName: 'div',
                        className: 'pb-2 answer-resource',
                        bind: [answerBindList, 'resource']
                    },
                    {
                        tagName: 'div',
                        className: 'd-flex',
                        children: [
                            {
                                tagName: 'textarea',
                                className: 'content w-100 inputbox',
                                rows: 1,
                                spellcheck: false,
                                placeholder: 'Enter answer content here',
                                addEventListener: ['input', textAreaResize(2)]
                            },
                            {
                                tagName: 'button',
                                className: 'btn flex-shrink-0 btn-primary ms-2',
                                innerHTML: '<i class="fa-sharp fa-solid fa-file"></i>',
                                addEventListener: ['click', () => {
                                        openResourceSelector(answerBindList.resource, answerRsList, answerImageBox, answerDocumentBox)
                                        resourceModalBootstrap.show()
                                    }]
                            }
                        ]
                    }
                ]
            })
            answerBindList.changeState.addEventListener('click', () => {
                newAnswer.classList.toggle('true')
            })
            answerObjectList.push({
                element: newAnswer
            })
            bindList.answerList.append(newAnswer)
        }
        bindList.removeQuestion.addEventListener('click', () => {
            newQuestion.remove();
            const qList = [...questionList.getElementsByClassName('question')]
            createExerciseButton.disabled = qList.length <= 0
            qList.forEach((q, i) => {
                q.querySelector('.question-order').textContent = 'Question ' + (i + 1)
            })
        })
        bindList.answerCounter.value = answerCount
        bindList.answerCounter.addEventListener('change', () => {
            if (!bindList.answerCounter.value.match(/^\d+$/g)) {
                bindList.answerCounter.value = answerCount
                return
            }
            const value = parseInt(bindList.answerCounter.value)
            if (value < 1) {
                bindList.answerCounter.value = 1
                bindList.answerCounter.dispatchEvent(new Event('change'))
                return;
            }
            answerCount = value
            if (value !== bindList.answerList.children.length) {
                for (var i = 0; i < value; i++) {
                    const el = answerObjectList[i]
                    if (el && !el.element.isConnected) {
                        bindList.answerList.append(el.element)
                    } else if (!el) {
                        addAnswer()
                    }
                }
                [...bindList.answerList.children].forEach((as, idx) => {
                    if (idx >= value) {
                        as.remove()
                    }
                })
            }
        })
        bindList.answerCounter.dispatchEvent(new Event('change'))
        questionList.append(newQuestion)
        createExerciseButton.disabled = questionList.children.length <= 1
    })

    const messageModal = new bootstrap.Modal(document.getElementById('message-modal'))

    function showError(element, msg, placeAction, extra, propagation) {
        if (element.classList.contains('validate-fail'))
            return
        element.classList.add('validate-fail')
        extra = extra || element
        const msgLabel = createElement({
            tagName: 'label',
            style: 'color: #dc3545;margin-top: 4px 0;',
            textContent: msg
        })
        if (placeAction) {
            placeAction(msgLabel)
        }
        const listener = e => {
            if (propagation) {
                e.stopPropagation()
            }
            extra.removeEventListener('click', listener)
            element.classList.remove('validate-fail')
            msgLabel.remove()
        }
        extra.addEventListener('click', listener)
    }

    createExerciseButton.addEventListener('click', async e => {
        let isValid = true
        let lastFail
        const now = new Date()
        now.setMinutes(now.getMinutes() - now.getTimezoneOffset())
        const testObject = {
            classId: '${classObject.classId}',
            resourceId: rsTest[0] && questionFileToggle.checked ? rsTest[0].resourceId : null,
            title: document.getElementById('title').value.trim() || null,
            description: document.getElementById('description').value.trim() || null,
            startAt: startTimeToggle.checked ? startTimeInput.value : now.toISOString().slice(0, 16),
            endAt: endTimeInput.value || null,
            duration: testTimeToggle.checked ? testTimeInput.valueAsNumber : null,
            allowReview: !reviewToggle.checked,
            questions: [...questionList.getElementsByClassName('question')].reduce((qs, q, qidx) => {
                const question = {
                    content: q.querySelector('.question-term .content').value || null,
                    resourceId: q.querySelector('.question-term').dataset.id || null,
                    questionOrder: qidx + 1,
                    answers: [...q.querySelector('.question-answer-list').children].reduce((as, a, aidx) => {
                        const answer = {
                            correct: a.classList.contains('true'),
                            content: a.querySelector('.content').value,
                            answerOrder: aidx + 1,
                            resourceId: a.querySelector('.answer-resource').dataset.id || null
                        }
//                        isValid = !!(isValid && (answer.content || answer.resourceId))
                        if (!answer.content && !answer.resourceId) {
                            showError(a, "Answer content must be filled or attach a file", msgLabel => a.insertBefore(msgLabel, a.children[0]))
                            lastFail = a
                            isValid = false
                        }
                        as.push(answer)
                        return as
                    }, [])
                }
//                isValid = !!(isValid && (question.content || question.resourceId) && question.answers.some(a => a.correct))
                if (!question.content && !question.resourceId) {
                    showError(q, "Question content must be filled or attach a file", msgLabel => q.insertBefore(msgLabel, q.children[0]))
                    lastFail = q
                    isValid = false
                }
                if (!question.answers.some(a => a.correct)) {
                    showError(q, "Question must has at least one correct answer", msgLabel => q.insertBefore(msgLabel, q.children[0]), null, true)
                    lastFail = q
                    isValid = false
                }
                qs.push(question)
                return qs
            }, [])
        }
//        isValid = !!(isValid && testObject.title && testObject.questions.length > 0)
        if (!testObject.title) {
            lastFail = document.getElementById('title')
            showError(lastFail, "Title cannot be empty", msgLabel => lastFail.parentElement.append(msgLabel))
            isValid = false
        }
        if (testObject.questions.length <= 0) {
            showError(questionList, "A exercise must has at least one question", msgLabel => questionList.append(msgLabel))
            lastFail = questionList
            isValid = false
        }
        if (startTimeToggle.checked && !testObject.startAt) {
            showError(startTimeInput, "Start time enable but not set", msgLabel => startTimeInput.parentElement.append(msgLabel), startTimeInput.parentElement)
            lastFail = startTimeInput
            isValid = false
        }
        if (endTimeToggle.checked && !testObject.endAt) {
            showError(endTimeInput, "End time enable but not set", msgLabel => endTimeInput.parentElement.append(msgLabel), endTimeInput.parentElement)
            lastFail = endTimeInput
            isValid = false
        }
        const startDatetime = new Date(startTimeInput.value || Date.now())
        if (isValid && testObject.endAt) {
            const endDatetime = new Date(endTimeInput.value)
            if (endDatetime <= startDatetime) {
                showError(endTimeInput, "End time must after start time", msgLabel => endTimeInput.parentElement.append(msgLabel), endTimeInput.parentElement)
                lastFail = endTimeInput
                isValid = false
            }
            if (testObject.duration && (endDatetime.getTime() - startDatetime.getTime()) / 1000 / 60 < testObject.duration) {
                showError(endTimeInput, "Start time to end time must equal or longer than duration", msgLabel => endTimeInput.parentElement.append(msgLabel), endTimeInput.parentElement)
                lastFail = endTimeInput
                isValid = false
            }
        }
        if (isValid) {
            const response = await fetch('<c:url value="/teacher/class/exercise/create"/>', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=UTF-8'
                },
                body: JSON.stringify(testObject)
            })
            if (response.ok) {
                window.location.replace('<c:url value="/teacher/class/exercise?code=${classObject.code}"/>')
            }
        } else {
            if (!mainContainer.classList.contains('has-paper')) {
                window.scroll({
                    top: lastFail.offsetTop - 100,
                    behavior: 'smooth'
                });
            } else {
                document.querySelector(".test-info-area").scroll({
                    top: lastFail.offsetTop - 100,
                    behavior: 'smooth'
                });
            }
        }
    })
</script>
<c:import url="../template/footer.jsp"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    p {
        margin: 0;
    }

    #right-sidebar {
        top:0;
        bottom: 0;
        right: 0;
        padding-top: 56px;
        height: 100vh;
    }

    #notification-box {
        background-color: white;
        width: 300px;
        height: 100%;
        padding: 1rem;
        display: flex;
        gap: 1.2rem;
        flex-direction: column;
    }

    #notification-box > p {
        font-weight: 500;
        margin: 0;
    }

    #notification-box button {
        width: 100%;
        height: 38px !important;
        text-transform: unset;
        font-weight: 500;
        border-radius: 8px;
    }

    #notification-side-receive {
        flex-grow: 1;
        list-style: none;
        padding: 0;
        margin: 0;
        margin-right: -12px;
        padding-right: 4px;
        display: flex;
        flex-direction: column;
        overflow-x: hidden;
        overflow-y: scroll;
        gap: 20px;
        border-radius: 8px;
    }

    #notification-side-receive::-webkit-scrollbar {
        width: 8px;
        padding: 0 4px;
    }

    #notification-side-receive::-webkit-scrollbar-thumb {
        background-color: #ddd;
        border-radius: 4px;
    }

    #notification-side-receive::-webkit-scrollbar-thumb:hover {
        background-color: #bbb;
    }

    #notification-box > ul > li {
        border-radius: 8px;
        border-left: 4px solid rgb(30, 136, 229);
        padding: 8px 12px;
        background: rgb(245, 246, 252);
    }
    
    #notification-box .notification-content {
        white-space: pre-wrap;
        word-break: break-word;
    }

    #notification-box .notification-time {
        user-select: none;
        font-size: 0.9rem;
        opacity: 0.6;
        margin-top: 4px;
    }

    .modal-open #right-sidebar {
        padding-right: 17px
    }

    .modal-dialog {
        margin: 0;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-50%) !important;
    }

    #notification-content {
        resize: none;
        outline: none;
        border: none;
    }

    #notification-msg {
        color: red;
    }
</style>
<c:if test="${account.role == 1}">
    <div class="modal fade" id="new-notification-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Create new notification</h5>
                    <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <textarea spellcheck="false" rows="4" cols="50" id="notification-content"></textarea>
                    <p id="notification-msg"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" id="modal-close-btn" class="btn btn-secondary" data-mdb-dismiss="modal">Close</button>
                    <button type="button" id="add-noti-btn" class="btn btn-primary">Add</button>
                </div>
            </div>
        </div>
    </div>
</c:if>
<div id="right-sidebar" class="position-fixed">
    <div id="notification-box">
        <p>Notification</p>
        <c:if test="${account.role == 1}">
            <div>
                <button class="btn btn-primary" data-mdb-toggle="modal" data-mdb-target="#new-notification-modal">
                    <i class="fa-solid fa-plus"></i>
                    New notification
                </button>
            </div>
        </c:if>
        <ul id="notification-side-receive"></ul>
    </div>
</div>
<script defer>
    const classId = '${classObject.classId.toString()}'
    const classCode = '${classObject.code}'
    const teacherId = '${teacher.accountId.toString()}'
    const notiMsg = document.getElementById('notification-msg')
    const notiReceiveBox = document.getElementById('notification-side-receive')
    <c:if test="${account.role == 1}">
        const notiContentTextarea = document.getElementById('notification-content')
        const addBtn = document.getElementById('add-noti-btn')
        const closeBtn = document.getElementById('modal-close-btn')

        let validContent = true

        notiContentTextarea.addEventListener('input', () => {
            const content = notiContentTextarea.value.trim()
            if (content.length > 200) {
                validContent = false
                notiMsg.textContent = 'Notification length must less than 200 character'
                return
            } else {
                validContent = true
                notiMsg.textContent = ''
            }
        })

        addBtn.addEventListener('click', async () => {
            const content = notiContentTextarea.value.trim()
            if (!validContent)
                return
            if (content) {
                const formData = new FormData()
                formData.append('classId', classId)
                formData.append('classCode', classCode)
                formData.append('teacherId', teacherId)
                formData.append('title', 'Notification from ${classObject.name}')
                formData.append('content', content)
                const response = await fetch('<c:url value="/teacher/class/notification"/>', {
                    method: 'POST',
                    body: formData
                })
                closeBtn.click()
                notiContentTextarea.value = ''
            } else {
                notiMsg.textContent = 'Notification must not left empty'
            }
        })
    </c:if>
    
    function insertNotificationSide(notification) {
        if (notification.classId !== classId) return
        const liElement = document.createElement('li')
        const contentElement = document.createElement('p')
        contentElement.classList.add('notification-content')
        contentElement.textContent = notification.content

        const timeElement = document.createElement('p')
        timeElement.classList.add('notification-time')
        timeElement.textContent = notification.createTime

        liElement.append(contentElement)
        liElement.append(timeElement)
        notiReceiveBox.insertBefore(liElement, notiReceiveBox.children[0])
    }
    
    generalWS.on('notification', insertNotificationSide)
    generalWS.on('init-notification', notifications => {
        notifications.forEach(n => insertNotificationSide(n))
    })
</script>
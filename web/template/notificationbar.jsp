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

    #notification-box .notification-time {
        font-size: 0.9rem;
        opacity: 0.7;
        margin-top: 4px;
    }

    .modal-open #right-sidebar {
        padding-right: 17px
    }
</style>
<div class="modal fade" id="new-notification-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">...</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
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
        <ul id="notification-side-receive">
            <li>
                <p class="notification-content">Các ông có hiểu cảm giác nhận được cuộc gọi từ điện thoại của người thân, mà bên kia đầu máy là giọng của người lạ chưa</p>
                <p class="notification-time">dd-mm-yyyy hh:MM</p>
            </li>
        </ul>
    </div>
</div>
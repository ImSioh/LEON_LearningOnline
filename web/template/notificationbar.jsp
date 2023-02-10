<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
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
        padding: 8px;
        background: rgb(245, 246, 252);
    }
</style>
<div id="right-sidebar" class="position-fixed">
    <div id="notification-box">
        <p>Notification</p>
        <div>
            <button class="btn btn-primary">
                <i class="fa-solid fa-plus"></i>
                New notification
            </button>
        </div>
        <ul id="notification-side-receive">
            <li>first</li>
            <li>second</li>
            <li>third</li>
        </ul>

    </div>
</div>
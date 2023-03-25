<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>
<div id="content" style="margin: 10px">
    <div style="display:flex;justify-content:center;align-items:center;">
        <img src="assets/img/notification1.png" alt="alt" width="18%"/>
    </div>
    <h1 style="text-align: center">${headerLock}</h1>
    <div style="display:flex;justify-content:center;align-items:center;">
        <form action="" method="post">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Title *</label>
                <textarea name="title" rows="1" cols="45" class="form-control" 
                          placeholder="Write the title...">${title}</textarea>
                <div class="form-text" style="color: red">${msgTitle}</div>
            </div>
            <div class="mb-3">
                <label class="form-label">Content *</label>
                <textarea name="content" rows="5" cols="45" class="form-control" 
                          placeholder="Write the reason...">${content}</textarea>
                <div class="form-text" style="color: red">${msgContent}</div>
            </div>
            <button type="submit" class="btn btn-primary">Send <i class="fa-solid fa-paper-plane"></i></button>
        </form>
    </div>
    <div style="display:flex;justify-content:center;align-items:center; margin-top: 1%">
        <c:if test="${status}">
            <p style="color: green;">${msg}</p>
        </c:if>
        <c:if test="${!status}">
            <p style="color: red;">${msg}</p>
        </c:if>
    </div>
</div>

<%@include file="template/footer.jsp" %>
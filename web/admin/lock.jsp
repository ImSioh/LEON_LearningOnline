<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>
<div id="content" style="margin: 10px">
    <div style="display:flex;justify-content:center;align-items:center;">
        <img src="assets/img/lock.png" alt="alt" width="12%"/>
    </div>
    <h1 style="text-align: center">${headerLock}</h1>
    <div style="display:flex;justify-content:center;align-items:center;">
        <form action="" method="post">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email</label>
                <input type="email" name="email"  value="${email}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Reason</label>
                <textarea name="reason" rows="5" cols="30" class="form-control" 
                          placeholder="Write the reason...">${reason}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<div id="content">
    <h1>Students Management</h1>
    <!-- <img src="assets/img/welcome_admin.jpg" alt="Welcome to Admin Homepage" width="100%" height="100%" style="margin: 0;"/> -->
    <form action="<c:url value="/SearchAccount"/>" method="get" style="padding-top: 3%;">
        <span class="button-action" style="display: flex;">
            <select name="optionSearch" class="form-select" style="width: 18%; margin: 32px 0  32px 55%; text-align: center">
                <option value="name" ${optionSearch eq "name"?"selected":""}>Name</option>
                <option value="email" ${optionSearch eq "email"?"selected":""}>Email</option>
                <option value="phoneNumber" ${optionSearch eq "phoneNumber"?"selected":""}>PhoneNumber</option>
            </select>
            <input type="hidden" name="searchFor" value="1">
            <input type="text" value="${keyword}" name="keyword" id="" class="form-control" placeholder="Input something..." style="width: 45%; margin: 32px"> 
            <input type="submit" value="SEARCH" id="search" class="btn-info" 
                   style="margin: 32px 0 32px 0; width: 10%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
        </span>

    </form>

    <div class="table">
        <table class="table table-light table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>PhoneNumber</th>
                    <th>CreateTime</th>
                    <th>Locked</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="account" items="${accountList}" >
                    <tr>
                        <td>${account.getAccountId()}</td>
                        <td>${account.getName()}</td>
                        <td>${account.getEmail()}</td>
                        <td>${account.getAddress()}</td>
                        <td>${account.getPhoneNumber()}</td>
                        <td>${account.getCreateTime()}</td>
                        <td><a href="#"><i class="fa-solid fa-lock-open"></i></a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-end">
            <li class="page-item disabled">
                <a class="page-link">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</div>

<%@include file="template/footer.jsp" %>
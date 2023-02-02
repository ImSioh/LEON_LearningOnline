<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "template/header.jsp" %>

<div id="content">
    <h1>Teachers Management</h1>

        <!--Search-->
    <form action="<c:url value="/SearchAccount"/>" method="get" style="">
        <span class="button-action" style="display: flex;">
            <select name="optionSearch" class="form-select" style="width: 18%; height: 10%; margin: 0 10px 0 55%; text-align: center">
                <option value="name" ${optionSearch eq "name"?"selected":""}>Name</option>
                <option value="email" ${optionSearch eq "email"?"selected":""}>Email</option>
                <option value="phoneNumber" ${optionSearch eq "phoneNumber"?"selected":""}>PhoneNumber</option>
            </select>
            <input type="hidden" name="searchFor" value="1">
            <input type="text" value="${keyword}" name="keyword" id="" class="form-control" placeholder="Input something..." style="width: 45%; height: 10%; margin: 0"> 
            <input type="submit" value="SEARCH" id="search" class="btn-info" 
                   style="margin: 5px 0 5px 10px; width: 10%; height: 15%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
        </span>
    </form>

    <!--Sort-->
    <form action="<c:url value="/"/>" method="get" style="margin-top: 10px;">
        <span class="button-action" style="display: flex;">
            <select name="optionSearch" class="form-select" style="width: 30%; height: 10%; margin: 0 0 0 55%; text-align: center">
                <option value="name" ${optionSearch eq "name"?"selected":""}>Name</option>
                <option value="email" ${optionSearch eq "email"?"selected":""}>Email</option>
                <option value="phoneNumber" ${optionSearch eq "phoneNumber"?"selected":""}>PhoneNumber</option>
            </select>
            <input type="hidden" name="sortBy" value="1">
            <!--<input type="text" value="${keyword}" name="keyword" id="" class="form-control" placeholder="Input something..." style="width: 45%; margin: 32px">--> 
            <input type="submit" value="SORT" id="sort" class="btn-info" 
                   style="margin: 5px 0 5px 15%; width: 10%; height: 15%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
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
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="account" items="${accountList}" >
                    <tr>
                        <td>
                            <a href="">${account.getAccountId()}</a>
                        </td>
                        <td>${account.getName()}</td>
                        <td>${account.getEmail()}</td>
                        <td>${account.getAddress()}</td>
                        <td>${account.getPhoneNumber()}</td>
                        <td>${account.getCreateTime()}</td>
                        <c:if test="${account.isLocked()}">
                            <td><a href="#"><i class="fa-solid fa-lock"></i></a></td>
                                </c:if>
                                <c:if test="${account.isLocked()!=true}">
                            <td><a href="#"><i class="fa-solid fa-lock-open"></i></a></td>
                                </c:if>
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

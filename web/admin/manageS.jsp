<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "template/header.jsp" %>

<c:set scope="page" var="page" value="${page}"/>
<c:set scope="page" var="numberOfPage" value="${numberOfPage}"/>
<c:if test="${!(page >= 1 && page <= numberOfPage)}">
    <%--<c:redirect url="/admin/student-account-list"/>--%>
</c:if>

<div id="content" style="margin: 3% 5%">
    <h1>Students Management</h1>

    <!--Search-->
    <form action="" method="post" style="">
        <span class="button-action" style="display: flex;">
            <select name="search" class="form-select" style="width: 18%; height: 10%; margin: 0 10px 0 55%; text-align: center">
                <option value="name" ${search eq "name"?"selected":""}>Name</option>
                <option value="email" ${search eq "email"?"selected":""}>Email</option>
                <option value="address" ${search eq "address"?"selected":""}>Address</option>
                <option value="phoneNumber" ${search eq "phoneNumber"?"selected":""}>Phone Number</option>
            </select>

            <input type="text" value="${keyword}" name="keyword" id="" class="form-control" placeholder="Search something..." style="width: 45%; height: 10%; margin: 0"> 
            <input type="submit" value="SEARCH" id="search" class="btn-info" 
                   style="margin: 5px 0 5px 10px; width: 10%; height: 15%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
        </span>

        <!--Sort-->
        <span class="button-action" style="display: flex; margin-top: 10px;">
            <select name="criteria" class="form-select" style="width: 18%; height: 10%; margin: 0 10px 0 55%; text-align: center">
                <option value="name" ${criteria eq "name"?"selected":""}>Name</option>
                <option value="email" ${criteria eq "email"?"selected":""}>Email</option>
                <option value="create_time" ${criteria eq "create_time"?"selected":""}>Create Time</option>
            </select>
            <select name="orderBy" class="form-select" style="width: 35%; height: 10%; padding: 6px 12px; text-align: center">
                <option value="true" ${orderBy?"selected":""}>Ascending</option>
                <option value="false" ${orderBy?"":"selected"}>Descending</option>
            </select>
            <input type="submit" value="SORT" id="sort" class="btn-info" 
                   style="margin: 5px 0 5px 10px; width: 10%; height: 15%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
        </span>

        <!--Show items-->
        <span class="button-action" style="display: flex; margin-top: 0;">
            Show 
            <select name="element" style="width: 5%; height: 5%; margin: 5px; text-align: center;
                    border: 3px solid #e3f2fd; border-radius: 0.25em;">
                <c:forEach items="${elementOption}" var="eO">
                    <option value="${eO}" ${element eq eO ?"selected":""}>${eO}</option>
                </c:forEach>
            </select>
            entries
            <input type="submit" value="SHOW" id="show" class="btn-info" 
                   style="margin: 5px 5px; width: 5%; height: 5%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
        </span>

        <div class="table" style="overflow: scroll; overflow-x: hidden; height: 350px;">
            <table class="table table-light table-hover">
                <thead>
                    <tr>
                        <th>Details</th>
                        <th>Name</th>
                        <th>Gender</th>
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
                                <a href="user-account-profile?id=${account.getAccountId()}">View Profile</a>
                            </td>
                            <td>${account.getName()}</td>
                            <td>
                                <c:if test="${account.isGender()}">
                                    Male
                                </c:if>
                                <c:if test="${!account.isGender()}">
                                    Female
                                </c:if>
                            </td>
                            <td>${account.getEmail()}</td>
                            <td>${account.getAddress()}</td>
                            <td>
                                <c:if test="${empty account.getPhoneNumber()}">
                                    ${account.getPhoneNumber()}
                                </c:if>
                                <c:if test="${not empty account.getPhoneNumber()}">
                                    ${account.getPhoneNumber().substring(0,4)}-XXX-${account.getPhoneNumber().substring(7,10)}
                                </c:if>
                            </td>
                            <td>${account.getCreateTime()}</td>
                            <td>
                                <c:if test="${account.isLocked()}">
                                    <a href="<c:url value="/admin/lock?id=${account.getAccountId()}"/>" 
                                       onclick="return lockAcc('Do you want to unlock this account?')">
                                        <i class="fa-solid fa-lock"></i></a>
                                    </c:if>
                                    <c:if test="${account.isLocked()!=true}">
                                    <a href="<c:url value="/admin/lock?id=${account.getAccountId()}"/>" 
                                       onclick="return lockAcc('Do you want to lock this account?')">
                                        <i class="fa-solid fa-lock-open"></i></a>
                                    </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <c:set value="${accountList}" var="acc"/>
        <c:if test="${acc.size()==0}">
            <p style="text-align: center; font-size: 30px; color: red">
                Not results found</p>
            </c:if>

        <c:url value="admin/student-account-list" var="baseUrl"/>
        <c:import url="/template/pagination-bar.jsp">
            <c:param name="page" value="${page}"/>
            <c:param name="numberOfPage" value="${numberOfPage}"/>
            <c:param name="basePath" value="/${baseUrl}"/>
        </c:import>

</div>

<script src="<c:url value="assets/js/lock.js"/>"></script>

<%@include file="template/footer.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<c:set scope="page" var="page" value="${page}"/>
<c:set scope="page" var="numberOfPage" value="${numberOfPage}"/>
<c:if test="${!(page > 1 && page <= numberOfPage)}">
    <%--<c:redirect url="/error"/>--%>
</c:if>

<div id="content" style="margin: 1% 5%">
    <h1>Feedbacks Management</h1>
    <!-- <img src="assets/img/welcome_admin.jpg" alt="Welcome to Admin Homepage" width="100%" height="100%" style="margin: 0;"/> -->

    <form action="" method="post">
        <!--Search-->
        <span class="d-flex" style="gap: 10px; margin-left: 60%;">
            <select name="search" class="form-select" style="width: 35%;">
                <option value="name" ${search eq "name"?"selected":""}>Name</option>
                <option value="email" ${search eq "email"?"selected":""}>Email</option>
                <option value="title" ${search eq "title"?"selected":""}>Title</option>
            </select>

            <input type="text" value="${keyword}" name="keyword" id="" class="form-select" placeholder="Search something..." style="width: 70%;"> 
            <input type="submit" value="SEARCH" id="search" class="btn btn-info" name="search_button" style="width: 80px;">
        </span>

        <!--Sort-->
        <span class="d-flex" style="gap: 10px; margin-left: 60%; margin-top: 10px;">
            <select name="criteria" class="form-select" style="width: 35%;">
                <option value="name" ${criteria eq "name"?"selected":""}>Name</option>
                <option value="title" ${criteria eq "title"?"selected":""}>Title</option>
                <option value="create_time" ${criteria eq "create_time"?"selected":""}>Create Time</option>
            </select>

            <select name="orderBy" class="form-select" style="width: 70%;">
                <option value="true" ${orderBy?"selected":""}>Ascending</option>
                <option value="false" ${orderBy?"":"selected"}>Descending</option>
            </select>
            <input type="submit" value="SORT" id="sort" class="btn btn-info" style="width: 100px;">
        </span>

        <div style="display: flex; margin-top: 10px;">
            <!--Show items-->
            <span class="d-flex" style="gap: 10px">
                Show 
                <select class="form-select" name="element" style="width: fit-content;">
                    <c:forEach items="${elementOption}" var="eO">
                        <option value="${eO}" ${element eq eO ?"selected":""}>${eO}</option>
                    </c:forEach>
                </select>
                entries
                <button type="submit" value="SHOW" id="show" class="btn btn-info">Show</button>
            </span>  

            <!--Export to excel-->
<!--            <span style="margin-left: 70%;">
                <a href="#"
                   class="btn btn-primary text-light" style="width: max-content">
                    <i class="fa-solid fa-download"></i>
                    Download List
                </a>
            </span>-->
        </div>

        <!--Table-->
        <div class="table" style="overflow: scroll; overflow-x: hidden; height: 345px; margin-top: 10px">
            <table class="table table-light table-hover">
                <thead>
                    <tr>
                        <th>Details</th>
                        <th>Email</th>
                        <th>Account</th>
                        <th>Role</th>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Response</th>
                        <th>CreateTime</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${feedbacks}" var="fb">
                        <tr>
                            <td> <a href="response?Id=${fb.getFeedbackId()}">View feedback</a> </td>

                            <c:forEach items="${accounts}" var="acc">
                                <c:if test="${fb.getAccountId() == acc.getAccountId()}">
                                    <td>${acc.getEmail()}</td>
                                    <td> <a href="user-account-profile?id=${fb.getAccountId()}">${acc.getName()}</a> </td>
                                    <c:if test="${acc.getRole() == 1}">
                                        <td>Teacher</td>
                                    </c:if>
                                    <c:if test="${acc.getRole() == 2}">
                                        <td>Student</td>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                            <td><c:if test="${fb.getTitle().length() > 20}">
                                    ${fb.getTitle().substring(0, 20)}...
                                </c:if>
                                <c:if test="${fb.getTitle().length() <= 20}">
                                    ${fb.getTitle()}
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${fb.getContent().length() > 20}">
                                    ${fb.getContent().substring(0, 20)}...
                                </c:if>
                                <c:if test="${fb.getContent().length() <= 20}">
                                    ${fb.getContent()}
                                </c:if>
                            </td>
                            <td>
                                <c:if test="${fb.getResponse().length() > 20}">
                                    ${fb.getResponse().substring(0, 20)}...
                                </c:if>
                                <c:if test="${fb.getResponse().length() <= 20}">
                                    ${fb.getResponse()}
                                </c:if>
                                <!--<a href="<c:url value="/admin/response?Id=${fb.getFeedbackId()}"/>">View Response</a>-->
                            </td>
                            <td>${fb.getCreateTime()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <c:set value="${feedbacks}" var="fb"/>
        <c:if test="${fb.size()==0}">
            <p style="text-align: center">
                <img src="../admin/assets/img/not-found.jpg" alt="Not result found!" style="width: 50%; text-align: center"/>
            </p>
        </c:if>

        <c:url value="admin/feedback-list" var="baseUrl"/>
        <c:import url="/template/pagination-bar.jsp">
            <c:param name="page" value="${page}"/>
            <c:param name="numberOfPage" value="${numberOfPage}"/>
            <c:param name="basePath" value="/${baseUrl}"/>
        </c:import>

</div>

<%@include file="template/footer.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<c:set scope="page" var="page" value="${page}"/>
<c:set scope="page" var="numberOfPage" value="${numberOfPage}"/>
<c:if test="${!(page > 1 && page <= numberOfPage)}">
    <%--<c:redirect url="/error"/>--%>
</c:if>

<div id="content">
    <h1>Feedbacks Management</h1>
    <!-- <img src="assets/img/welcome_admin.jpg" alt="Welcome to Admin Homepage" width="100%" height="100%" style="margin: 0;"/> -->

    <!--Search-->
    <form action="" method="post" style="">
        <span class="button-action" style="display: flex;">
            <select name="search" class="form-select" style="width: 18%; height: 10%; margin: 0 10px 0 55%; text-align: center">
                <option value="name" ${search eq "name"?"selected":""}>Name</option>
                <option value="email" ${search eq "email"?"selected":""}>Email</option>
                <option value="title" ${search eq "title"?"selected":""}>Title</option>
            </select>
            <input type="text" value="${keyword}" name="keyword" id="" class="form-control" placeholder="Search something..." style="width: 45%; height: 10%; margin: 0"> 
            <input type="submit" value="SEARCH" id="search" class="btn-info" 
                   style="margin: 5px 0 5px 10px; width: 10%; height: 15%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
        </span>

        <!--Sort-->
        <span class="button-action" style="display: flex; margin-top: 10px;">
            <select name="criteria" class="form-select" style="width: 18%; height: 10%; margin: 0 10px 0 55%; text-align: center">
                <option value="name" ${criteria eq "name"?"selected":""}>Name</option>
                <option value="title" ${criteria eq "title"?"selected":""}>Title</option>
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

        <div class="table">
            <table class="table table-light table-hover">
                <thead>
                    <tr>
                        <th>Details</th>
                        <th>Email</th>
                        <th>Name</th>
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
                            <td>${fb.getTitle()}</td>
                            <td>
                                <a href="response?Id=${fb.getFeedbackId()}">${fb.getContent().substring(0, 10)}...</a>
                            </td>
                            <td>
                                <%--<c:if test="${fb.getResponse()== ''}" >--%>
                                <a href="<c:url value="/admin/response?Id=${fb.getFeedbackId()}"/>">View Response</a>
                                <%--</c:if>--%>
                            </td>
                            <td>${fb.getCreateTime()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <c:set value="${feedbacks}" var="fb"/>
        <c:if test="${fb.size()==0}">
            <p style="text-align: center; font-size: 30px; color: red">
                Not results found</p>
            </c:if>

        <c:url value="admin/feedback-list" var="baseUrl"/>
        <c:import url="/template/pagination-bar.jsp">
            <c:param name="page" value="${page}"/>
            <c:param name="numberOfPage" value="${numberOfPage}"/>
            <c:param name="basePath" value="/${baseUrl}"/>
        </c:import>

</div>

<%@include file="template/footer.jsp" %>

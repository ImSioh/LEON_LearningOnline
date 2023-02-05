<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<div id="content">
    <h1>Feedbacks Management</h1>
    <!-- <img src="assets/img/welcome_admin.jpg" alt="Welcome to Admin Homepage" width="100%" height="100%" style="margin: 0;"/> -->

    <!--Search-->
    
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
                    <th>FeedbackID</th>
                    <th>AccountID</th>
                    <th>Role</th>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Response</th>
                    <th>SubmitTime</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${feedbacks}" var="fb">
                    <tr>
                        <td>
                            <a href="">${fb.getFeedbackId()}</a>
                        </td>
                        <td>
                            <a href="">${fb.getAccountId()}</a>
                        </td>
                        <c:forEach items="${accounts}" var="acc">
                            
                            <c:if test="${fb.getAccountId() == acc.getAccountId() 
                                          && acc.getRole() == 1}">
                                  <td>Teacher</td>
                            </c:if>
                            <c:if test="${fb.getAccountId() == acc.getAccountId() 
                                          && acc.getRole() == 2}">
                                  <td>Student</td>
                            </c:if>
                        </c:forEach>
                        <td>${fb.getTitle()}</td>
                        <td>
                            <a href="">Link</a>
                        </td>
                        <td>
                            <a href="">Link</a>
                        </td>
                        <td>fb.getSubmitTime()</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <c:import url="/template/pagination-bar.jsp"/>
</div>

<%@include file="template/footer.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="template/header.jsp" %>

<c:set scope="page" var="pageNumber" value="${param.page != null ? param.page : 1}"/>
<c:if test="${!(pageNumber >= 1 && pageNumber <= feedbackDAO.totalPage)}">
    <c:redirect url="${baseUrl}"/>
</c:if>

<div id="content">
    <h1>Feedbacks Management</h1>
    <!-- <img src="assets/img/welcome_admin.jpg" alt="Welcome to Admin Homepage" width="100%" height="100%" style="margin: 0;"/> -->

    <!--Search-->
    
    <!--Sort-->
    <form action="<c:url value="${baseURL}"/>" method="get" style="margin-top: 10px;">
        <span class="button-action" style="display: flex;">
            <select name="criteria" class="form-select" style="width: 18%; height: 10%; margin: 0 10px 0 55%; text-align: center">
                <option value="title" ${criteria eq "title"?"selected":""}>Title</option>
                <option value="email" ${criteria eq "email"?"selected":""}>Email</option>
                <option value="role" ${criteria eq "role"?"selected":""}>Role</option>
            </select>
            <select name="orderBy" class="form-select" style="width: 35%; height: 10%; padding: 6px 12px; text-align: center">
                <option value="true" ${orderBy?"selected":""}>Ascending</option>
                <option value="false" ${orderBy?"":"selected"}>Descending</option>
            </select>
            <input type="submit" value="SORT" id="sort" class="btn-info" 
                   style="margin: 5px 0 5px 10px; width: 10%; height: 15%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
        </span>
    </form>
            
    <!--Show items-->
    <form action="<c:url value="${baseUrl}?page=${pageNumber}&element=${element}"/>" method="get" style="margin-top: 0;">
        <span class="button-action" style="display: flex;">
            Show 
            <select name="element" style="width: 5%; height: 5%; margin: 5px; text-align: center;
                    border: 3px solid #e3f2fd; border-radius: 0.25em;">
                <c:forEach items="${elementOption}" var="eO">
                    <c:if test="${eO == element}">
                        <option value="${eO}" selected>${eO}</option>
                    </c:if>
                    <c:if test="${eO != element}">
                        <option value="${eO}">${eO}</option>
                    </c:if>
                </c:forEach>
            </select>
            entries
            <!--<input type="text" value="${keyword}" name="keyword" id="" class="form-control" placeholder="Input something..." style="width: 45%; margin: 32px">--> 
            <input type="submit" value="SHOW" id="show" class="btn-info" 
                   style="margin: 5px 5px; width: 5%; height: 5%; border-radius: 0.25em!important; border: 1px solid #e3f2fd !important;">
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
                <c:forEach items="${feedbackDAO.getItemsInPage(pageNumber)}" var="fb">
                <%--<c:forEach items="${feedbacks}" var="fb">--%>
                    <tr>
                        <td>
                            <a href="">${fb.getFeedbackId()}</a>
                        </td>
                        <td>${fb.getAccountId()}</td>
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
                            <c:if test="${fb.getResponse()== ''}" >
                                <a href="<c:url value="/admin/response?Id=${fb.getFeedbackId()}" />">Link</a>
                            </c:if>
                        </td>
                        <td>fb.getSubmitTime()</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <c:url value="admin/feedback-list" var="baseUrl">

    </c:url>
    <c:import url="/template/pagination-bar.jsp">
        <c:param name="page" value="${pageNumber}"/>
        <c:param name="modelDAOName" value="feedbackDAO"/>
        <c:param name="basePath" value="/${baseUrl}"/>
    </c:import>
            
</div>

<%@include file="template/footer.jsp" %>

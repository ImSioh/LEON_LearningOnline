<%@include file= "../template/header.jsp" %>
<div class="content"  style="background-color: rgba(209, 209, 209, 0.5); height: 100vh;">
    <div class="row" style="margin-top: 50px; padding-left: calc(100% / 6); " >
        <div class="col-md-2" style="position: fixed; transform: translateX(-100%);">
            <div style="background-color: #f8f9fa; height: 100vh; width: 220px;" class="d-flex flex-shrink-0 p-3" >
                <hr>
                <ul class="nav nav-pills flex-column mb-auto sidebarnav" style="padding-left: 15px">
                    <li class="nav-item ">
                        <a href="<%=path%>/student/overview" class="nav-link link-dark active"  aria-current="page">
                            Incomplete
                        </a>
                    </li>
                    <li >
                        <a href="<%=path%>/student/achievement" class="nav-link link-dark">
                            Achievement
                        </a>
                    </li>

                </ul>
                <hr>
            </div>
        </div>
        <div class="col-md-10 row">

            <div class="content-main d-flex justify-content-center container">
                <div class="card col-md-9 mt-4 row" style="height: fit-content; border-radius: 15px; overflow: hidden;" >
                    <div class="card-body m-3" >
                        <table class="table align-middle mb-0 bg-white" style="margin-left: -15px !important">
                            <thead class="bg-light">
                                <tr>
                                    <th>Exercise</th>
                                    <th>Teacher</th>
                                    <th>Class</th>
                                    <th>Deadline</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${co}" var="co">
                                    <c:forEach items="${testDAO.getListTitleTest(co.getClassId())}" var="testD">
                                        <c:if test="${dotestDAO.getDoTest(accL.getAccountId(), testD.getTestId()) == null || dotestDAO.getDoTest(accL.getAccountId(), testD.getTestId()).getFinishTime() == null}">
                                            <c:if test="${testD.getCreateTime() != null}">
                                            <tr>
                                                <td>
                                                    <div class="d-flex align-items-center"> 
                                                        <div >
                                                            <a href="<c:url value="/student/class/exercise?code=${co.getCode()}"/>" style="padding-right: 150px; text-decoration: none">
                                                                <p class="fw-bold mb-1">${testD.getTitle()}</p>
                                                                <p class="text-muted mb-0">not done</p>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                                 <td>
                                                    <p class="fw-normal mb-1" style="padding-right: 100px" >${accDAO.getAccountById(co.getAccountId()).getName()}</p>
                                                </td>
                                                <td>
                                                    <p class="fw-normal mb-1" style="padding-right: 50px">${co.getName()}</p>
                                                </td>
                                                <td>
                                                    <div  style="padding: 22px 0px">
                                                        <span class="fw-normal mb-1">${testD.getEndAt()}</span><br>
                                                    </div>
                                                </td>  
                                            </tr>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file= "../template/footer.jsp" %>
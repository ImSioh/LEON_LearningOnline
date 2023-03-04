<%@include file= "../template/header.jsp" %>

<div class="content" style="background-color: rgba(209, 209, 209, 0.5); height: 100vh;">
    <div class="row" style="margin-top: 50px;padding-left: calc(100% / 6);">
        <div class="col-md-2" style="position: fixed; transform: translateX(-100%);">
            <div style="background-color: #f8f9fa; height: 100vh; width: 220px;" class="d-flex flex-shrink-0 p-3" >
                <hr>
                <ul class="nav nav-pills flex-column mb-auto sidebarnav" style="padding-left: 15px">
                    <li>
                        <a href="<%=path%>/student/overview" class="nav-link link-dark"  aria-current="page">
                            Incomplete
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a href="<%=path%>/student/achievement" class="nav-link link-dark active">
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
                        <table class="table align-middle mb-0 bg-white" style="padding: -10px;">
                            <thead class="bg-light">
                                <tr>
                                    <th>Class Name</th>
                                    <th>Average</th>                                   
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${co}" var="co">                                   
                                    <tr>                                       
                                        <td>
                                            <a href="" style="text-decoration: none">
                                            <p class="fw-normal mb-1" style="padding-right: 100px">${co.getName()}</p>
                                            </a>
                                        </td>                                      
                                        <td>                                           
                                            <div style="top :0px">
                                                <span class="fw-normal mb-1">${formatter.format(DoTestDAO.getScoreTest(co.getClassId(), accID))}</span><br>
                                            </div>
                                        </td>  
                                    </tr>
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
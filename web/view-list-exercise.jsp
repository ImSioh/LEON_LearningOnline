<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file= "/template/header.jsp" %>

<c:set var="code" value="${classObject.getCode()}"/>
<c:set var="role" value="${account.getRole() == 1 ? 'teacher' : 'student'}"/>
<c:set var="role" value="${account.getRole() == 1 ? 'teacher' : 'student'}"/>
<c:set var="baseURL" value="${role}/class/exercise"/>

<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">

    <%@include file="/template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container" style="margin-left: 250px;">
        <div class="card col-md-9 mt-4 row" style="height: fit-content;">
            <div style="display: flex; margin-top: 30px; margin-bottom: 0px;">
                <!--CREATE-->
                <div style="margin-left: 20px;">
                    <c:if test="${account.getRole() == 1}">
                        <a href="<c:url value="/teacher/class/exercise/create?code=${code}"/>"
                           class="btn btn-primary text-light" style="width: max-content">
                            <i class="fa-solid fa-plus"></i>
                            Create exercise
                        </a>
                    </c:if>
                </div>
                <!--SEARCH--> 
                <div style="display: flex; position: relative; right: 20px; left: 50%;">
                    <div class="form-outline col-md-10"  style="width: 200px;">
                        <input type="hidden" name="code" value="${code}">
                        <input type="text" class="form-control" id="myInput" name="search" value="${search}"
                               onkeyup="searchTable()">
                        <label class="form-label" for="datatable-search-input">Search</label>
                    </div>
                    <button type="submit" class="btn btn-info col-md-2" style="width: 50px">
                        <i class="fas fa-search text-light"></i>
                    </button>
                </div>
            </div>

            <div class="card-body m-3" >
                <table id="myTable" class="table align-middle mb-0 bg-white" style="padding: -10px;">
                    <thead class="bg-light">               
                        <tr>
                            <th>
                                <a onclick="sortTable(0)" class="fas fa-sort fa-sm m-2" 
                                   style="cursor: pointer; text-decoration: none"></a>   
                                Title 
                            </th>
                            <th>Duration</th>
                            <th><a onclick="sortTable(2)" class="fas fa-sort fa-sm m-2" 
                                   style="cursor: pointer;text-decoration: none"></a>
                                Start Time</th>
                            <th><a onclick="sortTable(3)" class="fas fa-sort fa-sm m-2" 
                                   style="cursor: pointer;text-decoration: none"></a>  
                                Finish Time  
                            </th>
                            <c:if test="${account.getRole() == 2}">
                                <th><a onclick="sortTable(4)" class="fas fa-sort fa-sm m-2" 
                                       style="cursor: pointer;text-decoration: none"></a>
                                    Submit Time</th>
                                <th><a onclick="sortTable(5)" class="fas fa-sort fa-sm m-2" 
                                       style="cursor: pointer;text-decoration: none"></a>
                                    Score</th>
                                </c:if>
                            <th style="text-align: center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listExercise}" var="listEX">
                            <c:if test="${listEX.getCreateTime() != null}">
                                <c:set var="testid" value="${listEX.getTestId()}"/>
                                <tr>                          
                                    <td>
                                        <c:if test="${account.getRole() == 1}">
                                            <a href="<c:url value="/teacher/class/exercise/detail?code=${code}&testid=${testid}"/>"
                                               style="text-decoration: none">
                                            </c:if>
                                            <c:if test="${account.getRole() == 2}">
                                                <a href="" style="text-decoration: none">
                                                </c:if>
                                                <p class="fw-bold mb-1">
                                                    <c:set value="${listEX.getTitle()}" var="title"/>
                                                    <c:if test="${title.length() > 25}">
                                                        ${title.substring(0, 25)}...
                                                    </c:if>
                                                    <c:if test="${title.length() <= 25}">
                                                        ${title}
                                                    </c:if>
                                                </p>
                                            </a>
                                            <p class="text-muted mb-0">
                                                <c:set value="${listEX.getDescription()}" var="description"/>
                                                <c:if test="${description.length() > 25}">
                                                    ${description.substring(0, 25)}...
                                                </c:if>
                                                <c:if test="${description.length() <= 25}">
                                                    ${description}
                                                </c:if>
                                            </p> 
                                    </td>
                                    <td>
                                        <c:set var="duration" value="${listEX.getDuration()}"/>
                                        <fmt:formatNumber value="${duration}" pattern="0"/> min</td>
                                    <td>
                                        <c:set value="${listEX.getStartAt()}" var="start"/>
                                        <c:if test="${start != null}">
                                            ${sdf.format(start)}
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:set value="${listEX.getEndAt()}" var="end"/>
                                        <c:if test="${end != null}">
                                            ${sdf.format(end)}
                                        </c:if>
                                    </td>
                                    <c:if test="${account.getRole() == 2}">
                                        <td>
                                            <c:if test="${DoTestDAO.getDoTest(aid, testid).getFinishTime() != null}">
                                                ${sdf.format(DoTestDAO.getDoTest(aid, testid).getFinishTime())}
                                            </c:if>
                                        </td>
                                    </c:if>

                                    <!--SCORE-->
                                    <c:if test="${account.getRole() == 2}">
                                        <td>
                                            <!--end = null-->
                                            <c:if test="${end == null}">
                                                <!--submit = null--><!--N/A-->
                                                <c:if test="${DoTestDAO.getDoTest(aid, testid).getFinishTime() == null}">
                                                    N/A
                                                </c:if>
                                                <!--submit != null--><!--score-->
                                                <c:if test="${DoTestDAO.getDoTest(aid, testid).getFinishTime() != null}">
                                                    ${DoTestDAO.getDoTest(aid, testid).getScore()}
                                                </c:if>
                                            </c:if>

                                            <!--end != null-->
                                            <c:if test="${end != null}">
                                                <!--now < end--><!--N/A-->
                                                <c:if test="${now <= end}">
                                                    N/A
                                                </c:if>
                                                <!--now > end-->
                                                <c:if test="${now > end}">
                                                    <!--submit = null--><!--N/A-->
                                                    <c:if test="${DoTestDAO.getDoTest(aid, testid).getFinishTime() == null}">
                                                        N/A
                                                    </c:if>
                                                    <!--submit != null--><!--score-->
                                                    <c:if test="${DoTestDAO.getDoTest(aid, testid).getFinishTime() != null}">
                                                        ${DoTestDAO.getDoTest(aid, testid).getScore()}
                                                    </c:if>
                                                </c:if>
                                            </c:if>
                                        </td>
                                    </c:if>

                                    <!--ACTION-->
                                    <c:set value="${(now.time - start.time)/60000}" var="elapse"/>

                                    <!--FINISH TIME # NULL-->
                                    <c:if test="${end != null}">
                                        <!--NOT START-->
                                        <c:if test="${now < start}">
                                            <!--TEACHER: VIEW, EXIT, DELETE EXERCISE-->
                                            <c:if test="${account.getRole() == 1}">
                                                <td style="text-align: center">
                                                    <div class="justify-content-center gap-1">
                                                        <a href="<c:url value="/teacher/exercise/view-detail-test?Tid=${testid}&Sid=${account.getAccountId()}"/>" 
                                                           class="btn btn-link btn-sm btn-rounded bg-primary text-light"
                                                           style="text-decoration: none">
                                                            Detail
                                                        </a>
                                                        <a href="<c:url value="/${baseURL}/edit?code=${code}&testid=${testid}"/>" 
                                                           class="btn btn-link btn-sm btn-rounded bg-secondary text-light"
                                                           style="text-decoration: none">
                                                            Edit
                                                        </a>
                                                        <a onclick="return confirm('Do you want to delete this exercise?')" eq true 
                                                           ? href="<c:url value="/${baseURL}/delete?code=${code}&testid=${testid}"/>"
                                                           :href="" 
                                                           class="btn btn-link btn-sm btn-rounded bg-danger text-light"
                                                           style="text-decoration: none">
                                                            Delete
                                                        </a>
                                                    </div>
                                                </td>     
                                            </c:if>

                                            <!--STUDENT: NOTHING-->
                                            <c:if test="${account.getRole() == 2}">
                                                <td></td>
                                            </c:if>
                                        </c:if>

                                        <!--DOING-->
                                        <c:if test="${start <= now && now <= end}">
                                            <!--TEACHER: VIEW EXERCISE-->
                                            <c:if test="${account.getRole() == 1}">
                                                <td style="text-align: center">
                                                    <div class="justify-content-center gap-1">
                                                        <a href="<c:url value="/teacher/exercise/view-detail-test?Tid=${testid}&Sid=${account.getAccountId()}"/>" 
                                                           class="btn btn-link btn-sm btn-rounded bg-primary text-light"
                                                           style="text-decoration: none">
                                                            Detail
                                                        </a>
                                                    </div>
                                                </td>     
                                            </c:if>

                                            <!--STUDENT: DO EXERCISE-->
                                            <c:if test="${account.getRole() == 2}">
                                                <!--Exercise-->
                                                <td>
                                                    <c:if test="${DoTestDAO.getDoTest(aid, testid).getFinishTime() == null}">
                                                        <div class="justify-content-center">
                                                            <a onclick="return startExercise(${duration})" 
                                                               href="<c:url value="/student/class/exercise/do?code=${code}&testid=${testid}"/>"
                                                               class="btn btn-link btn-sm btn-rounded bg-primary text-light"
                                                               style="text-decoration: none">
                                                                Start
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                </td>
                                            </c:if>
                                        </c:if>

                                        <!--DONE--> 
                                        <c:if test="${end < now}">
                                            <!--TEACHER: VIEW, DELETE EXERCISE, VIEW RESULT-->
                                            <c:if test="${account.getRole() == 1}">
                                                <td style="text-align: center">
                                                    <div class="justify-content-center gap-1">
                                                        <a href="<c:url value="/teacher/exercise/view-detail-test?Tid=${testid}&Sid=${account.getAccountId()}"/>" 
                                                           class="btn btn-link btn-sm btn-rounded bg-primary text-light"
                                                           style="text-decoration: none">
                                                            Detail
                                                        </a>
                                                        <a href="<c:url value="/teacher/class/exercise/detail?code=${code}&testid=${testid}"/>" 
                                                           class="btn btn-link btn-sm btn-rounded bg-success text-light"
                                                           style="text-decoration: none">
                                                            Result
                                                        </a>
                                                        <a onclick="return confirm('Do you want to delete this exercise?')" eq true 
                                                           ? href="<c:url value="/${baseURL}/delete?code=${code}&testid=${testid}"/>"
                                                           :href="" 
                                                           class="btn btn-link btn-sm btn-rounded bg-danger text-light"
                                                           style="text-decoration: none">
                                                            Delete
                                                        </a>
                                                    </div>
                                                </td>     
                                            </c:if>

                                            <!--STUDENT: RESULT-->
                                            <c:if test="${account.getRole() == 2}">
                                                <!--Exercise-->
                                                <td>
                                                    <c:if test="${listEX.isAllowReview()}">
                                                        <div class="justify-content-center">
                                                            <a href="<c:url value="/student/exercise/view-detail-test?Tid=${testid}&Sid=${account.getAccountId()}"/>"
                                                               class="btn btn-link btn-sm btn-rounded bg-success text-light"
                                                               style="text-decoration: none">
                                                                Result
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                </td>
                                            </c:if>
                                        </c:if>
                                    </c:if>
                                    <!--end: end time != null-->

                                    <!--FINISH TIME = NULL-->
                                    <c:if test="${end == null}">
                                        <!--end = null-->
                                        <!--teacher-->
                                        <c:if test="${account.getRole() == 1}">
                                            <!--not start-->
                                            <c:if test="${now < start}">
                                                <td style="text-align: center">
                                                    <div class="justify-content-center gap-1">
                                                        <a href="<c:url value="/teacher/exercise/view-detail-test?Tid=${testid}&Sid=${account.getAccountId()}"/>" 
                                                           class="btn btn-link btn-sm btn-rounded bg-primary text-light"
                                                           style="text-decoration: none">
                                                            Detail
                                                        </a>
                                                        <a href="<c:url value="/${baseURL}/edit?code=${code}&testid=${testid}"/>" 
                                                           class="btn btn-link btn-sm btn-rounded bg-secondary text-light"
                                                           style="text-decoration: none">
                                                            Edit
                                                        </a>
                                                        <a onclick="return confirm('Do you want to delete this exercise?')" eq true 
                                                           ? href="<c:url value="/${baseURL}/delete?code=${code}&testid=${testid}"/>"
                                                           :href="" 
                                                           class="btn btn-link btn-sm btn-rounded bg-danger text-light"
                                                           style="text-decoration: none">
                                                            Delete
                                                        </a>
                                                    </div>
                                                </td>    
                                            </c:if>

                                            <!--started-->
                                            <c:if test="${now >= start}">
                                                <!--doing-->
                                                <!--elapse <= duration--><!--view-->
                                                <c:if test="${elapse <= duration}">
                                                    <td style="text-align: center">
                                                        <div class="justify-content-center gap-1">
                                                            <a href="<c:url value="/teacher/exercise/view-detail-test?Tid=${testid}&Sid=${account.getAccountId()}"/>" 
                                                               class="btn btn-link btn-sm btn-rounded bg-primary text-light"
                                                               style="text-decoration: none">
                                                                Detail
                                                            </a>
                                                        </div>
                                                    </td>     
                                                </c:if>
                                                <!--done-->
                                                <!--elapse > duration--><!--view & delete & result-->
                                                <c:if test="${elapse > duration}">
                                                    <td style="text-align: center">
                                                        <div class="justify-content-center gap-1">
                                                            <a href="<c:url value="/teacher/exercise/view-detail-test?Tid=${testid}&Sid=${account.getAccountId()}"/>" 
                                                               class="btn btn-link btn-sm btn-rounded bg-primary text-light"
                                                               style="text-decoration: none">
                                                                Detail
                                                            </a>
                                                            <a href="<c:url value="/teacher/class/exercise/detail?code=${code}&testid=${testid}"/>" 
                                                               class="btn btn-link btn-sm btn-rounded bg-success text-light"
                                                               style="text-decoration: none">
                                                                Result
                                                            </a>
                                                            <a onclick="return confirm('Do you want to delete this exercise?')" eq true 
                                                               ? href="<c:url value="/${baseURL}/delete?code=${code}&testid=${testid}"/>"
                                                               :href="" 
                                                               class="btn btn-link btn-sm btn-rounded bg-danger text-light"
                                                               style="text-decoration: none">
                                                                Delete
                                                            </a>
                                                        </div>
                                                    </td>     
                                                </c:if>
                                            </c:if>
                                        </c:if>

                                        <!--end: teacher-->

                                        <!--student-->
                                        <c:if test="${account.getRole() == 2}">
                                            <c:if test="${now < start}">
                                                <td></td>
                                            </c:if>
                                            <c:if test="${now >= start}">
                                                <!--doing-->
                                                <!--submit = null--><!--start-->
                                                <c:if test="${DoTestDAO.getDoTest(aid, testid).getFinishTime() == null}">
                                                    <td>
                                                        <div class="justify-content-center">
                                                            <a onclick="return startExercise(${duration})" 
                                                               href="<c:url value="/student/class/exercise/do?code=${code}&testid=${testid}"/>"
                                                               class="btn btn-link btn-sm btn-rounded bg-primary text-light"
                                                               style="text-decoration: none">
                                                                Start
                                                            </a>
                                                        </div>
                                                    </td>
                                                </c:if>
                                                <!--done-->
                                                <!--submit != null-->
                                                <c:if test="${DoTestDAO.getDoTest(aid, testid).getFinishTime() != null}">
                                                    <td>
                                                        <!--review = true--><!--result-->
                                                        <c:if test="${listEX.isAllowReview()}">
                                                            <div class="justify-content-center">
                                                                <a href="<c:url value="/student/exercise/view-detail-test?Tid=${testid}&Sid=${account.getAccountId()}"/>"
                                                                   class="btn btn-link btn-sm btn-rounded bg-success text-light"
                                                                   style="text-decoration: none">
                                                                    Result
                                                                </a>
                                                            </div>
                                                        </c:if>
                                                        <!--review = false--><!--nothing-->
                                                    </td>
                                                </c:if>
                                            </c:if>
                                        </c:if>
                                        <!--end: role-->
                                    </c:if>
                                    <!--end: end time = null-->
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<c:import url="/template/footer.jsp"/>

<script>
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("myTable");
        switching = true;
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchcount++;
            } else {
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }

    function searchTable() {
        var input, filter, table, tr, td, i, j, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            for (j = 0; j < tr[i].cells.length; j++) {
                td = tr[i].getElementsByTagName("td")[j];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                        break;
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    }

    function startExercise(duration) {
        msg = 'The test has a time limit of ' + duration + ' min.\n\
You must submit your exercise before time runs out..\n\
Are you sure you want to get started now?'
        if (confirm(msg)) {
            return true;
        } else {
            return false;
        }
    }
</script>

<%@include file="../template/header.jsp" %>

<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">
    <%@include file="../template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container" style="margin-left: 250px;">
        <div class="card col-md-9 mt-4 row" style="height: fit-content;" >
            <!--<div class="card-header">Create Post</div>-->
            <div class=" d-flex mt-4 gap-1 justify-content-end row input-group"  style=""> 
                <form action="member-list" method="post" class="row col-md-7 d-flex row">
                    <input type="hidden" name="code" value="${classObject.getCode()}" style="border-radius: 6px;">
                    <div class="form-outline col-md-10">
                        <input type="text" class="form-control" onkeyup="searchTable()" id="myInput">
                        <label  class="form-label" for="datatable-search-input">Search</label>
                    </div>                   
                </form>
            </div>
            <ul style="margin-left:40px " class="nav nav-pills mb-3" id="pills-tab2" role="tablist">
                <li class="nav-item" role="presentation">
                    <button
                        class="nav-link active"
                        id="pills-home-tab2"
                        data-mdb-toggle="pill"
                        data-mdb-target="#pills-home2"
                        type="button"
                        role="tab"
                        aria-controls="pills-home"
                        aria-selected="true"
                        >
                        All
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button
                        class="nav-link"
                        id="pills-profile-tab2"
                        data-mdb-toggle="pill"
                        data-mdb-target="#pills-profile2"
                        type="button"
                        role="tab"
                        aria-controls="pills-profile"
                        aria-selected="false"
                        >
                        Done
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button
                        class="nav-link"
                        id="pills-contact-tab2"
                        data-mdb-toggle="pill"
                        data-mdb-target="#pills-contact2"
                        type="button"
                        role="tab"
                        aria-controls="pills-contact"
                        aria-selected="false"
                        >
                        Not Started
                    </button>
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent2">
                <div
                    class="tab-pane fade show active"
                    id="pills-home2"
                    role="tabpanel"
                    aria-labelledby="pills-home-tab2"
                    >
                    <div class="card-body m-3">
                        <table id="myTable" class="table align-middle mb-0 bg-white" style="padding: -10px;">
                            <thead class="bg-light">               
                                <tr>
                                    <th>
                                        <a onclick="sortTable(0)" class="fas fa-sort fa-sm m-2" style="cursor: pointer; text-decoration: none"></a>   
                                        Name 
                                    </th>
                                    <th><a onclick="sortTable(1)" class="fas fa-sort fa-sm m-2" style="cursor: pointer;text-decoration: none"></a>Score</th>
                                    <th><a onclick="onclick = sortTable(2)" style="cursor: pointer;text-decoration: none" class="fas fa-sort fa-sm m-2"></a>Time</th>
                                    <th>Submit Time</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${listStudent}" var="listS" >
                                    <tr>                          
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div style="width: 45px; height: 45px; overflow: hidden;" class="rounded-circle" >
                                                    <div id="profile-img" style="
                                                         width: 100%;
                                                         height: 0;
                                                         padding-bottom: 100%;
                                                         background-image: url(<c:url value="${listS.getProfilePicture() ==null ? '/assets/img/ava.png' : listS.getProfilePicture()}"/>);
                                                         background-position: center;
                                                         background-repeat: no-repeat;
                                                         background-size: cover;
                                                         ">;
                                                    </div>
                                                </div>
                                                <div class="ms-3" style="cursor: pointer;">
                                                    <p class="fw-bold mb-1">${listS.getName()}</p>
                                                    <p class="text-muted mb-0">${listS.getEmail()}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fw-normal mb-1">${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getScore()}</p>
                                        </td>
                                        <c:set value="${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getStartTime()}" var="start" ></c:set>
                                        <c:set value="${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getFinishTime()}" var="finish" ></c:set>
                                <fmt:formatDate value="${start}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate" />
                                <fmt:formatDate value="${finish}" pattern="yyyy-MM-dd HH:mm:ss" var="finishDate" />
                                <c:set var="diffInMillis" value="${finish.time - start.time}" />
                                <c:if test="${diffInMillis/60000 !=0.0}">
                                    <td>
                                        ${diffInMillis/60000}
                                    </td>
                                </c:if> 
                                <td>
                                    ${start}
                                </td>
                                <td>
                                    <c:if test="${DoTestDAO.getDoTestById(listS.getAccountId(),testId).getFinishTime()!=null}">
                                        <a  style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-info text-light">
                                            Reset
                                        </a>
                                        <a  style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-info text-light">
                                            View
                                        </a>
                                    </c:if>
                                </td> 
                                </tr>
                            </c:forEach>   

                            </tbody>
                        </table>
                    </div>
                </div>

                <div
                    class="tab-pane fade"
                    id="pills-profile2"
                    role="tabpanel"
                    aria-labelledby="pills-profile-tab2"
                    >

                    <div class="card-body m-3">
                        <table id="myTable" class="table align-middle mb-0 bg-white" style="padding: -10px;">
                            <thead class="bg-light">               
                                <tr>
                                    <th>
                                        <a onclick="sortTable(0)" class="fas fa-sort fa-sm m-2" style="cursor: pointer; text-decoration: none"></a>   
                                        Name 
                                    </th>
                                    <th><a onclick="sortTable(1)" class="fas fa-sort fa-sm m-2" style="cursor: pointer;text-decoration: none"></a>Score</th>
                                    <th><a onclick="onclick = sortTable(2)" style="cursor: pointer;text-decoration: none" class="fas fa-sort fa-sm m-2"></a>Time</th>
                                    <th>Submit Time</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${listStudent}" var="listS" >
                                    <c:if test="${DoTestDAO.getDoTestById(listS.getAccountId(),testId).getFinishTime()!=null}">
                                        <tr>                          
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div style="width: 45px; height: 45px; overflow: hidden;" class="rounded-circle" >
                                                        <div id="profile-img" style="
                                                             width: 100%;
                                                             height: 0;
                                                             padding-bottom: 100%;
                                                             background-image: url(<c:url value="${listS.getProfilePicture() ==null ? '/assets/img/ava.png' : listS.getProfilePicture()}"/>);
                                                             background-position: center;
                                                             background-repeat: no-repeat;
                                                             background-size: cover;
                                                             ">;
                                                        </div>
                                                    </div>
                                                    <div class="ms-3" style="cursor: pointer;">
                                                        <p class="fw-bold mb-1">${listS.getName()}</p>
                                                        <p class="text-muted mb-0">${listS.getEmail()}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1">${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getScore()}</p>
                                            </td>
                                            <c:set value="${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getStartTime()}" var="start" ></c:set>
                                            <c:set value="${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getFinishTime()}" var="finish" ></c:set>
                                    <fmt:formatDate value="${start}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate" />
                                    <fmt:formatDate value="${finish}" pattern="yyyy-MM-dd HH:mm:ss" var="finishDate" />
                                    <c:set var="diffInMillis" value="${finish.time - start.time}" />
                                    <c:if test="${diffInMillis/60000 !=0.0}">
                                        <td>
                                            ${diffInMillis/60000}
                                        </td>
                                    </c:if> 
                                    <td>
                                        ${start}
                                    </td>
                                    <td>
                                        <c:if test="${DoTestDAO.getDoTestById(listS.getAccountId(),testId).getFinishTime()!=null}">
                                            <a  style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-info text-light">
                                                Reset
                                            </a>
                                            <a  style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-info text-light">
                                                View
                                            </a>
                                        </c:if>
                                    </td> 
                                    </tr>
                                </c:if>
                            </c:forEach>   

                            </tbody>
                        </table>
                    </div>

                </div>

                <div
                    class="tab-pane fade"
                    id="pills-contact2"
                    role="tabpanel"
                    aria-labelledby="pills-contact-tab2"
                    >
                     <div class="card-body m-3">
                        <table id="myTable" class="table align-middle mb-0 bg-white" style="padding: -10px;">
                            <thead class="bg-light">               
                                <tr>
                                    <th>
                                        <a onclick="sortTable(0)" class="fas fa-sort fa-sm m-2" style="cursor: pointer; text-decoration: none"></a>   
                                        Name 
                                    </th>
                                    <th><a onclick="sortTable(1)" class="fas fa-sort fa-sm m-2" style="cursor: pointer;text-decoration: none"></a>Score</th>
                                    <th><a onclick="onclick = sortTable(2)" style="cursor: pointer;text-decoration: none" class="fas fa-sort fa-sm m-2"></a>Time</th>
                                    <th>Submit Time</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${listStudent}" var="listS" >
                                    <c:if test="${DoTestDAO.getDoTestById(listS.getAccountId(),testId).getFinishTime()==null}">
                                        <tr>                          
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div style="width: 45px; height: 45px; overflow: hidden;" class="rounded-circle" >
                                                        <div id="profile-img" style="
                                                             width: 100%;
                                                             height: 0;
                                                             padding-bottom: 100%;
                                                             background-image: url(<c:url value="${listS.getProfilePicture() ==null ? '/assets/img/ava.png' : listS.getProfilePicture()}"/>);
                                                             background-position: center;
                                                             background-repeat: no-repeat;
                                                             background-size: cover;
                                                             ">;
                                                        </div>
                                                    </div>
                                                    <div class="ms-3" style="cursor: pointer;">
                                                        <p class="fw-bold mb-1">${listS.getName()}</p>
                                                        <p class="text-muted mb-0">${listS.getEmail()}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="fw-normal mb-1">${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getScore()}</p>
                                            </td>
                                            <c:set value="${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getStartTime()}" var="start" ></c:set>
                                            <c:set value="${DoTestDAO.getDoTestById(listS.getAccountId() , testId).getFinishTime()}" var="finish" ></c:set>
                                    <fmt:formatDate value="${start}" pattern="yyyy-MM-dd HH:mm:ss" var="startDate" />
                                    <fmt:formatDate value="${finish}" pattern="yyyy-MM-dd HH:mm:ss" var="finishDate" />
                                    <c:set var="diffInMillis" value="${finish.time - start.time}" />
                                    <c:if test="${diffInMillis/60000 !=0.0}">
                                        <td>
                                            ${diffInMillis/60000}
                                        </td>
                                    </c:if> 
                                    <td>
                                        ${start}
                                    </td>
                                    <td>
                                        <c:if test="${DoTestDAO.getDoTestById(listS.getAccountId(),testId).getFinishTime()!=null}">
                                            <a  style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-info text-light">
                                                Reset
                                            </a>
                                            <a  style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-info text-light">
                                                View
                                            </a>
                                        </c:if>
                                    </td> 
                                    </tr>
                                </c:if>
                            </c:forEach>   

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--</div>-->
<c:import url="../template/footer.jsp" />
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

</script>



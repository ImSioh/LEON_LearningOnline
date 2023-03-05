<%@include file= "/template/header.jsp" %>

<c:set var="code" value="${classObject.getCode()}"/>
<c:set var="classid" value="${classObject.getClassId()}"/>
<c:set var="role" value="${account.getRole() == 1 ? 'teacher' : 'student'}"/>
<c:set var="baseURL" value="${role}/class/exercise"/>

<c:set var="count" value="0"/> <!--number of null createTime of list exercise-->
<c:forEach items="${listExercise}" var="listEX">
    <c:if test="${listEX.getCreateTime() == null}">
        <c:set var="count" value="${count + 1}"/>
    </c:if>
</c:forEach>

<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">

    <%@include file="/template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container" style="margin-left: 250px;">


        <div class="card col-md-9 mt-4 row" style="height: fit-content;">

            <div style="display: flex; margin-top: 30px; margin-bottom: 0px;">
                <!--EXPORT-->
                <div style="margin-left: 20px;">
                    <c:if test="${account.getRole() == 1}">
                        <a href="<c:url value="/teacher/class/export?code=${code}"/>"
                           class="btn btn-primary text-light" style="width: max-content">
                            <i class="fa-solid fa-download"></i>
                            Export Score
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

            <div class="card-body m-3 wrapper" style="display: flex; width: 95%; height: 65vh;">
                <table id="myTable" class="table align-middle mb-0 bg-white">
                    <thead class="bg-light">
                        <tr>
                            <th class="sticky-col first-col">
                                <a onclick="sortTable(0)" class="fas fa-sort fa-sm m-2" 
                                   style="cursor: pointer; text-decoration: none"></a>  
                                Student</th>
                            <th class="sticky-col second-col"><a onclick="sortTable(1)" class="fas fa-sort fa-sm m-2" 
                                                                 style="cursor: pointer; text-decoration: none"></a>
                                Average</th>
                                <c:forEach items="${listExercise}" var="listEX" varStatus="i">
                                    <c:if test="${listEX.getCreateTime() != null}">
                                    <th>
                                        <a onclick="sortTable(${i.count - count + 1})" class="fas fa-sort fa-sm m-2" 
                                           style="cursor: pointer; text-decoration: none"></a>
                                        <c:set value="${listEX.getTitle()}" var="title"/>
                                        <c:if test="${title.length() > 15}">
                                            ${title.substring(0, 15)}...
                                        </c:if>
                                        <c:if test="${title.length() <= 15}">
                                            ${title}
                                        </c:if>
                                    </th>
                                </c:if>
                            </c:forEach>
                        </tr>
                    </thead> 
                    <tbody>
                        <c:forEach items="${listStudent}" var="listS">
                            <tr>
                                <td class="sticky-col first-col">
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
                                        </div>
                                    </div>
                                </td>
                                <td class="sticky-col second-col" style="text-align: center">
                                    <c:set var="avg" value="${DoTestDAO.getScoreTest(classid, listS.getAccountId())}"/>
                                    <c:if test="${avg != null}">
                                        <fmt:formatNumber value="${avg}" pattern="0.0"/>
                                    </c:if>
                                    <c:if test="${avg == null}">
                                        N/A
                                    </c:if>
                                </td>
                                <c:forEach items="${listExercise}" var="listEX">
                                    <c:if test="${listEX.getCreateTime() != null}">
                                        <c:set var="testid" value="${listEX.getTestId()}"/>
                                        <td style="text-align: center">
                                            <c:set var="score" value="${DoTestDAO.getDoTestById(listS.getAccountId() , testid).getScore()}"/>
                                            <c:if test="${score != null}">
                                                <fmt:formatNumber value="${score}" pattern="0.0"/>
                                            </c:if>
                                            <c:if test="${score == null}">
                                                N/A
                                            </c:if>
                                        </td>
                                    </c:if>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<c:import url="/template/footer.jsp"/>

<style>
    .wrapper {
        position: relative;
        overflow: auto;
        white-space: nowrap;
    }

    .sticky-col {
        position: -webkit-sticky;
        position: sticky;
        background-color: #f8f9fa !important;
    }

    .first-col {
        min-width: 200px;
        left: 0px;
        background-color: #f8f9fa !important;
    }

    .second-col {
        left: 200px;
        background-color: #f8f9fa !important;
    }
</style>

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
<%@include file= "/template/header.jsp" %>

<c:set var="code" value="${classObject.getCode()}"></c:set>

    <div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">

    <%@include file="/template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container" style="margin-left: 250px;">
        <div class="card col-md-9 mt-4 row" style="height: fit-content;">
            <div class="" style="display: flex; margin-top: 30px; margin-bottom: 0px;">
                <!--CREATE-->
                <div style="width: 200px; margin-left: 20px;">
                    <c:if test="${account.getRole() == 1}">
                        <a href="<c:url value="/teacher/class/exercise/create?code=${code}"/>"
                           class="btn btn-primary text-light">
                            <i class="fa-solid fa-plus"></i>
                            Create exercise
                        </a>
                    </c:if>
                </div>
                <!--SEARCH--> 
                <div style="display: flex; margin-left: 21em; margin-right: 0">
                    <div class="form-outline" style="width: 300px;">
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
                            <th><a onclick="sortTable(4)" class="fas fa-sort fa-sm m-2" 
                                   style="cursor: pointer;text-decoration: none"></a>
                                Create Time
                            </th>
                            <c:if test="${account.getRole() == 1}">
                                <th>Action</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listExercise}" var="listEX" >
                            <c:set var="testid" value="${listEX.getTestId()}"/>
                                <tr>                          
                                    <td>
                                        <a href="/teacher/exercise?code=${code}&testid=${testid}">
                                        <p class="fw-bold mb-1">${listEX.getTitle()}</p>
                                    </a>
                                    <p class="text-muted mb-0">${listEX.getDescription()}</p> 
                                </td>
                                <td>${listEX.getDuration()} minute(s)</td>
                                <td>${listEX.getStartAt()}</td>
                                <td>${listEX.getEndAt()}</td>
                                <td>${listEX.getCreateTime()}</td>
                                <c:if test="${account.getRole() == 1}">
                                    <td>
                                        <div class="d-flex justify-content-center gap-1">
                                            <a href="<c:url value="/teacher/class/exercise/edit?code=${code}&testid=${testid}"/>" 
                                               class="btn btn-link btn-sm btn-rounded bg-success text-light"
                                               style="text-decoration: none">
                                                Edit
                                            </a>
                                            <a onclick="return confirm('Do you want to delete this exercise?')" eq true 
                                               ? href="<c:url value="/teacher/class/exercise/delete?code=${code}&testid=${testid}"/>"
                                               :href="" 
                                               class="btn btn-link btn-sm btn-rounded bg-danger text-light"
                                               style="text-decoration: none">
                                                Delete
                                            </a>
                                        </div>
                                    </td>     
                                </c:if>
                            </tr>
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
</script>

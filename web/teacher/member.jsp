<%@include file="../template/header.jsp" %>

<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">
    <%@include file="../template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container" style="margin-left: 250px;">
        <div class="card col-md-9 mt-4 row" style="height: fit-content;" >
            <!--<div class="card-header">Create Post</div>-->
            <div class="d-flex mt-4 gap-1 justify-content-end"  style=""> 
                <div class="form-outline col-md-5 ">
                    <input id="myInput" onkeyup="searchTable()" type="search" class="form-control" id="datatable-search-input">
                    <label  class="form-label" for="datatable-search-input">Search</label>
                </div>
                <div id="datatable">
                </div>
                <button type="button" class="btn btn-primary">
                    <i class="fas fa-print"></i>
                </button>
            </div>
            <div class="card-body m-3" >
                <table id="myTable" class="table align-middle mb-0 bg-white" style="padding: -10px;">
                    <thead class="bg-light">               
                        <tr>
                            <th>
                                <a onclick="sortTable(0)" class="fas fa-sort fa-sm m-2" style="cursor: pointer; text-decoration: none"></a>   
                                Name 
                            </th>
                            <th>School</th>
                            <c:if test="${account.getRole() ==1}"><th>Phone Number</th></c:if>
                            <c:if test="${account.getRole() ==1}"> <th><a onclick="sortTable(4)" class="fas fa-sort fa-sm" style="cursor: pointer;text-decoration: none"></a>  
                                    Exercise  </th></c:if>
                            <c:if test="${account.getRole() ==1}"> <th>Actions</th></c:if>
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
                                            <c:if test="${account.getRole() ==1}"><p class="text-muted mb-0">${listS.getEmail()}</p></c:if> 
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="fw-normal mb-1">${listS.getSchool()}</p>
                                </td>
                                <c:if test="${account.getRole() ==1}"> <td>
                                        <span class="">${listS.getPhoneNumber()}</span>
                                    </td></c:if>
                                <c:if test="${account.getRole() ==1}">  <td>10/12</td></c:if>
                                <c:if test="${account.getRole() ==1}"> <td>
                                        <a onclick="return confirm('Do you want to remove this student?')" eq true ? href="<c:url value="/teacher/class/remove-student?code=${param.code}&accountId=${listS.getAccountId()}" />" : href="" style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-danger text-light">
                                            Remove
                                        </a>
                                    </td>    </c:if>          
                                </tr>
                        </c:forEach>
                    </tbody>
                </table>
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



<%@include file="../template/header.jsp" %>

<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">
    <%@include file="../template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container" style="margin-left: 250px;">
        <div class="card col-md-9 mt-4 row" style="height: fit-content;" >
            <!--<div class="card-header">Create Post</div>-->
             <div class="d-flex mt-4 gap-1 justify-content-end"  style=""> 
                <div class="form-outline col-md-5 ">
                    <input type="search" class="form-control" id="datatable-search-input">
                    <label class="form-label" for="datatable-search-input">Search</label>
                </div>
                <div id="datatable">
                </div>
                <button type="button" class="btn btn-primary">
                    <i class="fas fa-search"></i>
                </button>
            </div>
            <div class="card-body m-3" >
                <table class="table align-middle mb-0 bg-white" style="padding: -10px;">
                    <thead class="bg-light">

                        <tr>
                            <th>
                                 <a onclick="sortTable(0)" class="fas fa-sort fa-sm m-2" style="cursor: pointer; text-decoration: none"></a>   
                                Name
                            </th>
                            <th>School</th>
                            <th>Phone Number</th>                         
                            <th class="text-center">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listRequest}" var="listS" >
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
                                        <div class="ms-3">
                                            <p class="fw-bold mb-1">${listS.getName()}</p>
                                            <p class="text-muted mb-0">${listS.getEmail()}</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="fw-normal mb-1">${listS.getSchool()}</p>
                                </td>
                                <td>
                                    <span class="">${listS.getPhoneNumber()}</span>
                                </td>

                                <td class="">
                                    <div class="d-flex justify-content-center gap-2">
                                        <a  onclick="return confirm('Do you want accept student?')" eq true ? href="<c:url value="/teacher/class/accept-student?code=${param.code}&accountId=${listS.getAccountId()}" />":href="" style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-success text-light">
                                            Accept <i class="fas fa-check"></i>
                                        </a>
                                        <a onclick="return confirm('Do you want reject student?')" eq true ? href="<c:url value="/teacher/class/reject-student?code=${param.code}&accountId=${listS.getAccountId()}" />":href="" style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-danger text-light">
                                            Reject <i class="fas fa-times"></i>
                                        </a>
                                    </div>
                                </td>              
                            </tr>
                        <input type="hidden" value="${listS.getAccountId()}" name="accountId">
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
    function confirmFunction() {
        alert("Accept student successfully"");
    }

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
</script>
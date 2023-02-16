<%@include file="../template/header.jsp" %>

<div class="content main-container d-flex" style="background-color: rgba(209, 209, 209, 0.5);  margin-top: 56px;">
    <%@include file="../template/sidebar.jsp" %>

    <div class="content-main d-flex justify-content-center container" style="margin-left: 250px;">
        <div class="card col-md-9 mt-4 row" style="height: fit-content;" >
            <!--<div class="card-header">Create Post</div>-->
            <div class=""  style="margin-left: 31%;"> 
                <div class="form-outline mt-4 col-md-8 ">
                    <input type="search" class="form-control" id="datatable-search-input">
                    <label class="form-label" for="datatable-search-input">Search</label>
                </div>
                <div id="datatable">
                </div>
            </div>
            <div class="card-body m-3" >
                <table class="table align-middle mb-0 bg-white" style="padding: -10px;">
                    <thead class="bg-light">               
                        <tr>
                            <th> 
                                <i class="fas fa-sort fa-sm m-2" style="cursor: pointer;"></i> 
                                Name 
                            </th>
                            <th>School</th>
                            <th>Phone Number</th>
                            <th><i class="fas fa-sort fa-sm"></i>Exercise</th>
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
                                <td>10/12</td>
                                <td>
                                    <a onclick="return confirm('Do you want to remove this student?')" eq true ? href="<c:url value="/teacher/class/remove-student?code=${param.code}&accountId=${listS.getAccountId()}" />" : href="" style="text-decoration: none" type="button" class="btn btn-link btn-sm btn-rounded bg-danger text-light">
                                        Remove
                                    </a>
                                </td>              
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
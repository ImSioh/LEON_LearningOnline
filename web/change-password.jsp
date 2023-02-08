<%@include file= "/template/header.jsp" %>
<div class="content" style="margin-top: 50px;">
    <section style="background-color: rgba(209, 209, 209, 0.5);" >
        <div class="container py-5">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0">
                            <c:choose>
                                <c:when test="${account.getRole() == 1 }">
                                    <li class="breadcrumb-item"><a href="<c:url value="/teacher/class"/>" style="text-decoration: none;">Home</a></li>
                                    <li class="breadcrumb-item"><a href="<c:url value="/teacher/profile"/>" style="text-decoration: none;">Profile</a></li>
                                    </c:when>    
                                    <c:otherwise>
                                    <li class="breadcrumb-item"><a href="<c:url value="/student/overview"/>" style="text-decoration: none;">Home</a></li>
                                    <li class="breadcrumb-item"><a href="<c:url value="/student/profile"/>" style="text-decoration: none;">Profile</a></li>
                                    </c:otherwise>
                                </c:choose>
                            <li class="breadcrumb-item active" aria-current="page">Change Password</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row d-flex flex-column align-items-center">

                <div class="col-lg-9">
                    <div class="card mb-4 ">
                        <div class="card-body ">
                            <div class=" p-3 py-5 justify-content-center">

                                <form action="#" method="post">
                                    <div class="">
                                        <h4 class="text-left">Change Password</h4>
                                    </div>
                                    <div class="row mt-3 col-6">
                                        <input type="hidden" id="txtUUID" name="txtUUID" value="${account.getAccountId()}">
                                        <div class="input-group mb-3 " x-data="{ showPassword: false }">
                                            <input x-bind:type="showPassword ? 'text' : 'password'" class="form-control" placeholder="Old password" aria-label="Old password" aria-describedby="basic-addon2" name="txtOldPass" value="${txtOldPass}">
                                            <span class="input-group-text" x-on:click="showPassword = ! showPassword" id="basic-addon2"><i
                                                    class="fa"
                                                    x-bind:class="[showPassword ? 'fa-eye' : 'fa-eye-slash']"
                                                    aria-hidden="true"></i></span>


                                        </div>
                                        <p id="name-error" class="error" for="name">${requestScope["txtOldPass-error"]}</p>
                                        <div class="input-group mb-3" x-data="{ showPassword: false }">
                                            <input x-bind:type="showPassword ? 'text' : 'password'" class="form-control" placeholder="New password" aria-label="New password" aria-describedby="basic-addon2" name="txtNewPass" value="${txtNewPass}">
                                            <span class="input-group-text" x-on:click="showPassword = ! showPassword" id="basic-addon2"><i
                                                    class="fa"
                                                    x-bind:class="[showPassword ? 'fa-eye' : 'fa-eye-slash']"
                                                    aria-hidden="true"></i></span><br>
                                        </div>
                                        <p id="name-error" class="error" for="name">${requestScope["txtNewPass-error"]}</p>

                                        <div class="input-group mb-3" x-data="{ showPassword: false }">
                                            <input x-bind:type="showPassword ? 'text' : 'password'" class="form-control" placeholder="Re-enter New password" aria-label="Re-enter New password" aria-describedby="basic-addon2" name="txtReNewPass" value="${txtReNewPass}">
                                            <span class="input-group-text" x-on:click="showPassword = ! showPassword" id="basic-addon2"><i
                                                    class="fa"
                                                    x-bind:class="[showPassword ? 'fa-eye' : 'fa-eye-slash']"
                                                    aria-hidden="true"></i></span>
                                            <br>
                                        </div>
                                        <p id="name-error" class="error" for="name">${requestScope["txtReNewPass-error"]}</p>
                                    </div>
                                    <c:out value="${msg}"/>
                                    <div class="mt-4 text-center col-6">
                                        <input class="btn btn-primary profile-button" type="submit" value="Change password">
                                        </input>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

</div>
<c:import url="/template/footer.jsp"/>
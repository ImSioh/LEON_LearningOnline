<%@include file= "./template/header.jsp" %>
        <div class="content">
            <section style="background-color: rgb(209, 209, 209);">
                <div class="container py-5">
                    <div class="row">
                        <div class="col">
                            <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item"><a href="HomeS.jsp">Home</a></li>
                                    <li class="breadcrumb-item"><a href="profile.jsp">User</a></li>
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
                                                
                                                <div class="input-group mb-3 " x-data="{ showPassword: false }">
                                                    <input x-bind:type="showPassword ? 'text' : 'password'" class="form-control" placeholder="Old password" aria-label="Old password" aria-describedby="basic-addon2">
                                                    <span class="input-group-text" x-on:click="showPassword = ! showPassword" id="basic-addon2"><i
                                                            class="fa"
                                                            x-bind:class="[showPassword ? 'fa-eye' : 'fa-eye-slash']"
                                                            aria-hidden="true"></i></span>
                                                </div>
                                                <div class="input-group mb-3" x-data="{ showPassword: false }">
                                                    <input x-bind:type="showPassword ? 'text' : 'password'" class="form-control" placeholder="New password" aria-label="New password" aria-describedby="basic-addon2">
                                                    <span class="input-group-text" x-on:click="showPassword = ! showPassword" id="basic-addon2"><i
                                                            class="fa"
                                                            x-bind:class="[showPassword ? 'fa-eye' : 'fa-eye-slash']"
                                                            aria-hidden="true"></i></span>
                                                </div>

                                                <div class="input-group mb-3" x-data="{ showPassword: false }">
                                                    <input x-bind:type="showPassword ? 'text' : 'password'" class="form-control" placeholder="Re-enter New password" aria-label="Re-enter New password" aria-describedby="basic-addon2">
                                                    <span class="input-group-text" x-on:click="showPassword = ! showPassword" id="basic-addon2"><i
                                                            class="fa"
                                                            x-bind:class="[showPassword ? 'fa-eye' : 'fa-eye-slash']"
                                                            aria-hidden="true"></i></span>
                                                </div>
                                            </div>

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
        <div class="footer">

        </div>
    </div>
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
    <script defer src="https://unpkg.com/alpinejs@3.x.x/dist/cdn.min.js"></script>
</body>

</html>
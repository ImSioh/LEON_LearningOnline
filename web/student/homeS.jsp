<%@include file= "../template/header.jsp" %>
<div class="content"  style="background-color: rgba(209, 209, 209, 0.5); height: 100vh;">
    <div class="row" style="margin-top: 50px; padding-left: calc(100% / 6); " >
        <div class="col-md-2" style="position: fixed; transform: translateX(-100%);">
            <div style="background-color: #f8f9fa; height: 100vh; width: 220px;" class="d-flex flex-shrink-0 p-3" >
                <hr>
                <ul class="nav nav-pills flex-column mb-auto sidebarnav" style="padding-left: 15px">
                    <li class="nav-item ">
                        <a href="<%=path%>/student/overview" class="nav-link link-dark active"  aria-current="page">
                            Incomplete
                        </a>
                    </li>
                    <li >
                        <a href="<%=path%>/student/achievement" class="nav-link link-dark">
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
                                    <th>School</th>
                                    <th>Phone Number</th>
                                    <th>Exercise</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img
                                                src="https://mdbootstrap.com/img/new/avatars/8.jpg"
                                                alt=""
                                                style="width: 45px; height: 45px"
                                                class="rounded-circle"
                                                />
                                            <div class="ms-3">
                                                <p class="fw-bold mb-1">John Doe</p>
                                                <p class="text-muted mb-0">john.doe@gmail.com</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="fw-normal mb-1">Software engineer</p>
                                        <p class="text-muted mb-0">IT department</p>
                                    </td>
                                    <td>
                                        <span class="badge badge-success rounded-pill d-inline">Active</span>
                                    </td>
                                    <td>Senior</td>
                                    <td>
                                        <button type="button" class="btn btn-link btn-sm btn-rounded">
                                            Edit
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img
                                                src="https://mdbootstrap.com/img/new/avatars/6.jpg"
                                                class="rounded-circle"
                                                alt=""
                                                style="width: 45px; height: 45px"
                                                />
                                            <div class="ms-3">
                                                <p class="fw-bold mb-1">Alex Ray</p>
                                                <p class="text-muted mb-0">alex.ray@gmail.com</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="fw-normal mb-1">Consultant</p>
                                        <p class="text-muted mb-0">Finance</p>
                                    </td>
                                    <td>
                                        <span class="badge badge-primary rounded-pill d-inline"
                                              >Onboarding</span
                                        >
                                    </td>
                                    <td>Junior</td>
                                    <td>
                                        <button
                                            type="button"
                                            class="btn btn-link btn-rounded btn-sm fw-bold"
                                            data-mdb-ripple-color="dark"
                                            >
                                            Edit
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img
                                                src="https://mdbootstrap.com/img/new/avatars/7.jpg"
                                                class="rounded-circle"
                                                alt=""
                                                style="width: 45px; height: 45px"
                                                />
                                            <div class="ms-3">
                                                <p class="fw-bold mb-1">Kate Hunington</p>
                                                <p class="text-muted mb-0">kate.hunington@gmail.com</p>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <p class="fw-normal mb-1">Designer</p>
                                        <p class="text-muted mb-0">UI/UX</p>
                                    </td>
                                    <td>
                                        <span class="badge badge-warning rounded-pill d-inline">Awaiting</span>
                                    </td>
                                    <td>Senior</td>
                                    <td>
                                        <button
                                            type="button"
                                            class="btn btn-link btn-rounded btn-sm fw-bold"
                                            data-mdb-ripple-color="dark"
                                            >
                                            Edit
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file= "../template/footer.jsp" %>
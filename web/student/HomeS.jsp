<%@include file= "../template/header.jsp" %>
<div class="content"  style="background-color: rgba(209, 209, 209, 0.5); height:  1000px;">
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
        <div class="col-md-8 row">
            <div class="col-md-2">
            </div>
            <div class="col-md-10">
                <div style="background: #f8f9fa; padding-top: 15px;">
                    <table class="table" >
                        <thead>
                            <tr>                            
                                <th scope="col">Exercise Name</th>
                                <th scope="col">Time</th>
                            </tr>
                        </thead>
                        <tbody style=" color: #6e6e6e !important">
                            <tr>                               
                            </tr>
                        </tbody>
                    </table>
                </div>  
            </div>

        </div>
    </div>
</div>
<%@include file= "../template/footer.jsp" %>
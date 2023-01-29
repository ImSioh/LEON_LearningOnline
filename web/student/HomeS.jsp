<%@include file= "./template/header.jsp" %>
<%
    request.setAttribute("AccDAO", new AccountDAO());
    request.setAttribute("AssDAO", new AssignTestDAO());
   
%>
<div class="content" >
      
    <div class="row" style="margin-top: 50px;padding-left: calc(100% / 6);">
        <div class="col-md-2" style="position: fixed;transform: translateX(-100%);">
            <div style="background-color: #f8f9fa; height: 100vh" class="d-flex flex-shrink-0 p-3" >
                <hr>
                <ul class="nav nav-pills flex-column mb-auto sidebarnav" style="padding-left: 15px">
                    <li class="nav-item ">
                        <a href="<%=path%>/overview-incomplete" class="nav-link link-dark active"  aria-current="page">
                            Incomplete
                        </a>
                    </li>
                    <li >
                        <a href="<%=path%>/overview-achievement" class="nav-link link-dark">
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
                                <c:forEach items="${accList}" var="accL">
                                    <th>${accL.getAssignTestId()};</th>
                                    <th>${accL.getCreateTime()};</th>
                                </c:forEach>
                            </tr>
                        </tbody>
                    </table>
                    <!--                    <div>
                                            <img style="width: 100%" src="assets/img/Untitled.png" alt=""/>
                                        </div>-->
                </div>  
            </div>

        </div>
    </div>
</div>                         
</div>

<script
    type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"
></script>
</body>

</html>
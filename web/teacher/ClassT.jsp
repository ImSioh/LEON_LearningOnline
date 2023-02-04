

<%@include file= "./template/header.jsp" %>




<div class="Content" style="background-color: rgb(209, 209, 209); height:  1000px; margin-top: 38px;">
    <section>
        <div class="container py-5">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0 position-relative row">
                            <div class="left col-md-6" style="margin-left: 24px;">
                                <a type="button" class="btn btn-info text-light " href="<%=path%>/teacher/class/create">Create class</a>
                            </div>
                            <div class="right position-absolute col-md-6" style="top:0; bottom: 0;right: 0;">
                                <div class="input-group rounded" style="">
                                    <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                                    <span class="input-group-text border-0" id="search-addon">
                                        <i class="fas fa-search"></i>
                                    </span>
                                </div>
                            </div>
                        </ol>
                    </nav>
                </div>
            </div>

            <div class="row">



                <c:forEach items="${classObjList}" var="co">
                    <div class="col-lg-3" style="margin-bottom: 24px;">
                        <a href="<c:url value="/teacher/class/newfeed?code=${co.getCode()}"/>" style="text-decoration: none;">
                            <div class="card">
                                <div style="overflow: hidden; width: 100%; height: 100%;height: 188px; background-size: cover;
                                     background-position: center;
                                     background-image: url(<c:url value="${co.getClassPicture() == null ? '/assets/img/Common_picture.png' : co.getClassPicture()}"/>)"> 
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">${co.getName()}</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>

            </div>
        </div>
    </section>

</div>
</div>
<script
    type="text/javascript"
    src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"
></script>
</body>
</html>



<%@include file= "./template/header.jsp" %>

<div class="Content" style="background-color: rgb(209, 209, 209); height:  1000px; margin-top: 38px;">
    <section>
        <div class="container py-5">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0 position-relative row">
                            <div class="left col-md-6" style="margin-left: 24px;">
                                <button type="button" class="btn btn-info text-light "><a href="<%=path%>/teacher/class/create" style="text-decoration: none; color: white ">+ Create class</a></button>
                            </div>
                            <div class="right position-absolute col-md-6" style="top:0; bottom: 0;right: 0;">
                                <div class="input-group rounded" style="">
                                    <form action="<%=path%>/teacher/search" method="post">
                                        <input type="search" class="form-control rounded" name="searchName" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
                                    </form>
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
                <c:if test="${verified}">
                    <c:forEach items="${classObjList}" var="co">
                        <div class="col-lg-3" style="margin-bottom: 24px;">
                            <a href="<c:url value="/teacher/class/newfeed?code=${co.getCode()}"/>" style="text-decoration: none;">
                                <div class="card">
                                    <div style="overflow: hidden; width: 100%; height: 100%;height: 188px; background-size: cover;
                                         background-position: center;
                                         background-image: url(<c:url value="${co.getClassPicture() == null ? '/assets/img/Common_picture.png' : co.getClassPicture()}"/>)"> 
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title" style="padding: 4px 8px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${co.getName()}</h5>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${!verified}">
                    <div style=" width: 100%; width: 250px;height: 100%;height: 200px; background-size: cover;
                         margin: auto; background-image: url(<c:url value="/student/assets/img/10.png"/>)">
                    </div>
                    <div class="card-body" >
                        <h5 class="card-title" style="text-align: center;font-weight: 100;">Not found class - Search again</h5>
                    </div>

                </c:if>
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

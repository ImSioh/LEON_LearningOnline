
<%@include file= "./template/header.jsp" %>
<div class="Content">
    <div class="row" style="margin-top: 50px">
        <div class="p-2 col" style="margin: 10px 0px 10px 10px;">        
            <input style="border-radius: 34px !important; height: 56px" type="search" class="form-control rounded .col-md-4" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />    
        </div>

        <div class="col-md-auto">
            <button type="button" style="border-radius: 34px; padding: 15px; margin: 15px;" class="btn btn-outline-secondary btn-rounded" data-mdb-ripple-color="dark"><a href="<%=path%>/student/join" style="text-decoration: none; color: grey;">+ Enter code</a></button>
        </div>
    </div>
</div>

    <div class="content-main">
        <c:forEach items="${co}" var="co">
        <div class="class-content">
            <a href="<c:url value="/student/overview"/>">            
                <div style="overflow: hidden; width: 100%; height: 100%;height: 100px; background-size: cover;
                     background-position: center;
                     background-image: url(<c:url value="${co.getClassPicture() == null ? '/assets/img/Common_picture.png' : co.getClassPicture()}"/>)">
                </div>                  
                <div style="text-decoration: none">
                    ${co.getName()}<br>
                </div>
            </a> 
        </div>  
</c:forEach>
    </div>

<%@include file= "./template/footer.jsp" %>

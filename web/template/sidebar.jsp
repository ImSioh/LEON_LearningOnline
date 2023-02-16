<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="role" value="${account.role == 1 ? 'teacher' : 'student'}" scope="request"/>
<div class="sidebar position-fixed" id="side-nav">
    <div class="header-box px-2 pt-3 align-items-center justify-content-center" >
        <div style="width: 150px; height: 150px; overflow: hidden; margin: 0 auto;" class="rounded-circle mt-3 position-relative" >
            <div id="profile-img" style="
                 width: 100%;
                 height: 0;
                 padding-bottom: 100%;
                 background-image: url(<c:url value="${classObject.getClassPicture() ==null ? '/assets/img/ava.png' : classObject.getClassPicture()}"/>);
                 background-position: center;
                 background-repeat: no-repeat;
                 background-size: cover;
                 ">;
            </div>

        </div>
        <p class="text-center fw-bold fs-4" style="margin:8px auto;">${classObject.name}</p>
        <p class="text-center mb-1">Class Code: ${classObject.code} </p>
        <p class="text-center mb-1">Teacher: ${teacher.name}</p>
    </div>
    <hr class="h-color mx-2">
    <ul class="list-unstyled px-2 d-flex flex-grow-1 flex-column">
        <li class="${activeNF}"><a href="<c:url value="/${role}/class/newfeed?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block ml-3"> New Feed</a> </li> 
        <li class="${activeMB}"><a href="<c:url value="/${role}/class/member-list?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block ml-3">Members</a> </li>      
        <li class=""><a href="#" class="text-decoration-none px-3 py-2 d-block"> Assignment</a> </li> 
        <li class=""><a href="#" class="text-decoration-none px-3 py-2 d-block">  Rank</a> </li> 
        <li class="${activeRQ}"><a href="<c:url value="/${role}/class/member-request-list?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block">request</a> </li> 

        <hr class="h-color mx-2">
        <c:if test="${account.getRole() == 1}">
            <li class="${activeST}"><a href="<c:url value="/${role}/class/setting?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block"> Setting </a> </li>
            </c:if>
            <c:if test="${account.getRole() == 2}">
            <li class="btn btn-danger d-flex justify-content-center" style="margin-top: auto;"><a href="<c:url value="/${role}/class/leave?code=${param.code}&accountId=${account.getAccountId()}"/>" id="leaveStudent" class="text-decoration-none px-3 py-2 d-block text-light"> Leave class <i class="fas fa-sign-out-alt"></i></a> </li>
            </c:if>

    </ul>
</div>
<script>
    document.getElementById("leaveStudent").addEventListener("click", e => {
        if (!confirm("Are you sure about this choice ?")) {
            e.preventDefault();
        }
    })
</script>
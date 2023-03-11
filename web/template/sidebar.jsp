<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="role" value="${account.role == 1 ? 'teacher' : 'student'}" scope="request"/>
<div class="sidebar position-fixed" id="side-nav">
    <div class="header-box px-2 pt-3 align-items-center justify-content-center" >
        <div style="width: 150px; height: 150px; overflow: hidden; margin: 0 auto;" class="rounded-circle mt-3 position-relative" >
            <div id="profile-img" style="
                 width: 100%;
                 height: 0;
                 padding-bottom: 100%;
                 background-image: url(<c:url value="${classObject.getClassPicture() ==null ? '/assets/img/Common_picture.png' : classObject.getClassPicture()}"/>);
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

        <c:choose>
            <c:when test="${account.getRole() == 1 }">
                <li class="${activeNF}"><a href="<c:url value="/teacher/class/newfeed?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block ml-3"> New Feed</a> </li> 
                <li class="${activeEX}"><a href="<c:url value="/teacher/class/exercise?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block ml-3">Exercise</a> </li>
                <li class="${activeTS}"><a href="<c:url value="/teacher/class/transcript?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block">  Transcript</a> </li> 
                <li class="${activeMB}"><a href="<c:url value="/teacher/class/member-list?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block ml-3">Members</a> </li>      
                <li class="${activeRQ}"><a href="<c:url value="/teacher/class/member-request-list?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block">request</a> </li> 
                <hr class="h-color mx-2">
                <li class="${activeST}"><a href="<c:url value="/teacher/class/setting?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block"> Setting </a> </li>
                </c:when>    
                <c:otherwise>
                <li class="${activeNF}"><a href="<c:url value="/student/class/newfeed?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block ml-3"> New Feed</a> </li> 
                <li class="${activeEX}"><a href="<c:url value="/student/class/exercise?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block ml-3">Exercise</a> </li>
                <li class="${activeTS}"><a href="<c:url value="/student/class/transcript?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block">  Transcript</a> </li> 
                <li class="${activeMB}"><a href="<c:url value="/student/class/member-list?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block ml-3">Members</a> </li>      
                <hr class="h-color mx-2">
                <li class="btn btn-danger d-flex justify-content-center" style="margin-top: auto;">
                    <a href="<c:url value="/student/class/leave?code=${param.code}&accountId=${account.getAccountId()}"/>" id="leaveStudent" class="text-decoration-none px-3 py-2 d-block text-light"> Leave class <i class="fas fa-sign-out-alt"></i></a> 
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<script>
    document.getElementById("leaveStudent").addEventListener("click", e => {
        if (!confirm("Do you want leave this class now?")) {
            e.preventDefault();
        }
    })
</script>
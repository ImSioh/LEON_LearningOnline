<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="sidebar position-fixed" id="side-nav">
    <div class="header-box px-2 pt-3 align-items-center justify-content-center" >
        <div style="display: flex; justify-content: center;" >
            <img src="https://www.shareicon.net/data/128x128/2016/09/15/829459_man_512x512.png" alt="" class=""/>
        </div>
        <p class="text-center" style="margin:8px auto;">CodegangZ</p>
        <p class="text-center">Class Code: HFUJK</p>
         <p class="text-center">Teacher: Dung Dung Dung Dung Dung</p>

    </div>
    <hr class="h-color mx-2">
    <ul class="list-unstyled px-2">
        <li class="active"><a href="#" class="text-decoration-none px-3 py-2 d-block ml-3"> New Feed</a> </li> 
        <li class=""><a href="<c:url value="/teacher/class/member-list?code=${param.code}"/>" class="text-decoration-none px-3 py-2 d-block active">Members</a> </li>      
        <li class=""><a href="#" class="text-decoration-none px-3 py-2 d-block"> Assignment</a> </li> 
        <li class=""><a href="#" class="text-decoration-none px-3 py-2 d-block">  Rank</a> </li> 
        <li class=""><a href="#" class="text-decoration-none px-3 py-2 d-block">request</a> </li> 

        <hr class="h-color mx-2">
        <li class=""><a href="#" class="text-decoration-none px-3 py-2 d-block"> Setting</a> </li>
    </ul>
</div>
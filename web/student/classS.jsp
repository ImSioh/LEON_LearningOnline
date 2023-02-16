
<%@include file= "../template/header.jsp" %>
<div style="margin-top: 70px !important; padding-left: 92px !important">
    <ul class="nav nav-tabs mb-3" id="ex-with-icons" role="tablist">
        <li class="nav-item" role="presentation">
            <a class="nav-link active" id="ex-with-icons-tab-1" data-mdb-toggle="tab" href="#ex-with-icons-tabs-1" role="tab"
               aria-controls="ex-with-icons-tabs-1" aria-selected="true"><i class="fas fa-chart-pie fa-fw me-2"></i>Class approved</a>
        </li>
        <li class="nav-item" role="presentation">
            <a class="nav-link" id="ex-with-icons-tab-2" data-mdb-toggle="tab" href="#ex-with-icons-tabs-2" role="tab"
               aria-controls="ex-with-icons-tabs-2" aria-selected="false"><i class="fas fa-chart-line fa-fw me-2"></i>Class is being approved</a>
        </li>

    </ul>
</div>
<div class="content" style="background-color: rgba(209, 209, 209, 0.5); height:  100vh; margin-top: 1px;">
    <section>
        <div class="container py-5">
            <div class="row"  style="margin-top: -24px;">
                <div class="col">
                    <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                        <ol class="breadcrumb mb-0 position-relative row">
                            <div class="left col-md-6" style="margin-left: 24px;">
                                <a type="button" class="btn btn-info text-light " href="<%=path%>/student/join">Enter Code</a>
                            </div>
                            <div class="right position-absolute col-md-6" style="top:0; bottom: 0;right: 0;">
                                <div class="input-group rounded row" style="">

                                    <input type="search" id="searchBar" class="form-control rounded" value="${searchName}" placeholder="Search" name="searchName" aria-label="Search" aria-describedby="search-addon" />

                                </div>
                            </div>
                        </ol>
                    </nav>
                </div>
            </div>
            <div class="tab-content" id="ex-with-icons-content">
                <div class="tab-pane fade show active" isApproved="true" id="ex-with-icons-tabs-1" role="tabpanel" aria-labelledby="ex-with-icons-tab-1">
                    <div class="row">
                        <c:if test="${verified}">
                            <c:forEach items="${co}" var="co">

                                <div class="col-lg-3" style="margin-bottom: 24px;">
                                    <a href="<c:url value="/student/class/newfeed?code=${co.getCode()}"/>" style="text-decoration: none;">
                                        <div class="card" style=" border-radius: 15px; overflow: hidden;">
                                            <div style="overflow: hidden; width: 100%; height: 100%;height: 188px; background-size: cover;
                                                 background-position: center;
                                                 background-image: url(<c:url value="${co.getClassPicture() == null ? '/assets/img/Common_picture.png' : co.getClassPicture()}"/>)"> 
                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-title"  style="padding: 4px 8px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${co.getName()}</h5>
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
                            <div style="text-align: center;font-weight: 100;">Not found class - Input again</div>
                        </c:if>
                    </div>
                </div>
                <div class="tab-pane fade" id="ex-with-icons-tabs-2" role="tabpanel" aria-labelledby="ex-with-icons-tab-2">
                    <div class="row">
                        <c:if test="${verified}">
                            <c:forEach items="${classobjna}" var="co">

                                <div class="col-lg-3" style="margin-bottom: 24px;">
                                    <a href="<c:url value="/student/class/newfeed?code=${co.getCode()}"/>" style="text-decoration: none;">
                                        <div class="card" style=" border-radius: 15px; overflow: hidden;">
                                            <div style="overflow: hidden; width: 100%; height: 100%;height: 188px; background-size: cover;
                                                 background-position: center;
                                                 background-image: url(<c:url value="${co.getClassPicture() == null ? '/assets/img/Common_picture.png' : co.getClassPicture()}"/>)"> 
                                            </div>
                                            <div class="card-body">
                                                <h5 class="card-title"  style="padding: 4px 8px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${co.getName()}</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>


                            </c:forEach>
                        </c:if>
                    </div>
                </div>

            </div>

        </div>
    </section>
</div>
<script>
    function createElement(element) {
        const parent = document.createElement(element.tagName)
        mergeObject(element, parent)
        if (Array.isArray(element.children))
            element.children.forEach(child => parent.append(createElement(child)))
        return parent
    }

    function mergeObject(source, target) {
        Object.entries(source).forEach(attr => {
            if (attr[0] === 'children' || attr[0] === 'tagName')
                return
            if (Object.prototype.toString.call(attr[1]) === '[object Object]') {
                mergeObject(attr[1], target[attr[0]])
            } else if (Array.isArray(attr[1]) && typeof target[attr[0]] === 'function') {
                target[attr[0]](...attr[1])
            } else {
                target[attr[0]] = attr[1]
            }
        })
    }

    async function storeDibao() {
        var searchBarValue = searchBar.value;
        var isApproved = document.querySelector("#ex-with-icons-content > .active").getAttribute("isApproved") === "true";
        var response = await fetch("<c:url value="/student/search?isApproved="/>" + isApproved + "&keyword=" + searchBarValue);
//        var json = response.json();
        var classList = document.querySelector("#ex-with-icons-content > .active").querySelector("div.row");
        classList.textContent = "";
        var result = await response.json();

        if (result.length === 0) {
            var classElementBegin = createElement({
                tagName: "div",
                style: " width: 100%; width: 250px;height: 100%;height: 200px; background-size: cover;margin: auto; background-image: url(<c:url value="/student/assets/img/10.png"/>)"
            })

            var classElementBegin2 = createElement({
                tagName: "div",
                className: "card-body",
                children: [{
                        tagName: "h5",
                        textContent: "Not found class - Search again",
                        className: "card-title",
                        style: "text-align: center;font-weight: 100;"

                    }]
            })
            classList.append(classElementBegin);
            classList.append(classElementBegin2);
            return;
        }

        result.forEach(item => {
            var pictureURL = item.classPicture ? item.classPicture.substring(1) : "assets/img/Common_picture.png";
            var classElement = createElement({
                tagName: "div",
                className: "col-lg-3",
                style: "margin-bottom: 24px;",
                children: [{
                        tagName: "a",
                        href: "<c:url value="/"/>teacher/class/newfeed?code=" + item.code,
                        style: "text-decoration: none;",
                        children: [{
                                tagName: "div",
                                className: "card",
                                style: " border-radius: 15px; overflow: hidden;",
                                children: [
                                    {
                                        tagName: "div",
                                        style: "overflow: hidden; width: 100%; height: 100%;height: 188px; background-size: cover; background-position: center; background-image: url(<c:url value="/"/>" + pictureURL + ")",
                                    },
                                    {
                                        tagName: "div",
                                        className: "card-body",
                                        children: [{
                                                tagName: "h5",
                                                textContent: item.name,
                                                className: "card-title",
                                                style: "padding: 4px 8px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"

                                            }]
                                    }

                                ]
                            }]
                    }]
            });
            classList.append(classElement);

        })
    }


    var searchBar = document.getElementById("searchBar");
    var accountId = "${account.accountId}";
    var timer;
    searchBar.addEventListener("input", function () {
        if (timer) {
            clearTimeout(timer);
        }
        timer = setTimeout(function () {
            storeDibao();
        },
                300
                )
    })

</script>
<%@include file= "../template/footer.jsp" %>

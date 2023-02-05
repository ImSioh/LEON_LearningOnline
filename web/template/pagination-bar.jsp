<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${empty pageNumber}">
    <c:set scope="page" var="pageNumber" value="${param.page != null ? param.page : 1}"/>
</c:if>
<c:if test="${empty modelDAO}">
    <c:set scope="page" var="modelDAO" value="${requestScope[param.modelDAOName]}"/>
</c:if>
<c:set scope="page" var="pageRange" value="${modelDAO.getPageRange(pageNumber)}"/>

<c:set scope="page" var="optionSearch" value="${optionSearch}"/>
<c:set scope="page" var="searchFor" value="${searchFor}"/>
<c:set scope="page" var="keyword" value="${keyword}"/>
<c:set scope="page" var="criteria" value="${criteria}"/>
<c:set scope="page" var="orderBy" value="${orderBy}"/>

<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-end">
        <c:if test="${modelDAO.totalPage > 1}">
            <li class="page-item">
                <c:if test="${pageNumber != 1}">
                    <a class="page-link" href="
                       <c:url value="${param.basePath}">
                           <c:param name="optionSearch" value="${optionSearch}"/>
                           <c:param name="searchFor" value="${searchFor}"/>
                           <c:param name="keyword" value="${keyword}"/>
                           <c:param name="criteria" value="${criteria}"/>
                           <c:param name="orderBy" value="${orderBy}"/>
                           <c:param name="page" value="${pageNumber - 1}"/>
                           <c:param name="element" value="${element}"/>
                       </c:url>
                       ">
                        Previous
                    </a>
                </c:if>
            </li>
            
            <li class="page-item">
                <c:if test="${pageRange[0] != 1}">
                    <span>...</span>
                </c:if>
            </li>
            
            <c:forEach begin="${pageRange[0]}" end="${pageRange[1]}" var="page">
                <li class="page-item <c:if test="${pageNumber == page}"> active</c:if>
                           <c:if test="${pageNumber == page}"></c:if>
                       "> 
                    <a class="page-link" href="
                       <c:url value="${param.basePath}">
                           <c:param name="optionSearch" value="${optionSearch}"/>
                           <c:param name="searchFor" value="${searchFor}"/>
                           <c:param name="keyword" value="${keyword}"/>
                           <c:param name="criteria" value="${criteria}"/>
                           <c:param name="orderBy" value="${orderBy}"/>
                           <c:param name="page" value="${page}"/>
                           <c:param name="element" value="${element}"/>
                       </c:url>
                       "> 
                        ${page}
                    </a>
                </li>
            </c:forEach>
                
            <li class="page-item">
                <c:if test="${pageRange[1] != modelDAO.totalPage}">
                    <span>...</span>
                </c:if>
            </li>
            
            <li class="page-item">
                <c:if test="${pageNumber != modelDAO.totalPage}">
                    <a class="page-link" href="
                       <c:url value="${param.basePath}">
                           <c:param name="optionSearch" value="${optionSearch}"/>
                           <c:param name="searchFor" value="${searchFor}"/>
                           <c:param name="keyword" value="${keyword}"/>
                           <c:param name="criteria" value="${criteria}"/>
                           <c:param name="orderBy" value="${orderBy}"/>
                           <c:param name="page" value="${pageNumber + 1}"/>
                           <c:param name="element" value="${element}"/>
                       </c:url>
                       ">
                        Next
                    </a>
                </c:if>
            </li>
        </c:if>
        <!--        <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>-->
    </ul>
</nav>

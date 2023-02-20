<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set scope="page" var="page" value="${param.page}"/>
<c:set scope="page" var="numberOfPage" value="${param.numberOfPage}"/>
<%--<c:set scope="page" var="pageRange" value="${modelDAO.getPageRange(page)}"/>--%>

<c:url value="${basePath}" var="paging_url">
    <c:param name="search" value="${search}"/>
    <c:param name="keyword" value="${keyword}"/> 
</c:url>

<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-end">
        <c:if test="${numberOfPage > 1 && page > 0
                      && numberOfPage >= page}">
            <c:if test="${page != 1}">
                <li class="page-item">
                    <button name="page" value="${page-1}" class="page-link">Previous</button>
                </li>
            </c:if>

            <!--            <li class="page-item">
            <c:if test="${pageRange[0] != 1}">
                <span>...</span>
            </c:if>
        </li>-->

            <c:forEach begin="1" end="${numberOfPage}" var="i">
                <li class="page-item <c:if test="${page == i}"> active</c:if>
                    <c:if test="${page == i}"></c:if>
                        "> 
                        <button name="page" value="${i}" class="page-link">${i}</button>
                </li>
            </c:forEach>

            <!--            <li class="page-item">
            <c:if test="${pageRange[1] != modelDAO.totalPage}">
                <span>...</span>
            </c:if>
        </li>-->

            <c:if test="${page != numberOfPage}">
                <li class="page-item">
                    <button name="page" value="${page+1}" class="page-link">Next</button>
                </li>
            </c:if>
        </c:if>
    </ul>
</nav>
</form>
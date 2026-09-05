<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Danh sách sản phẩm</title>

<div class="container py-4">
    <h2 class="mb-3">Tất cả sản phẩm</h2>
    <p class="text-muted mb-4">Tổng số: ${totalCount} sản phẩm</p>

    <div class="row row-cols-2 row-cols-md-4 g-3">
        <c:forEach items="${listProduct}" var="p">
            <div class="col">
                <div class="card h-100 shadow-sm">
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.productid}" class="text-decoration-none">
                        <c:choose>
                            <c:when test="${p.image.substring(0,5) == 'https'}">
                                <img src="${p.image}" class="card-img-top" alt="${p.productname}" style="height:180px; object-fit:cover;">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/image?fname=${p.image}" class="card-img-top" alt="${p.productname}" style="height:180px; object-fit:cover;">
                            </c:otherwise>
                        </c:choose>
                        <div class="card-body">
                            <h6 class="card-title text-truncate">${p.productname}</h6>
                            <p class="card-text text-primary fw-bold">${p.price} VNĐ</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${totalPages > 1}">
        <nav class="mt-4">
            <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 1}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=1">&laquo; Đầu</a></li>
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${currentPage - 1}">&lsaquo;</a></li>
                </c:if>

                <c:forEach begin="1" end="${totalPages}" var="i">
                    <c:choose>
                        <c:when test="${i == currentPage}">
                            <li class="page-item active"><span class="page-link">${i}</span></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:if test="${currentPage < totalPages}">
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${currentPage + 1}">&rsaquo;</a></li>
                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product?page=${totalPages}">Cuối &raquo;</a></li>
                </c:if>
            </ul>
        </nav>
    </c:if>
</div>

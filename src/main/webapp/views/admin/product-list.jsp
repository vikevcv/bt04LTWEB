<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Quản lý sản phẩm</title>

<div class="container py-4">
    <h2 class="mb-3">Quản lý sản phẩm</h2>

    <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-primary mb-3">+ Thêm sản phẩm mới</a>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <table class="table table-hover mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>STT</th>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Danh mục</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listProduct}" var="p" varStatus="STT">
                        <tr>
                            <td>${STT.index + 1}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.image.substring(0,5) == 'https'}">
                                        <img src="${p.image}" alt="anh" height="40"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/image?fname=${p.image}" alt="anh" height="40"/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${p.productname}</td>
                            <td>${p.price} VNĐ</td>
                            <td>${p.category.categoryname}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/product/edit?id=${p.productid}"
                                   class="btn btn-sm btn-outline-info">Sửa</a>
                                <a href="${pageContext.request.contextPath}/admin/product/delete?id=${p.productid}"
                                   class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

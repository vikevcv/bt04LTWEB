<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Quản lý sản phẩm</title>

<div class="content">
    <h2>Quản lý sản phẩm</h2>

    <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-primary"
       style="display:inline-block; width:auto; padding:10px 24px; margin-bottom:20px; text-decoration:none; text-align:center;">
        + Thêm sản phẩm mới
    </a>

    <div class="table-wrapper">
        <table>
            <thead>
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
                                    <img src="${p.image}" alt="anh"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="${pageContext.request.contextPath}/image?fname=${p.image}" alt="anh"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${p.productname}</td>
                        <td>${p.price} VNĐ</td>
                        <td>${p.category.categoryname}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/product/edit?id=${p.productid}"
                               class="action-btn edit">Sửa</a>
                            <a href="${pageContext.request.contextPath}/admin/product/delete?id=${p.productid}"
                               class="action-btn delete"
                               onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Danh sách Category</title>

<div class="container py-4">
    <h2 class="mb-3">Danh sách danh mục</h2>

    <a href="<c:url value='/admin/category/add'/>" class="btn btn-primary mb-3">+ Thêm Category mới</a>

    <div class="card shadow-sm">
        <div class="card-body p-0">
            <table class="table table-hover mb-0">
                <thead class="table-dark">
                    <tr>
                        <th>STT</th>
                        <th>Hình ảnh</th>
                        <th>Tên Category</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listcate}" var="cate" varStatus="STT">
                        <tr>
                            <td>${STT.index + 1}</td>

                            <c:if test="${cate.images.substring(0,5) == 'https'}">
                                <c:url value="${cate.images}" var="imgUrl"></c:url>
                            </c:if>
                            <c:if test="${cate.images.substring(0,5) != 'https'}">
                                <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                            </c:if>

                            <td><img src="${imgUrl}" alt="anh" height="40"/></td>
                            <td>${cate.categoryname}</td>
                            <td>
                                <c:if test="${cate.status == 1}">
                                    <span class="badge bg-success">Hoạt động</span>
                                </c:if>
                                <c:if test="${cate.status != 1}">
                                    <span class="badge bg-danger">Khóa</span>
                                </c:if>
                            </td>
                            <td>
                                <a href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>"
                                   class="btn btn-sm btn-outline-info">Sửa</a>
                                <a href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>"
                                   class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

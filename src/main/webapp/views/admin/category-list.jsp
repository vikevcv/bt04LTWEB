<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<title>Danh sách Category</title>

<div class="content">
    <h2>Danh sách danh mục</h2>

    <a href="<c:url value='/admin/category/add'/>" class="btn btn-primary"
       style="display:inline-block; width:auto; padding:10px 24px; margin-bottom:20px; text-decoration:none; text-align:center;">
        + Thêm Category mới
    </a>

    <div class="table-wrapper">
        <table>
            <thead>
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

                        <td><img src="${imgUrl}" alt="anh"/></td>
                        <td>${cate.categoryname}</td>
                        <td>
                            <c:if test="${cate.status == 1}">
                                <span class="badge badge-active">Hoạt động</span>
                            </c:if>
                            <c:if test="${cate.status != 1}">
                                <span class="badge badge-inactive">Khóa</span>
                            </c:if>
                        </td>
                        <td>
                            <a href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>"
                               class="action-btn edit">Sửa</a>
                            <a href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>"
                               class="action-btn delete"
                               onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

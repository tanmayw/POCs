<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
	<script>
		$(function() {
			
			$("#subcategory_id").dataTable();
						
		})
	</script>
	<form id="contentList" action="input.html" method="post">
	<!-- 	<input class="btn-primary" type="submit" value="Add New" /> -->
		<h4>SubCategories</h4>
		<table id="subcategory_id">

			<thead>
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Date</th>
					<th>ImageUrl</th>
					<th>Operation</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="sublistVar" items="${subCategoryList}">
					<tr>

						<td><c:out value="${sublistVar.subcategoryId}" /></td>
						<td><c:out value="${sublistVar.subCategoryTitle}" /></td>
						<td><c:out value="${sublistVar.subCategoryDate}" /></td>
						<td><c:out value="${sublistVar.subCategoryImgUrl}" /></td>
						<td><a
							href="delete.html?type=subcategory&id=${sublistVar.subcategoryId}">Del</a>&nbsp;&nbsp;&nbsp;
							<a
							href="edit.html?type=subcategory&id=${sublistVar.subcategoryId}">Edit</a>
							</td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>
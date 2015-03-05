<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<body>
		<script>
		$(function() {
			
			$("#fromtheshows_id").dataTable();
						
		})
	</script>
	<form id="contentList" action="input.html" method="post">
		<input class="btn-primary" type="submit" value="Add New" />
		<h4>From the Shows</h4>
		<table id="fromtheshows_id">
			<thead>
				<tr>
					<th>Id</th>
					<th>SubCategoryId</th>
					<th>Title</th>
					<th>Date</th>
					<th>ImageUrl</th>
					<th>Content</th>
					<th>Operation</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach var="var" items="${fromtheShowsList}">
					<tr>

						<td><c:out value="${var.fromTheShowsId}" /></td>
						<td><c:out value="${var.subcategory.subcategoryId}" /></td>
						<td><c:out value="${var.fromTheShowsTitle}" /></td>
						<td><c:out value="${var.fromTheShowsDate}" /></td>
						<td><c:out value="${var.fromtheshowsimageurl}" /></td>
						<td><c:out value="${var.fromTheShowsContent}" /></td>
						<td><a
							href="delete.html?type=fromtheshows&id=${var.fromTheShowsId}">Del</a>&nbsp;&nbsp;&nbsp;
							<a
							href="edit.html?type=fromtheshows&id=${var.fromTheShowsId}">Edit</a>
							</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>


	</form>
</body>
</html>
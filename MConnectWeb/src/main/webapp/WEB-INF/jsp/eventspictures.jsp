<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<body>
	<script>
		$(function() {
			
			$("#eventspictures_id").dataTable();
						
		})
	</script>
	<form id="contentList" action="input.html" method="post">
		<input class="btn-primary" type="submit" value="Add New" />
		<h4>Events and Pictures</h4>
		<table id="eventspictures_id">
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
				<c:forEach var="var" items="${eventsPicturesList}">
					<tr>

						<td><c:out value="${var.eventId}" /></td>
						<td><c:out value="${var.subcategory.subcategoryId}" /></td>
						<td><c:out value="${var.eventTitle}" /></td>
						<td><c:out value="${var.eventDate}" /></td>
						<td><c:out value="${var.eventimageurl}" /></td>
						<td><c:out value="${var.eventContent}" /></td>
						<td><a
							href="delete.html?type=EventsPictures&id=${var.eventId}">Del</a>&nbsp;&nbsp;&nbsp;
							<a
							href="edit.html?type=EventsPictures&id=${var.eventId}">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</form>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<body>
	
	<script>
		$(function() {
			
			$("#medialFiles_id").dataTable({"iTotalDisplayRecords": 10});
						
		})
	</script>
	<form id="contentList" action="input.html" method="post">
		<input class="btn-primary" type="submit" value="Add New" />
		
		<h4>Media Files</h4>
		<table id="medialFiles_id">
			<thead>
				<tr>
					<th>Id</th>
					<th>SubCategoryId</th>
					<th>Type</th>
					<th>Name</th>
					<th>Desc</th>
					<th>Image</th>
					<th>Url</th>
					<th>Date</th>
					<th>UserName</th>
					<th>Operation</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="var" items="${mediaFilesList}">
					<tr>

						<td><c:out value="${var.mediaFileId}" /></td>
						<td><c:out value="${var.categoryId}" /></td>
						<td><c:out value="${var.mediaFileType}" /></td>
						<td><c:out value="${var.mediaFileName}" /></td>
						<td><c:out value="${var.mediaFileDesc}" /></td>
						<td><c:out value="${var.mediafileimage}" /></td>
						<td><c:out value="${var.mediaURL}" /></td>
						<td><c:out value="${var.mediauploadDate}" /></td>
						<td><c:out value="${var.username}" /></td>

						<td><a
							href="delete.html?type=mediafiles&id=${var.mediaFileId}">Del</a>&nbsp;&nbsp;&nbsp;
							<a
							href="edit.html?type=mediafiles&id=${var.mediaFileId}">Edit</a>

					</tr>
				</c:forEach>
			</tbody>
		</table>



	</form>
</body>
</html>
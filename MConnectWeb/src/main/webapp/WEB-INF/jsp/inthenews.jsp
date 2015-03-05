<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<body>
	
	<script>
		$(function() {
			
			$("#inthenews_id").dataTable();
						
		})
	</script>
	<form id="contentList" action="input.html" method="post">
		<input class="btn-primary" type="submit" value="Add New" />
			<h4>In The News</h4>
		<table id="inthenews_id">
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
				<c:forEach var="var" items="${inTheNewsList}">
					<tr>

						<td><c:out value="${var.inTheNewsId}" /></td>
						<td><c:out value="${var.subcategory.subcategoryId}" /></td>
						<td><c:out value="${var.inTheNewsTitle}" /></td>
						<td><c:out value="${var.inTheNewsDate}" /></td>
						<td><c:out value="${var.inthenewsimageurl}" /></td>
						<td><c:out value="${var.inTheNewsContent}" /></td>
						<td><a
							href="delete.html?type=inthenews&id=${var.inTheNewsId}">Del</a>&nbsp;&nbsp;&nbsp;
							<a
							href="edit.html?type=inthenews&id=${var.inTheNewsId}">Edit</a>
							</td>


					</tr>
				</c:forEach>
			</tbody>
		</table>


	</form>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
 
</head>
<body>
	<script>
		$(function() {
			
			$("#category_id").dataTable().makeEditable({sUpdateURL: "update.html"});

						
		})
	</script>
	<form id="contentList" action="input.html" method="post">
	<button class="btn-primary" type="submit">Add New</button>
	<h4>Categories</h4>
		<table id="category_id">
			<thead>
				<tr>
					<th>Id</th>
					<th>Name</th>
					<th>Desc</th>
					<th>ImageName</th>
					<th>Operation</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="listVar" items="${categoryList}">
					<tr>
						<td><c:out value="${listVar.categoryId}" /></td>
						<td><c:out value="${listVar.categoryName}" /></td>
						<td><c:out value="${listVar.categoryDesc}" /></td>
						<td><c:out value="${listVar.categoryimagename}" /></td>
						<td><a
							href="delete.html?type=category&id=${listVar.categoryId}">Del</a>&nbsp;&nbsp;&nbsp;
							<a
							href="edit.html?type=category&id=${listVar.categoryId}">Edit</a>
							</td>

					</tr>
				</c:forEach>
			</tbody>

		</table>
	</form>
</body>
</html>
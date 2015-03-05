<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<body>
	
	<script>
		$(function() {
			
			$("#contribution_id").dataTable();
						
		})
	</script>
	<form id="contentList" action="input.html" method="post">
		<input class="btn-primary" type="submit" value="Add New" />
		<h4>Employee Contributions</h4>
		<table id="contribution_id">
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
				<c:forEach var="var" items="${contributionList}">
					<tr>

						<td><c:out value="${var.employeeContributionId}" /></td>
						<td><c:out value="${var.subcategory.subcategoryId}" /></td>
						<td><c:out value="${var.employeeContributionTitle}" /></td>
						<td><c:out value="${var.employeeContributionDate}" /></td>
						<td><c:out value="${var.employeeContributionimageurl}" /></td>
						<td><c:out value="${var.employeeContributionContent}" /></td>
						<td><a
							href="delete.html?type=employeecontribution&id=${var.employeeContributionId}">Del</a>&nbsp;&nbsp;&nbsp;
							<a
							href="edit.html?type=employeecontribution&id=${var.employeeContributionId}">Edit</a>
							</td>

					</tr>
				</c:forEach>
			</tbody>

		</table>

	</form>
</body>
</html>
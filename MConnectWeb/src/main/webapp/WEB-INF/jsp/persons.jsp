<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<body>
	
	<script>
		$(function() {
			
			$("#personList_id").dataTable();
						
		})
	</script>
	<form id="contentList" action="input.html" method="post">
		<input class="btn-primary" type="submit" value="Add New" />
		<h4>Leadership List</h4>
		<table id="personList_id">
			<thead>
				<tr>
					<th>Id</th>
					<th>FName</th>
					<th>LName</th>
					<th>ImageLoc</th>
					<th>Designation</th>
					<th>username</th>
					<th>HobbyDesc</th>
					<th>Priority</th>
					<th>Operation</th>
				</tr>
			</thead>
			<tbody>
					<c:forEach var="var" items="${personsList}">
					<tr>

						<td><c:out value="${var.personId}" /></td>
						<td><c:out value="${var.firstName}" /></td>
						<td><c:out value="${var.lastName}" /></td>
						<td><c:out value="${var.imgLoc}" /></td>
						<td><c:out value="${var.designation}" /></td>
						<td><c:out value="${var.username}" /></td>
						<td><c:out value="${var.hobbydesc}" /></td>
						<td><c:out value="${var.priority}"/></td>
						<td><a href="delete.html?type=person&id=${var.personId}">Del</a>&nbsp;&nbsp;&nbsp;
							<a
							href="edit.html?type=person&id=${var.personId}">Edit</a>
							</td>


					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>
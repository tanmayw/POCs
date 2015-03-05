<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">




</head>
<!-- <table id="example" class="display" >



</table>

 -->
<body>
	<script type="text/javascript" charset="utf8"
		src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
	<script>
		$(function() {
			
			$("#category_id").dataTable();
			$("#subcategory_id").dataTable();
			$("#contribution_id").dataTable();
			$("#eventspictures_id").dataTable();
			$("#fromtheshows_id").dataTable();
			$("#inthenews_id").dataTable();
			$("#medialFiles_id").dataTable({"iTotalDisplayRecords": 10});
			$("#personList_id").dataTable();
			
		})
	</script>
	<h2>List of contents</h2>




	<form id="contentList" action="input.html" method="post">
	<button class="btn-primary" type="submit" value="Add New">Add New</button>
	
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

		</table><br><br>
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
		</table><br><br>
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

		</table><br><br>

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
		</table><br><br>



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
		</table><br><br>


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
		</table><br><br>




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
		</table><br><br>



		<h4>Person List</h4>
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
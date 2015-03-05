<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<html>
<script type="text/javascript">
	$(document).ready(function() {
		var vars = [], hash;
		var q = document.URL.split('?')[1];
		if (q != undefined) {
			q = q.split('&');
			for ( var i = 0; i < q.length; i++) {
				hash = q[i].split('=');
				vars.push(hash[1]);
				vars[hash[0]] = hash[1];
			}
		}

		if (vars['type'] === "category") {
			$("#category_form").show();
			$("#subcategory_form").hide();
			$("#empcontribution_form").hide();
			$("#tabeventspicture_form").hide();
			$("#tabfromtheshow_form").hide();
			 $("#tabmediafile_form").hide();
			 $("#tabperson_form").hide();
			  $("#tabinthenew_form").hide();

		} else if (vars['type'] === "subcategory") {
			$("#subcategory_form").show();
			$("#category_form").hide();
			$("#empcontribution_form").hide();
			$("#tabeventspicture_form").hide();
			$("#tabfromtheshow_form").hide();
			 $("#tabmediafile_form").hide();
			 $("#tabperson_form").hide();
			  $("#tabinthenew_form").hide();

		} else if (vars['type'] === "employeecontribution") {
			$("#empcontribution_form").show();
			$("#category_form").hide();
			$("#subcategory_form").hide();
			$("#tabeventspicture_form").hide();
			$("#tabfromtheshow_form").hide();
			 $("#tabmediafile_form").hide();
			 $("#tabperson_form").hide();
			  $("#tabinthenew_form").hide();
			 
		} else if (vars['type'] === "EventsPictures") {
			$("#tabeventspicture_form").show();
			$("#category_form").hide();
			$("#subcategory_form").hide();
			$("#empcontribution_form").hide();
			$("#tabfromtheshow_form").hide();
			 $("#tabmediafile_form").hide();
			 $("#tabperson_form").hide();
			  $("#tabinthenew_form").hide();

		} else if (vars['type'] === "fromtheshows") {
			$("#tabfromtheshow_form").show();
			$("#category_form").hide();
			$("#subcategory_form").hide();
			$("#empcontribution_form").hide();
			$("#tabeventspicture_form").hide();
			 $("#tabmediafile_form").hide();
			 $("#tabperson_form").hide();
			  $("#tabinthenew_form").hide();

		}
		 else if (vars['type'] === "inthenews") {
				 $("tabinthenew_form").show();
				$("#tabfromtheshow_form").hide();
				$("#category_form").hide();
				$("#subcategory_form").hide();
				$("#empcontribution_form").hide();
				$("#tabeventspicture_form").hide();
				 $("#tabmediafile_form").hide();
				 $("#tabperson_form").hide();

			}
		 else if (vars['type'] === "mediafiles") {
			    $("#tabmediafile_form").show();
			    $("#tabinthenew_form").hide();
				$("#tabfromtheshow").hide();
				$("#category_form").hide();
				$("#subcategory_form").hide();
				$("#empcontribution_form").hide();
				$("#tabeventspicture_form").hide();
				 $("#tabperson_form").hide();
				}
		 else if (vars['type'] === "person") 
			 {
			    $("#tabperson_form").show();
			    $("#tabmediafile_form").hide();
			    $("#tabinthenew_form").hide();
				$("#tabfromtheshow_form").hide();
				$("#category_form").hide();
				$("#subcategory_form").hide();
				$("#empcontribution_form").hide();
				$("#tabeventspicture_form").hide();
			 }
	});
</script>
<h3>Update Details</h3>
<div id="category">
	<f:form method="post" action="updateCategoryDetails.html"
		modelAttribute="category" id="category_form">
		<table>
			<tr style="display: none;">
				<td><f:label path="categoryId">CategoryId</f:label></td>
				<td><f:input path="categoryId" /></td>
			</tr>
			<tr>
				<td><f:label path="categoryName" />Name :-</td>
				<td><f:input path="categoryName" /></td>
			</tr>
			<tr>
				<td><f:label path="categoryDesc" />Desc :-</td>
				<td><f:input path="categoryDesc" /></td>
			</tr>
			<tr>
				<td><f:label path="categoryimagename" />ImageName:-</td>
				<td><f:input path="categoryimagename" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</f:form>
</div>

<div id="subcategory">
	<f:form method="post" action="updateSubCategoryDetails.html"
		modelAttribute="subcategory" id="subcategory_form">
		<table>
			<tr style="display: none;">
				<td><f:label path="subcategoryId">SubCategoryId</f:label></td>
				<td><f:input path="subcategoryId" /></td>
			</tr>
			<tr>
				<td><f:label path="subCategoryTitle" />Title :-</td>
				<td><f:input path="subCategoryTitle" /></td>
			</tr>
			<tr>
				<td><f:label path="subCategoryImgUrl" />ImageUrl :-</td>
				<td><f:input path="subCategoryImgUrl" /></td>
			</tr>
			<%-- <tr>
			<td><f:label path="subCategoryDate" />Date:-</td>
			<td><f:input path="subCategoryDate" /></td>
		</tr> --%>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</f:form>
</div>


<div id="employeeContribution">
	<f:form method="post" action="updateEmpContributionDetails.html"
		modelAttribute="employeeContribution" id="empcontribution_form">
		<table>
			<tr style="display: none;">
				<td><f:label path="employeeContributionId">EmployeeContribution ID</f:label></td>
				<td><f:input path="employeeContributionId" /></td>
			</tr>
			<tr>
				<td><f:label path="subcategory.subcategoryId">SubCategory ID</f:label></td>
				<td><f:input path="subcategory.subcategoryId" /></td>
			</tr>
			<tr>
				<td><f:label path="employeeContributionTitle" />Title :-</td>
				<td><f:input path="employeeContributionTitle" /></td>
			</tr>
			<tr>
				<td><f:label path="employeeContributionimageurl" />ImageUrl :-</td>
				<td><f:input path="employeeContributionimageurl" /></td>
			</tr>
			<%-- <tr>
			<td><f:label path="subCategoryDate" />Date:-</td>
			<td><f:input path="subCategoryDate" /></td>
		</tr> --%>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</f:form>
</div>
<div id="tabeventspicture">
	<f:form method="post" action="updateTabeventspicture.html"
		modelAttribute="tabeventspicture" id="tabeventspicture_form">
		<table>
			<tr style="display: none;">
				<td><f:label path="eventId">Event ID</f:label></td>
				<td><f:input path="eventId" /></td>
			</tr>
			<tr>
				<td><f:label path="subcategory.subcategoryId">SubCategory ID</f:label></td>
				<td><f:input path="subcategory.subcategoryId" /></td>
			</tr>
			<tr>
				<td><f:label path="eventTitle" />Title :-</td>
				<td><f:input path="eventTitle" /></td>
			</tr>
			<tr>
				<td><f:label path="eventimageurl" />ImageUrl :-</td>
				<td><f:input path="eventimageurl" /></td>
			</tr>
			<%-- <tr>
			<td><f:label path="subCategoryDate" />Date:-</td>
			<td><f:input path="subCategoryDate" /></td>
		</tr> --%>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</f:form>
</div>
<div id="tabfromtheshow">
	<f:form method="post" action="updateTabfromtheshows.html"
		modelAttribute="tabfromtheshow" id="tabfromtheshow_form">
		<table>
			<tr style="display: none;">
				<td><f:label path="fromTheShowsId">ID</f:label></td>
				<td><f:input path="fromTheShowsId" /></td>
			</tr>
			<tr>
				<td><f:label path="subcategory.subcategoryId">SubCategory ID</f:label></td>
				<td><f:input path="subcategory.subcategoryId" /></td>
			</tr>
			<tr>
				<td><f:label path="fromTheShowsTitle" />Title :-</td>
				<td><f:input path="fromTheShowsTitle" /></td>
			</tr>
			<tr>
				<td><f:label path="fromtheshowsimageurl" />ImageUrl :-</td>
				<td><f:input path="fromtheshowsimageurl" /></td>
			</tr>
			<%-- <tr>
			<td><f:label path="subCategoryDate" />Date:-</td>
			<td><f:input path="subCategoryDate" /></td>
		</tr> --%>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</f:form>
</div>
<div id="tabinthenew">
	<f:form method="post" action="updateTabinthenew.html"
		modelAttribute="tabinthenew" id="tabinthenew_form">
		<table>
			<tr style="display: none;">
				<td><f:label path="inTheNewsId">ID</f:label></td>
				<td><f:input path="inTheNewsId" /></td>
			</tr>
			<tr>
				<td><f:label path="subcategory.subcategoryId">SubCategory ID</f:label></td>
				<td><f:input path="subcategory.subcategoryId" /></td>
			</tr>
			<tr>
				<td><f:label path="inTheNewsTitle" />Title :-</td>
				<td><f:input path="inTheNewsTitle" /></td>
			</tr>
			<tr>
				<td><f:label path="inthenewsimageurl" />ImageUrl :-</td>
				<td><f:input path="inthenewsimageurl" /></td>
			</tr>
			<%-- <tr>
			<td><f:label path="subCategoryDate" />Date:-</td>
			<td><f:input path="subCategoryDate" /></td>
		</tr> --%>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</f:form>
</div>
<div id="tabmediafile">
	<f:form method="post" action="updateTabmediafile.html"
		modelAttribute="tabmediafile" id="tabmediafile_form">
		<table>
			<tr style="display: none;">
				<td><f:label path="mediaFileId">ID</f:label></td>
				<td><f:input path="mediaFileId" /></td>
			</tr>
			<tr>
				<td><f:label path="categoryId">SubCategory ID</f:label></td>
				<td><f:input path="categoryId" /></td>
			</tr>
			<tr>
				<td><f:label path="mediaFileDesc" />Desc :-</td>
				<td><f:input path="mediaFileDesc" /></td>
			</tr>
			<tr>
				<td><f:label path="mediafileimage" />Image :-</td>
				<td><f:input path="mediafileimage" /></td>
			</tr>
			<tr>
				<td><f:label path="mediaFileName" />File Name :-</td>
				<td><f:input path="mediaFileName" /></td>
			</tr>
			<tr>
				<td><f:label path="mediaURL" />Media URL :-</td>
				<td><f:input path="mediaURL" /></td>
			</tr>
			<tr>
				<td><f:label path="username" />User Name :-</td>
				<td><f:input path="username" /></td>
			</tr>
			<%-- <tr>
			<td><f:label path="subCategoryDate" />Date:-</td>
			<td><f:input path="subCategoryDate" /></td>
		</tr> --%>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</f:form>
</div>
<div id="tabperson">
	<f:form method="post" action="updateTabperson.html"
		modelAttribute="tabperson" id="tabperson_form">
		<table>
			<tr style="display: none;">
				<td><f:label path="personId">ID</f:label></td>
				<td><f:input path="personId" /></td>
			</tr>
			<tr>
				<td><f:label path="designation">Designation</f:label></td>
				<td><f:input path="designation" /></td>
			</tr>
			<tr>
				<td><f:label path="firstName" />First Name :-</td>
				<td><f:input path="firstName" /></td>
			</tr>
			<tr>
				<td><f:label path="hobbydesc" />Hobby Desc :-</td>
				<td><f:input path="hobbydesc" /></td>
			</tr>
			<tr>
				<td><f:label path="imgLoc" />Image Loc:-</td>
				<td><f:input path="imgLoc" /></td>
			</tr>
			<tr>
				<td><f:label path="lastName" />Last Name :-</td>
				<td><f:input path="lastName" /></td>
			</tr>
			<tr>
				<td><f:label path="priority" />Priority :-</td>
				<td><f:input path="priority" /></td>
			</tr>
			<tr>
				<td><f:label path="username" />User Name :-</td>
				<td><f:input path="username" /></td>
			</tr>
			<%-- <tr>
				<td><f:label path="favouritecategories.favouriteCategoryId" />Favourite Category ID:-</td>
				<td><f:input path="favouritecategories.favouriteCategoryId" /></td>
			</tr> --%>
			<%-- <tr>
			<td><f:label path="subCategoryDate" />Date:-</td>
			<td><f:input path="subCategoryDate" /></td>
		</tr> --%>
			<tr>
				<td colspan="2"><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</f:form>
</div>

</html>

<%-- if the type is category show category related fields --%>

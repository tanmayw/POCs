<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<html>
<script type="text/javascript">
	$(document).ready(function() {

	
		$("#upload").click(function() {

			$('#result').html('');
			$("#uploadForm").ajaxForm({

				success : function(data) {

					$('#result').html(data);
				},
				dataType : "text"
			}).submit();
		});

		$("#inputFormButton").click(function() {
			
			var param = document.URL.split('?categoryid=')[1];
			document.getElementById('categoryhidden').value=param;
			$("#subCategoryInput").ajaxForm({

				success : function(data) {
					alert(data);
					$('#saveResult').html(data);
				},
				dataType : "text"
			}).submit();
		});
		
		

	});

</script>

<div>
	<font color="red"><div id="saveResult"
			style="font-style: italic"></div></font>
	<f:form id="subCategoryInput"  method="post" commandName="subCategoryForm" action="saveSubCategoryDetails.html">
		<h2>
			<U>Mconnect Web Input</U>
		</h2>
		<table>
			
			<tr id="title">
				<td><f:label path="title">Title :-</f:label></td>
				<td><f:input path="title" /></td>
			</tr>
	
			<tr id="fileName">
				<td><f:label path="fileName">File Name :-</f:label></td>
				<td><f:input path="fileName" />
			</tr>
			<tr id="uploadType">
				<td><f:label path="uploadType">Upload Type :-</f:label></td>
				<td><f:select path="uploadType" id="uploadType">
						<f:option value="audio"/>
							<f:option value="video"/>
								<f:option value="image"/>
					</f:select>
			</tr>
			<tr id="uploadedBy">
				<td><f:label path="uploaduser">Uploaded By :-</f:label></td>
				<td><f:select path="uploaduser" id="uploadedBy">
				<f:option value="NONE" label="--- Select ---"/>
				<f:options  items="${uplodedBy}"/>	
				</f:select>
				
				</td>
				
			</tr>
			<tr><td><f:hidden id="categoryhidden" path="categoryid"/></td></tr>
		</table>
		
	</f:form>

	<f:form id="uploadForm" action="upload.html"
		modelAttribute="uploadForm" enctype="multipart/form-data">
		<p>
			<input name="file" id="file" type="file" /><input type="button"
				value="Upload" id="upload" />
		<div id="result"></div>
		</p>
	</f:form>
	
	<table>
		<tr>
			<td colspan="2"><input type="button" id="inputFormButton"
				value="Save" /></td>
		</tr>

	</table>


</div>

</html>
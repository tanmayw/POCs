<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<html>
<script type="text/javascript">
	$(document).ready(function() {

		if ($("#categories").val() == "1") {
			$("#fname").show();
			$("#lname").show();
			$("#designation").show();
			$("#priority").show();
			$("#name").hide();
			$("#title").hide();
			var lastValue = $('#priority option:last-child').val();
			lastValue = +lastValue +1;
			//alert(lastValue);
			/*  $('#priority')
	         .append($("<option></option>")
	         .attr(lastValue,key)
	         .text(lastValue));  */
	         $('#priority').append(new Option(lastValue, lastValue));
			
		 /*    $('#priority').append($('<option/>', { 
		        value: lastValue,
		        text : lastValue 
		    })); */
	
		}

		else if ($("#categories").val() == "2") {
			$("#fname").hide();
			$("#lname").hide();
			$("#designation").hide();
			$("#prioritytd").hide();
			$("#name").show();
			$("#title").show();
			//$("#video").hide();
			//$("#audio").hide();
		}

		else if ($("#categories").val() == "3") {
			$("#fname").hide();
			$("#lname").hide();
			$("#designation").hide();
			$("#prioritytd").hide();
			$("#name").show();
			$("#title").show();
			//$("#video").show();
			//$("#audio").hide();
		}

		else if ($("#categories").val() == "4") {
			$("#fname").hide();
			$("#lname").hide();
			$("#designation").hide();
			$("#prioritytd").hide();
			$("#name").show();
			$("#title").show();
			//$("#video").hide();
			//$("#audio").hide();
		}

		else {
			$("#name").show();
			$("#title").show();
			//$("#video").hide();
			//$("#audio").hide();
			$("#fname").hide();
			$("#lname").hide();
			$("#designation").hide();
			$("#priority").hide();
		}

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
			

			$("#inputForm").ajaxForm({

				success : function(data) {
					alert(data);
					$('#saveResult').html(data);
				},
				dataType : "text"
			}).submit();
		});

		$("#categories").change(function() {

			if ($("#categories").val() == "1") {
				$("#fname").show();
				$("#lname").show();
				$("#designation").show();
				$("#prioritytd").show();
				$("#name").hide();
				$("#title").hide();
				
				
			/* 	 $('#priority')
		         .append($("<option></option>")
		         .attr(lastValue,key)
		         .text(lastValue));  */
				/* 
				
			    $('#priority').append($('<option></option>', { 
			        value: lastValue,
			        text : lastValue 
			    }));
		 */
				
				//$("#video").hide();
				//$("#audio").hide();
			}

			else if ($("#categories").val() == "2") {
				$("#fname").hide();
				$("#lname").hide();
				$("#designation").hide();
				$("#prioritytd").hide();
				$("#name").show();
				$("#title").show();
				//$("#video").hide();
				//$("#audio").hide();
			}

			else if ($("#categories").val() == "3") {
				$("#fname").hide();
				$("#lname").hide();
				$("#designation").hide();
				$("#prioritytd").hide();
				$("#name").show();
				$("#title").show();
				//$("#video").show();
				//$("#audio").hide();
			}

			else if ($("#categories").val() == "4") {
				$("#fname").hide();
				$("#lname").hide();
				$("#designation").hide();
				$("#prioritytd").hide();
				$("#name").show();
				$("#title").show();
				//$("#video").hide();
				//$("#audio").hide();
			}

			else {
				$("#name").show();
				$("#title").show();
				//$("#video").hide();
				//$("#audio").hide();
				$("#fname").hide();
				$("#lname").hide();
				$("#designation").hide();
				$("#priority").hide();
			}

		});
		
		$("#subCategoryref").click(function(event){
			 var val = $("#categories").val();
			 $("#subCategoryref").attr("href", "inputSubCategory.html?categoryid="+val);
			});
		
		
		
		
		
	});

	/* 	
	
	
	
	
	
	
	 function uploadFormData(){
	 alert('in upload');
	 $('#result').html('');
	 var oMyForm = new FormData();
	 oMyForm.append("file", file2.files[0]);
	 $.ajax({
	 url: 'upload.html',
	 data: oMyForm,
	 dataType: 'text', 
	 processData: false, 
	 contentType: false, 
	 type: 'POST', 
	 success: function(data){
	 alert(data);
	 //  $('#result').html(data+ " uploaded by FormData!");  
	 $('#result').html(data);    }  });}  */
</script>

<div>
	<font color="red"><div id="saveResult"
			style="font-style: italic"></div></font>
	<f:form id="inputForm" method="post" action="saveDetails.html">
		<h2>
			<U>Mconnect Web Input</U>
		</h2>
		<table>
			<tr>

			</tr>
			<tr>
				<td><f:label path="categories">Categories :-</f:label></td>
				<td><f:select path="categories" id="categories">
						<f:options items="${categoryMap}" />
					</f:select></td>
			</tr>
			<tr id="name">
				<td><f:label path="title">Title :-</f:label></td>
				<td><f:input path="title" /></td>
			</tr>
			<tr id="fname">
				<td><f:label path="fname">First Name :-</f:label></td>
				<td><f:input path="fname" /></td>
			</tr>
			<tr id="lname">
				<td><f:label path="lname">Last Name :-</f:label></td>
				<td><f:input path="lname" /></td>
			</tr>
			<tr id="designation">
				<td><f:label path="designation">Designation :-</f:label></td>
				<td><f:input path="designation" /></td>
			</tr>
			<tr id="prioritytd">
				<td><f:label path="priority">Priority :-</f:label></td>
				<td><f:select path="priority" id="priority">
						<f:options items="${persons}" />
				</f:select></td>
			</tr>
			<tr id="title">
				<td><f:label path="subCategory">SubCategory :-</f:label></td>
				<td><f:select path="subCategory" id="title">
						<f:options items="${subCategoryMap}" />
					</f:select>&nbsp;<a id="subCategoryref" href="#">New</a></td>
			</tr>
			<tr id="desc">
				<td><f:label path="description">Description :-</f:label></td>
				<td><f:textarea cols="100" rows="10" path="description" /></td>
			</tr>

			<tr id="image">
				<td><f:label path="image">File Name :-</f:label></td>
				<td><f:input path="image" />
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


		<%-- 	<tr id="video">
				<td><f:label path="video">Video :-</f:label></td>
				<td><f:input path="video" /><input type="file" /> <input
					type="button" value="upload" /></td>
			</tr>
			
			<tr id="audio">
				<td><f:label path="audio">Audio :-</f:label></td>
				<td><f:input path="audio" /><input type="file" /> <input
					type="button" value="upload" /></td>
			</tr> --%>

		<tr>
			<td colspan="2"><input type="button" id="inputFormButton"
				value="Save" /></td>
		</tr>

	</table>


	<%-- <form id="form2" method="post" action="upload.html" enctype="multipart/form-data">
				<!-- File input -->
				<input name="file2" id="file2" type="file" /><br />
			</form>
			<button value="Submit" onclick="uploadJqueryForm()">Upload</button>
			<i>Using JQuery Form Plugin</i>
			<br />
			<button value="Submit" onclick="uploadFormData()">Upload</button>
			<i>Using FormData Object</i>
			<div id="result"></div>
			</form> --%>
</div>

</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
 <link href="css/sticky-footer.css" rel="stylesheet">
   <!-- Bootstrap core CSS -->
  
	
<title><decorator:title default="MConnect Web" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<decorator:head />
<style type="text/css">
#navigation {
	position: absolute;
	top: 10;
	left: 0;
	width: 200px;
	background-color: rgb(238, 238, 238);
}

#content {
	margin-left: 200px;
		
}
#home{
margin-left: 10px;
margin-top: 10px;
}
#logout{
margin-top: 0px;
text-align: right;
}
.error {
	color: #ff0000;
}
 
.errorblock {
	color: #000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}

body,table {
	font-size: 12px;
	font-family: arial, sans-serif;
	}
li {
margin-bottom:10px;
}
</style>
<!--  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/sticky-footer-navbar.css" rel="stylesheet"> -->
</head>
<body>
	<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<div id="header" class="navbar navbar-default navbar-static-top">
	<div id="home" ><a href="content.html">Home</a></div>
	<div id="logout" ><a href="logout.html">Logout</a></div>
	<h4 align="right">Logged In : ${enterpriseid}</label></h4>
	</div>
	<div id="navigation">
		<ul>
			<li><a href="category.html">Categories</a></li>
			<li><a href="subcategory.html">SubCategories</a></li>
			<li><a href="contibutions.html">Contributions</a></li>
			<li><a href="eventspictures.html">Events/Pictures</a></li>
			<li><a href="fromtheshows.html">From The Shows</a></li>
			<li><a href="inthenews.html">In The News</a></li>
			<li><a href="mediafiles.html">Media files</a></li>
			<li><a href="persons.html">Leadership</a></li>
		</ul>
	</div>

	<div id="content">
		<decorator:body />
	</div>
	
<!-- 	<div id="footer">
      <div class="container">
        <p class="text-muted">MConnect Web Developers.</p>
      </div>
    </div>
 -->



</body>
</html>
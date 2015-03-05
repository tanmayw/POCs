<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <html>
<head>

<style>
body,table {
	font-size: 12px;
	font-family: arial, sans-serif;
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
</style>



</head>
<body>
	<div align="center">
<form:form method="post" commandName="loginForm"  action="index.html" >
<form:errors path="*" cssClass="errorblock" element="div" />

		<table>
		
    
			<tr>
				<td><form:label path="enterpriseid">Enterprise Id :-</form:label></td>
				<td><form:input path="enterpriseid" /></td><td><form:errors path="enterpriseid"  cssClass="error"/></td>

			</tr>
			<tr>
				<td><form:label path="password">Password :-</form:label></td>
				<td><form:password path="password" /></td><td><form:errors path="password"  cssClass="error"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Login" /></td>
			</tr>

		</table>

</form:form>

	</div>
</body>
</html> --%>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>MConnect Web Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	 <link href="css/login.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css"	href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

   <!--  <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div>/.nav-collapse
      </div>
    </div> -->

    <div id="loginDiv">
    <form:form method="post" modelAttribute="loginForm" class="form-signin"  action="index.html" >

       <!--  <h3 class="form-signin-heading">Sign In</h2> -->
        <form:errors path="*" cssClass="errorblock" element="div" />
			<table>
				<tr>
					<td><form:label path="enterpriseid">Enterprise Id :-</form:label></td>
					<td><form:input path="enterpriseid" class="form-control" /></td>
					
					<td><form:errors path="enterpriseid" cssClass="error" /></td>
				</tr>
				<tr>
					<td><form:label path="password">Password :-</form:label></td>
					<td><form:password path="password" class="form-control" /></td>
					
					<td><form:errors path="password" cssClass="error" /></td>
				</tr>
				<tr>
					<td colspan="4"><button
							class="btn btn-lg btn-primary btn-block" type="submit">Sign
							in</button>
					<td>
				</tr>
			</table>
		</form:form>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

  </body>
</html>











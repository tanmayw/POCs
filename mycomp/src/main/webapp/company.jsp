<!DOCTYPE html>
<html lang="en" ng-app="company">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">
<link rel="icon" href="../../favicon.ico">
<script
	src="js/jquery.min.js"></script>
<script src="js/angular.min.js"></script>
<script src="js/ui-bootstrap-tpls-0.11.0.min.js"></script>
<title>Revolution Enterprises</title>
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="assets/js/ie-emulation-modes-warning.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
/* Featurettes
------------------------- */
.featurette-divider {
	margin: 80px 0; /* Space out the Bootstrap <hr> more */
}

/* Thin out the marketing headings */
.featurette-heading {
	font-weight: 300;
	line-height: 1;
	letter-spacing: -1px;
}

@media ( min-width : 768px) {
	.featurette-heading {
		font-size: 50px;
	}
}

@media ( min-width : 992px) {
	.featurette-heading {
		margin-top: 120px;
	}
}
</style>

</head>

<body>
	<div class="container">

		<div class="masthead" ng-controller="PanelController as panel">
			<!-- <h3 class="text-muted">Project name</h3> -->
			<ul class="nav nav-justified">
				<li class="active" ng-class="{ active:panel.isSelected(1)}"><a
					href ng-click="panel.selectTab(1)">Home</a></li>
				<!-- <li ng-class="{ active:panel.isSelected(2)}"><a href
					ng-click="panel.selectTab(2)">Projects</a></li> -->
				<li ng-class="{ active:panel.isSelected(3)}"><a href
					ng-click="panel.selectTab(3)">Services</a></li>
				<!-- <li ng-class="{ active:panel.isSelected(4)}"><a href
					ng-click="panel.selectTab(4)">Solutions</a></li> -->
				<li ng-class="{ active:panel.isSelected(5)}"><a href
					ng-click="panel.selectTab(5)">Frameworks</a></li>
				<li ng-class="{ active:panel.isSelected(6)}"><a href
					ng-click="panel.selectTab(6)">About</a></li>
				<li ng-class="{ active:panel.isSelected(7)}"><a href
					ng-click="panel.selectTab(7)">Contact</a></li>
			</ul>
			<div class="panel" ng-show="panel.isSelected(1)">

				<div ng-controller="CarouselDemoCtrl">
					<div style="height: 305px">
						<carousel interval="myInterval"> <slide
							ng-repeat="slide in slides" active="slide.active"> <img
							ng-src="{{slide.image}}" style="margin: auto;">
						<div class="carousel-caption">
							<!-- <h4>Slide {{$index}}</h4>
							<p>{{slide.text}}</p> -->
						</div>
						</slide> </carousel>
					</div>
				</div>
				<!-- Example row of columns -->
				<div class="row">
					<div class="col-md-12">
						<p class="text-info lead">With the advancement of open source
							and open source related technologies the new technological era
							has evolved. Getting accustomed with new evolving technologies
							and working with the existing developed is a challenge.With the
							infomation resources scattered all across the places in different
							knowlege pools its very difficult to get hold of the correct
							information and use it effectively for the work. Revolution
							Enterprises helps in providing those information resources.</p>
					</div>
					<div class="col-md-12">
						<h2>Why choose us</h2>
						<p class="text-success">
							<strong>Revolution Enterprises is one of a kind
								enterprise which has various offerings catering wider audience
								in present industry. Revolution Enterprise's one of a kind
								"Smart-Design" product provides various decision making ways to
								come up with easy options in designing the requisite solutions
								which would cater to specific needs.</strong>
						</p>
						<p class="text-primary">
							<strong>Some of the important factors which help
								Revolution Enterprises to be the best option are :-</strong>
						</p>
						<ul>
							<li><em>Cutting edge design as per industry's need</em></li>
							<li><em>Vast industrial experience on Java/J2EE
									opensource space</em></li>
							<li><em>High performing,fast and reliable products</em></li>
							<li><em>On scratch to industry server deployable
									solutions</em></li>
							<li><em>Cost Effective and High Quality products</em></li>
						</ul>
					</div>

					<div class="col-md-4">
						<h2>Recent Technological Trends</h2>
						<p class="text-danger">In this new era of technological
							advancement new organizations are moving in adapting new
							technologies,facinating UI's and responsive web designs.</p>
						<p>The study shows how the technology market is evolving with
							new research and devlopments.</p>
						<p>
							<a class="btn btn-primary btn-sm" href="http://opensource.com/business/14/2/5-ways-open-source-transforming-tech-2014" role="button" target="_blank">View
								details &raquo;</a>
						</p>
					</div>
					<div class="col-md-4">
						<h2>Opensource Vs Licensed</h2>
						<p class="text-success">More and more companies are moving in
							a direction for adapting opensource technologies as opposed to
							licenced on. This accounts in cutting the cost of development and
							support in using licensed servers and there support</p>
						<p>
							<a class="btn btn-primary btn-sm" href="http://en.wikipedia.org/wiki/Comparison_of_open_source_and_closed_source" role="button" target="_blank">View
								details &raquo;</a>
						</p>
					</div>
					<div class="col-md-4">
						<h2>Recent News</h2>
						<p class="text-primary">Latest news on opensource market and technologies </p>
						<p>
							<a class="btn btn-primary btn-sm" href="http://opensource.com/tags/open-source-news" role="button" target="_blank">View
								details &raquo;</a>
						</p>
					</div>
				</div>


			</div>


			<div class="panel" ng-show="panel.isSelected(2)">

				<div ng-controller="CarouselDemoCtrl">
					<div style="height: 305px">
						<carousel interval="myInterval"> <slide
							ng-repeat="slide in slides" active="slide.active"> <img
							ng-src="{{slide.image}}" style="margin: auto;">
						<div class="carousel-caption">
							<!--  <h4>Slide {{$index}}</h4> -->
							<!-- <p>{{slide.text}}</p> -->
						</div>
						</slide> </carousel>
					</div>
				</div>
				<h4>Projects</h4>
				<blockquote>None Yet</blockquote>
			</div>


			<div class="panel" ng-show="panel.isSelected(3)">

				<div ng-controller="CarouselDemoCtrl">
					<div style="height: 305px">
						<carousel interval="myInterval"> <slide
							ng-repeat="slide in slides" active="slide.active"> <img
							ng-src="{{slide.image}}" style="margin: auto;">
						<div class="carousel-caption">
							<!--  <h4>Slide {{$index}}</h4> -->
							<!-- <p>{{slide.text}}</p> -->
						</div>
						</slide> </carousel>
					</div>
				</div>
				<p class="text-success">
					<strong>Revolution Enterprises offers wide variety of
						services for working on Open Source Technologies The services
						which any company offers are the essential pillars to its success.
						These services are focused to meet the requirements of the
						customer and potentially satisfy there business neeeds.</strong>
				</p>
				<br> <br>
				<div class="row">

					<div class="col-md-4">
						<img alt="" src="images/service1.png" class="img-circle" />
						<p>OpenSource Framework Decision Offerings</p>
					</div>
					<div class="col-md-4">
						<img alt="" src="images/service2.png" />
						<p>Design Methodolgies</p>
					</div>
					<div class="col-md-4">
						<img alt="" src="images/service3.png" />
						<p>Training</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-16"></div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<img alt="" src="images/service4.png" />
						<p>Ready2Use pluggable interface offerings</p>
					</div>
					<div class="col-md-4">
						<img alt="" src="images/service5.png" />
						<p>End2End solution offerings</p>
					</div>
					<div class="col-md-4">
						<img alt="" src="images/service6.png" />
						<p>Wide industry research and findings</p>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-md-16">
						<p class="text-primary">All these services are unique
							offerings of Revolution Enterprises. We are pioneers in
							delivering our service offerings to wide variety of audiences
							catering there business needs.</p>
					</div>
				</div>
			</div>

			<div class="panel" ng-show="panel.isSelected(4)">

				<div ng-controller="CarouselDemoCtrl">
					<div style="height: 305px">
						<carousel interval="myInterval"> <slide
							ng-repeat="slide in slides" active="slide.active"> <img
							ng-src="{{slide.image}}" style="margin: auto;">
						<div class="carousel-caption">
							<!--  <h4>Slide {{$index}}</h4> -->
							<!-- <p>{{slide.text}}</p> -->
						</div>
						</slide> </carousel>
					</div>
				</div>
				<h4>Solutions</h4>
				<blockquote>None Yet</blockquote>
			</div>

			<div class="panel" ng-show="panel.isSelected(5)">

				<div ng-controller="CarouselDemoCtrl">
					<div style="height: 305px">
						<carousel interval="myInterval"> <slide
							ng-repeat="slide in slides" active="slide.active"> <img
							ng-src="{{slide.image}}" style="margin: auto;">
						<div class="carousel-caption">
							<!--  <h4>Slide {{$index}}</h4> -->
							<!-- <p>{{slide.text}}</p> -->
						</div>
						</slide> </carousel>
					</div>
				</div>
				<div class="row">
					<div class="col-md-16">
						<p class="text-success">
							<strong>Some of the leading industrial frameworks which
								Revolution Enterprises have expertise and experience in working
								are :</strong>
						</p>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-md-4">
						<img src="images/struts.gif" />
					</div>
					<div class="col-md-4">
						<img src="images/Spring_Framework.png" />
					</div>
					<div class="col-md-4">
						<img src="images/Hibernate.png" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<p class="text-center">
							<img src="images/opensource.jpg" />
						</p>
					</div>
					<div class="col-md-6">
						<img src="images/AngularJS-large.png" />

					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<img src="images/Liferay.jpg" />
					</div>
					<div class="col-md-4">
						<img src="images/mysql.jpg" />
					</div>

					<div class="col-md-4">
						<img src="images/jquery.jpg" />

					</div>
				</div>
			</div>

			<div class="panel" ng-show="panel.isSelected(6)">

				<div ng-controller="CarouselDemoCtrl">
					<div style="height: 305px">
						<carousel interval="myInterval"> <slide
							ng-repeat="slide in slides" active="slide.active"> <img
							ng-src="{{slide.image}}" style="margin: auto;">
						<div class="carousel-caption">
							<!--  <h4>Slide {{$index}}</h4> -->
							<!-- <p>{{slide.text}}</p> -->
						</div>
						</slide> </carousel>
					</div>
				</div>


				<div class="row featurette">
					<div class="col-md-7">
						<h2 class="featurette-heading">
							Who we are <span class="text-muted"></span>
						</h2>
						<p class="text-primary lead">Revolution Enterprises consist of
							team of highly skilled vast experienced industry professionals
							who are experts in Java and Opensource related technologies This
							company consist of talented individuals having vast experienced
							skills in technological as well as industrial domain.</p>
					</div>
					<div class="col-md-5">
						<img class="featurette-image img-responsive"
							src="images/whoweare.jpg" data-src="holder.js/500x500/auto">
					</div>
				</div>

				<hr class="featurette-divider">

				<div class="row featurette">
					<div class="col-md-5">
						<img class="featurette-image img-responsive"
							data-src="holder.js/500x500/auto" src="images/whatwedo.jpg">
					</div>
					<div class="col-md-7">
						<h2 class="featurette-heading">
							What we do <span class="text-muted"></span>
						</h2>
						<p class="text-primary lead">We provide end to end solution
							design offerings to our customers by using our seasoned services.
							Our company also provide solution support and on demand service
							solution creation.</p>
					</div>
				</div>
				<hr class="featurette-divider">
			</div>

			<div class="panel" ng-show="panel.isSelected(7)">
				<div ng-controller="CarouselDemoCtrl">
					<div style="height: 305px">
						<carousel interval="myInterval"> <slide
							ng-repeat="slide in slides" active="slide.active"> <img
							ng-src="{{slide.image}}" style="margin: auto;">
						<div class="carousel-caption">
							<!--  <h4>Slide {{$index}}</h4> -->
							<!-- <p>{{slide.text}}</p> -->
						</div>
						</slide> </carousel>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4" ng-controller="QuickContactController">
						<h3>Quick Contact</h3>
						 <p ng-class="result" style="padding: 15px; margin: 0;">{{resultMessage }}</p>						
						<form ng-submit="submit(quickcontactform)" name="quickcontactform"
							method="post" action="" role="form">
						
						 
						 
							<div class="form-group">
								<input ng-model="formData.email" type="email" name="email"
									class="form-control" placeholder="Type your email id here">
							</div>
							<div class="form-group">
								<textarea ng-model="formData.inputMessage" class="form-control"
									rows="3" cols="10" name="inputMessage"
									placeholder="Type your requirement"></textarea>
							</div>
							<div class="form-group">
								<input ng-model="formData.phone" name="phone" type="phone"
									name="phone" class="form-control"
									placeholder="Type your phone no"><br>
							</div>

							<button type="submit" class="btn btn-default">Submit</button>
						</form>
						

					</div>
					<div class="col-md-8" ng-controller="ContactController">
						<div ng-class="result" class="well well-lg">{{contactResultMessage }}</div> 
					
						<div collapse="isCollapsed">
						<h3>Contact Us</h3>	
						
						<p class="text-success">Customers can provide there
							information in the below given form with relevant details. Our
							representatives of the company will contact you on the given
							information.</p>

						
						<form role="form">
							<div class="form-group">
								<label class="col-sm-2 control-label">Company</label> <input
									type="text" class="form-control" />
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Full Name</label> <input
									type="text" class="form-control" />
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Address</label> <input
									type="text" class="form-control" />
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Phone</label> <input
									type="text" class="form-control" />
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Email</label> <input
									type="email" class="form-control" />
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">Comments</label> <input
									type="text" class="form-control" />
							</div>

						<button type="button" ng-click="showStatus()" class="btn btn-default">Send Now</button>
						</form>	
					</div>
					
					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
	<!-- Site footer -->
	<div class="footer">
		<p>&copy;Revolution Enterprises 2014</p>
	</div>
	</div>
	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

</body>
<script type="text/javascript">
	var myApp = angular.module('company', [ 'ui.bootstrap' ]);
	myApp.controller("PanelController", function() {
		this.tab = 1;
		this.selectTab = function(setTab) {
			this.tab = setTab;
		};

		this.isSelected = function(checkTab) {
			return this.tab === checkTab;
		};
	});

	myApp.controller("CarouselDemoCtrl", function($scope) {
		$scope.myInterval = 5000;
		var slides = $scope.slides = [];

		$scope.addSlide = function(i) {
			slides.push({
				image : 'images/banner' + i + '.jpg'

			});
		};
		for ( var i = 0; i < 4; i++) {
			$scope.addSlide(i);
		}
	});

	myApp.controller("QuickContactController", function($scope, $http) {
		$scope.result = 'hidden'
		$scope.resultMessage;
		$scope.formData; //formData is an object holding the name, email, subject, and message

		$scope.submit = function(quickcontactform) {
			
			
			 $http({
				method : 'POST',
				url : '/test.do',
				data : $.param($scope.formData), //param method from jQuery
				headers : {'Content-Type' : 'application/x-www-form-urlencoded'}
			//set the headers so angular passing info as form data (not request payload)
			}).success(function(data) {
				console.log(data);
					//success comes from the return json object					
					$scope.resultMessage = data;
					$scope.result = 'bg-success';
				
			}).error(function(data)
					{
			
				$scope.resultMessage = data
				$scope.result = 'bg-danger';
					}
					); 

		}

	});
	
	myApp.controller("ContactController", function($scope) {
		$scope.result = 'hidden';
		$scope.contactResultMessage = '';
		$scope.isCollapsed = false;
		$scope.showStatus = function() {
			$scope.isCollapsed = true;
			$scope.contactResultMessage = "Your Details are recieved";
			$scope.result = 'bg-success';
		}
	});
</script>
</html>
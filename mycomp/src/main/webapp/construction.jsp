
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>AngularJS Routing example</title>
<script src="js/angular.min.js"></script>
<script src="js/angular-route.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
  </head>
 
  <body ng-app="sampleApp">

    <div class="container" ng-controller="SwitchController">
        <div class="row">
        <div class="col-md-3">
            <ul class="nav">
            	<button ng-click="switchURL()">Switch</button>
                <li><a href="#AddNewOrder"> Add New Order </a></li>
                <li><a href="#ShowOrders"> Show Order </a></li>
            </ul>
        </div>
        <div class="col-md-9">
            <div ng-view></div>
        </div>
        </div>
    </div>
 
  
   <script type="text/javascript">

   var sampleApp = angular.module('sampleApp',['ngRoute']);
    
   sampleApp.controller("SwitchController", function($scope,$location) {
		
	   $scope.switchURL = function(){
		   
		   $location.url('/ShowOrders');
	   }
	   
	});
   
   
   //Define Routing for app
   //Uri /AddNewOrder -> template add_order.html and Controller AddOrderController
   //Uri /ShowOrders -> template show_orders.html and Controller AddOrderController
   sampleApp.config(['$routeProvider',
     function($routeProvider) {
       $routeProvider.
         when('/AddNewOrder', {
           templateUrl: 'template/add_order.html',
           controller: 'AddOrderController'
       }).
         when('/ShowOrders', {
           templateUrl: 'template/show_orders.html',
           controller: 'ShowOrdersController'
         }).
         otherwise({
           redirectTo: '/AddNewOrder'
         });
   }]);
    
    
   sampleApp.controller('AddOrderController', function($scope) {
        
       $scope.message = 'This is Add new order screen';
        
   });
    
    
   sampleApp.controller('ShowOrdersController', function($scope) {
    
       $scope.message = 'This is Show orders screen';
    
   });
   
   </script>
 
  </body>
</html>
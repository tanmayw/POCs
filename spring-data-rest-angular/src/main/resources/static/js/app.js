
var email;
var userObj;
var userId;

var taskManagerModule = angular.module('taskManagerApp', ['ngAnimate','ngRoute']);


taskManagerModule.run(function($rootScope) {
    $rootScope.userEmail= "";
    $rootScope.userObj= {};
})

taskManagerModule .config(['$routeProvider',
                   function($routeProvider) {
                     $routeProvider.
                       when('/task', {
                         templateUrl: 'partials/task.html',
                         controller: 'taskManagerController'
                       }).
                       when('/home', {
                           templateUrl: 'partials/login.html',
                           controller: 'homeController'
                         }).
                     
                       otherwise({
                         redirectTo: '/home'
                       });
                   }]);



taskManagerModule.factory('userService', function($http) {
	  var userService = {
	    async: function(userEmail) {
	      // $http returns a promise, which has a then function, which also returns a promise
	      var promise = $http.get('/users/search/findByUserEmail?userEmail=test@test.com').then(function (response) {
	        // The then function here is an opportunity to modify the response
	        console.log(response);
	        // The return value gets picked up by the then in the controller.
	        return response.data;
	      });
	      // Return the promise to the controller
	      return promise;
	    }
	  };
	  return userService;
	});


/*
taskManagerModule.service('userService', function($http){
    this.findUser= function(userEmail){   	
    	var objUser;
    	var urlBase="";
    	var foundUser;
		//check the looged in user 
		$http.get('http://localhost:8080/users/search/findByUserEmail?userEmail=test@test.com').

		success(function (data) {
			console.log("inside the success call of userEmail");
			var foundUser;
			if (data._embedded != undefined) {
			var users = data._embedded.users;
			foundUser =users[0];
			
			} else {
				alert("UserService >>> no user found for this email ")			
			}
			
			return foundUser;


		});	
    	
    	
    	
    	
        
    };        
});
*/


taskManagerModule.controller('homeController', function ($scope,$http,$location, $rootScope,userService)
{

	$scope.showLogin = true;
	var urlBase="";
	
	console.log("inside home controller >>>> rootscope value for email " + $scope.userEmail);
	
	
	$scope.showLoginPage = function showLoginPage()
	{
		
		$scope.showTask=false;
		$location.path('/home');
	};



	$scope.login = function login()
	{
		$rootScope.userEmail = $scope.userEmail;
		var objUser;
		userService.async($scope.userEmail).then(function(d) {
			 
			 if (d._embedded != undefined) {
					var users = d._embedded.users;
					objUser =users[0];
			 }
			    
			  });
		
		//var objUser = userService.findUser($scope.userEmail);
		
		$rootScope.userObj= objUser;
		console.log("inside login method  >>>> rootscope value for userObj " + $rootScope.userObj);
		
		alert("ObjUser inside login >>>>"+objUser);
		if(objUser!=undefined)
			{
			//show tasks to logged in user 
			$location.path('/task');
			}
		else {
			alert("no user found registering you as a new user")
			$scope.users = [];

			//post the user to DB.
			$http.post(urlBase + '/users', {
				userEmail: $scope.userEmail,
				userPassword: $scope.userPassword
			}).
			success(function(data, status, headers) {
				alert("User added");
				var newTaskUri = headers()["location"];
				console.log("Might be good to GET " + newTaskUri + " and append the task.");
				$scope.showLogin=false;
				$location.path('/task');
			});
		}


	};
});


taskManagerModule.controller('taskManagerController', function ($scope,$http,$location, $rootScope,userService) {
	var urlBase="";
	$scope.toggle=true;
	$scope.selection = [];
	$scope.statuses=['ACTIVE','COMPLETED'];
	$scope.priorities=['HIGH','LOW','MEDIUM'];
	$http.defaults.headers.post["Content-Type"] = "application/json";

	console.log("inside taskManagerController >>>> rootscope value for userObj " + $rootScope.userObj);
	findAllTasks($rootScope.userObj);

	function findAllTasks(foundUser) {

		if(foundUser!=undefined)
		{
			//get all tasks and display initially
			$http.get(urlBase + '/tasks/search/findByUserId?user_id='+foundUser.userId).
			success(function (data) {
				if (data._embedded != undefined) {
					$scope.tasks = data._embedded.tasks;
				} else {
					$scope.tasks = [];
				}
				for (var i = 0; i < $scope.tasks.length; i++) {
					if ($scope.tasks[i].taskStatus == 'COMPLETED') {
						$scope.selection.push($scope.tasks[i].taskId);
					}
				}

				$scope.taskName="";
				$scope.taskDesc="";
				$scope.taskPriority="";
				$scope.taskStatus="";
				$scope.toggle='!toggle';

			});
		}
	}

	//add a new task
	$scope.addTask = function addTask() {

		var userEmail =$rootScope.userEmail;
		console.log("inside taskManagerController >>>> addTask method rootscope value for userEmail " + $rootScope.userEmail);
		
		

		console.log("inside add  task ");

		if($scope.taskName=="" || $scope.taskDesc=="" || $scope.taskPriority == "" || $scope.taskStatus == ""){
			console.log("Insufficient Data! Please provide values for task name, description, priortiy and status");
		}		
		else{

			console.log("valid data inserting task for user ");

			//get the user for the logged in email address 

			console.log("inside the success call of userEmail");
			var objUser={};
			
			if($rootScope.userObj==undefined)
			{
				userService.async(userEmail).then(function(d) {
					 
					 if (d._embedded != undefined) {
							var users = d._embedded.users;
							objUser =users[0];
							userId= objUser.userId;
					 }
					    
					  });
				
			}
			else
			{
				objUser = $rootScope.userObj;
			}


			//create task by posting the parameters to tasks 
			//console.log("User obtained after the get call " +objUser.userName+ " "+ objUser.userEmail);
			if(objUser.userEmail!="")
			{
				console.log("Posting data to system to creat task for this user");
				$http.post(urlBase + '/tasks', {
					taskName: $scope.taskName,
					taskDescription: $scope.taskDesc,
					taskPriority: $scope.taskPriority,
					taskStatus: $scope.taskStatus,
					userId:urlBase+'/users/'+userId

				}).
				success(function(data, status, headers) {
					console.log("Task added");
					var newTaskUri = headers()["location"];
					console.log("Might be good to GET " + newTaskUri + " and append the task.");
					// Refetching EVERYTHING every time can get expensive over time
					// Better solution would be to $http.get(headers()["location"]) and add it to the list
					findAllTasks(objUser);
				});              
			} 
		}
	};

	// toggle selection for a given task by task id
	$scope.toggleSelection = function toggleSelection(taskUri) {
		var idx = $scope.selection.indexOf(taskUri);

		// is currently selected
		// HTTP PATCH to ACTIVE state
		if (idx > -1) {
			$http.patch(taskUri, { taskStatus: 'ACTIVE' }).
			success(function(data) {
				alert("Task unmarked");
				findAllTasks();
			});
			$scope.selection.splice(idx, 1);
		}

		// is newly selected
		// HTTP PATCH to COMPLETED state
		else {
			$http.patch(taskUri, { taskStatus: 'COMPLETED' }).
			success(function(data) {
				alert("Task marked completed");
				findAllTasks();
			});
			$scope.selection.push(taskUri);
		}
	};


	// Archive Completed Tasks
	$scope.archiveTasks = function archiveTasks() {
		$scope.selection.forEach(function(taskUri) {
			if (taskUri != undefined) {
				$http.patch(taskUri, { taskArchived: 1});
			}
		});
		alert("Successfully Archived");
		console.log("It's risky to run this without confirming all the patches are done. when.js is great for that");
		findAllTasks();
	};

});

//Angularjs Directive for confirm dialog box
taskManagerModule.directive('ngConfirmClick', [
	function(){
         return {
             link: function (scope, element, attr) {
                 var msg = attr.ngConfirmClick || "Are you sure?";
                 var clickAction = attr.confirmedClick;
                 element.bind('click',function (event) {
                     if ( window.confirm(msg) ) {
                         scope.$eval(clickAction);
                     }
                 });
             }
         };
 }]);
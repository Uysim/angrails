myApp=angular.module('myApp',['ngRoute'])

myApp.config(['$routeProvider'
	($routeProvider)->
		$routeProvider
			.when('/'
				templateUrl: 'assets/templates/index.html'
				controller: 'indexController'
			)
			.when('/names/:nameId'
				templateUrl: 'assets/templates/show.html'
				controller: 'showController'
			)
			.otherwise(
				redirectTo: '/'
			)
])

# myApp.factory('nameService',()->
# 	name=null
# 	{
# 		setName: (nameparam)->
# 			name=nameparam
# 		getName: ()->
# 			name
# 	}
# )

myApp.controller('indexController',['$scope','$http'
	($scope,$http)->
		$http.get('./names/index.json').success(then(data)->
			$scope.names=data
		)
])

myApp.controller('showController',['$scope','$http','$routeParams','$location'
	($scope,$http,$routeParams,$location)->
		$http.get('/names/'+$routeParams.nameId+'.json').success(then(data)->
			$scope.name=data
		)
])
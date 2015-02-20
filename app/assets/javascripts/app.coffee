myApp=angular.module('myApp',['ngRoute'])

myApp.config(['$routeProvider'
	($routeProvider)->
		$routeProvider
			.when('/'
				templateUrl: 'assets/templates/index.html'
				controller: 'indexController'
			)
			.when('/show'
				templateUrl: 'assets/templates/show.html'
				controller: 'showController'
			)
			.otherwise(
				redirectTo: '/'
			)
])

myApp.factory('nameService',()->
	name=null
	{
		setName: (nameparam)->
			name=nameparam
		getName: ()->
			name
	}
)

myApp.controller('indexController',['$scope','$http','nameService'
	($scope,$http,nameService)->
		$http.get('./names/index.json').success(then(data)->
			$scope.names=data
		)
		$scope.show=(name)->
			nameService.setName(name)
])

myApp.controller('showController',['$scope','nameService'
	($scope,nameService)->
		$scope.name=nameService.getName()
])
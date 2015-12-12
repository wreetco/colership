angular.module("vinLookup", ['ngRoute'])
// configuration
.config(['$routeProvider', function($routeProvider) {
	$routeProvider
	// /test
	.when('/', {
    template: '',
		controller: 'MainCtrl'
	})
	// default route
	.otherwise({
		template: '',
		controller: 'MainCtrl',
	});
}])

// services
.factory('VinLookup', function($http) {
	return {
		getCarByVin: function($main_scope, vin_number) {
      // hardcron a base case
      url = "http://dev.wreet.co/vinnythevintool/" + vin_number;
			$http.get(url).
			success(function(data, status, headers, config) {
				$main_scope.cars = angular.fromJson(data);
				console.log(data);
				/*
					* What we need is to go through all this data, and map it out to the
					* fields that correspond to the template.
				*/
				// first we try and collect all the 'trims'
				var trims = [];
				for (var y = 0; y < data.years.length; y++) {
					// 'y' is our year iterator, in each of these we search 'styles'
					for (var s = 0; s < data.years[y].styles.length; s++) {
						// 's' is our styles iterator
						trims.push(data.years[y].styles[s]);
					} // end styles it
				} // end years it
				console.log(trims);
				// if there is more than one configuration for this VIN, get clarification

				// autofill the fields we can
				// fill make
				if (data.make.name)
					$main_scope.car_form.make = data.make.name;
				// fill model
				if (data.model.name)
					$main_scope.car_form.model = data.model.name;
				// fill year
				if (data.years[0].year)
					$main_scope.car_form.year = data.years[0].year;
				/// fill engine
				if (data.engine && data.engine.configuration && data.engine.cylinder)
					$main_scope.car_form.engine = data.engine.configuration + data.engine.cylinder;
				// fill transmission
				if (data.transmission)
					$main_scope.car_form.transmission = data.transmission.numberOfSpeeds + "-speed " + data.transmission.transmissionType.toLowerCase();
				// fill fuel type
				if (data.engine && data.engine.fuelType)
					$main_scope.car_form.fuel_type = data.engine.fuelType;
				// fill the mpgs
				if (data.MPG) {
					$main_scope.car_form.mpg_city = data.MPG.city;
					$main_scope.car_form.mpg_highway = data.MPG.highway;
				}
				// drivetrain
				if (data.drivenWheels)
					$main_scope.car_form.drivetrain = data.drivenWheels;

			});
		}
	};
}) // end userservice

// controllerz
.controller("MainCtrl", function($scope, $timeout, VinLookup) {
	$scope.cars = {};
	$scope.car_form = {};
	$scope.lookupVin = function(){
		VinLookup.getCarByVin($scope, $scope.vin);
	};
}) // end main controller
; // end app defs

var app = angular.module("laberintoApplication", ['ngResource']);

app.factory('LaberintoS', function($resource) {
    return $('/laberintos/:id', {'id': '@id'}, {
    	'todosLosLaberintos': { method: 'GET', isArray: true}
    });
});

app.factory('HabitacioneS', function($resource) {
    return $('/iniciarLaberinto/:uid/:lid', {'uid': '@uid'}, {'lid': '@lid'} , {
    	'todosLasHabitaciones': { method: 'GET', isArray: true}
    });
});

app.factory('AccioneS', function($resource) {
    return $('/realizarAccion/:uid/:hid/:aid', {'uid': '@uid'}, {'hid': '@hid'} , {'aid': '@aid'} , {
    	'todosLasHabitaciones': { method: 'GET', isArray: false}
    });
});


app.controller('laberintoController', function($scope, LaberintoS, HabitacioneS, AccioneS, $http) {

	$scope.idUsuario = "1";
	
	$http.get("laberintos/"+ $scope.idUsuario).success(function(data) {
		
		$scope.laberintos = data;
		console.log(data);
	}).error(errorHandler);

	$scope.iniciarLaberinto = function(idLaberinto) {
		$http.get("iniciarLaberinto/"+ $scope.idUsuario +"/" + idLaberinto).success(function(data) {
			$scope.habitaciones = data.laberinto.habitaciones;
			$scope.habitacionActual = $scope.habitaciones[0];
			$scope.inventarioActual = data.laberinto.inventario
			console.log(data);
		}).error(errorHandler);
	}
	
	$scope.realizarAccion = function(idHabitacion, idAccion) {
		$http.get("realizarAccion/"+ $scope.idUsuario +"/" + idHabitacion + "/" + idAccion).success(function(data) {
			$scope.habitacionActual = data.habitacion
			$scope.inventarioActual = data.inventario
			console.log(data);
		}).error(errorHandler);
	}
	
	this.verDetalle = function(laberinto) {
		$scope.laberintoSeleccionado = laberinto;
		$("#accesoLaberintoModal").modal({});

		console.log($scope.laberintoSeleccionado);
	};

	function errorHandler(error) {
		this.notificarError(error.data);
	}
	;
});
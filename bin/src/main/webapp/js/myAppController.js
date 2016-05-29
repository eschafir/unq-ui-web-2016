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


app.controller('laberintoController', function($scope, LaberintoS, HabitacioneS, $http) {
	
	// $scope.laberintos = [{nombre: 'Laberinto 1'},{nombre: 'Laberinto 2'},{nombre:"Laberinto 3"}];

	$scope.idUsuario = "1";
	
	$http.get("laberintos/"+ $scope.idUsuario).success(function(data) {
		
		$scope.laberintos = data;
		console.log(data);
	}).error(errorHandler);

	$scope.iniciarLaberinto = function(idLaberinto) {
		$http.get("iniciarLaberinto/"+ $scope.idUsuario +"/" + idLaberinto).success(function(data) {
			$scope.habitaciones = data.laberinto.habitaciones;
			$scope.habitacionActual = $scope.habitaciones[0];
			$scope.inventarioActual = [{nombre: 'Martillo'},{nombre: 'Serrucho'},{nombre:"Llave"}];
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
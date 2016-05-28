var app = angular.module("laberintoApplication", ['ngResource']);

app.factory('LaberintoS', function($resource) {
    return $('/laberintos/:id', {'id': '@id'}, {
    	'todosLosLaberintos': { method: 'GET', isArray: true}
    });
});


app.controller('laberintoController', function($scope, LaberintoS, $http) {
	/*
	 * La línea de abajo significa que los datos están harckodeados, cuando
	 * tenga el servicio se tiene que borrar
	 */
	// $scope.laberintos = [{nombre: 'Laberinto 1'},{nombre: 'Laberinto 2'},{nombre:"Laberinto 3"}];
	/*
	 * Al principio en la aplicación no tengo laberintos, la línea tiene que
	 * estar descomentada
	 */


	$http.get("laberintos/1").success(function(data) {
		$scope.laberintos = data
		console.log(data);
	}).error(errorHandler);
	

	this.verDetalle = function(laberinto) {
		$scope.laberintoSeleccionado = laberinto;
		$("#accesoLaberintoModal").modal({});
	};


    function obtenerHabitaciones(laberinto) {
    		var index;
			$scope.habitaciones = [];
			
			for (index = 0; index < laberinto.habitaciones.length; ++index) {

    			$scope.habitaciones.push(aca iria cada habitacion);
    	}		
    }

	function obtenerHabitacionInicial(habitaciones) {
    	$scope.habitacionInicial;

    	for (index = 0; index < habitaciones.length; ++index) {

    			if(habitaciones.esInicial[index] == true) {
    			$scope.habitacionInicial = index;
    		};
    	};		
    };    

	function errorHandler(error) {
		this.notificarError(error.data);
	}
	;
});
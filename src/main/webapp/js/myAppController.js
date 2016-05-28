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
	/*
	 * La línea de abajo significa que los datos están harckodeados, cuando
	 * tenga el servicio se tiene que borrar
	 */
	// $scope.laberintos = [{nombre: 'Laberinto 1'},{nombre: 'Laberinto 2'},{nombre:"Laberinto 3"}];
	/*
	 * Al principio en la aplicación no tengo laberintos, la línea tiene que
	 * estar descomentada
	 */

	 //$scope.habitaciones = [{nombre: 'habi1'}, {nombre: 'habi2'} ];
	//$scope.habitaciones = [];
	 $scope.idUsuario = "1";
	
	$http.get("laberintos/"+ $scope.idUsuario).success(function(data) {
		
		$scope.laberintos = data;
		console.log(data);
	}).error(errorHandler);

	$scope.iniciarLaberinto = function(idLaberinto) {
		$http.get("iniciarLaberinto/"+ $scope.idUsuario +"/" + idLaberinto).success(function(data) {
			$scope.habitaciones = data.laberinto.habitaciones;
			$scope.habitacionActual = $scope.habitaciones[0];
			console.log(data);
		}).error(errorHandler);
	}


	this.verDetalle = function(laberinto) {
		$scope.laberintoSeleccionado = laberinto;
		$("#accesoLaberintoModal").modal({});

		console.log($scope.laberintoSeleccionado);
	};

	// function obtenerAcciones(habitacion) {
 //    	libros.forEach(function(libro){
 //    		if(self.autores.indexOf(libro.autor) == -1) {
 //    			this.acciones.push(accion);
 //    		};
 //    	});
 //    };

	function errorHandler(error) {
		this.notificarError(error.data);
	}
	;
});
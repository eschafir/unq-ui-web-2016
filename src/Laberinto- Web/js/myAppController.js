var app = angular.module("laberintoApplication", []);

app.controller('laberintoController', function($scope){
	/* La línea de abajo significa que los datos están harckodeados, cuando tenga el servicio se tiene
	   que borrar
	*/
	$scope.laberintos = [{nombre: 'Laberinto 1'},{nombre: 'laberinto 2'},{nombre:"Laberinto 3"}];

	/* Al principio en la aplicación no tengo laberintos, la línea tiene que estar descomentada */
	/* $scope.laberintos = []; */

	// VER DETALLE
	this.laberintoSeleccionado = null;

	this.verDetalle = function(laberinto) {
		this.laberintoSeleccionado = laberinto;
		$("#accesoLaberintoModal").modal({});
	};

	function errorHandler(error) {
		this.notificarError(error.data);
	}
	;
});
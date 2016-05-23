var app = angular.module("laberintoApplication", []);

app.controller('laberintoController', function($scope){
	$scope.laberintos = [{nombre: 'Laberinto 1'},{nombre: 'laberinto 2'},{nombre:"Laberinto 3"}];

});
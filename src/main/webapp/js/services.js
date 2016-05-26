var app = angular.module("laberintoApplication", []); 

app.factory('laberintosService', function($resource) {
    return $resource('/laberintos/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true}
    });
});


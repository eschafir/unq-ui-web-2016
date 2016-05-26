app.factory('Laberintos', function($resource) {
    return $resource('/laberintos/:id', {'id': '@id'}, {
    	'query': { method: 'GET', isArray: true}
    });
});
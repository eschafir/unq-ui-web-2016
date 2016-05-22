angular.module("myAppController", [])
	.controller('homeController', ['$scope','$modal',function($scope,$modal)
	{	
	
	/**
	* Abre la modal
	*/
	$scope.openModal = function () 
	{
	    var modalInstance = $modal.open({
		    templateUrl:'accesoLaberintoModal.html'
		    }
	    });
	}
}]);
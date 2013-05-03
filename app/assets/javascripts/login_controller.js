var root = typeof global !== "undefined" && global !== null ? global : window;

root.LoginCtrl = function ($scope, $location, LogService) {
	$scope.showError = false;
	$scope.submit = function () {
		LogService.login($scope.username, $scope.password).then(function (success) {
			$scope.showError = !success;
		});
	};
};

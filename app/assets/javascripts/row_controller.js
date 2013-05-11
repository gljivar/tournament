var root = typeof global !== "undefined" && global !== null ? global : window;

root.RowCtrl = function ($rootScope, $scope, $location) {
	$rootScope.$on('$viewContentLoaded', function() {
		var path = $location.path();
		if (path === '/repeater' || path === '/field_fights') {
			$scope.viewClass = 'span12';
		        $scope.sidebarClass = '';
			$scope.sidebarHide = true;
		} else {
			$scope.viewClass = 'span9';
		        $scope.sidebarClass = 'span3';
			$scope.sidebarHide = false;
		}

		if (path === '/repeater') {
                        $scope.qrCodeShow = true;
                } else {
                        $scope.qrCodeShow = false;
                }
	});
};

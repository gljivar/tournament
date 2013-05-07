var root = typeof global !== "undefined" && global !== null ? global : window;

root.NavigationCtrl = function ($scope, $http, $location, LogService, TournamentGlobal) {
	//collapse nav bar after click
	$('.nav-collapse a[class!=dropdown-toggle]').on('click', function () {
		$('.navbar .nav-collapse')
			.removeClass('in')
			.removeClass('collapse')
			.removeAttr('style')
		;
	});
	//fix height
	$('.nav-collapse a[class=dropdown-toggle]').on('click', function (e) {
		e.preventDefault();
		var $this = $(this),
			$parent = $this.parents('.dropdown:first'),
			menuHeight = $parent.find('.dropdown-menu').innerHeight(),
			mainMenuHeight = $('.navbar .nav-collapse').height(),
			isOpen = $parent.hasClass('open');
		
		if (!isOpen) {
			$('.navbar .nav-collapse').height(mainMenuHeight+menuHeight);
		} else {
			$('.navbar .nav-collapse').height(mainMenuHeight-menuHeight-2); //TODO: remove HACK!
		}
	});
	
	$scope.TournamentGlobal = TournamentGlobal;
	$scope.success = true;
	
	$scope.goToView = function (view) {
		$location.path(view);
	};
	$scope.logout = function () {
		$scope.success = LogService.logout();
		$location.path('/');
	};
};
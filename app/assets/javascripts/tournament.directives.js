angular.module('tournament.directives', ['http-auth-interceptor'])
	.directive('authTournament', function ($location) {
		var previousPath;
		return {
			restrict: 'C',
			link: function (scope, elem, attrs) {
				scope.$on('event:auth-loginRequired', function () {
					previousPath = $location.path();
					//console.log($location, previousPath);
					$location.path('/login');
				});

				scope.$on('event:auth-loginConfirmed', function () {
					if (previousPath !== undefined && previousPath !== '/login') {
						$location.path(previousPath);
						//console.log('redirect', previousPath);
					} else {
						$location.path('/');
						//console.log('redirect', '/');
					}
				});
			}
		};
	});

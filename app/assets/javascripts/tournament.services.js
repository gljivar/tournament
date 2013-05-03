angular.module('tournament.services', ['ngResource'])
	.factory('LogService', function ($http, $q, $location, authService, TournamentGlobal) {
		return {
			login: function (username, password) {
				var deferred = $q.defer();

				$http.post('/sessions/login', {"username": username, "password": password}).success(function (data, status, headers, config) {
					deferred.resolve(true);
					authService.loginConfirmed();
					TournamentGlobal.userId = data.user_id;
					TournamentGlobal.username = data.username;
					TournamentGlobal.loggedIn = true;
					console.log("Ulogiran korisnik");
				}).error(function (data, status, headers, config) {
					TournamentGlobal.userId = undefined;
					TournamentGlobal.username = undefined;
					TournamentGlobal.loggedIn = false;
					deferred.resolve(false);
					console.log("Krivi podaci!");
				});
				return deferred.promise;
			},
			logout: function () {
				$http.post('/sessions/logout').success(function () {
					TournamentGlobal.userId = undefined;
					TournamentGlobal.username = undefined;
					TournamentGlobal.loggedIn = false;
					console.log('Odlogiran korisnik');
				});
			}
		};
	})
	.factory('TournamentGlobal', function ($http) {
		var TournamentGlobal = {
			userId: undefined,
			username: undefined,
			loggedIn: true
		};
		
		$http.get('/sessions/login').success(function (data, status, headers, config) {
			TournamentGlobal.userId = data.user_id;
			TournamentGlobal.username = data.username;
			TournamentGlobal.loggedIn = data.logged_in;
		});
		
		return TournamentGlobal;
	});

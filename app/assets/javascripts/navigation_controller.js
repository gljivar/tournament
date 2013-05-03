var root = typeof global !== "undefined" && global !== null ? global : window;

root.NavigationCtrl = function ($scope, $http, $location, LogService, TournamentGlobal) {
                $scope.TournamentGlobal = TournamentGlobal;
                $scope.success = true;
                $scope.goToView = function (view) {
                        $location.path(view);
                };
                $scope.logout = function () {
                        $scope.success = LogService.logout();
                        $location.path('/');
                };
                //$scope.myPlaylists = function () {
                //        $location.path('/user/' + ListUp.userId + '/playlists');
                //};

                //$scope.myProfile = function () {
                //        $location.path('/users/' + ListUp.userId);
                //};
        };


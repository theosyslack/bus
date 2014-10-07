var app = angular.module("MyApp", ['angularMoment']);

app.controller("BusCtrl", function($scope, $http) {
  $http.get('buses.json').
    success(function(data, status, headers, config) {
      $scope.buses = data['bustime_response'].prd;

      $scope.until = function (theMoment){
        time = theMoment;
        prettyTime = moment(time, "YYYYMMDD hh:mm").fromNow();
        return prettyTime
      };

      $scope.now = moment().format('hh:mm');
    }).
    error(function(data, status, headers, config) {
      // log error
      console.log("error")
    });

  
});
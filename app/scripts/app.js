'use strict';

angular.module('priorityQueueApp', [
  'ngAnimate',
  'ngCookies',
  'ngResource',
  'ngRoute',
  'ngSanitize',
  'ngTouch',
  'ui.router'
]).config(function(
  $stateProvider,
  $urlRouterProvider
) {

  $stateProvider.state('board', {

    url: '/',

    views: {

      '@': {
        templateUrl: 'views/board.html',
        controller: 'BoardCtrl'
      },

      'queue@board': {
        templateUrl: 'views/queue.html',
        controller: 'QueueCtrl'
      },

      'priorities@board': {
        templateUrl: 'views/priorities.html',
        controller: 'PrioritiesCtrl'
      },

      'ranked@board': {
        templateUrl: 'views/ranked.html',
        controller: 'RankedCtrl'
      }

    }

  });

  $urlRouterProvider.otherwise('/');

});

'use strict';

angular.module('priorityQueueApp').controller('BoardCtrl', function(
  $scope,
  ItemsResource
) {

  _.extend($scope, {

    id: 2,

    moving: {},

    toggleMoving: function(item) {
      var id = _.deepGet($scope.moving, 'item.id');

      if (id === item.id) {
        delete $scope.moving.item;

        return;
      }

      $scope.moving.item = item;
    },

    isMoving: function(item) {
      return _.deepGet($scope.moving, 'item.id') === item.id;
    },

    anyMoving: function() {
      return _.has($scope.moving, 'item');
    },

    getItems: function() {
      return ItemsResource.query().$promise.then(function(items) {
        $scope.items = items;
      });
    },

    _init: function() {
      $scope.getItems();
    }

  })._init();

});

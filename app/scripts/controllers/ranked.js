'use strict';

angular.module('priorityQueueApp').controller('RankedCtrl', function(
  $scope,
  RankedItemsResource
) {

  _.extend($scope, {

    addItem: function(item) {
      RankedItemsResource.save(item).$promise.then(function() {
        Object.keys(item).forEach(function(key) {
          delete item[key];
        });

        return $scope.getItems();
      });
    },

    getItems: function() {
      RankedItemsResource.query().$promise.then(function(items) {
        $scope.items = items;
      });
    },

    _init: function() {
      $scope.getItems();
    }

  })._init();

});

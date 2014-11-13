'use strict';

angular.module('priorityQueueApp').controller('QueueCtrl', function(
  $scope,
  ItemsResource
) {

  _.extend($scope, {

    addItem: function(item) {
      ItemsResource.save(item).$promise.then(function() {
        Object.keys(item).forEach(function(key) {
          delete item[key];
        });

        return $scope.getItems();
      });
    },

    queueItems: function(item) {
      return !_.has(item.priorities, $scope.id);
    }

  });

});

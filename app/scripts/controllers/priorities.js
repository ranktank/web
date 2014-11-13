'use strict';

angular.module('priorityQueueApp').controller('PrioritiesCtrl', function(
  $scope,
  ItemsResource,
  PrioritizedItemsResource
) {

  _.extend($scope, {

    prioritize: function(item, moved) {
      if (moved) {
        var params = _.pick(moved, 'id');
        var data = {
          id: $scope.id,
          value: item.priorities[$scope.id]
        };

        PrioritizedItemsResource.save(params, data).$promise.then(function() {
          return $scope.getItems();
        });
      }
    },

    prioritizedItems: function(item) {
      return _.has(item.priorities, $scope.id);
    },

    priority: function(item) {
      return item.priorities[$scope.id];
    }

  });

});

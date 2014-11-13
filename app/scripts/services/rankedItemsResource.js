'use strict';

angular.module('priorityQueueApp').factory('RankedItemsResource', function (
  $resource,
  api
) {
  return $resource(_.template('<%= root %>/rankedItems')(api));
});

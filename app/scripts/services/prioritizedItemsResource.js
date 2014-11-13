'use strict';

angular.module('priorityQueueApp').factory('PrioritizedItemsResource', function (
  $resource,
  api
) {
  return $resource(_.template('<%= root %>/items/:id/priority')(api));
});

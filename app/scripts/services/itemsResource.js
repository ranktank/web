'use strict';

angular.module('priorityQueueApp').factory('ItemsResource', function (
  $resource,
  api
) {
  return $resource(_.template('<%= root %>/items')(api));
});

Backbone = require 'backbone'
Backbone.$ = require 'jquery'
require 'jquery-ui'

Item = require './models/item'
Items = require './models/items'
ListContainerView = require './views/listContainer'

tank = new Items
rank = new Items
ranked = new Items

new ListContainerView
  el: '#tank'
  collection: tank
  title: 'Tank'
  addItems: true
  list:
    sortable:
      connectWith: '#rank .list'

new ListContainerView
  el: '#rank'
  collection: rank
  title: 'Rank'
  list:
    sortable:
      connectWith: '#tank .list'

new ListContainerView
  el: '#ranked'
  collection: ranked
  title: 'Ranked'

tank.fetch()

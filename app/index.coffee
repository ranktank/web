Backbone = require 'backbone'
Backbone.$ = require 'jquery'
require 'jquery-ui'

config = require './config'

Item = require './models/item'
Items = require './models/items'
ListContainerView = require './views/listContainer'

tank = new Items
rank = new Items
ranked = new Items

rank.url = "#{config.api}/ranks/user/#{config.userId}"
ranked.url = "#{config.api}/rankedItems"

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
    itemId: 'rank'
    sortable:
      connectWith: '#tank .list'

new ListContainerView
  el: '#ranked'
  collection: ranked
  title: 'Ranked'
  list:
    itemId: 'ranked'

items.fetch() for items in [tank, rank, ranked]

Backbone = require 'backbone'
Backbone.$ = require 'jquery'
require 'jquery-ui'

Item = require './models/item'
Items = require './models/items'
ListView = require './views/list'

items = new Items
tank = new Items
ranked = new Items

new ListView
  collection: items
  sortable:
    connectWith: '#tank .list'
.$el.appendTo '#items'

new ListView
  collection: tank
  sortable:
    connectWith: '#items .list'
.$el.appendTo '#tank'

new ListView
  collection: ranked
.$el.appendTo '#ranked'

items.add [
  {id: 1, title: 'test'}
  {id: 2, title: 'other'}
  {id: 3, title: 'name'}
  {id: 4, title: 'last'}
]

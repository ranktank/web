Backbone = require 'backbone'
Item = require './item'
config = require '../config'

module.exports = Backbone.Collection.extend

  url: "#{config.api}/items"

  model: Item

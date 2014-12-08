Backbone = require 'backbone'
Item = require './item'

module.exports = Backbone.Collection.extend

  model: Item

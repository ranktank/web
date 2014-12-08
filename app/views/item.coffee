Backbone = require 'backbone'
Mustache = require 'mustache'
template = require('../templates').item

module.exports = Backbone.View.extend

  initialize: ->
    @render()

  events:
    moveitem: 'getModel'

  template: (view) ->
    Mustache.render template, view

  render: ->
    @$el.html @template @model.toJSON()

    return this

  getModel: ->
    @model

_ = require 'underscore'
Backbone = require 'backbone'
Mustache = require 'mustache'
AddItemView = require './addItem'
ListView = require './list'
template = require('../templates').listContainer

module.exports = Backbone.View.extend

  initialize: (options = {}) ->
    @render options

    list = @$el.find '.list-container'

    if options.addItems
      new AddItemView
        collection: @collection
      .$el.appendTo list

    listOptions = _.extend collection: @collection, options.list

    new ListView listOptions
    .$el.appendTo list

  template: (view) ->
    Mustache.render template, view

  render: (options) ->
    @$el.html @template options

_ = require 'underscore'
Backbone = require 'backbone'
Mustache = require 'mustache'
template = require('../templates').addItem

module.exports = Backbone.View.extend

  initialize: ->
    @render()

  events: ->
    submit: 'submit'

  template: (view) ->
    Mustache.render template, view

  render: ->
    @$el.html @template id: _.uniqueId()

    return this

  submit: (event) ->
    event.preventDefault()

    input = @$el.find 'input'
    title = input.val()
    input.val ''

    if title
      item = title: title
      options = wait: true
      @collection.create item, options

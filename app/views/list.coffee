Backbone = require 'backbone'
ItemView = require './item'

module.exports = Backbone.View.extend

  tagName: 'ul'
  className: 'list list-group'

  initialize: (options = {}) ->
    @idPrefix = 'item-'

    @collection.on
      add: @addItem.bind this

    if options.sortable
      @$el.sortable options.sortable
        .on
          sortremove: @sortRemoveItem.bind this
          sortreceive: @sortAddItemElement.bind this

  events:
    moveitem: 'addItemModel'

  elementId: (item) ->
    "#{@idPrefix}#{item.id}"

  itemId: (element) ->
    Number element.attr('id').replace @idPrefix, ''

  addItem: (item) ->
    existing = @$el.find "##{@elementId item}"

    if !existing.length
      itemView = new ItemView
        model: item
        id: @elementId item
        tagName: 'li'
        className: 'list-item list-group-item'

      @$el.append itemView.$el

  sortRemoveItem: (event, ui) ->
    @collection.remove id: @itemId ui.item

  # handled by receiving list
  sortAddItemElement: (event, ui) ->
    ui.item.trigger 'moveitem', at: ui.item.index()

  addItemModel: (event, at) ->
    @collection.add event.result, at

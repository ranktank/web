fs = require 'fs'

'''
paths cannot contain runtime variables as it would require readFileSync to run
in the browser which is not possible.
'''
module.exports =
  item: fs.readFileSync "#{__dirname}/item.mustache", 'utf-8'
  addItem: fs.readFileSync "#{__dirname}/addItem.mustache", 'utf-8'
  listContainer: fs.readFileSync "#{__dirname}/listContainer.mustache", 'utf-8'

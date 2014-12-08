fs = require 'fs'

'''
paths cannot contain runtime variables as it would require readFileSync to run
in the browser which is not possible.
'''
module.exports =
  item: fs.readFileSync "#{__dirname}/item.mustache", 'utf-8'

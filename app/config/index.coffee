_ = require 'underscore'
base = require './base'
envs =
  development: require './development'
  production: require './production'

env = process.env.NODE_ENV || 'production'

module.exports = _.extend base, envs[env]

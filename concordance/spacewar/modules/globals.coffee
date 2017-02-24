


global.c = console.log.bind console
global.async = require 'async'
global.Imm = require 'immutable'
global.shortid = require 'shortid'
global._ = require 'lodash'

global.assign = _.assign
global.includes = _.includes
global.keys = _.keys

c 'hi from globals'

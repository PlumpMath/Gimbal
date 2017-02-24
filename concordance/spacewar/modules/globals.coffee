


global.c = console.log.bind console
global.async = require 'async'
global.Imm = require 'immutable'
global.shortid = require 'shortid'
global._ = require 'lodash'

global.assign = _.assign
global.includes = _.includes
global.keys = _.keys

global.color = require 'bash-color'


global.map = _.map
global.reduce = _.reduce



global.fs = require 'fs'
global.path = require 'path'
global.http = require 'http'
global.Primus = require 'primus'
global.express = require 'express'
global.cookie_parser = require 'cookie-parser'

global.body_parser = require 'body-parser'

uuid = require 'node-uuid'
global.v4 = uuid.v4.bind uuid

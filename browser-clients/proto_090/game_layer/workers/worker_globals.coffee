


exports.default = ({ self }) ->

    self.c = console.log.bind console
    self.async = require 'async'
    self._ = require 'lodash'
    self._fp = require 'lodash/fp'





require './globals.coffee'

Dispatch = new EE()

exports.default = ->

    reducer = require('./reducer.coffee').default
    side_effects = require('./side_effects').default { Dispatch }

    state = require('./initial_state').default { spacewar_primus }

    Dispatch.on 'new_action', ({ action }) ->
        state = reducer { state, action }
        side_effects { state }

    side_effects { state }
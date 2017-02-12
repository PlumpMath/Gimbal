


Dispatch = new EE()


exports.default = ->

    require('./globals.coffee').default

    state = require('./modules/initial_state.coffee').default

    Dispatch.on 'new_action', ({ action }) ->
        state = reducer { state, action }
        side_effects { state }

    side_effects { state }








EventEmitter = require 'events'
class Emitter extends EventEmitter
Dispatch = new Emitter()

process.setMaxListeners 10000
c 'helloaoeua'

module.exports = ({ cs, env, redis, spacewar_primus }) ->

    require './modules/globals.coffee'

    state = require('./modules/initial_state.coffee').default
        env: env
        spacewar_primus: spacewar_primus
        redis: redis

    reducer = require('./reducer.coffee').default()

    side_effects = require('./side_effects.coffee').default { Dispatch, cs, env }

    Dispatch.on 'new_action', ({ action }) ->
        state = reducer { state, action }
        side_effects { state }

    side_effects { state }

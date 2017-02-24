


arq = {}

arq = assign arq, require('./side_effects/primus_init.coffee').default

<<<<<<< HEAD
arq = assign arq, require('./side_effects/microservices_init.coffee').default

=======
>>>>>>> 2e281670acb19c723eb0ab009208461000516a5a
# arq = assign arq, require('./side_effects/lounger.coffee').default

keys_arq = keys arq

side_effects_f = ({ cs, Dispatch, env }) ->

    dispatch = (opts) ->
        Dispatch.emit 'new_action', { action: opts }

    # side_effects_counter = 0

    ({ cs, state }) ->
        # c side_effects_counter++
        for key_id, desire of state.get('desires').toJS()
            if includes(keys_arq, desire.type) is true
                arq[desire.type] { cs, state, dispatch, desire }
            else
                c 'noop in side-effects with ', desire.type

exports.default = side_effects_f

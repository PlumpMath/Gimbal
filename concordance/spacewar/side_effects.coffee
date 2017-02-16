


arq = {}

arq = assign arq, require('./side_effects/system_primus.coffee').default

arq = assign arq, require('./side_effects/lounger.coffee').default

keys_arq = keys arq

side_effects_f = ({ cs, Dispatch, env }) ->

    dispatch = (opts) ->
        Dispatch.emit 'new_action', { action: opts }

    # counter = 0

    ({ cs, state }) ->
        # c counter++
        for key_id, desire of state.get('desires').toJS()
            if includes(keys_arq, desire.type) is true
                arq[desire.type] { cs, state, dispatch, desire }
            else
                c 'noop in side-effects with ', desire.type

exports.default = side_effects_f

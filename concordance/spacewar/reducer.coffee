


arq = {}

<<<<<<< HEAD
arq = assign arq, require('./reducers/primus_base.coffee').default
=======
arq = assign arq, require('./reducers/infrastructure.coffee').default
>>>>>>> 2e281670acb19c723eb0ab009208461000516a5a

keys_arq = keys arq

reducer_f = ->

    reducer = ({ cs, state, action }) ->
        state = state.setIn ['desires'], Imm.Map({})
        if includes(keys_arq, action.type)
            arq[action.type] { cs, state, action, saga_channel }
        else
            c 'noop in reducer with', action.type
            state

    # saga_channel = ({ cs, state, action, saga_channel }) ->
    #     if includes(keys_arq, action.type)
    #         state = arq[action.type]
    #             cs: cs
    #             state: state
    #             action: action
    #             saga_channel: arguments.callee
    #         state
    #     else
    #         c 'No-Op in saga_channel.'
    #         state

exports.default = reducer_f

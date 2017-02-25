



arq = {}

arq = assign arq, require('./reducers/setup_feedback.coffee').default

keys_arq = keys arq

exports.default = ({ dispatch }) ->

    saga_channel = ({ state, action }) ->
        if includes(keys_arq, action.type)
            state = arq[action.type] { state, action }
            state
        else
            c 'noop in saga channel', action.type
            state


    reducer = ({ state, action }) ->
        # c 'now reducer root with action', action
        state = state.setIn ['desires'], Imm.Map({})
        if includes(keys_arq, action.type)
            state = arq[action.type] { state, action, saga_channel }
            state
        else
            c 'noop in reducer with', action.type
            state

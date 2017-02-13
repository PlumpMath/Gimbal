



arq = {}

# arq = assign arq, require('./reducer/lounge_ufo.coffee')



keys_arq = keys arq

reducer = ({ state, action }) ->
    state = state.setIn ['desires'], Imm.Map({})
    if includes(keys_arq, action.type)
        arq[action.type] { cs, state, action }
    else
        c 'noop in reducer with', action.type
        state

exports.default = reducer







arq = {}



arq['escape_key_press'] = ({ state, action }) ->
    c 'have escape_key_press'

    state







keys_arq = keys arq












gui = (state, action) ->
    c 'state in gui', state.toJS()
    state = state.setIn ['desires'], Imm.Map({})
    if includes(keys_arq, action.type)
        arq[action.type]({ state, action })
    else
        c 'NoOp in guid reducer with', action.type
        state

exports.default = gui

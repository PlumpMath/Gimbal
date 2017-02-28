





arq = {}

keys_arq = keys arq












gui = (state, action) ->

    state = state.setIn ['desires'], Imm.Map({})
    if includes(keys_arq, action.type)
        arq[action.type]({ state, action })
    else
        c 'NoOp in guid reducer with', action.type
        state

exports.default = gui

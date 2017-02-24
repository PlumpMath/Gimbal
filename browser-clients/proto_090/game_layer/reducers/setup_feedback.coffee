



arq = {}










arq['saga_test_one'] = ({ state, action }) ->

    c 'in saga_test_one', action

    state










arq['completed:init:webgl'] = ({ state, action, saga_channel }) ->
    c 'into completed webgl', action.payload
    { gl, canvas, colorLocation } = action.payload

    state = state.set 'canvas', canvas
    state = state.set 'gl', gl
    state = state.set 'colorLocation', colorLocation

    saga =
        type: 'saga_test_one'
        payload: 'null'

    state = saga_channel { state, action: saga }

    state = state.setIn ['desires', shortid()],
        type: 'gl_render'

    state















exports.default = arq





arq = {}

arq['saga_test_one'] = ({ state, action }) ->
    c 'in saga_test_one', action
    state


arq['completed:init:webgl'] = ({ state, action, saga_channel }) ->
    { gl, canvas, colorLocation } = action.payload
    # we could make these global but this is a better pattern for
    # may come a time when multiple canvases and gl windows
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

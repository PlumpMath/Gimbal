



arq = {}


arq['rotate_ship_2_clockwise'] = ({ state, action }) ->
    state.setIn ['s2', 'rota_rad'], state.getIn(['s2', 'rota_rad']) + .1

arq['rotate_ship_2_counterwise'] = ({ state, action }) ->
    state.setIn ['s2', 'rota_rad'], state.getIn(['s2', 'rota_rad']) - .1

arq['delta_thrust_ship_2'] = ({ state }) ->
    state.setIn ['s2_deltas', 'thrust'], state.getIn(['s2_deltas', 'thrust']) + .5

arq['delta_thrust_ship_1'] = ({ state }) ->
    state.setIn ['s1_deltas', 'thrust'], state.getIn(['s1_deltas', 'thrust']) + .5


arq['rotate_ship_1_clockwise'] = ({ state, action }) ->
    state.setIn ['s1', 'rota_rad'], state.getIn(['s1', 'rota_rad']) + .1

arq['rotate_ship_1_counterwise'] = ({ state, action }) ->
    rota_rad = state.getIn ['s1', 'rota_rad']
    rota_rad = rota_rad -= .1
    state = state.setIn ['s1', 'rota_rad'], rota_rad
    state

arq['zero_derivatives'] = ({ state }) ->
    state = state.setIn ['s1_deltas','thrust'], 0
    state = state.setIn ['s2_deltas','thrust'], 0
    state


arq['render_loop_iterate'] = ({ state, action }) ->
    state = state.setIn ['desires', shortid()],
        type: 'gl_render_iteration'
    state

arq['update_ship_state'] = ({ state, action }) ->
    { id, new_state } = action.payload
    state = state.setIn [id], Imm.Map(new_state)
    state

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


arq['render_loop_activated'] = ({ state, action }) ->
    c 'into render_loop_interval'
    { render_loop_interval } = action.payload
    state = state.set 'render_loop_interval', render_loop_interval

    state












exports.default = arq

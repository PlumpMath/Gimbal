




render_factory = ({ gl, colorLocation }) ->
    ({ uni_color, rayy }) ->
        [r, g, b, a] = uni_color
        gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
        gl.uniform4f colorLocation, r, g, b, a
        gl.drawArrays gl.TRIANGLES, 0, (rayy.length / 2)

render_space_stars = require('./render_space_stars.coffee').default
render_ship = require('./ship.coffee').default


# galaxy_rayy = require('./physical_space/stars.coffee').default()
set_ship = require('./physical_space/set_ship.coffee').default()


arq = {}

gl_render = ({ state, dispatch }) ->
    canvas = state.get 'canvas'
    gl = state.get 'gl'
    colorLocation = state.get 'colorLocation'
    render = render_factory { gl, colorLocation }

    render_space_stars { render }




    s1_state = state.get('s1').toJS()
    s1_deltas = state.get('s1_deltas').toJS()
    # c 's1_deltas', s1_deltas

    render_ship
        id: 's1'
        render: render
        dispatch: dispatch
        canvas: canvas
        ship_state: s1_state
        ship_deltas: s1_deltas


    s2_state = state.get('s2').toJS()
    s2_deltas = state.get('s2_deltas').toJS()

    render_ship
        id: 's2'
        render: render
        dispatch: dispatch
        canvas: canvas
        ship_state: s2_state
        ship_deltas: s2_deltas











arq['gl_render_iteration'] = ({ state, dispatch }) ->
    gl_render { state, dispatch }
    dispatch
        type: 'zero_derivatives'

arq['gl_render'] = ({ state, dispatch }) ->
    render_loop_interval = setInterval ->
        dispatch
            type: 'render_loop_iterate'
    , 10
    dispatch
        type: 'render_loop_activated'
        payload: { render_loop_interval }





exports.default = arq




vend = ({ rayy, uni_color, gl, colorLocation }) ->
    [r, g, b, a] = uni_color
    cardinal = Math.floor(rayy.length / 2)
    gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
    gl.uniform4f colorLocation, r, g, b, a
    gl.drawArrays gl.TRIANGLES, 0, cardinal


gl_tri = ({})


galaxy_rayy = require('./physical_space/stars.coffee').default()

set_ship = require('./physical_space/set_ship.coffee').default()

arq = {}


gl_render = ({ state, dispatch }) ->
    canvas = state.get 'canvas'
    gl = state.get 'gl'
    colorLocation = state.get 'colorLocation'
    s1_state = state.get 's1'
    s1_deltas = state.get 's1_deltas'

    c 's1_state', s1_state

    bk_rayy_3 = new Float32Array [
        0, 0,
        0, 1000,
        2000, 0
        2000, 0,
        0, 1000,
        2000, 1000
    ]



    draw_space = " draw a black background "
    vend
        colorLocation: colorLocation
        gl: gl
        rayy: bk_rayy_3
        uni_color: [0, 0, 0, 1]



    draw_stars = " draw a bunch of stars"
    for star_rayy_2, idx in galaxy_rayy
        do (star_rayy_2, idx) =>
            vend
                rayy: star_rayy_2
                uni_color: [1, Math.random(), 1, 1]
                gl: gl
                colorLocation: colorLocation


    draw_ship_1 = " draw the first ship"

    { thrust, rota_rad } = s1_deltas.toJS()
    c 's1_deltas', s1_deltas
    c 'thrust', thrust
    c 'rota_rad', rota_rad
    c 'cos', cos

    deltas =
        del_rota_rad: rota_rad
        del_vel_x: cos(s1_state.toJS().rota_rad) * thrust
        del_vel_y: sin(s1_state.toJS().rota_rad) * thrust
        del_time: .1


    { new_state: ship_1_state, ship_payload: ship_1_payload } = set_ship
        ship_state: s1_state.toJS()
        deltas: deltas
        canvas: canvas
        dispatch: dispatch

    c 'ship_1_payload', ship_1_payload
    # gl.bufferData gl.ARRAY_BUFFER, ship_1_payload, gl.STATIC_DRAW
    vend
        colorLocation: colorLocation
        gl: gl
        rayy: ship_1_payload
        uni_color: [0, .9, .7, 1]


    draw_ship_2 = 'draw the second ship'
    # gl.bufferData gl.ARRAY_BUFFER, ship_2_payload, gl.STATIC_



arq['gl_render_iteration'] = ({ state, dispatch }) ->
    gl_render { state, dispatch }

arq['gl_render'] = ({ state, dispatch }) ->
    render_loop_interval = setInterval ->
        dispatch
            type: 'render_loop_iterate'
    , 10


    dispatch
        type: 'render_loop_activated'
        payload: { render_loop_interval }





exports.default = arq

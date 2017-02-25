


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




arq['gl_render'] = ({ state, dispatch }) ->

    gl = state.get 'gl'
    colorLocation = state.get 'colorLocation'
    s1_state = state.get 's1'

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
    # gl.bufferData gl.ARRAY_BUFFER, bk_rayy_3, gl.STATIC_DRAW
    # gl.uniform4f colorLocation, 0, 0, 0, 1
    # gl.drawArrays gl.TRIANGLES, 0, 6


    draw_stars = " draw a bunch of stars"
    for star_rayy_2, idx in galaxy_rayy
        do (star_rayy_2, idx) =>
            vend
                rayy: star_rayy_2
                uni_color: [1, Math.random(), 1, 1]
                gl: gl
                colorLocation: colorLocation



    draw_ship_1 = " draw the first ship"
    # { new_state: ship_1_state, ship_payload: ship_1_payload } = set_ship

    # gl.bufferData gl.ARRAY_BUFFER, ship_1_payload, gl.STATIC_DRAW
    gl.uniform4f colorLocation, 0, .9, .7, 1
    gl.drawArrays gl.TRIANGLES, 0, 3


    draw_ship_2 = 'draw the second ship'
    # gl.bufferData gl.ARRAY_BUFFER, ship_2_payload, gl.STATIC_




exports.default = arq

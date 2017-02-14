


vend = ({ rayy, uni_color }) ->
    [r, g, b, a] = unicolor
    cardinal = Math.floor(rayy.length / 2)
    gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
    gl.uniform4f colorLocation r, g, b, a
    gl.drawArrays gl.TRIANGLES, 0, cardinal


gl_tri = ({})



arq = {}


arq['gl_render'] = ({ state, dispatch, desire }) ->
    { payload } = desire
    { ship_1_payload } = payload


    draw_space = " draw a black background "
    vend
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

            # gl.bufferData gl.ARRAY_BUFFER, star_rayy_2, gl.STATIC_DRAW
            # gl.uniform4f colorLocation, 1, Math.random(), 1, 1
            # gl.drawArrays gl.TRIANGLES, 0, 3


    draw_ship_1 = " draw the first ship"
    gl.bufferData gl.ARRAY_BUFFER, ship_1_payload, gl.STATIC_DRAW
    gl.uniform4f colorLocation, 0, .9, .7, 1
    gl.drawArrays gl.TRIANGLES, 0, 3


    draw_ship_2 = 'draw the second ship'
    gl.bufferData gl.ARRAY_BUFFER, ship_2_payload, gl.STATIC_







exports.default = arq

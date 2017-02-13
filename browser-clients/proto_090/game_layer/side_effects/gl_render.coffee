



gl_tri = ({})



arq = {}


arq['gl_render'] = ({ state, dispatch, desire }) ->
    { payload } = desire


    draw_space = " draw a black background "

    gl.bufferData gl.ARRAY_BUFFER, bk_rayy_3, gl.STATIC_DRAW
    gl.uniform4f colorLocation, 0, 0, 0, 1
    gl.drawArrays gl.TRIANGLES, 0, 6




exports.default = arq

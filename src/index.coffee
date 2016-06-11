require './globals.coffee'
document.getElementsByTagName('body')[0].style.overflow = 'hidden'

vertex_shader_source = require('./shaders/vertex_shader_001_.glsl')
fragment_shader_source = require('./shaders/fragment_shader_000_.glsl')

canvas = document.getElementById('canvas_000')
canvas.width = window.innerWidth
canvas.height = window.innerHeight
# canvas.width = canvas.clientWidth
# canvas.height = canvas.clientHeight
gl = canvas.getContext 'experimental-webgl'#, preserveDrawingBuffer: true

fragment_shader = get_shader(gl, fragment_shader_source, gl.FRAGMENT_SHADER, 'FRAGMENT')
vertex_shader = get_shader(gl, vertex_shader_source, gl.VERTEX_SHADER, 'VERTEX')
# gl.viewport(0, 0, window.innerWidth, window.innerHeight)

# program = createProgramFromScripts gl, [vertex_shader, fragment_shader]

program = gl.createProgram()
gl.attachShader program, vertex_shader
gl.attachShader program, fragment_shader
gl.linkProgram program
gl.useProgram program


colorLocation = gl.getUniformLocation program, "u_color"
resolutionLocation = gl.getUniformLocation(program, "u_resolution")
gl.uniform2f(resolutionLocation, canvas.width, canvas.height)
positionLocation = gl.getAttribLocation program, "a_position"

buffer = gl.createBuffer()
gl.bindBuffer gl.ARRAY_BUFFER, buffer

gl.enableVertexAttribArray positionLocation
gl.vertexAttribPointer positionLocation, 2, gl.FLOAT, false, 0, 0


counter = 0


t_mat_000 = [
    1, 0, 0,
    0, 1, 0,
    5, 5, 1
]


t_mat_001 = ->
    mod = counter % 200
    # switch mod
    if mod < 50
        x_offset = 5
        y_offset = 5
    else if mod > 50 and mod < 100
        x_offset = 5
        y_offset = -5
    else if mod > 100 and mod < 150
        x_offset = -5
        y_offset = -5
    else
        x_offset = -5
        y_offset = 5

    return [
        1, 0, 0,
        0, 1, 0,
        x_offset, y_offset, 1
    ]




set_ship_001 = (gl, old_pos) ->
    t_mat = t_mat_001()
    # c t_mat
    { 0: x, 1: y } = new_pos = vec2.transformMat3 vec2.create(), old_pos, t_mat
    rayy = new Float32Array [
        x, y,
        x - 15, y + 15,
        x + 15, y + 15
    ]
    gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
    return new_pos

random_int = (range) ->
    return Math.floor(Math.random() * range)

random_int_negpos = (range) ->
    if Math.random() > .5
        return Math.floor(Math.random() * range)
    else
        return -(Math.floor(Math.random() * range))




game_loop = (gl, set_ship) ->
    ship_pos = [300, 300]
    return ->
        ship_pos = set_ship(gl, ship_pos)
        gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
        gl.drawArrays gl.TRIANGLES, 0, 3




looper = game_loop(gl, set_ship_001)
interval = setInterval ->
    counter++
    if counter < 1500
        looper()
    else
        clearInterval interval
, 10

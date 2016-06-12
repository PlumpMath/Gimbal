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

delta_thrust = 0
delta_rota_rad = 0



document.addEventListener 'keydown', (e) ->
    switch e.keyCode
        when 37
            delta_rota_rad = delta_rota_rad - .25
        when 39
            delta_rota_rad = delta_rota_rad + .25
        when 38
            delta_thrust = delta_thrust + .5

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


set_ship_002 = ({gl, ship_state, deltas}) ->

    { del_vel_x, del_vel_y, del_rota_rad, shots_fired, del_time } = deltas
    { pos_x, pos_y, vel_x, vel_y, rota_rad } = ship_state


    new_vel_x = vel_x + del_vel_x
    new_vel_y = vel_y + del_vel_y
    new_rota_rad = rota_rad + del_rota_rad
    new_pos_x = pos_x + (del_time * new_vel_x)
    new_pos_y = pos_y + (del_time * new_vel_y)

    new_state =
        pos_x : new_pos_x
        pos_y : new_pos_y,
        vel_x : new_vel_x
        vel_y : new_vel_y
        rota_rad : new_rota_rad



    translation_t = [
        1, 0, 0,
        0, 1, 0,
        new_pos_x, new_pos_y, 1
    ]


    # we could just use a Mat2 but may want to compose later
    rotation_t = [
        cos(new_rota_rad), sin(new_rota_rad), 0
        -(sin(new_rota_rad)), cos(new_rota_rad), 0
        0, 0, 1
    ]

    composed_t = mat3.multiply mat3.create, translation_t, rotation_t

    bow = [12, 0]
    port = [-3, 5]
    starboard = [-3, -5]

    new_bow = vec2.transformMat3 vec2.create(), bow, composed_t
    new_port = vec2.transformMat3 vec2.create(), port, composed_t
    new_starboard = vec2.transformMat3 vec2.create(), starboard, composed_t

    rayy = new Float32Array [
        new_bow[0], new_bow[1],
        new_port[0], new_port[1]
        new_starboard[0], new_starboard[1]
    ]

    gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
    return new_state







    # apply acceleration after rotation ? or before ? or averaged ?
    # after is easiest


    gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
    return new_state

random_int = (range) ->
    return Math.floor(Math.random() * range)

random_int_negpos = (range) ->
    if Math.random() > .5
        return Math.floor(Math.random() * range)
    else
        return -(Math.floor(Math.random() * range))

change_velocity_000 = (old_vel_vec, delta_vec) ->
    return [old_vel_vec[0] + delta_vec[0], old_vel_vec[1] + delta_vec[1]]



game_loop = (gl, set_ship) ->
    ship_pos = [300, 300]
    ship_vel = [0, 0]
    return ->
        ship_pos = set_ship(gl, ship_pos)
        gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
        gl.drawArrays gl.TRIANGLES, 0, 3

game_loop_001 = (gl, set_ship) ->
    ship_state =
        pos_x: 300
        pos_y: 300
        vel_x: .5
        vel_y: .5
        rota_rad: 0
    # deltas =
    #     del_vel_x: 0
    #     del_vel_y: 0
    #     del_rota_rad: 0
    #     shots_fired: 0
    #     del_time: .1
    return ->

        deltas =
            del_rota_rad: delta_rota_rad
            del_vel_x: cos(ship_state.rota_rad) * delta_thrust
            del_vel_y: sin(ship_state.rota_rad) * delta_thrust
            del_time: .1

        # c deltas

        ship_state = set_ship({gl, ship_state, deltas})
        delta_rota_rad = 0
        delta_thrust = 0

        gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
        gl.drawArrays gl.TRIANGLES, 0, 3



looper = game_loop_001(gl, set_ship_002)
# looper = game_loop(gl, set_ship_002)
interval = setInterval ->
    counter++
    if counter < 15000
        looper()
    else
        clearInterval interval
, 10

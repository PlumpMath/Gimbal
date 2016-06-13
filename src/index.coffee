require './globals.coffee'

document.getElementsByTagName('body')[0].style.overflow = 'hidden'
vertex_shader_source = require('./shaders/vertex_shader_001_.glsl')
fragment_shader_source = require('./shaders/fragment_shader_000_.glsl')

canvas = document.getElementById('canvas_000')
canvas.width = window.innerWidth
canvas.height = window.innerHeight
gl = canvas.getContext 'experimental-webgl'  #, preserveDrawingBuffer: true

fragment_shader = get_shader(gl, fragment_shader_source, gl.FRAGMENT_SHADER, 'FRAGMENT')
vertex_shader = get_shader(gl, vertex_shader_source, gl.VERTEX_SHADER, 'VERTEX')

program = gl.createProgram()
gl.attachShader program, vertex_shader
gl.attachShader program, fragment_shader
gl.linkProgram program
gl.useProgram program

colorLocation = gl.getUniformLocation program, "u_color"
resolutionLocation = gl.getUniformLocation(program, "u_resolution")
gl.uniform2f(resolutionLocation, canvas.width, canvas.height)

buffer = gl.createBuffer()
gl.bindBuffer gl.ARRAY_BUFFER, buffer

positionLocation = gl.getAttribLocation program, "a_position"
gl.enableVertexAttribArray positionLocation
gl.vertexAttribPointer positionLocation, 2, gl.FLOAT, false, 0, 0

counter = 0
delta_thrust = 0
delta_rota_rad = 0

ship2_delta_thrust = 0
ship2_delta_rota_rad = 0

document.addEventListener 'keydown', (e) ->

    switch e.keyCode
        when 81
            ship2_delta_rota_rad -= .25
        when 75
            ship2_delta_rota_rad += .25
        when 74
            ship2_delta_thrust += .5
        when 37
            delta_rota_rad = delta_rota_rad - .25
        when 39
            delta_rota_rad = delta_rota_rad + .25
        when 38
            delta_thrust = delta_thrust + .5

set_ship_002 = ({gl, ship_state, deltas}) ->
    c 'ship_state', ship_state
    { del_vel_x, del_vel_y, del_rota_rad, shots_fired, del_time } = deltas
    { pos_x, pos_y, vel_x, vel_y, rota_rad } = ship_state
    new_vel_x = vel_x + del_vel_x
    new_vel_y = vel_y + del_vel_y
    new_rota_rad = rota_rad + del_rota_rad
    cursor_x = (pos_x + (del_time * new_vel_x)) % canvas.width
    new_pos_x = if cursor_x > 0 then cursor_x else canvas.width - cursor_x

    cursor_y = (pos_y + (del_time * new_vel_y)) % canvas.height
    new_pos_y = if cursor_y > 0 then cursor_y else canvas.height - cursor_y
    new_state =
        pos_x : new_pos_x
        pos_y : new_pos_y
        vel_x : new_vel_x
        vel_y : new_vel_y
        rota_rad : new_rota_rad



    translation_t = [
        1, 0, 0,
        0, 1, 0,
        new_pos_x, new_pos_y, 1
    ]
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

random_int = (range) ->
    return Math.floor(Math.random() * range)

game_loop_001 = (gl, set_ship) ->
    ship_state =
        pos_x: 300
        pos_y: 300
        vel_x: .5
        vel_y: .5
        rota_rad: 0

    ship_2 =
        pos_x: 800
        pos_y: 300
        vel_x: .5
        vel_y: .5
        rota_rad: 0
    return ->
        deltas =
            del_rota_rad: delta_rota_rad
            del_vel_x: cos(ship_state.rota_rad) * delta_thrust
            del_vel_y: sin(ship_state.rota_rad) * delta_thrust
            del_time: .1
        deltas2 =
            del_rota_rad: ship2_delta_rota_rad
            del_vel_x: cos(ship_2.rota_rad) * ship2_delta_thrust
            del_vel_y: sin(ship_2.rota_rad) * ship2_delta_thrust
            del_time: .1

        ship_state = set_ship({gl, ship_state, deltas})
        delta_rota_rad = 0
        delta_thrust = 0
        gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
        gl.drawArrays gl.TRIANGLES, 0, 3
        ship_2 = set_ship({gl, ship_state: ship_2, deltas: deltas2})
        gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
        gl.drawArrays gl.TRIANGLES, 0, 3
        ship2_delta_thrust = 0
        ship2_delta_rota_rad = 0



looper = game_loop_001(gl, set_ship_002)
interval = setInterval ->
    counter++
    if counter < 15000
        looper()
    else
        clearInterval interval
, 10

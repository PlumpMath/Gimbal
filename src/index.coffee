require './globals.coffee'

{ gl, canvas, colorLocation } = require './gl_setup/index.coffee'

counter = 0

delta_thrust = 0
delta_rota_rad = 0
torpedo_fired = false

ship2_delta_thrust = 0
ship2_delta_rota_rad = 0
ship2_torpedo_fired = false

# require './controls/keyboard_caputure'

# require('./controls/keyboard_capture_000_.coffee')({
#     delta_thrust, delta_rota_rad, torpedo_fired,
#     ship2_torpedo_fired, ship2_delta_thrust, ship2_delta_rota_rad
#     })


document.addEventListener 'keydown', (e) ->
    # c e.keyCode
    switch e.keyCode
        when 88, 81
            ship2_delta_rota_rad -= .1
        when 86, 75
            ship2_delta_rota_rad += .1
        when 67, 74
            ship2_delta_thrust += .5
        when 90, 191
            torpedo_fired = true
        when 32
            ship2_torpedo_fired = true
        when 37
            delta_rota_rad = delta_rota_rad - .1
        when 39
            delta_rota_rad = delta_rota_rad + .1
        when 38
            delta_thrust = delta_thrust + .5

set_blowup_002 = require('./physical_space/primitive_explosion_000_.coffee')

set_torpedos_002 = require('./physical_space/torpedos_002_.coffee') {canvas}


set_ship_002 = require('./physical_space/set_ship_002_.coffee') {canvas}



random_int = (range) ->
    return Math.floor(Math.random() * range)

game_loop_001 = (gl, set_ship, set_torpedos, set_blowup) ->

    background_rayy = new Float32Array [
        0, 0
        0, 1000,
        2000, 0
    ]
    bk_rayy2 = new Float32Array [
        2000, 0,
        0, 1000,
        2000, 1000
    ]



    torpedos_stack = []

    ship_state =
        pos_x: 800
        pos_y: 300
        vel_x: .5
        vel_y: .5
        rota_rad: 0

    ship_2 =
        pos_x: 300
        pos_y: 300
        vel_x: .5
        vel_y: .5
        rota_rad: 0
    return ->

        # c 'background_rayy', background_rayy
        gl.bufferData gl.ARRAY_BUFFER, background_rayy, gl.STATIC_DRAW
        gl.uniform4f colorLocation, 0, 0, 0, 1
        gl.drawArrays gl.TRIANGLES, 0, 3

        gl.bufferData gl.ARRAY_BUFFER, bk_rayy2, gl.STATIC_DRAW
        gl.uniform4f colorLocation, 0, 0, 0, 1
        gl.drawArrays gl.TRIANGLES, 0, 3




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
        gl.uniform4f colorLocation, 0, .9, .7, 1
        gl.drawArrays gl.TRIANGLES, 0, 3

        ship_2 = set_ship({gl, ship_state: ship_2, deltas: deltas2})
        # gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
        gl.uniform4f colorLocation, .1, .8, .2, 1
        gl.drawArrays gl.TRIANGLES, 0, 3


        if torpedo_fired is true
            tor_delta_x = cos(ship_state.rota_rad) * 3.5
            tor_delta_y = sin(ship_state.rota_rad) * 3.5
            torpedos_stack.push
                position_x: ship_state.pos_x + tor_delta_x
                position_y: ship_state.pos_y + tor_delta_y
                velocity_x: ship_state.vel_x + (cos(ship_state.rota_rad) * 20)
                velocity_y: ship_state.vel_y + (sin(ship_state.rota_rad) * 20)
                orientation_radians: ship_state.rota_rad

        if ship2_torpedo_fired is true
            # we want to set the torpedo ahead of the ship a bit outside the delta hit range
            tor_delta_x = cos(ship_2.rota_rad) * 3.5
            tor_delta_y = sin(ship_2.rota_rad) * 3.5
            torpedos_stack.push
                position_x: ship_2.pos_x + tor_delta_x
                position_y: ship_2.pos_y + tor_delta_y
                velocity_x: ship_2.vel_x + (cos(ship_2.rota_rad) * 20)
                velocity_y: ship_2.vel_y + (sin(ship_2.rota_rad) * 20)
                orientation_radians: ship_2.rota_rad


        delta_time = deltas.del_time
        { torpedos_stack, basket_rayys, ship_kill, ship2_kill } = set_torpedos({ gl, torpedos_stack, delta_time, ship_state, ship_2 })
        # gl.drawArrays gl.TRIANGLES, 0, 3 * torpedos_stack.length
        for rayy in basket_rayys
            gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
            gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
            gl.drawArrays gl.TRIANGLES, 0, 3

        delta_rota_rad = 0
        delta_thrust = 0
        torpedo_fired = false

        ship2_delta_thrust = 0
        ship2_delta_rota_rad = 0
        ship2_torpedo_fired = false

        if ship2_kill is true
            c "die die die ship2 !!!"
            cheunk_basket = set_blowup({ ship: ship_2 })
            for rayy in cheunk_basket
                gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
                gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
                gl.drawArrays gl.TRIANGLES, 0, 3

        if ship_kill is true
            cheunk_basket = set_blowup ship: ship_state
            for rayy in cheunk_basket
                gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
                gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
                gl.drawArrays gl.TRIANGLES, 0, 3








looper = game_loop_001(gl, set_ship_002, set_torpedos_002, set_blowup_002)
interval = setInterval ->
    counter++
    if counter < 100000
        looper()
    else
        clearInterval interval
, 5

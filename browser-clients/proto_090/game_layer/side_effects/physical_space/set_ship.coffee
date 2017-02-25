exports.default = ->
    set_ship_002 = ({ ship_state, deltas }) ->
        # c 'ship_state', ship_state
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

        ship_payload = new Float32Array [
            new_bow[0], new_bow[1],
            new_port[0], new_port[1]
            new_starboard[0], new_starboard[1]
        ]

        { new_state , ship_payload }

    set_ship_002

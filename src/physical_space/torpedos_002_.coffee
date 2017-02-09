module.exports = ({canvas})->
    set_torpedos_002 = ({ torpedos_stack, delta_time, ship_state, ship_2 }) ->
        basket_rayys = []
        kull_list = []
        ship_kill = false
        ship2_kill = false
        for torpedo, idx in torpedos_stack
            { position_x, position_y } = torpedo
            if (position_x < 0) or (position_x > canvas.width) or (position_y < 0) or (position_y > canvas.height)
                kull_list.push idx
        for idx in kull_list
            torpedos_stack.splice idx, 1

        kull_list = []
        for torpedo, idx in torpedos_stack
            { position_x, position_y, velocity_x, velocity_y, orientation_radians } = torpedo
            torpedo.position_x = (position_x + (delta_time * velocity_x))
            torpedo.position_y = (position_y + (delta_time * velocity_y))
            if (Math.abs(ship_state.pos_x - torpedo.position_x) < 3) and (Math.abs(ship_state.pos_y - torpedo.position_y) < 10)
                ship_kill = true
                kull_list.push idx
            if (Math.abs(ship_2.pos_x - torpedo.position_x) < 3) and (Math.abs(ship_2.pos_y - torpedo.position_y) < 10)
                ship2_kill = true
                kull_list.push idx
            translation_t = [
                1, 0, 0,
                0, 1, 0,
                torpedo.position_x, torpedo.position_y, 1
            ]
            rotation_t = [
                cos(torpedo.orientation_radians), sin(torpedo.orientation_radians), 0
                -(sin(torpedo.orientation_radians)), cos(torpedo.orientation_radians), 0
                0, 0, 1
            ]
            composed_t = mat3.multiply mat3.create, translation_t, rotation_t

            bow = [4, 0]
            port = [-2, 1]
            starboard = [-2, -1]

            new_bow = vec2.transformMat3 vec2.create(), bow, composed_t
            new_port = vec2.transformMat3 vec2.create(), port, composed_t
            new_starboard = vec2.transformMat3 vec2.create(), starboard, composed_t

            rayy = new Float32Array [
                new_bow[0], new_bow[1],
                new_port[0], new_port[1]
                new_starboard[0], new_starboard[1]
            ]
            basket_rayys.push rayy
            # gl.drawArrays gl.TRIANGLES, 0, 3 * torpedos_stack.length
        for idx in kull_list
            torpedos_stack.splice idx, 1
        return { torpedos_stack, basket_rayys, ship_kill, ship2_kill }
    return set_torpedos_002

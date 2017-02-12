module.exports = set_blowup_002 = ( { ship } ) ->
    basket_rayys = []
    for i in [0 .. 6]

        translation_t = [
            1, 0, 0,
            0, 1, 0,
            ship.pos_x, ship.pos_y, 1
        ]
        rotation_t = [
            cos(i * (.23 * pi )), sin(i * (.23 * pi )), 0,
            -(sin(i * (.23 * pi))), cos(i * (.23 * pi )), 0,
            0, 0, 1
        ]
        composed_t = mat3.multiply mat3.create, translation_t, rotation_t
        jagged_1 = [11, 30]
        jagged_2 = [-16, -14]
        jagged_3 = [15, -13]
        new_jagged_1 = vec2.transformMat3 vec2.create(), jagged_1, composed_t
        new_jagged_2 = vec2.transformMat3 vec2.create(), jagged_2, composed_t
        new_jagged_3 = vec2.transformMat3 vec2.create(), jagged_3, composed_t

        rayy = new Float32Array [
            new_jagged_1[0], new_jagged_1[1],
            new_jagged_2[0], new_jagged_2[1],
            new_jagged_3[0], new_jagged_3[1]
        ]
        basket_rayys.push rayy
    return basket_rayys

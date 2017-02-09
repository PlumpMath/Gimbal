


module.exports = ({
    delta_thrust, delta_rota_rad, torpedo_fired,
    ship2_torpedo_fired, ship2_delta_thrust, ship2_delta_rota_rad
    }) =>

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

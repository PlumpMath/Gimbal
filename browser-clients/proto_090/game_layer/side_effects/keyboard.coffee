



arq = {}


arq['init:keyboard'] = ({ dispatch, state }) ->

    document.addEventListener 'keydown', (e) ->
        switch e.keyCode
            when 88, 81
                dispatch
                    type: 'rotate_ship_2_step_counterwise'
            when 86, 75
                dispatch
                    type: 'rotate_ship_2_step_clockwise'
            when 67, 74
                dispatch
                    type: 'delta_thrust_ship_2'
            when 90, 191
                dispatch
                    type: 'ship_1_torpedo_fired'
            when 32
                dispatch
                    type: 'ship_2_torpedo_fired'
            when 37
                dispatch
                    type: 'rotate_ship_1_counterwise'
            when 39
                dispatch
                    type: 'rotate_ship_2_clockwise'
            when 38
                dispatch
                    type: 'delta_thrust_ship_1'



exports.default = arq
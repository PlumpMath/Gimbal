


# exports.default = ({ spacewar_primus }) ->

exports.default = ->

    js_state =

        # spacewar_primus: spacewar_primus

        desires:
            shortid():
                type: 'primus:init_all_the_primus'
            shortid():
                type: 'init:keyboard_handler'



        counter: 0

        s1_delta_thrust: 0
        s1_delta_rota_rad: 0
        s1_torpedo_fired: false
        s1_laser_fired: false


        s2_delta_thrust: 0
        s2_delta_rota_rad: 0
        s2_torpedo_fired: false
        s2_laser_fired: false

    state = Imm.fromJS js_state
    state

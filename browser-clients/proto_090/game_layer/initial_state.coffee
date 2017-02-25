
exports.default = ({ primus })->

    js_state =

        spacewar_primus: primus

        # sagas: Imm.Map
        #     test_000: 'blahblah'

        desires:
            "#{shortid()}":
                type: 'init:init_webgl'
            "#{shortid()}":
                type: 'setup:workers'
            "#{shortid()}":
                type: 'primus:init_all_the_primus'
            "#{shortid()}":
                type: 'init:keyboard_handler'



        counter: 0

        torpedos_stack: []

        s1:
            pos_x: 800
            pos_y: 300
            vel_x: 5
            vel_y: 5
            rota_rad: 0

        s1_deltas:
            rota_rad: 0
            thrust: 0
            torpedo_fired: false
            laser_fired: false

        s2:
            pos_x: 300
            pos_y: 300
            vel_x: .5
            vel_y: .5
            rota_rad: 0



        # s1_delta_thrust: 0
        # s1_delta_rota_rad: 0
        # s1_torpedo_fired: false
        # s1_laser_fired: false


        s2_delta_thrust: 0
        s2_delta_rota_rad: 0
        s2_torpedo_fired: false
        s2_laser_fired: false

    state = Imm.fromJS js_state
    state

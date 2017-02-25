
set_ship = require('./physical_space/set_ship.coffee').default()


render_ship = ({
     ship_state, ship_deltas, render, canvas, dispatch, id
     }) ->


    { thrust, rota_rad } = ship_deltas

    deltas =
        del_rota_rad: rota_rad
        del_vel_x: cos(ship_state.rota_rad) * thrust
        del_vel_y: sin(ship_state.rota_rad) * thrust
        del_time: .1

    { ship_payload } = set_ship
        ship_state: ship_state
        deltas: deltas
        canvas: canvas
        dispatch: dispatch
        id: id

    render
        rayy: ship_payload
        uni_color: [0, .9, .7, 1]










exports.default = render_ship

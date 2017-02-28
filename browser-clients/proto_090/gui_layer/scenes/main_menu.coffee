




main_menu = rr

    render: ->
        { ww, wh } = @props
        div

            style: styles.main_menu_container({ ww, wh })
            h1
                style: styles.main_menu_header
                "main menu gui"






map_state_to_props = (state) ->
    state.get('gui').toJS()

map_dispatch_to_props = (dispatch) ->
    {}

exports.default = connect(map_state_to_props, map_dispatch_to_props)(main_menu)




exports.default = ({ game_layer_dispatch }) ->

    require '../../globals/core.coffee'

    gui_root_el = document.getElementById 'gui_root'

    Provider = rc require('react-redux').Provider
    store = require('../../store/create.coffee') { game_layer_dispatch }

    scaffold = rr
        render: ->
            h1
                style:
                    textAlign: 'center'
                    color: 'magenta'
                "GUI_ROOT"

    gui_root_component = rr
        render: ->
            { ww, wh } = @props
            Provider
                store: store
                scaffold()


    gui_dispatch: store.dispatch

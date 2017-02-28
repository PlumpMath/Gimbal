


exports.default = ({ game_layer_dispatch }) ->

    require '../../globals/core.coffee'

    gui_root_el = document.getElementById 'gui_root'

    Provider = rc require('react-redux').Provider
    store = require('../../store/create.coffee').default { game_layer_dispatch }

    scaffold = rr
        render: ->
            c 'rendering scaffold'
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


    set_and_render = ->
        { width, height } = gui_root_el.getBoundingClientRect()
        React_DOM.render gui_root_component({ ww: width, wh: height }), gui_root_el

    window.onload = ->
        set_and_render()
        window.onresize = debounce(set_and_render, 100, false)

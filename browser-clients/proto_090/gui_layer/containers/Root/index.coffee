
require '../../globals/core.coffee'
require '../../globals/styles.coffee'




main_menu = rc require('../../scenes/main_menu.coffee').default



exports.default = ({ game_layer_dispatch }) ->



    gui_root_el = document.getElementById 'gui_root'

    Provider = rc require('react-redux').Provider
    store = require('../../store/create.coffee').default { game_layer_dispatch }



    gui_root_component = rr
        render: ->

            { ww, wh } = @props
            Provider
                store: store
                main_menu { ww, wh }


    gui_dispatch: store.dispatch


    set_and_render = ->
        { width, height } = gui_root_el.getBoundingClientRect()
        React_DOM.render gui_root_component({ ww: width, wh: height }), gui_root_el

    window.onload = ->
        set_and_render()
        window.onresize = debounce(set_and_render, 100, false)

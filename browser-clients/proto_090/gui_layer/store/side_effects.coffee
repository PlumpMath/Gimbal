arq = {}


arq = assign arq, require('./side_effects/init_keyboard.coffee').default


keys_arq = keys arq




side_effects_f = ({ store, game_layer_dispatch }) ->



    ({ state_js }) ->
        c 'into side_eff', state_js
        state = state_js
        for key_id, desire of state.gui.desires
            if includes(keys_arq, desire.type)
                arq[desire.type] { desire , store, game_layer_dispatch }
            else
                c "NoOp in side effects with", desire.type

exports.default = side_effects_f

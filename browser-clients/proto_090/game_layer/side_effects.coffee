






gl_graphics_pipeline_effect = ({ gl_render_payload }) ->
    draw_a_bunch = "of stuff on the screen"


arq = {}


arq = assign arq, require('./side_effects/keyboard.coffee')

# arq = assign arq, require('./side_effects/system_primus.coffee').default
#
# arq = assign arq, require('./side_effects/lounger.coffee').default

keys_arq = keys arq

side_effects_f = ({ Dispatch }) ->

    dispatch = (opts) ->
        Dispatch.emit 'new_action', { action: opts }

    ({ state }) ->
        for key_id, desire of state.get('desires').toJS()
            if includes(keys_arq, desire.type) is true
                arq[desire.type] { state, dispatch, desire }
            else
                c 'noop in side-effects with ', desire.type

exports.default = side_effects_f

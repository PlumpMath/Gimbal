






gl_graphics_pipeline_effect = ({ gl_render_payload }) ->
    draw_a_bunch = "of stuff on the screen"


arq = {}


arq = assign arq, require('./side_effects/init_webgl.coffee').default
arq = assign arq, require('./side_effects/init.coffee').default
arq = assign arq, require('./side_effects/gl_render.coffee').default
arq = assign arq, require('./side_effects/workers.coffee').default

keys_arq = keys arq

side_effects_f = ({ dispatch }) ->

    ({ state }) ->
        for key_id, desire of state.get('desires').toJS()
            if includes(keys_arq, desire.type) is true
                arq[desire.type] { state, dispatch, desire }
            else
                c 'noop in side-effects with ', desire.type

exports.default = side_effects_f

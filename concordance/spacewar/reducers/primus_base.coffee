







arq = {}


ufo_api = require('./ufo_api.coffee').default
keys_ufo_api = keys ufo_api
identified_player_api = require('./identified_player_api').default
keys_identified_player_api = keys identified_player_api


arq['spacewar:spark:data'] = ({ cs, state, action }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data

    if includes(keys_ufo_api, type)
        state = ufo_api[type] { cs, state, action, data, token }
    else if includes(keys_identified_player_api, type)
        user = state.getIn(['spacewar_sessions', token, 'user'])
        if user.toJS?
            if user.toJS().role is 'identified_player'
                state = identified_player_api[type] { cs, state, action, data, token }
    else
        c 'noop in spark : data in reducer with action.type', action.type
    state


arq['spacewar:primus:spark'] = ({ cs, state, action }) ->
    { spark, session_metadata } = action.payload
    { signedCookies, cookies, session, token } = session_metadata
    token = signedCookies['connect.sid']
    if state.hasIn(['spacewar_sessions', token]) isnt true
        master_session = Imm.Map
            spark: spark
            session_metadata: session_metadata
            token: token
            safe_id: v4()
        state = state.setIn(['spacewar_sessions', token], master_session)
    else
        state = state.setIn(['spacewar_sessions', token, 'spark'], spark)
    state

exports.default = arq



# elements = [
#     "wood"
#     "fire"
#     "earth"
#     "metal"
#     "water"
# ]
#
# colors = [
#     "cobalt-blue"
#     "stained-silver"
#     "verdigris-copper"
#     "gold-flakes"
#     "titanium-white"
# ]
#
# animals = [
#     'rooster'
#     'tanuki'
#     'ratsnake'
#     'mongoose'
#     'falcon'
# ]

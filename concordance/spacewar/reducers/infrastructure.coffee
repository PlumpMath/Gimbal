






elements = [
    "wood"
    "fire"
    "earth"
    "metal"
    "water"
]

colors = [
    "cobalt-blue"
    "stained-silver"
    "verdigris-copper"
    "gold-flakes"
    "titanium-white"
]

animals = [
    'rooster'
    'tanuki'
    'ratsnake'
    'mongoose'
    'falcon'
]




arq = {}



ufo = require('./energia/ufo.coffee').default
keys_ufo = keys ufo
verified = require('./energia/verified.coffee').default
keys_verified = keys verified

brujo_ufo = require('./brujo/brujo_ufo.coffee').default
keys_brujo_ufo = keys brujo_ufo
brujo_verified = require('./brujo/brujo_verified').default
keys_brujo_verified = keys brujo_verified


arq['brujo:spark:data'] = ({ cs, state, action }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data

    if includes(keys_ufo, type)
        state = ufo[type] { cs, state, action, data, token }
    else if includes(keys_verified_lounger, type)
        user = state.getIn(['spacewar_sessions', token, 'user'])
        if user.toJS?
            if user.toJS().role is 'verified_spacer'
                state = verified[type] { cs, state, action, data, token }
    else
        c 'noop in spark : data in reducer with action.type', action.type
    state


arq['spacewar:spark:data'] = ({ cs, state, action }) ->
    { session_metadata, spark_id, data, token } = action.payload
    { type, payload } = data

    if includes(keys_ufo, type)
        state = ufo[type] { cs, state, action, data, token }
    else if includes(keys_verified_lounger, type)
        user = state.getIn(['spacewar_sessions', token, 'user'])
        if user.toJS?
            if user.toJS().role is 'verified_spacer'
                state = verified[type] { cs, state, action, data, token }
    else
        c 'noop in spark : data in reducer with action.type', action.type
    state

arq['brujo:primus:spark'] = ({ state, action }) ->
    { spark, session_metadata } = action.payload
    { signedCookies, cookies, session, token } = session_metadata
    token = signedCookies['connect.sid']
    if state.hasIn(['brujo_sessions', token]) isnt true
        master_session = Imm.Map
            spark: spark
            session_metadata: session_metadata
            token: token
            username: 'mock brujo'
        state = state.setIn ['brujo_sessions', token], master_session
    else
        state = state.setIn ['brujo_sessions', token, 'spark'], spark
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
            username: "#{elements[Math.floor(Math.random() * 5)]} #{colors[Math.floor(Math.random() * 5)]} #{animals[Math.floor(Math.random() * 5)]}"
        state = state.setIn(['spacewar_sessions', token], master_session)
    else
        state = state.setIn(['spacewar_sessions', token, 'spark'], spark)
    state



exports.default = arq

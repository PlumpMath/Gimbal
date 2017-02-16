state_cache_reducer = ({ state_cache }) ->
    # TODO
    {}

log_cache = Imm.List []


desires = Imm.Map {}

module.exports = ({
    env,
    spacewar_primus,
    redis
}) ->

    { state_cache } = env
    state = state_cache_reducer { state_cache }

    primary_state =
        log_cache: log_cache
        desires: desires
        ufo_sessions: Imm.Map({})
        lounger_sessions: Imm.Map({})

        helsinki_primus: helsinki_primus

        chat_log: Imm.List([])

    state = assign state, primary_state

    state = Imm.fromJS state

    di = { type: 'primus:init_all_the_primus' }

    state = state.setIn ['desires', shortid()], di

    state

c = console.log.bind console
Redis = require 'ioredis'
redis = new Redis({ db: 3, dropBufferSupport: true })

logging_func_f = ({ env, dev_server }) ->

    cs = ( stuff ) ->

        # TODO: this is just a  placeholder for what should be a complex structured logging solution
        # eventually...
        # also may need to be performance optimised
        redis.lpush 'log_cache', JSON.stringify(stuff)
    dev_server { cs, env, redis }

get_state_cache = ({ logging_func_f, dev_server }) ->
    redis.hgetall 'env', (err, env) ->
        if err then c err else
            if env is null then env = JSON.stringify({})
            c 'env', env
            # env = JSON.parse env
            logging_func_f { env, dev_server }

module.exports = ({ dev_server }) ->
    get_state_cache { logging_func_f, dev_server }

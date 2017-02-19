


require './globals.coffee'


process.on 'uncaughtException', (err)->
    c color.blue('exiting', on)
    c err
    process.exit(0)



dev_server = ({ env, cs, redis }) ->

    shortid = require 'shortid'
    c = console.log.bind console
    uuid = require 'node-uuid'
    v4 = uuid.v4.bind uuid
    color = require 'bash-color'
    body_parser = require 'body-parser'
    cookie_parser = require 'cookie-parser'
    express = require 'express'
    _ = require 'lodash'
    fs = require 'fs'
    path = require 'path'
    http = require 'http'
    Primus = require 'primus'

    {
        keys, assign, map, reduce
    } = _


    public_dir = path.resolve path.join('..', '/browser-clients', '/public')

    spacewar_arq = do ->
        cookie_parser_secret = "sa4004chpase939383838bnaehtbu^))"
        cookies = cookie_parser cookie_parser_secret

        cookie_parser_secret: cookie_parser_secret
        cookies: cookies
        index_path: '/dev_index_090.html'
        primus_dir: path.resolve(path.join(public_dir, '/js'))

    # brujo_terminal_arq = do ->
    #     cookie_parser_secret = "49894839avvmbk;"
    #     cookies: cookies
    #     index_path: '/html/brujo_terminal.html'
    #     primus_dir: path.resolve('..', 'react-browser-client', 'public', 'js')

    primus_session_f = require './modules/primus_session.coffee'

    # if process.env.NODE_ENV is 'production'
    #     index = '/prod_index.html'
    # else
    #     index = '/dev_index_090.html'


    app_spacewar = express()

    express_session = require 'express-session'
    connect_redis = require 'connect-redis'
    Redis_Store = connect_redis express_session

    spacewar_redis_store_opts = {}
    spacewar_redis_store = new Redis_Store(spacewar_redis_store_opts)

    # brujo_redis_store_opts = {}
    # brujo__redis__store = new Redis__Store(brujo_redis_store_opts)

    spacewar_store_arq =
        resave: true
        saveUninitialized: true
        store: spacewar_redis_store
        secret: spacewar_arq.cookie_parser_secret

    app_spacewar.use spacewar_arq.cookies
    app_spacewar.use express_session(spacewar_store_arq)
    app_spacewar.use '/js', express.static(path.join(public_dir, '/js'))
    app_spacewar.use '/css', express.static(path.join(public_dir, '/css'))
    app_spacewar.use '/images', express.static(path.join(public_dir, '/images'))
    app_spacewar.use '/fonts', express.static(path.join(public_dir, '/fonts'))
    app_spacewar.use '/svgs', express.static(path.join(public_dir, '/svgs'))

    app_spacewar.all '/*', (req, res, next) ->
        if not(includes(keys(req.cookies), 'caracal'))
            res.cookie 'caracal', "eureka::#{v4()}"
        res.sendFile path.join(public_dir, spacewar_arq.index_path)

    app_spacewar.use express.static(public_dir)

    app_spacewar_port = 3883
    app_brujo_port = 2239

    app_spacewar_server = http.createServer app_spacewar

    opts_spacewar_primus =
        transformer: 'websockets'

    spacewar_primus = new Primus(app_spacewar_server, opts_spacewar_primus)

    spacewar_primus.use 'cookies', spacewar_arq.cookies

    spacewar_primus.use 'session', primus_session_f, { store: spacewar_redis_store }

    spacewar_primus.save path.join(spacewar_arq.primus_dir, '/primus.js')

    require('../concordance/spacewar/index.coffee')
        env: env
        cs: cs
        spacewar_primus: spacewar_primus
        redis: redis

    app_helsinki_lounge_server.listen app_helsinki_lounge_port, ->
        c color.blue("Server listening on port" , on), color.cyan(app_helsinki_lounge_port, on)

require('../concordance/spacewar/modules/startup_transce.coffee') { dev_server }



require './globals.coffee'


express = require 'express'
app = express()

primus_session_f = require './modules/primus_session.coffee'

if process.env.NODE_ENV is 'production'
    index = '/prod_index.html'
else
    index = '/dev_index_090.html'


public_dir = path.resolve path.join('..', '/browser-clients', '/public')

c 'public_dir', public_dir

# app.use '/js', path.join(public_dir, '/js')

app.use '/js', express.static(path.resolve(path.join(public_dir, '/js')))

app.use '/images', express.static(path.resolve(path.join(public_dir, '/images')))


app.use '/svgs', express.static(path.resolve(path.join(public_dir, '/svgs')))

app.all '/*', (req, res, next) ->
    res.sendFile path.join(public_dir, index)

app.use(express.static(public_dir))

port = process.env.PORT or 3883

server_090 = http.createServer app

opts_primus =
    transformer: 'websockets'

spacewar_primus = new Primus(server_090, opts_primus)

primus_path = path.resolve(path.join(public_dir, '/js', '/primus.js'))

spacewar_primus.save primus_path

# app.listen port, ->
#     c 'server listening on ', port

server_090.listen port, ->
    c color.cyan("Server listening on port", on), color.green(port, on)




# app_helsinki_lounge_port = 6494
# app_brujo_port = 2239
#
# app_helsinki_lounge_server = http.createServer app_helsinki_lounge
#
# opts_helsinki_primus =
#     transformer: 'websockets'
#
# helsinki_primus = new Primus(app_helsinki_lounge_server, opts_helsinki_primus)
#
# helsinki_primus.use 'cookies', helsinki_lounge_arq.cookies
#
# helsinki_primus.use 'session', primus_session_f, { store: helsinki_lounge_redis_store }
#
# helsinki_primus.save path.join(helsinki_lounge_arq.primus_dir, '/primus.js')
#
# require('../concordance/helsinki-lounge/index.coffee')
#     env: env
#     helsinki_primus: helsinki_primus
#     redis: redis
#
# app_helsinki_lounge_server.listen app_helsinki_lounge_port, ->
#     c color.blue("Server listening on port" , on), color.cyan(app_helsinki_lounge_port, on)

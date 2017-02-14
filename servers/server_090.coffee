


c = -> console.log.apply console, arguments
_ = require 'lodash'
express = require 'express'
app = express()
body_parser = require 'body-parser'
path = require 'path'
public_dir = path.join(__dirname, '..', '/browser-clients', '/public')
# app.use(body_parser.json())

Primus = require 'primus'

primus_session_f = require './modules/primus_session.coffee'

if process.env.NODE_ENV is 'production'
    index = '/prod_index.html'
else
    index = '/dev_index_090.html'


# app.use '/js', path.join(public_dir, '/js')

app.use '/js', express.static(path.join(public_dir, '/js'))

app.use '/images', express.static(path.join(public_dir, '/images'))


app.use '/svgs', express.static(path.join(public_dir, '/svgs'))

app.all '/*', (req, res, next) ->
    res.sendFile path.join(public_dir, index)

app.use(express.static(public_dir))
port = process.env.PORT or 3883

app.listen port, ->
    c 'server listening on ', port







module.exports = ->

    require('./worker_globals.coffee').default { self }


    @onmessage = (e) ->
        console.log 'got a message in worker'

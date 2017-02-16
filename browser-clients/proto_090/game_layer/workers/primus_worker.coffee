



on_message = (e) ->
    c 'primus_worker got message'
    c _.keys(self)



module.exports = ->


    require('./worker_globals.coffee').default { self }

    @onmessage = on_message

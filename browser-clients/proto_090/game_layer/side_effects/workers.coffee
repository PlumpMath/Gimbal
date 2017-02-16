


arq = {}



arq['setup:workers'] = ({ state, dispatch }) ->
    w = work(require.resolve('../workers/proto_worker_090.coffee'))


    primus_worker = work(require.resolve('../workers/primus_worker.coffee'))

    # setTimeout =>
    #     c 'w', w
    #     w.postMessage 'dude'
    # , 2000

    setTimeout =>
        primus_worker.postMessage 'hello'
    , 200

exports.default = arq

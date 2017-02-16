


arq = {}



arq['setup:workers'] = ({ state, dispatch }) ->
    w = work(require.resolve('../workers/proto_worker_090.coffee'))

    setTimeout =>
        c 'w', w
        w.postMessage 'dude'
    , 2000

exports.default = arq

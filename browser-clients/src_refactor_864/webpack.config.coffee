c = -> console.log.apply console, arguments

path = require 'path'
webpack = require 'webpack'

_ = require 'lodash'

# c _.keys webpack
worker_thing = new webpack.LoaderOptionsPlugin
    options:
        worker:
            output:
                filename: 'hash.worker.js'
                chunkFilename: '[id].hash.worker.js'

module.exports = config =
    # worker:
    #     output:
    #         filename: "hash.worker.js"
    #         chunkFilename: "[id].hash.worker.js"
    node:
        fs: "empty"

    context: __dirname

    cache: true

    entry:
        app: ['./index.coffee']
    stats:
        colors: on
        reasons: on

    plugins: [
        worker_thing
    ]


    module:

        rules: [
            {
                test: /\.glsl$/
                loader: 'webpack-glsl'
            },
            {
                test: /\.coffee$/
                loaders: ['coffee-loader']
            }
        ]

    output:
        path: __dirname
        filename: "../public/js/app_864.js"

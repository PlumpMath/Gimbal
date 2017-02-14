
path = require 'path'

module.exports =

    entry: './entry.coffee'

    output:
        path: path.resolve(__dirname, '..', 'public', 'js')
        filename: 'app_090.js'

    module:
        loaders: [
            {
                test: /\.glsl$/
                loader: 'webpack-glsl'
            },
            {
                test: /\.coffee$/
                loader: "coffee-loader"
            }
        ]

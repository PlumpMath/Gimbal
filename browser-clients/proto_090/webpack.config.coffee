
path = require 'path'

module.exports =

    entry: './entry.coffee'

    output:
        path: path.resolve(__dirname, '..', 'public', 'js')
        filename: 'app_090.js'

    module:
        loaders: [
            {
                exclude: /node_modules/
                test: /\.glsl$/
                loader: 'webpack-glsl-loader'
            },
            {
                exclude: /node_modules/
                test: /\.coffee$/
                loader: "coffee-loader"
            }
        ]

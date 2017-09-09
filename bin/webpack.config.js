//import path from 'path'
var path = require('path')

module.exports = {
    entry: "./src/index.js",
    output: {
        filename: "myApp.js",
        path: path.resolve(__dirname, '../static/dist/js')
    },
    watch: true,
    watchOptions: {
        aggregateTimeout: 100
    },
    module: {
        loaders: [
            {
                test: /\.js$/,
                exclude: /(node_modules|bower_components)/,
                use: {
                    loader: 'babel-loader',
                    options: {
                        presets: ["es2015"]
                    }
                }
            },
            {
                test: /\.tag$/,
                exclude: /node_modules/,
                loader: 'riot-tag-loader',
                enforce: 'pre',
                query: {
                    type: 'es6',
                    hot: false
                }
            }
        ]
    }
}
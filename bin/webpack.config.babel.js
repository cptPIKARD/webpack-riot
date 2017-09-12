var path = require('path')
// var webpack = require('webpack')
import webpack from 'webpack'
var NODE_ENV = process.env.NODE_ENV || 'development'
// const options = loaderUtils.getOptions(this);

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
    plugins: [
        new webpack.DefinePlugin({
            NODE_ENV: JSON.stringify(NODE_ENV)
        })
    ],
    module: {
        rules: [
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
                loaders: [
                    {loader: 'babel-loader'},
                    {loader: 'riot-tag-loader', options: {template: 'pug', hot: false}}
                ]
            }
        ]
    },
    devServer: {
        contentBase: 'static',
        compress: true,
        port: 8787,
        historyApiFallback: {
            index: 'index.html'
        }
    }
}
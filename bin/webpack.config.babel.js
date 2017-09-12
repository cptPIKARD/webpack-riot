import path from 'path'
import webpack from 'webpack'
const output = path.join(process.cwd(), 'static')
const NODE_ENV = process.env.NODE_ENV || 'development'

module.exports = {
    entry: "./src/index.js",
    output: {
        path: output,
        filename: "../static/dist/myApp.js",
        library: 'myApp'
    },
    watch: true,
    watchOptions: {
        aggregateTimeout: 100
    },
    plugins: [
        new webpack.NoEmitOnErrorsPlugin(),
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
    resolve: {
        unsafeCache: true,
        extensions: ['.js', '.es6', '.jsx', '.pug', '.css', '.svg', '.tag', '.png'],
        modules: ['node_modules']
    },
    resolveLoader: {
        modules: ['node_modules']
    },
    devServer: {
        contentBase: output,
        compress: true,
        port: 8787,
        historyApiFallback: {
            index: 'index.html'
        }
    }
}

if( NODE_ENV == 'production' ) {
    module.exports.plugins.push(
        new webpack.optimize.UglifyJsPlugin({
            unsafe: true,
            drop_console: true,
            warnings: false
        })
    )
}
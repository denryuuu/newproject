const path = require('path');
const slsw = require('serverless-webpack');
const nodeExternals = require('webpack-node-externals');
const ForkTsCheckerWebpackPlugin = require('fork-ts-checker-webpack-plugin');

module.exports = {
  context: __dirname,
  mode: slsw.lib.webpack.isLocal ? 'development' : 'production',
  entry: {
    application: './app/javascript/application.js',
    index: './app/javascript/controllers/index.js',
  },
  devtool: slsw.lib.webpack.isLocal ? 'cheap-module-eval-source-map' : 'source-map',
  resolve: {
    extensions: ['.mjs', '.json', '.ts'],
    symlinks: false,
    cacheWithContext: false,
  },
  output: {
    path: path.join(__dirname, '.webpack'),
    filename: '[name].bundle.js',
  },
  target: 'node',
  externals: [nodeExternals()],
  module: {
    rules: [
      // all files with a `.ts` or `.tsx` extension will be handled by `ts-loader`
      {
        test: /\.(tsx?)$/,
        loader: 'ts-loader',
        exclude: [
          [
            path.resolve(__dirname, 'node_modules'),
            path.resolve(__dirname, '.serverless'),
            path.resolve(__dirname, '.webpack'),
          ],
        ],
        options: {
          transpileOnly: true,
          experimentalWatchApi: true,
        },
      },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: path.join(__dirname, 'public', './app/javascript/application.html'),
      filename: "application.html",
      chunks: ['application']
    }),
     new HtmlWebpackPlugin({
      template: path.join(__dirname, 'public', './app/javascript/controllers/index.html'),
      filename: "index.html",
      chunks: ['index']
    })
  ],
};
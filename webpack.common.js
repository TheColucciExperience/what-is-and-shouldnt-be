
// Getting all necessary loaders and plugins

const path = require( 'path' ),
  HtmlWebpackPlugin = require( 'html-webpack-plugin' ),
  CopyWebpackPlugin = require( 'copy-webpack-plugin' );

module.exports = {
  entry: {
    app: './src/main.js',
  },
  output: {
    filename: '[name].bundle.js',
    path: path.resolve( __dirname, 'dist' )
  },
  module: {
    rules: [
      {
        test: /\.(png|jpg|gif|svg)$/,
        use: [ 'file-loader' ]
      }, {
        test: /\.jade$/,
        use: [ 'jade-loader' ]
      }, {
        test: /\.styl$/,
        use: [
          'style-loader',
          'css-loader',
          'stylus-loader'
        ]
      }, {
        test: /\.coffee$/,
        use: [ 'coffee-loader' ]
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin( {
      template: './src/index.jade'
    } ),
    new CopyWebpackPlugin( [
      { from: './src/images/', to: './images' }
    ] )
  ]
}

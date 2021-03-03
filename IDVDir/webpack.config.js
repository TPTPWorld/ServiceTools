const path = require('path');

module.exports = {
  entry: './static/js/helpers.js',
  output: {
    path: path.resolve(__dirname, 'static/js'),
    filename: 'bundle.js'
  },
  node: { module: "empty", net: "empty", fs: "empty" },
  mode:"development",
  module: {
    rules: [
      {
        test: /\.js/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
            plugins: [
              "@babel/plugin-syntax-dynamic-import",
              "@babel/plugin-proposal-class-properties"
            ]
          }
        }
      }
    ]
  }

};


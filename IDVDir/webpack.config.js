const path = require('path');

module.exports = {
  entry: './static/js/helpers.js',
  output: {
    path: path.resolve(__dirname, 'static/js'),
    filename: 'bundle.js'
  },
  node: { module: "empty", net: "empty", fs: "empty" },
  mode:"development"
};


const path = require('path')

module.exports = {
  resolve: {
    alias: {
      '@': path.resolve(__dirname, '..', '..', 'app/javascript'),
      '@libs': path.resolve(__dirname, '..', '..', 'app/javascript/libs')
    },
  }
}

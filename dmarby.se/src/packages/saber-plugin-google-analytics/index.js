// https://github.com/saberland/saber/tree/master/packages/saber-plugin-google-analytics

const path = require('path')

const ID = 'google-analytics'

exports.name = ID

exports.apply = (api, { trackId = false } = {}) => {
  api.hooks.chainWebpack.tap(ID, config => {
    config.plugin('constants').tap(([options]) => [
      Object.assign(options, {
        __GA_TRACK_ID__: JSON.stringify(trackId)
      })
    ])
  })

  api.browserApi.add(path.join(__dirname, 'saber-browser.js'))
}

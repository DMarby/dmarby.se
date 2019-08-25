import './css/shoelace.css'
import './css/global.css'

export default ({ router }) => {
  if (!process.browser) {
    return
  }

  // Progress bar
  // https://saber.land/tutorial/tutorial.html#adding-progress-bar-for-page-loading
  // https://kamal.io/blog/preventing-loading-progress-bar-flashes-with-vue

  // These dependencies are only bundled in client build
  const nprogress = require('nprogress')
  require('nprogress/nprogress.css')

  const progressFns = () => {
    let progressTimeout, count = 0

    const start = () => {
        count++

        progressTimeout = setTimeout(() => {
            nprogress.start()
        }, 200)
    }

    const stop = () => {
        count = Math.max(0, count - 1)
        if (count > 0) return

        nprogress.done()
        clearTimeout(progressTimeout)
    }

    return { start, stop }
  }

  const {
    start: progressStart,
    stop: progressStop,
  } = progressFns()

  const loaded = Object.create(null)

  router.beforeEach((to, from, next) => {
    if (!loaded[to.path]) {
      // Start progress bar before entering page
      progressStart()
    }
    next()
  })

  router.afterEach(to => {
    loaded[to.path] = true
    // Stop progress bar after entering page
    progressStop()
  })

  // fonts.com tracking
  if (process.env.NODE_ENV === 'production') {
    router.afterEach(to => {
      (function() {
        var mtTracking = document.createElement('script');
        mtTracking.type='text/javascript';
        mtTracking.async='true';
        mtTracking.src='/mtiFontTrackingCode.js';

        (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(mtTracking);
      })();
    })
  }
}

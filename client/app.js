import app from 'ampersand-app'
import styles from './styles/main.styl'
import Router from './router'
import Entry from './models/entry'

// expose `app` to browser console
window.app = app

app.extend({
  init () {
    this.entry = new Entry()
    this.router = new Router()
    this.router.history.start()
  }
})

app.init()
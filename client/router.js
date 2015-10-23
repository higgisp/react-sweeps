import React from 'react'
import Router from 'ampersand-router'
import PublicPage from './views/public'
import EntryPage from './views/entry'
import ThanksPage from './views/thanks'

export default Router.extend({
  routes: {
    '': 'public',
    'entry': 'entry',
    'thanks': 'thanks'
  },

  public () {
    React.render(<PublicPage/>, document.body)
  },

  entry () {
    React.render(<EntryPage entry={app.entry} />, document.body)
  },

  thanks () {
    React.render(<ThanksPage/>, document.body)
  }
})
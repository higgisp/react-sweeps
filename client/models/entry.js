import app from 'ampersand-app'
import Model from 'ampersand-model'
import xhr from 'xhr'

export default Model.extend({
  url: 'http://localhost:3000/entries',

  props: {
    first_name: 'string',
    last_name: 'string',
    email: 'string',
    address: 'string',
    city: 'string',
    state: 'string',
    opt_in: 'boolean',
    mobile: 'string'
  },

  update (data) {
    xhr({
      url: this.url(),
      json: data,
      method: 'POST',
    }, (err, resp, body) => {
      if (err) {
        console.error('error!')
      }
    })
    this.set(data)
  }

})
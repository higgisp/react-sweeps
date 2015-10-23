import React from 'react'
import ampersandMixin from 'ampersand-react-mixin'

import states from '../data/states'

export default React.createClass({
  mixins: [ampersandMixin],

  displayName: 'Entry',

  getInitialState () {
    const { first_name, last_name, email, address, city, zip, state, opt_in } = this.props.entry
    return {
      first_name: '',
      last_name: '',
      email: '',
      address: '',
      city: '',
      zip: '',
      state: '',
      opt_in: false
    }
  },

  handleChange: function(event) {
    var nextState = {};
    nextState[event.target.name] = event.target.value;
    this.setState(nextState);
  },

  handleCheck: function(event) {
    this.setState({opt_in: !this.state.opt_in})
  },

  onSubmitForm (event) {
    event.preventDefault()
    const {entry} = this.props
    entry.save({
      entry: {
        first_name: this.state.first_name,
        first_name: this.state.last_name,
        email: this.state.email,
        address: this.state.address,
        city: this.state.city,
        zip: this.state.zip,
        state: this.state.state,
        opt_in: this.state.opt_in
      }
    })
  },

  render () {
    const {entry} = this.props
    const {first_name, last_name, email, address, city, zip, state, opt_in} = this.state

    let content

    content = (
      <form onSubmit={this.onSubmitForm} className='entry'>
        <div className='form-element'>
          <label htmlFor='first_name'>First Name</label>
          <input className='form-input' onChange={this.handleChange} value={first_name} name='first_name'/>
        </div>
        <div className='form-element'>
          <label htmlFor='last_name'>Last Name</label>
          <input className='form-input' onChange={this.handleChange} value={last_name} name='last_name'/>
        </div>
        <div className='form-element'>
          <label htmlFor='email'>Email</label>
          <input className='form-input' onChange={this.handleChange} value={email} name='email'/>
        </div>
        <div className='form-element'>
          <label htmlFor='address'>Address</label>
          <input className='form-input' onChange={this.handleChange} value={address} name='address'/>
        </div>
        <div className='form-element'>
          <label htmlFor='city'>City</label>
          <input className='form-input' onChange={this.handleChange} value={city} name='city'/>
        </div>
        <div className='form-element'>
          <label htmlFor='zip'>Zip</label>
          <input className='form-input' onChange={this.handleChange} value={zip} name='zip'/>
        </div>
        <div className='form-element'>
          <label htmlFor='state'>State</label>
          <select className='form-element' onChange={this.handleChange} value={state} name="state">
            {states.US.map((state) => {
              return (
                <option key={state.value} value={state.value}>{state.label}</option>
              )
            })}
          </select>
        </div>
        <div className='form-element'>
          <label htmlFor='opt_in'>Opt in</label>
          <input className='input-checkbox form-element' onChange={this.handleCheck} checked={this.state.opt_in} type="checkbox" name='opt_in'/>
          {this.state.opt_in ? this.props.labelOn : this.props.labelOff}
        </div>
        <div className='form-element'>
          <button type='submit' className='button button-small'>Save</button>
        </div>
      </form>
    )

    return <div>{content}</div>
  }
})
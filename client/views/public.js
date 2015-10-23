import React from 'react'

export default React.createClass({
  displayName: 'PublicPage',
  render () {
    return (
      <div className='container'>
        <header role='banner'>
          <h1>Sweeps</h1>
        </header>
        <div>
          <a href='/entry' className='button button-large'>Enter Sweeps</a>
        </div>
      </div>
    )
  }
})
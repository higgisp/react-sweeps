import React from 'react'
import Entry from '../components/entry'

export default React.createClass({

  displayName: 'EntryPage',

  render () {
    const {entry} = this.props
    return (
      <div id="content">
        <h1>Entry Page</h1>
        <Entry entry={entry}/>
      </div>
    );
  }
})
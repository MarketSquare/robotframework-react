import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

const wait = time => {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve()
    }, time)
  })
}

class App extends Component {
  state = {
    isLoading: true,
  }

  componentDidMount() {
    wait(2000).then(() => {
      this.setState({ isLoading: false })
    })
  }

  componentDidUpdate() {
    if (!this.state.isLoading) {
      this.props.updateStatus()
    }
  }

  render() {
    if (this.state.isLoading) {
      return <h1>Loading</h1>
    }

    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
        </p>
      </div>
    );
  }
}

export default App;

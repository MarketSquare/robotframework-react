import React, { Component } from 'react';
import './App.css';
import { connect } from 'react-redux';
import { headlinesActions } from './reducers/headlines';

const wait = time => {
  return new Promise(resolve => {
    setTimeout(() => {
      resolve()
    }, time)
  })
}

const fakeData = [
  { id: 1, text: 'React Europe is best conference everrrr' },
  { id: 2, text: 'Robot Framework is awesome' },
  { id: 3, text: 'Much wow' },
];

class App extends Component {
  componentDidMount() {
    this.props.fetchHeadlinesRequest()

    wait(2000).then(() => {
      const result = fakeData.map(({ id }) => id);
      const headlines = fakeData.reduce((current, { id, text }) => {
        return { ...current, [id]: { id, text } }
      }, {})

      const payload = {
        result,
        entities: {
          headlines
        }
      }
      this.props.fetchHeadlinesRequestSuccess(payload)
    })
  }

  render() {
    if (this.props.isFetching) {
      return <h1>Loading</h1>
    }

    return (
      <div className="App">
        {this.props.headlines.map(({ id, text }) => <h1 key={id}>{text}</h1>)}
      </div>
    );
  }
}

const mapStateToProps = state => ({
  isFetching: state.headlines.isFetching,
  headlines: state.headlines.indexIds.map(id => state.headlines.byId[id])
})

export default connect(mapStateToProps, headlinesActions)(App);

import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';
import registerServiceWorker from './registerServiceWorker';
import './index.css';

window.appStatus = false
const updateStatus = () => {
  window.appStatus = true
}

ReactDOM.render(<App updateStatus={updateStatus} />, document.getElementById('root'));
registerServiceWorker();

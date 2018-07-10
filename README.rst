==============================================================================
A Robot Framework library for React.
==============================================================================

.. image:: https://travis-ci.org/kitconcept/robotframework-react.svg?branch=master
    :target: https://travis-ci.org/kitconcept/robotframework-react

.. image:: https://img.shields.io/pypi/status/robotframework-react.svg
    :target: https://pypi.python.org/pypi/robotframework-react/
    :alt: Egg Status

.. image:: https://img.shields.io/pypi/v/robotframework-react.svg
    :target: https://pypi.python.org/pypi/robotframework-react/
    :alt: Latest Version

.. image:: https://img.shields.io/pypi/l/robotframework-react.svg
    :target: https://pypi.python.org/pypi/robotframework-react/
    :alt: License

|

.. image:: https://raw.githubusercontent.com/kitconcept/robotframework-react/master/kitconcept.png
   :alt: kitconcept
   :target: https://kitconcept.com/


Introduction
------------

ReactLibrary is a Robot Framework library for React. It currently provides a single 'Wait for React' keyword that makes sure your React application has been fully loaded and can be interacted with.


Installation
------------

Install robotframework-react with pip::

  $ pip install robotframework-react


Usage
-----

In order to write your first robot test, make sure that you include SeleniumLibrary and ReactLibrary. Create a test.robot file with the following content::

  *** Settings ***

  Library         SeleniumLibrary  timeout=10  implicit_wait=0
  Library         React Library
  Suite Setup     Open browser  https://airbnb.com  chrome
  Suite Teardown  Close browser


  *** Test Cases ***

  Scenario: Wait for react
    Go To  https://airbnb.com
    Wait for react
    Page Should Contain  Airbnb Book unique homes

  Scenario: Wait for react with reducer
    Go To  https://airbnb.com
    Wait for react  reducer=headlines
    Page Should Contain  Airbnb Book unique homes


Keywords
--------

robotframework-react currently only provides a single keyword "Wait for React".
The keyword makes sure the React app is fully loaded.


Plain React Example
^^^^^^^^^^^^^^^^^^^

When used without any parameter, "Wait for react" expects the React app to
set a global variable named "window.appStatus" to true when the app is fully
loaded.

To make this work with your React app, add a global window.appStatus to your
index.js::

  window.appStatus = false
  const updateStatus = () => {
    window.appStatus = true
  }

  ReactDOM.render(<App updateStatus={updateStatus} />, document.getElementById('root'));

Add an "isLoading" state to your App and update it on componentDidMount and componentDidUpdate (App.js)::

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
    ...
  }

You can find a full working example here: https://github.com/kitconcept/robotframework-react/tree/master/tests/create-react-app

Robot Test: https://github.com/kitconcept/robotframework-react/blob/master/tests/create-react-app/test.robot

Redux
^^^^^

When working with Redux, you have to pass the name of the reducer to the 'Wait for React' keyword::

  Wait for react  reducer=headlines

The reducer should implement an "isFetching" attribute in the Redux state::

  const initialState = {
    isFetching: false,
    ...
  };

Instead of adding "isFetching", you can also name the attribute whatever you want, and pass in the "stateName" parameter to the 'Wait for react' keyboard::

   Wait for react  reducer=headlines  stateName=isLoading

You can find a full working example here:

https://github.com/kitconcept/robotframework-react/tree/master/tests/create-react-app-with-redux

Robot Test with Redux:

https://github.com/kitconcept/robotframework-react/blob/master/tests/create-react-app-with-redux/test.robot


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

In order to write your first robot test, make sure that you include Selenium2Library and ReactLibrary. Create a test.robot file with the following content::

  *** Settings ***

  Library         Selenium2Library  timeout=10  implicit_wait=0
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

robotframework-react currently only provides a single keyword "Wait for React". The keyword makes sure the React app is fully loaded.

When used without any parameter, "Wait for react" expects the React app to set a global variable named "window.appStatus" to true when the app is fully loaded.

Example React reducer code::

  export default combineReducers({
    headlines,
  });

  const initialState = {
    isFetching: false,
    byId: {},
    indexIds: [],
  };

A full example app can be found here:

https://github.com/kitconcept/robotframework-react/blob/master/tests/create-react-app/test.robot


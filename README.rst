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

  Scenario: Webpack Dev Server
    Go To  https://airbnb.com
    Wait for react
    Page Should Contain  Airbnb Book unique homes

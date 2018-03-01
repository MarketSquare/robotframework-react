*** Variables ***

${HOST}                 127.0.0.1
${PORT}                 3000
${BROWSER}              chrome
${SERVER}               http://${HOST}:${PORT}


*** Settings ***

Documentation   ReactLibrary Acceptance Tests
Library         Selenium2Library  timeout=5  implicit_wait=0
Library         ReactLibrary
Library         DebugLibrary
Library         WebpackLibrary

Suite Setup     Start React and open browser
Suite Teardown  Stop React and close browser


*** Test Cases ***

Scenario: Wait for react keyword can be called
  Wait for react

Scenario: Wait for react keyword waits for loading
  Go to  ${SERVER}
  Wait for react
  Page should contain  Welcome to React


*** Keywords ***

Start React and Open Browser
  Start Webpack  yarn start  path=tests/create-react-app
  Open Browser  ${SERVER}  ${BROWSER}
  Set Window Size  1280  1024

Stop React and Close Browser
  # stop react

  Stop Webpack
  Close Browser

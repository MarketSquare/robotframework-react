*** Variables ***

${HOST}                 127.0.0.1
${PORT}                 3000
${BROWSER}              chrome
${SERVER}               http://${HOST}:${PORT}


*** Settings ***

Documentation   ReactLibrary Acceptance Tests
Library         Selenium2Library  timeout=10  implicit_wait=0
Library         ReactLibrary
Library         DebugLibrary

Suite Setup     Start React and Open Browser
Suite Teardown  Stop React and Close Browser


*** Test Cases ***

Scenario: Wait until react app has been fully loaded
  Wait until react app is fully loaded

Scenario: Create React App
  Go to  ${SERVER}
  Wait until react app is fully loaded
  Page should contain  Welcome to React


*** Keywords ***

Start React and Open Browser
  # start react
  Open Browser  ${SERVER}  ${BROWSER}
  Set Window Size  1280  1024

Stop React and Close Browser
  # stop react
  Close Browser

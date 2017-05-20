*** Variables ***

${HOST}                 127.0.0.1
${PORT}                 5000
${BROWSER}              chrome
${SERVER}               http://${HOST}:${PORT}


*** Settings ***

Documentation   ReactLibrary Acceptance Tests
Library         Selenium2Library  timeout=10  implicit_wait=0
Library         ReactLibrary
Library         DebugLibrary
Library         Process

Suite Setup     Start React and Open Browser
Suite Teardown  Stop React and Close Browser


*** Test Cases ***

Scenario: Wait for react keyword can be called
  Wait for react

Scenario: Wait for react keyword waits for loading
  Go to  ${SERVER}
  Wait for react
  Page should contain  Welcome to React


*** Keywords ***

Start React and Open Browser
  Run process  yarn run build  shell=True  cwd=${CURDIR}/tests/create-react-app
  Run process  yarn global add serve  shell=True  cwd=${CURDIR}/tests/create-react-app
  Start process  serve -s build  shell=True  cwd=${CURDIR}/tests/create-react-app
  Open Browser  ${SERVER}  ${BROWSER}
  Set Window Size  1280  1024

Stop React and Close Browser
  # stop react
  Terminate All Processes  kill=True
  Close Browser

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
Library         Process
Library         WebpackLibrary

Suite Setup     Start React and Open Browser
Suite Teardown  Stop React and Close Browser


*** Test Cases ***

Scenario: Wait for react keyword can be called with reducer argument
  Wait for react  reducer=headlines

Scenario: Wait for react keyword with reducer argument waits for loading
  Go to  ${SERVER}
  Wait for react  reducer=headlines
  Page should contain  React Europe


*** Keywords ***

Start React and Open Browser
  # Run process  yarn run build  shell=True  cwd=${CURDIR}
  # Run process  yarn global add serve  shell=True  cwd=${CURDIR}
  # Start process  serve -s build  shell=True  cwd=${CURDIR}
  Start Webpack  path=tests/create-react-app-with-redux
  Open Browser  ${SERVER}  ${BROWSER}
  Set Window Size  1280  1024

Stop React and Close Browser
  Stop Webpack
  # Terminate All Processes  kill=True
  Close Browser

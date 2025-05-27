*** Settings ***
Documentation       To validate the Login form
Library             SeleniumLibrary
#Library             DataDriver  file=../Resources/data1.csv   dialect=excel
Test Teardown       Close Browser
Test Template       Validate Unsuccessful Login

*** Variables ***
${LOGIN_URL}                https://rahulshettyacademy.com/loginpagePractise/
${ERROR_MESSAGE_LOCATOR}    css:.alert-danger
${EXPECTED_ERROR_MESSAGE}   Incorrect username/password.

*** Test Cases ***
Login with user ${username} and password ${password}

*** Keywords ***
Validate Unsuccessful Login
    [Arguments]     ${username}     ${password}
    Open Browser To Login Page
    Fill Login Form                ${username}    ${password}
    Wait For Error Message
    Verify Error Message

Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    chrome

Fill Login Form
    [Arguments]     ${username}     ${password}
    Input Text          id:username        ${username}
    Input Password      id:password        ${password}
    Click Button        signInBtn

Wait For Error Message
    Wait Until Element Is Visible    ${ERROR_MESSAGE_LOCATOR}

Verify Error Message
    Element Text Should Be           ${ERROR_MESSAGE_LOCATOR}    ${EXPECTED_ERROR_MESSAGE}

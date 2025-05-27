*** Settings ***
Library    SeleniumLibrary
Library    DataDriver  file=Resources/data.csv
Test Teardown    Close Browser

*** Test Cases ***
Validate UnSuccessful Login
    [Template]    Validate Login With Data

*** Keywords ***
Validate Login With Data
    [Arguments]    ${username}    ${password}
    Open Browser    https://rahulshettyacademy.com/loginpagePractise/    chrome
    Maximize Browser Window
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Element    xpath://label[2]//span[2]
    Wait Until Element Is Visible    xpath://div[@class='modal-body']
    Sleep    5
    Click Element    xpath://button[@id='okayBtn']
    Wait Until Element Is Not Visible    xpath://div[@class='modal-body'
    Scroll Element Into View    xpath://input[@id='signInBtn']
    Sleep    5
    Click Element    xpath://input[@id='signInBtn'

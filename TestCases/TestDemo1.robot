*** Settings ***
Library     SeleniumLibrary
Library     DataDriver  file=Resources/data.csv
Test Teardown       Close Browser
#Test Setup      Open Browser        Chrome




*** Test Cases ***
Validate UnSuccesful Login

        Navigate to URL
        Enter Username And password
        click on submit


*** Keywords ***
Navigate to URL
        Open Browser  https://rahulshettyacademy.com/loginpagePractise/  chrome
        Maximize Browser Window
Enter Username And password
        Input Text    id:username    rahulshettyacademy
        Input Password    id:password    learning
        Click Element    xpath://label[2]//span[2]
        Wait Until Element Is Visible    xpath://div[@class='modal-body']
        Sleep    5
        Click Element    xpath://button[@id='okayBtn']
        Click Element    xpath://button[@id='okayBtn']
        Wait Until Element Is Not Visible     xpath://div[@class='modal-body']
        Scroll Element Into View    xpath://input[@id='signInBtn']
click on submit 
        Sleep    5
        Click Element    xpath://input[@id='signInBtn']


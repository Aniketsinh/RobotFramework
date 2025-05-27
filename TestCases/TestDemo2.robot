*** Settings ***
Documentation       To validate the Login form
Library             SeleniumLibrary
Library             Collections
Test Setup          Open The Browser With Mortgage Payment URL
Test Teardown       Close Browser Session
Resource            .../PO/Generic.robot

*** Variables ***
${URL}                         https://example.com   # Add your actual URL
${user_name}                   rahulshettyacademy
${valid_password}              learning
${invalid_password}            wrongpass
${Error_Message_Login}         css:.alert-danger
${Shop_page_load}             css:.nav-link

*** Test Cases ***
Validate Succesul Login
    Fill The Login Form     ${user_name}    ${invalid_password}
    Wait Until Element Is Visible     ${Error_Message_Login}
    Verify Error Message Is Correct

Validate Cards Display In The Shopping Page
    Fill The Login Form     ${user_name}    ${valid_password}
    Wait Until Element Is Located In The Page     ${Shop_page_load}
    Verify Card Titles In The Shop Page
    Select The Card     Nokia Edge

Select The Form And Navigate To Child Window
    Fill The Login Details And Login Form

*** Keywords ***

Open The Browser With Mortgage Payment URL
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Close Browser Session
    Close Browser

Fill The Login Form
    [Arguments]    ${username}    ${password}
    Input Text          id:username     ${username}
    Input Text      id:password

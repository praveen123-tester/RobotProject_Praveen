*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside Test Suite Testup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Tear down                 
Default Tags    Sanity




*** Variables ***

${Browser}  Chrome

#Scalar Variable 
 ${Url}  https://opensource-demo.orangehrmlive.com
#List Variable
 @{CREDENTIALS}  Admin   admin123
#Dictionary Variable
 &{LoginData}    Username=Admin  Password=admin123   


*** Test Cases ***
MyFirstTest
    [Tags]    Smoke
    Log    This is my 1st Test Set    
    
MySecondTest
    [Tags]    
    Log    This is my 2nd Test Set   
    Set Tags    regression1 
    Remove Tags    regression1 
    
MyThirdTest
    Log    This is my 3rd Test Set    


# TC_001_Login_Test
    # [Documentation]   This Scenario is for Opening Orange HRM Web Page
    # Open Browser    ${Url}  ${Browser} 
    # Maximize Browser Window
    # Sleep    5
    # LoginKW
    # Click Element    id=welcome
    # Set Browser Implicit Wait  5    
    # Click Element    link=Logout    
    # Close Browser
    # Log    TestCompleted Hurray:-)    
    

*** Keywords ***

LoginKW
     Input Text       id=txtUsername    @{CREDENTIALS}[0]
    Set Browser Implicit Wait    5
    Input Password   id=txtPassword    &{LoginData}[Password]
    Set Browser Implicit Wait    5
    Click Button     id=btnLogin    


    
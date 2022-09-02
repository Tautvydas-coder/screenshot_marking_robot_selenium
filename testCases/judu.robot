*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    BuiltIn
#Library  ../PythonFiles/highlighElement.py
Library    String
Variables  ../Resources/variables.py
Resource   ../Resources/configuration.robot

Test Setup  StartBrowserAndMaximizeAndSpeed
*** Variables ***

*** Test Cases ***

TC_01 Choose first ExpressBus Stop
    Click Element  ${ACCEPT_COOKIES}
    toDoScreenshot
    Scroll Element Into View    ${BUS_SCHEDULE}
    Click Element    ${BUS_SCHEDULE}
    Wait Until Page Contains Element    ${SCHEDULE_IFRAME}
    Select Frame   ${SCHEDULE_IFRAME}
    Click Element  ${EXPRESS_BUSES}
    Click Element  ${FIRST_EXPRESS_BUS}
    Click Element    ${FIRST_BUS_STOP}
    Element Attribute Value Should Be  xpath://*[@id="schedule-new-stops"]/div[2]  class  stop-toggle-container active
*** Keywords ***
toDoScreenshot
    ${index}=  Generate Random String
    Capture Page Screenshot  ${index}.png
# paveikslelio pavadinimas sulinkintas/suristas su testcase pavadinimu ir testo zingsniu (pvz.: Choose first ExpressBus Stop_Click Element)

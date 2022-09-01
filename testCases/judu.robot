*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  BuiltIn
Library    String
Variables  ../Resources/variables.py
*** Variables ***

*** Test Cases ***
[Setup]  Run Keywords  Open Browser  ${URL}  ${Browser}
    ...              AND   Set Selenium Speed  ${SELSPEED}  AND  ${MAX_WINDOW}
TC_01 Choose first ExpressBus Stop
    toDoScreenshot
    Click Element  ${ACCEPT_COOKIES}
    toDoScreenshot
    Scroll Element Into View    ${BUS_SCHEDULE}
    toDoScreenshot
    Click Element    ${BUS_SCHEDULE}
    toDoScreenshot
    Wait Until Page Contains Element    ${SCHEDULE_IFRAME}
    toDoScreenshot
    Select Frame   ${SCHEDULE_IFRAME}
    toDoScreenshot
    Click Element  ${EXPRESS_BUSES}
    toDoScreenshot
    Click Element  ${FIRST_EXPRESS_BUS}
    toDoScreenshot
    Click Element    ${FIRST_BUS_STOP}
    toDoScreenshot
    Element Attribute Value Should Be  xpath://*[@id="schedule-new-stops"]/div[2]  class  stop-toggle-container active
    toDoScreenshot
    [Teardown]  Close All Browsers
*** Keywords ***
toDoScreenshot
    ${index}=  Generate Random String
    Capture Page Screenshot  ${index}.png
# paveikslelio pavadinimas sulinkintas/suristas su testcase pavadinimu ir testo zingsniu (pvz.: Choose first ExpressBus Stop_Click Element)
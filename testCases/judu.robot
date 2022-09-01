*** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  BuiltIn
Library    String
Library    ../selenium_file/highlight_element.py
Variables  ../Resources/variables.py
*** Variables ***

*** Test Cases ***
[Setup]  Run Keywords  Open Browser  ${URL}  ${Browser}
    ...              AND   Set Selenium Speed  ${SELSPEED}  AND  ${MAX_WINDOW}
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
    [Teardown]  Close All Browsers
*** Keywords ***
toDoScreenshot
    ${index}=  Generate Random String
    Capture Page Screenshot  ${index}.png
# paveikslelio pavadinimas sulinkintas/suristas su testcase pavadinimu ir testo zingsniu (pvz.: Choose first ExpressBus Stop_Click Element)

toMarkElement
    MARK_ELEMENT
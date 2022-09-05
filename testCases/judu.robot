*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    BuiltIn
Library    String
Library    XML
Library   ../Resources/HighlightElement.py
Variables  ../Resources/variables.py
Resource   ../Resources/configuration.robot

Test Setup  StartBrowserAndMaximizeAndSpeed
Test Teardown  closeBrowserWindow
*** Variables ***

*** Test Cases ***
TC_01 Choose first ExpressBus Stop
    Highlight  ${ACCEPT_COOKIES}
    Click Element  ${ACCEPT_COOKIES}

#    ${temp}=  Get CSS Property Value  ${ACCEPT_COOKIES}  border-width
#    Log To Console    TEMP${temp}
    # Get element using Xpath in JavaScript.
#    ${element}=    Set Variable    document.evaluate('html/body/div[2]/div[2]/button[1]', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue
    # Get css attribute value using getComputedStyle()
#    ${attribute_value}=    Execute Javascript    return window.getComputedStyle(${element},null).getPropertyValue('style');
#    ${attribute_value}=    Execute Javascript  return window.getComputedStyle(document."arguments[0].style.border='2px solid red'", ${element});
#    Log  ${attribute_value}
#    ${temp}=  Get WebElement    ${ACCEPT_COOKIES}
#    Log To Console    TEMP${temp}
#    ${elem_attrib}=  Set Suite Variable   ${ACCEPT_COOKIES}    red
#    Log To Console    ELEM_ATTRIB${elem_attrib}
#    ${style}=  Get Element Attribute    ${ACCEPT_COOKIES}    class
#    ${color}=  evaluate  re.search("background-color: *(.*?);", '''${style}''').group(1)

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

Highlight
    [Arguments]  ${xpath}
    ${element}=  Get WebElement    ${xpath}
    Log To Console     ${element}
    ${attribute_value}=  Execute Javascript  ("arguments[0].setAttribute('style', arguments[1]);", ${element}, "border: 5px solid red;")


#TODO what if python function return red border and selenium set border to the element


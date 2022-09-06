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
    Highlight  ${ACCEPT_COOKIES}

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
# TODO try to do image name from testcase and keywords names (e.g. Choose first ExpressBus Stop_Click Element)

Highlight
    [Arguments]  ${xpath}
    ${web_element}=  Get WebElement    ${xpath}
    ${returnjselement}=    Execute Javascript    return document.evaluate("//html/body/div[2]/div[2]/button[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    Log To Console    ${web_element}
    Log To Console    ${returnjselement}
    Execute Javascript  ("arguments[0].style.border = '5px solid red'", '${returnjselement}')
    Element Attribute Value Should Be   ${xpath}   style   border: 5px solid red;
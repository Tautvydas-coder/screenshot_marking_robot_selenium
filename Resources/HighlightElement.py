from selenium import webdriver
from selenium.webdriver.common.by import By
from Resources.variables import *
from robot.api.deco import keyword

ROBOT = False

chromeOptions = webdriver.ChromeOptions()
driver = webdriver.Chrome()
driver.maximize_window()
driver.get(URL)


@keyword("MARK_ELEMENT")
def highlight():
    # Highlights a Selenium Webdriver element
    element = driver.find_element(By.XPATH, ACCEPT_COOKIES)
    print(element)
    # session and element strings always have differens values
    # <selenium.webdriver.remote.webelement.WebElement (session="5b63ae06a9909947d722318bb9fae8b0", element="3e7f0497-aa1a-4b4e-a980-e3c0d84d94d0")>
    driver.execute_script("arguments[0].setAttribute('style', arguments[1]);", element, "border: 5px solid red;")
    return True

highlight()
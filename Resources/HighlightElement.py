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
    driver.execute_script("arguments[0].setAttribute('style', arguments[1]);", element, "border: 5px solid red;")
    return True

highlight()

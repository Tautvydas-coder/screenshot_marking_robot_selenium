from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains
import time
from Resources.variables import *
from robot.api.deco import keyword

chromeOptions = webdriver.ChromeOptions()
driver = webdriver.Chrome()
driver.maximize_window()
driver.get(URL)

ROBOT = True

@keyword("MARK_ELEMENT")
def highlight(element, effect_time, color, border, drivers):
    """Highlights (blinks) a Selenium Webdriver element"""
    drivers = element._parent

    def apply_style(s):
        drivers.execute_script("arguments[0].setAttribute('style', arguments[1]);", element, s)

    original_style = element.get_attribute('style')
    apply_style("border: {0}px solid {1};".format(border, color))
    time.sleep(effect_time)
    apply_style(original_style)

open_window_elem = driver.find_element(By.XPATH, ACCEPT_COOKIES[6:])
highlight(open_window_elem, 3, "red", 5, driver)
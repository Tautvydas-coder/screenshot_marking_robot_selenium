from selenium import webdriver
from selenium.webdriver.common.by import By
import time
from Resources.variables import *
from robot.api.deco import keyword

ROBOT = True

# chromeOptions = webdriver.ChromeOptions()
# driver = webdriver.Chrome()
# driver.maximize_window()
# driver.get(URL)


# @keyword("MARK_ELEMENT")
# def highlight(element, effect_time=3, color="red", border=5, drivers=driver):
#     """Highlights (blinks) a Selenium Webdriver element"""
#     drivers = element._parent
#
#     def apply_style(s):
#         drivers.execute_script("arguments[0].setAttribute('style', arguments[1]);", element, s)
#
#     original_style = element.get_attribute('style')
#     apply_style("border: {0}px solid {1};".format(border, color))
#     time.sleep(effect_time)
#     apply_style(original_style)
#
# open_window_elem = driver.find_element(By.XPATH, ACCEPT_COOKIES[6:])
# highlight(open_window_elem)
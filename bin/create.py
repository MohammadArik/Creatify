import os
import time
import sys
from selenium import webdriver


main_dir = os.path.split(sys.argv[0])[0]

try:
    with open(os.path.join(main_dir, "github.pyc"), "r") as f:
        data = f.readlines()
        uid = data[0]
        password = data[1]
        f.close()

except FileNotFoundError:
    sys.exit(1)

uid = uid.replace(uid[-1], "")
password = password.replace(password[-1], "")

driver = webdriver.Firefox()
driver.maximize_window()
driver.get('https://github.com/')


driver.find_element_by_xpath('/html/body/div[1]/header/div/div[2]/div[2]/a[1]').click()

uid_log = driver.find_element_by_xpath('//*[@id="login_field"]')
pass_log = driver.find_element_by_xpath('//*[@id="password"]')
uid_log.send_keys(uid)
pass_log.send_keys(password)
driver.find_element_by_xpath('//*[@id="login"]/form/div[4]/input[12]').click()

driver.find_element_by_xpath('//*[@id="repos-container"]/h2/a').click()

repo_title = driver.find_element_by_xpath('//*[@id="repository_name"]')
repo_title.send_keys(sys.argv[1])


time.sleep(2)
driver.find_element_by_xpath('//*[@id="new_repository"]/div[4]/button').click()

time.sleep(2)

ssh_git = driver.find_element_by_xpath('//*[@id="empty-setup-clone-url"]').get_attribute("value")
driver.close()


os.system('git remote add origin {}'.format(ssh_git))

sys.exit(0) 

import unittest
from selenium import webdriver
import time
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException
from selenium.common.exceptions import StaleElementReferenceException
import os

download_dir = os.getcwd()
options = webdriver.ChromeOptions()

profile = {"plugins.plugins_list": [{"enabled": False, "name": "Chrome PDF Viewer"}], # Disable Chrome's PDF Viewer
               "download.default_directory": download_dir , "download.extensions_to_open": "applications/pdf"}
options.add_experimental_option("prefs", profile)

url = 'https://www.coursera.org/learn/machine-learning/home/'
USER_NAME = '' #add corsera username here
PASSWORD = '' #add coursera password here
urls = ['https://www.coursera.org/learn/machine-learning/home/week/{}'.format(x) for x in range(1,12)]
class get_coursera_pdfs(unittest.TestCase):

    @classmethod
    def setUp(cls):

        cls.driver = webdriver.Chrome(executable_path = 'chromedriver.exe', options = options) #here you need to replace your executable path with where your driver is located.  I just put it in my directory
        cls.driver.get(url)
        cls.driver.maximize_window()
        cls.driver.implicitly_wait(3)

    def log_in(self, username = USER_NAME, password = PASSWORD):
        self.driver.find_element_by_name("email").send_keys(username)

        self.driver.find_element_by_name("password").send_keys(password)

        self.driver.find_element_by_name("login").submit()

    def get_urls(self):
        ##Get all the links to our pdfs along with what we want to name our pdfs after we are done
        pdf_links = []
        for url in urls:
            self.driver.get(url)
            self.driver.maximize_window()
            time.sleep(3)
            try:
                links = self.driver.find_elements_by_partial_link_text('Lecture Slides')
                for link in links:
                    pdf_links.append((url.split('/')[-1],links.index(link)+1,link.get_attribute('href')))            
                time.sleep(1)
            except Exception as e:
                print(e, "\n Error so we won't add a URL")

        return pdf_links

    def get_pdfs(self,pdf_links):
        ## Downloads all our pdfs and renames them to the links provided in the pdf_linkts index 1 is the link, index 0 is what to nam eit
        for item in pdf_links:
            print(item)
            self.driver.get(item[1])
            delay = 10 # seconds
            try:
                myElem = WebDriverWait(self.driver, delay).until(EC.presence_of_element_located((By.CLASS_NAME, 'cml-asset-link')))
                print("Page is ready!")
            except TimeoutException:
                print("Loading took too much time!")
            
            max_attempts = 5
            attempts = 0 
            while True:
                try:
                    self.driver.find_element_by_class_name("cml-asset-link").click()

                    break
                except StaleElementReferenceException:
                    if attempts == max_attempts:
                        raise
                    attempts+=1
                    print(str(attempts))


            
            time.sleep(2)
            while True:
                try:
                    filename = [name for name in os.listdir(download_dir) if name.startswith('_')][0]
                    os.rename(os.path.join(download_dir,filename),os.path.join(download_dir,item[0]))
                    break
                except Exception as e:
                    if attempts == max_attempts:
                        raise
                    attempts+=1
                    time.sleep(1)

            print('{} renamed to : {}'.format(filename,item[0]))
            time.sleep(2)

    def test_get_pdf(self):
        self.log_in()
        pdf_links = self.get_urls()
        print(len(pdf_links))
        self.get_pdfs([('Week {} - Lecture {}.pdf'.format(pdf_link[0],pdf_link[1]),pdf_link[2]) for pdf_link in pdf_links])
    @classmethod
    def tearDown(cls):
        cls.driver.delete_all_cookies()
        cls.driver.quit()


if __name__ == "__main__":
    unittest.main()

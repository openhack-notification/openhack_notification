from selenium import webdriver
import tldextract


def start():
    global driver
    options = webdriver.ChromeOptions()
    options.add_argument('headless')
    options.add_argument('window-size=1920x1080')
    options.add_argument("disable-gpu")
    options.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36")

    driver = webdriver.Chrome("/usr/lib/chromium-browser/chromedriver", chrome_options=options)
    #driver = webdriver.Chrome('chromedriver', chrome_options=options)


def get_domain(url):
    extracted = tldextract.extract(url)
    domain = "{}.{}".format(extracted.domain, extracted.suffix)
    return domain



def get_rule(a, b):
    rule = ""
    for i in range(len(a)):
        if a[i] == b[i]:
            rule += a[i]
        else:
            rule = rule[:-1]
            rule += a[i+2:]
            
def get_element_by_text(str):
    element = driver.find_elements_by_xpath("//*[contains(text(), '" + str + "')]")
    if not len(element):
        print("Can not Find Element")
        return None
    else:
        return element[0]


def get_xpath_by_element(web_element):
    xpath = driver.execute_script("""gPt=function(c){
                                     if(c.id!==''){
                                         return'id("'+c.id+'")'
                                     } 
                                     if(c===document.body){
                                         return c.tagName
                                     }
                                     var a=0;
                                     var e=c.parentNode.childNodes;
                                     for(var b=0;b<e.length;b++){
                                         var d=e[b];
                                         if(d===c){
                                             return gPt(c.parentNode)+'/'+c.tagName+'['+(a+1)+']'
                                         }
                                         if(d.nodeType===1&&d.tagName===c.tagName){
                                             a++
                                         }
                                     }
                                 };
                                 return gPt(arguments[0]).toLowerCase();""", web_element)
    return xpath


def get_rule(xpath1, xpath2):
    rule = ""
    for i in range(len(xpath1)):
        if xpath1[i] == xpath2[i]:
            rule += xpath1[i]
        else:
            rule = rule[:-1]
            rule += xpath1[i+2:]
            # print("found!", rule)
            return rule
    print("Error: Can not find rule")
    return None


def crawl(url, rule):
    posts = []
    links = []
    driver.get(url)

    if links is None and links[0][:4] != "http":

        links = []
        for i in range(len(driver.find_elements_by_xpath(rule))):
            driver.implicitly_wait(3)
            driver.find_elements_by_xpath(rule)[i].click()
            links.append(driver.current_url)
            driver.back()
            # driver.execute_script("window.history.go(-1)")

    return posts, links


def get_xpath_by_element(web_element):
    xpath = driver.execute_script("""gPt=function(c){
                                     if(c.id!==''){
                                         return'id("'+c.id+'")'
                                     } 
                                     if(c===document.body){
                                         return c.tagName
                                     }
                                     var a=0;
                                     var e=c.parentNode.childNodes;
                                     for(var b=0;b<e.length;b++){
                                         var d=e[b];
                                         if(d===c){
                                             return gPt(c.parentNode)+'/'+c.tagName+'['+(a+1)+']'
                                         }
                                         if(d.nodeType===1&&d.tagName===c.tagName){
                                             a++
                                         }
                                     }
                                 };
                                 return gPt(arguments[0]).toLowerCase();""", web_element)
    return xpath


def find_board_info(url, str1, str2):
    driver.get(url)

    element1 = driver.find_elements_by_xpath("//*[contains(text(), '" + str1 + "')]")[0]
    element2 = driver.find_elements_by_xpath("//*[contains(text(), '" + str2 + "')]")[0]

def find_board_info(url, str1, str2):
    driver.get(url)

    tmp = get_element_by_text(str1)
    if tmp is None:
        return None, None, None
    element1 = tmp

    tmp = get_element_by_text(str2)
    if tmp is None:
        return None, None, None
    element2 = tmp
'''

    xpath1 = get_xpath_by_element(element1)
    xpath2 = get_xpath_by_element(element2)

    rule = get_rule(xpath1, xpath2)

    site_title = driver.find_element_by_xpath("/html/head/title").get_attribute('text')

    driver.get("http://" + get_domain(url))
    domain_title = driver.find_element_by_xpath("/html/head/title").get_attribute('text')

    return rule, site_title, domain_title


if __name__ == '__main__':
    #사용자 입력 정보
    url = 'https://cs.kookmin.ac.kr/news/notice/'
    str1 = '네이버 커넥트재단 부스트캠프'
    str2 = '2019학년도 1학기 학업성적 확인 및 정정요청 기간 …'

    start()

    rule, site_title, domain_title = find_board_info(url, str1, str2)
'''

    print("rule: ", rule, "\nsite_title", site_title, "\ndomain_title: ", domain_title)


    posts, links = crawl(url, rule)

    for i in range(len(posts)):
        print(i, posts[i], links[i])
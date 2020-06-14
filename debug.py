import crawler as cw

url = 'https://cs.kookmin.ac.kr/news/notice/'
str1 = '네이버 커넥트재단 부스트캠프'
str2 = '2019학년도 1학기 학업성적 확인 및 정정요청 기간 …'



if __name__ == '__main__':
    #사용자 입력 정보
    url = 'https://cs.kookmin.ac.kr/news/notice/'
    str1 = '네이버 커넥트재단 부스트캠프'
    str2 = '2019학년도 1학기 학업성적 확인 및 정정요청 기간 …'

    options = cw.webdriver.ChromeOptions()
    options.add_argument('headless')
    options.add_argument('window-size=1920x1080')
    options.add_argument("disable-gpu")
    options.add_argument("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36")

    driver = cw.webdriver.Chrome('chromedriver', chrome_options=options)
    driver.implicitly_wait(3)

    rule, site_title, domain_title = cw.find_board_info(url, str1, str2)

    print("rule: ", rule, "\nsite_title", site_title, "\ndomain_title: ", domain_title)

    for i in cw.crawl(url, rule):
        print(i)
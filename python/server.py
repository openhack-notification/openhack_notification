import main
import crawler
from http.server import HTTPServer, BaseHTTPRequestHandler
from optparse import OptionParser
from urllib.parse import urlparse
import urllib
def crawling(url,str1,str2):
    crawler.start()
    rule, site_title, domain_title = crawler.find_board_info(url, str1, str2)

    print("rule: ", rule, "\nsite_title", site_title, "\ndomain_title: ", domain_title)

    boards,urls = crawler.crawl(url,rule)

    for i in crawler.crawl(url, rule):
       print(i)
    post_id = main.insert_into_tables(rule,site_title,domain_title,url)

    board_urls = list(zip(boards,urls))
    for elem in board_urls:
        main.insert_into_crawl_list(post_id,elem[0],elem[1])


class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        print(type(self.path))
        print(self.path.encode())
        parsed_path=urlparse(self.path)
        message_parts=['Client string : {0:s}'.format(self.address_string()),
                       'Command : {0:s}'.format(self.command),
                       'Path : {0:s}'.format(self.path),
                       'real path : {0:s}'.format(parsed_path.path),
                       'query : {0:s}'.format(parsed_path.query),]
        message='<br>'.join(message_parts)

        self.send_response(200) #응답코드
        self.end_headers() #헤더가 본문을 구분
        self.wfile.write(message.encode('utf-8'))
        if(parsed_path.query):
            s = parsed_path.query
            out = urllib.parse.unquote(s).split(',')

            #out = bytes(s, 'utf-8').decode('utf-8').split(',')
            for elem in out:
                crawling(out[0],out[1],out[2])
        return None

s=HTTPServer(('localhost',8080),MyHandler)
s.serve_forever()




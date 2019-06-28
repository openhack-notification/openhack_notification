import main
import crawler
from http.server import HTTPServer, BaseHTTPRequestHandler
from optparse import OptionParser
from urllib.parse import urlparse
import urllib
import copy

def crawling(url,str1,str2):
    crawler.start()
    print("hi")
    print(url)
    print(str1)
    print(str2)
    
    rule, site_title, domain_title = crawler.find_board_info(url, str1, str2)
    print("rule: ", rule, "\nsite_title : ", site_title, "\ndomain_title: ", domain_title)

    _list=crawler.crawl(url,rule)
    boards=_list[0]
    urls =_list[1] 

    post_id = main.insert_into_tables(rule,site_title,domain_title,url)
    board_urls = list(zip(boards,urls))

    for _i,elem in enumerate(board_urls):
        print(str(_i+1)+'/'+str(len(board_urls)))
        print(elem[0],elem[1])
        main.insert_into_crawl_list(post_id,elem[0],elem[1])


class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        parsed_path=urlparse(self.path)
        message_parts=['Client string : {0:s}'.format(self.address_string()),
                       'Command : {0:s}'.format(self.command),
                       'Path : {0:s}'.format(self.path),
                       'real path : {0:s}'.format(parsed_path.path),]
                       
        message='<br>'.join(message_parts)

        self.send_response(200) #응답코드
        self.end_headers() #헤더가 본문을 구분
        self.wfile.write(message.encode('utf-8'))
        if(parsed_path.query):
            s = parsed_path.query
            out = urllib.parse.unquote(s).split('&')
            
            
            
            #out = urllib.parse.unquote(s)
            
            
            #index1 = out.find("?url=")+5
            #index2 = out.find("&str1=")+6
           #index3 = out.find("&str2=")+6

           # _url = out[index1:index2-6]
           # _str1 = out[index2:index3-6]
           # _str2 = out[index3:]
           #
            #_str1 = _str1.replace('+', ' ')
            #_str2 = _str2.replace('+', ' ')
            
           # url = copy.deepcopy(_url)
           # str1 = copy.deepcopy(_str1).strip()
           # str2 = copy.deepcopy(_str2).strip()
            url = copy.deepcopy(out[0][4:])
            str1 = copy.deepcopy(out[1][5:15].replace('+',' '))
            str2 = copy.deepcopy(out[2][5:15].replace('+',' '))
            print(url)
            print(str1)
            print(str2)
            crawling(url,str1,str2)
        print("crawling and database inserting completed. wait for request...")
        return None


s=HTTPServer(('0.0.0.0',8080),MyHandler)
print("wait for request...")
s.serve_forever()




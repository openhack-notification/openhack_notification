import crawler
import sqlite3
import pymysql
import psycopg2
from datetime import datetime

def get_conn():
    host="db-central-ydd.cp97brx4lcga.ap-northeast-2.rds.amazonaws.com"
    port=5432
    dbname="db-central-ydd_development"
    user="ydd"
    password="a1274821"
    conn = psycopg2.connect("dbname={} user={} host={} password={}".format(dbname,user,host,password))
    return conn

def check():
    host="db-central-ydd.cp97brx4lcga.ap-northeast-2.rds.amazonaws.com"
    port=5432
    dbname="db-central-ydd_development"
    user="ydd"
    password="a1274821"
    conn = psycopg2.connect("dbname={} user={} host={} password={}".format(dbname,user,host,password))
    cur = conn.cursor()
    quary = "Select * from Bulletins"
    cur.execute(quary)
    rows = cur.fetchall()
    for row in rows:
        print(row)

    cur = conn.cursor()
    quary = "Select * from Posts"
    cur.execute(quary)
    rows = cur.fetchall()
    for row in rows:
        print(row)

    cur = conn.cursor()
    quary = "Select * from crawl_lists"
    cur.execute(quary)
    rows = cur.fetchall()
    for row in rows:
        print(row)


def delete():
    #conn = sqlite3.connect("db.sqlite3")
    conn=get_conn()
    cur = conn.cursor()
    quary = "DELETE FROM crawl_lists"
    cur.execute(quary)
    conn.commit()
    cur = conn.cursor()
    quary = "DELETE FROM posts"
    cur.execute(quary)
    conn.commit()
    cur = conn.cursor()
    quary = "DELETE FROM Bulletins"
    cur.execute(quary)
    conn.commit()

   

    

def insert_into_bulletin(domain_title):
    #conn = sqlite3.connect("db.sqlite3")
    conn=get_conn()

    cur = conn.cursor()
    quary = "Select MAX(id) from Bulletins"
    cur.execute(quary)
    rows = cur.fetchall()
    if rows[0][0] is not None:
        for row in rows:
            max_bulletinid = row[0]+1
    else:
        max_bulletinid = 1

    cur = conn.cursor()
    quary = "Select title,id from Bulletins"
    cur.execute(quary)
    rows = cur.fetchall()
    is_joongbok = False
    for row in rows:
       if domain_title == row[0]:
           is_joongbok = True
           return row[1]

    if not is_joongbok:
        cur = conn.cursor()
        now = datetime.now()
        query = "insert into Bulletins(title,created_at,updated_at) values ('"+domain_title+"','"+str(now)+"','"+str(now)+"')"
        cur.execute(query)
        conn.commit()

        cur = conn.cursor()
        query = "Select id from Bulletins where title='"+domain_title+"'"
        cur.execute(query)
        for row in rows:
           return row[0]


def insert_into_post(bulletin_id,site_title,url,select_rule):
    #conn = sqlite3.connect("db.sqlite3")
    conn=get_conn()
    cur = conn.cursor()
    quary = "Select MAX(id) from posts"
    cur.execute(quary)
    rows = cur.fetchall()
    if rows[0][0] is not None:
        for row in rows:
            max_postid = row[0]+1
    else:
        max_postid = 1

    cur = conn.cursor()
    quary = "Select title,id from posts"
    cur.execute(quary)
    rows = cur.fetchall()
    is_joongbok = False
    for row in rows:
       if site_title == row[0]:
           is_joongbok = True
           return row[1]
    
    if not is_joongbok:
        cur = conn.cursor()
        now = datetime.now()
        query = "insert into Posts(bulletin_id,title,url,select_role,created_at,updated_at) values ("+str(bulletin_id)+",'"+site_title+"','"+url+"','"+select_rule+"','"+str(now)+"','"+str(now)+"')"

        cur.execute(query)
        conn.commit()
        cur = conn.cursor()
        query = "Select id from Posts where title='"+site_title+"'"
        cur.execute(query)
        for row in rows:
            return row[0]
    else:
        return max_postid-1

def insert_into_crawl_list(post_id,title):
#    conn = sqlite3.connect("db.sqlite3")
    conn=get_conn()
    cur = conn.cursor()
    quary = "Select MAX(id) from crawl_lists"
    cur.execute(quary)
    rows = cur.fetchall()
    if rows[0][0] is not None:
        for row in rows:
            max_crawl_list_id = row[0]+1
    else:
        max_crawl_list_id = 1

    cur = conn.cursor()
    quary = "Select title,id from crawl_lists"
    cur.execute(quary)
    rows = cur.fetchall()
    is_joongbok = False
    for row in rows:
       if title == row[0]:
           is_joongbok = True
           return row[1]

    if not is_joongbok:
        cur = conn.cursor()        
        now = datetime.now()

        query = "insert into crawl_lists(post_id,title,created_at,updated_at) values ("+str(post_id)+",'"+title+"','"+str(now)+"','"+str(now)+"')"
        cur.execute(query)
        conn.commit()
        return max_crawl_list_id
    else:
        return max_crawl_list_id-1

def insert_into_tables(rule, site_title, domain_title,url):
    bulletin_id = insert_into_bulletin(domain_title)
    post_id = insert_into_post(bulletin_id,site_title,url,rule)
    return post_id

# 사용자 입력 정보
url = 'https://cs.kookmin.ac.kr/news/notice/'
str1 = '네이버 커넥트재단 부스트캠프'
str2 = '2019학년도 1학기 학업성적 확인 및 정정요청 기간 …'

crawler.start()

rule, site_title, domain_title = crawler.find_board_info(url, str1, str2)

print("rule: ", rule, "\nsite_title", site_title, "\ndomain_title: ", domain_title)

boards = crawler.crawl(url,rule)
for i in crawler.crawl(url, rule):
    print(i)

post_id = insert_into_tables(rule,site_title,domain_title,url)


for elem in boards:
     insert_into_crawl_list(post_id,elem)

insert_into_tables(rule,site_title, domain_title,url)

check()
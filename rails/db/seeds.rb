# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## 테스트 계정 생성(어드민 권한 O)
test1 = User.create( email: 'kbs4674@naver.com', password: '123456', nickname: '어드민', admin: true )
user = User.find(1)
user.add_role :admin

## 테스트 계정 생성(어드민 권한 X)
test2 = User.create( email: 'test4674@naver.com', password: '123456', nickname: '테스트계정1',  admin: false )
user = User.find(2)
user.add_role :normal
user.add_role :block_yellow
user.add_role :block_red

User.create( email: 'test@naver.com', password: '123456', nickname: '테스트계정2',  admin: false )
User.create( email: 'test2@naver.com', password: '123456', nickname: '테스트계정3',  admin: false )
User.create( email: 'test3@naver.com', password: '123456', nickname: '테스트계정4',  admin: false )

## 게시판 생성
Bulletin.create( title: '한양대 ERICA', opt_crawl: true, user_nickname: '어드민', user_id: '1' )
Bulletin.create( title: '국민대학교', opt_crawl: true, user_nickname: '어드민', user_id: '1' )

# Post.create( bulletin_id: 1, title: "", content: "", url: "", select_role: "", user_id: 1, user_nickname: 1)
Post.create( bulletin_id: 1, title: "주요알림 - 한양대학교", url: "https://www.hanyang.ac.kr/web/www/main-notices", select_role: "#notice01 > div > table > tbody > tr > td > div > div > p > a")
Post.create( bulletin_id: 1, title: "전체공지 목록- 열린 캠퍼스 > 통합공지 - 국민대학교", url: "https://www.kookmin.ac.kr/site/ecampus/notice/all/?utm_source=www_visual&utm_medium=More%EB%B2%84%ED%8A%BC&utm_campaign=%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80%EC%9A%94%EC%86%8C%EB%B3%84%ED%81%B4%EB%A6%AD&utm_content=%EC%A0%84%EC%B2%B4%EA%B3%B5%EC%A7%80", select_role: "#content_body > section > div.boardlist > table > tbody > tr > td > a")

## CrawlList.create( post_id: 1, title: "", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[서울, ERICA 공통] 무인증명발급기 로그인 방식 변경 안내", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[학생생활관][2019년 9월 신입학 합격자] 2019-2학기 정규입사 모집요강", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[학생생활관][학부 재학생 및 일반대학원생] 2019-2학기 정규입사 모집요강", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "국민권익위 사학비리.부패신고센터 운영 안내", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[서울,ERICA 공통]증명발급 일시 중단 안내(2019.06.10(월) 14:00 - 15:00)", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[서울,ERICA 공통]증명발급 일시 중단 안내(2019.06.05(수) 18:00 - 21:00)", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[서울]2019-2학기 학부 재학생 교내 장학금(성적,가계곤란) 신청 안내", is_message_send: "false" )

CrawlList.create( post_id: 2, title: "'19년 2학기 삼성드림클래스 주중주말교실 대학생멘토 추가선발 협조요청", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[경영대학원 교학팀] 계약직원 모집", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[공동실험기기센터] 계약직원 모집", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[2019학년도 2학기 전임교원 신규충원] 최종 합격자 발표", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[학술서비스팀] 계약직원 모집", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[총무팀(수위실)] 계약직원 모집", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[비서실] 계약직원 모집", is_message_send: "false" )

## 데이터 테스트용
# for num in 1..50000
#     AllNotice.create( title: "#{num}", content: "안녕#{num+2}", global_notice: 'false', local_notice: 'false', user_nickname: "어드민", user_id: "1" )
# end
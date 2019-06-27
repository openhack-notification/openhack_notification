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
Bulletin.create( title: '한양대 ERICA' )
Bulletin.create( title: '국민대학교' )

# Post.create( bulletin_id: 1, title: "", content: "", url: "", select_role: "", user_id: 1, user_nickname: 1)
Post.create( bulletin_id: 1, title: "주요알림 - 한양대학교", url: "https://www.hanyang.ac.kr/web/www/main-notices", select_role: "#notice01 > div > table > tbody > tr > td > div > div > p > a")
Post.create( bulletin_id: 1, title: "보도자료 - 한양대학교", url: "https://www.hanyang.ac.kr/web/www/press#none", select_role: "#notice01 > div > table > tbody > tr > td > div > div > p > a")
Post.create( bulletin_id: 1, title: "일일 브리핑 - 한양대학교", url: "https://www.hanyang.ac.kr/web/www/daily", select_role: "#notice01 > div > table > tbody > tr > td > div > div > p > a")

Post.create( bulletin_id: 2, title: "전체공지 목록- 열린 캠퍼스 > 통합공지 - 국민대학교", url: "https://www.kookmin.ac.kr/site/ecampus/notice/all/?utm_source=www_visual&utm_medium=More%EB%B2%84%ED%8A%BC&utm_campaign=%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80%EC%9A%94%EC%86%8C%EB%B3%84%ED%81%B4%EB%A6%AD&utm_content=%EC%A0%84%EC%B2%B4%EA%B3%B5%EC%A7%80", select_role: "#content_body > section > div.boardlist > table > tbody > tr > td > a")
Post.create( bulletin_id: 2, title: "행정공지 목록- 열린 캠퍼스 > 통합공지 - 국민대학교", url: "https://www.kookmin.ac.kr/site/ecampus/notice/all/?utm_source=www_visual&utm_medium=More%EB%B2%84%ED%8A%BC&utm_campaign=%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80%EC%9A%94%EC%86%8C%EB%B3%84%ED%81%B4%EB%A6%AD&utm_content=%EC%A0%84%EC%B2%B4%EA%B3%B5%EC%A7%80", select_role: "#content_body > section > div.boardlist > table > tbody > tr > td > a")


## CrawlList.create( post_id: 1, title: "", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[서울, ERICA 공통] 무인증명발급기 로그인 방식 변경 안내", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[학생생활관][2019년 9월 신입학 합격자] 2019-2학기 정규입사 모집요강", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[학생생활관][학부 재학생 및 일반대학원생] 2019-2학기 정규입사 모집요강", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "국민권익위 사학비리.부패신고센터 운영 안내", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[서울,ERICA 공통]증명발급 일시 중단 안내(2019.06.10(월) 14:00 - 15:00)", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[서울,ERICA 공통]증명발급 일시 중단 안내(2019.06.05(수) 18:00 - 21:00)", is_message_send: "false" )
CrawlList.create( post_id: 1, title: "[서울]2019-2학기 학부 재학생 교내 장학금(성적,가계곤란) 신청 안내", is_message_send: "false" )

CrawlList.create( post_id: 2, title: "[19.06.27] <인사> 한양대(교무위원)", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[19.06.27] 한양대 아태지역연구센터, 러시아 차세대 정책전문가 포럼", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[19.06.25] 국내 과학자가 새로운 딥러닝 인공지능 학습 알고리즘 개발, 저명한 외국 학술지에 발표", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[19.06.21] 한양대 경영대학, PBL수업 성과공유회 개최", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[19.06.19] 한양대, 혁신적 아이디어 가진 예비창업자 모집", is_message_send: "false" )
CrawlList.create( post_id: 2, title: "[19.06.14] 한양대, 제 2회 Innovation Awards 시상식 열어", is_message_send: "false" )

CrawlList.create( post_id: 4, title: "2020학년도 전부(과) 선발방법 안내", is_message_send: "false" )
CrawlList.create( post_id: 4, title: "하계방학 종합서비스센터 근무시간 안내", is_message_send: "false" )
CrawlList.create( post_id: 4, title: "2019학년도 하계 계절학기 2차 폐강 안내", is_message_send: "false" )
CrawlList.create( post_id: 4, title: "졸업인증제 변경사항 안내", is_message_send: "false" )
CrawlList.create( post_id: 4, title: "[교무팀] 계절학기 관련 안내", is_message_send: "false" )
CrawlList.create( post_id: 4, title: "2019학년도 하계 계절학기 등록안내", is_message_send: "false" )

CrawlList.create( post_id: 3, title: "6/27 지석영상 수상", is_message_send: "false" )
CrawlList.create( post_id: 3, title: "6/26 새로운 딥러닝 학습 알고리즘 개발", is_message_send: "false" )
CrawlList.create( post_id: 3, title: "6/17 한경·글로벌리서치 이공계 대학 평가", is_message_send: "false" )
CrawlList.create( post_id: 3, title: "6/13 '진로지도 교수 활성화 사례' 공유", is_message_send: "false" )
CrawlList.create( post_id: 3, title: "6/11 '라 트라비아타' 성황리에 마쳐", is_message_send: "false" )
CrawlList.create( post_id: 3, title: "6/7 '온 나라 국악 경연대회' 대상에", is_message_send: "false" )

CrawlList.create( post_id: 5, title: "2019학년도 하반기 숲해설가 21기 추가모집 안내", is_message_send: "false" )
CrawlList.create( post_id: 5, title: "제20회 전국 고등학생 조형실기대회 입상자 발표", is_message_send: "false" )
CrawlList.create( post_id: 5, title: "'19년 민방위대원(1~4년차) 민방위 기본교육 안내", is_message_send: "false" )
CrawlList.create( post_id: 5, title: "교내 단수 및 정전 안내", is_message_send: "false" )
CrawlList.create( post_id: 5, title: "[창업지원단] 2019년 글로벌 창업 강좌 [Global Challenge] 참가자 모집", is_message_send: "false" )
CrawlList.create( post_id: 5, title: "[홍보팀] 교수님들의 다양한 성과를 공유해주세요", is_message_send: "false" )

Subscribe.create( post_id: 1, user_id: 1 )
## 데이터 테스트용
# for num in 1..50000
#     AllNotice.create( title: "#{num}", content: "안녕#{num+2}", global_notice: 'false', local_notice: 'false', user_nickname: "어드민", user_id: "1" )
# end
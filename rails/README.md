# Ruby on Rails New Project Base

## 팀원
#### 김철민


## 1. INFO
<img src="" width="250px">

#### 주최명
#### [DEMO] 


## 2. 루비/루비온 레일즈 정보
* Ruby : 2.4.0
* Rails : 5.1.6


## 3. 프로젝트 개요
1.


## 4. 핵심 코드파일
1. ```app/controllers/messages_controller.rb``` [<a href="/app/controllers/messages_controller.rb">이동</a>] 쪽지 시스템 관련 Controller


## 5. M : 모델 설명
* AllNotice : 공지사항 (어드민만 작성 허용)
* Bulletin : 게시만을 생성하기 위한 카테고리 (Post와 DB Model 연결관계, 어드민만 작성 허용)
* Post : 게시판 (여러 목적의 게시판 생성이 가능)
* Comment : 댓글 (대댓글 작성 가능)
* Conversation : 쪽지함 내 1:1 대화방
* Message : 쪽지에서 유저 간 오고가는 메세지
* NewNotification : 쪽지 및 댓글 수신에 대해 사용자에게 알림이 감 (unread Gem 관련)
* Ability : 권한에 따른 허용 권한범위 설정
* Univ : 대학교 및 혜택별 Boolean 체크
* Promotion : 혜택 이름 및 혜택 설명


## 6. Ruby on Rails 프로젝트 생성
* 첫 레일즈 셋팅 (C9에서 Ruby on Rails Tutorial 프로젝트를 선택하세요.)
    * 공개버전 Github에서는 API 관련 등 계정 정보가 담긴 ```application.yml``` 파일이 없습니다.
```
git init
rm -rf README.md
git remote add origin https://github.com/kbs4674/rails_base
git pull origin master
gem install rails --version=5.1.6
bundle install
rake db:drop;rake db:migrate;rake db:seed
rails s -b $IP -p $PORT
```
* 혹시 AWS에서 프로젝트를 생성 할 경우 ```bundle install``` 전에 다음 명령어를 추가적으로 입력해주세요.
```
sudo su
yum install -y postgresql95 postgresql95-server postgresql95-libs postgresql95-contrib postgresql95-devel
exit
bundle install
```
* <b>AWS 기준</b> 서버 설정법은 다음 과정을 따라주길 바랍니다.
    * <a href="https://blog.naver.com/kbs4674/221168996150" target="_blank">```https://blog.naver.com/kbs4674/221168996150```</a>
* <b>Heroku</b> 서버 셋팅은 <a href="http://wantknow.tistory.com/61" target="_blank"><b>여기</b></a>를 참고 바랍니다.
* <b>development 환경</b>에서 ```rake db:drop``` 시 오류가 나오는 것은 "정상"입니다.
    * production 모드에서 설정한 PostgreSQL DB 설정 때문이며, 정상 drop 됩니다.
* <b>Heroku</b> 서버 설정 시, ```database.yml``` 파일을 수정해주세요.
* <b>Heroku</b> 에 Deploy 때, <b>You must use Bundler 2 or greater with this lockfile</b> 오류 발생 시,
```heroku login``` 및 ```git remote heroku ...``` 후,  ```heroku buildpacks:set https://github.com/bundler/heroku-buildpack-bundler2``` 명령어를 입력해주세요.


## 7. Ruby on Rails 간단 이론 설명
* 이론
    * Ruby on Rails은 Ruby 기반의 웹 프레임워크임. (Python의 Django 혹은 Java의 Spring 같은 개념)
    * Ruby on Rails은 MVC 패턴으로 이루어져 있으며, 디자인 작업은 보통 V(View)에서 이루어짐
        * M : Model(DB 및 DB 관계를 다룸) / V : View (페이지를 다루며, HTML/CSS/Javascript/Rails 코드와 병합되어 사용) / C : Controller (DB를 어떻게 처리할건지 관리)
        * 디자인을 할 땐 M, C를 고려할 것 없이 V만 신경쓰면 될 것임.
    * Javascript, CSS는 ```app/assets/javascript``` 혹은 ```app/assets/stylesheets```에 넣어두면 됨.
        * ```<script src="...">``` 혹은 ```<link rel="...">```을 정의하지 않아도 알아서 적용됨.
        * 캐싱에 영향을 안받음. (F12로 보면 파일 이름 뒤에 난수가 붙는걸 확인 가능)
    * ```<%= ... %>``` 혹은 ```<% ... %>```은 레일즈 코드임.
    * ```<%= render '...' %>```은 ```'...'``` 위치의 View를 불러오는 역할을 맡음 (Default : ```app/views/```)
    * 모든 View에 있어 공통적으로 보여지는 View(예 : 상단 메뉴, 기본 글꼴 style) ```app/views/layouts/application.html.erb``` 
    * 홈페이지 View 코드 수정은 ```app/views/(모델명)``` 에서 이루어짐.<br/><br/>
    * Ruby on Rails에는 크게 3가지 모드가 존재함 : Development, Test, Production
        * Development : 주로 개발용 모드로서 오류를 일으킬 시 오류메세지 및 디버그를 알려줌.
        * Production : 서비스를 릴리즈할 때 쓰이는 모드로서, 링크를 잘못 입력하거나 오류 발생 시 404 에러페이지 혹은 500 에러페이지로 리다이렉트 시킴.
            * 404 혹은 500 페이지 view는 ```public``` 폴더 안에 있음.

* 명령어 및 위치 모음
    * 서버 ON 명령어 : ```rails s -b $IP -p $PORT```
    * DB추가, 애트리뷰트 추가 등으로 인한 업데이트 시( 기존의 데이터 삭제) : ```rake db:drop;rake db:migrate```
    * 미리 입력된 DB 불러오기(app/db/seeds.rb) ```rake db:seed```


## 8. 현재 홈페이지에 있는 기능
* Devise 설치 + 비밀번호 분실 대비 이메일 연동
    * ```enviropment/production&development.rb``` 수정작업 할 것.
* 부트스트랩 4.1 설치
* 폰트어썸 설치 [For 아이콘 표현, <a href="https://fontawesome.com/icons" target="_blank">사이트 참고(클릭)</a>]
* 기본 글꼴 : 나눔고딕 설정
* .gitignore 파일 셋팅 (일부 파일은 github에 자료가 push되는 것을 제한.)
* Rails Local 시간 환경을 '대한민국'으로 설정.
* ```/app/assets/stylesheets/application.scss``` 파일 일부 수정
* 검색창 (created at Now ~ 1년단위 검색) [<a href="https://blog.naver.com/kbs4674/221379111562" target="_blank">참고</a>]
* 쪽지함 [<a href="https://blog.naver.com/kbs4674/221236300834" target="_blank">참고</a>]
* ```rake db:seed``` 시 기본 DB 설정
* Nav-bar 디자인 참고 : https://bootstrapmade.com/demo/BizPage/
* PostgreSQL DB : AWS 서버오픈 기반 설치 [<a href="https://blog.naver.com/kbs4674/221077775973" target="_blank">AWS 서버 설치대비 참고</a>]
    * ```config/application.yml``` 수정작업 할 것.
* 게시판(카테고리 형식) 방식 구현 [<a href="https://blog.naver.com/kbs4674/221380526245" target="_blank">참고</a>]
* Gem : Devise 한국어 번역 처리
* Gem : RailsDB (Development 환경 내에서만 동작) [<a href="https://blog.naver.com/kbs4674/221052908122" target="_blank">참고</a>]
* Gem : J-Query 설치
* Gem : cancancan+rolify [<a href="https://blog.naver.com/kbs4674/221069915874" target="_blank">참고</a>]
* Gem : paranoia (자료 백업 / Bulletin, Post) [<a href="https://blog.naver.com/kbs4674/221052897085" target="_blank">참고</a>]
* Gem : therubyracer (서버 설정 전용 Gem)
* Gem : Figaro (코드보안) [<a href="https://blog.naver.com/kbs4674/221191136195" target="_blank">참고</a>]
* Gem : Rails Admin (어드민 페이지) [<a href="https://blog.naver.com/kbs4674/221187526054" target="_blank">참고</a>]
* Gem : TinyMce (게시글 에디터) [<a href="https://blog.naver.com/kbs4674/221012826088" target="_blank">참고</a>]
* Gem : impressionist 설치 (조회수 / Bulletin, AllNotice, Post) [<a href="https://blog.naver.com/kbs4674/221042620689" target="_blank">참고</a>]
* Gem : Mailgun 기반 설치 (이메일 전송 / Post 모델에서 좋아요 n개 받을 시 전송) [<a href="https://blog.naver.com/kbs4674/221386948816" target="_blank">참고</a>]
    * ```config/application.yml``` 수정작업 할 것.
* Gem : act-as-commentable-with-threading (댓글구현 / AllNotice, Post) [<a href="https://blog.naver.com/kbs4674/221182443309" target="_blank">참고</a>]
    * ajax 구동 방식이라 '좋아요'를 클릭해도 refresh 안됨. [<a href="https://stackoverflow.com/a/34011958" target="_blank">참고</a>]
* Gem : 투표 (쪽지게시판에서 쪽지 숨기기 및 Post 좋아요 등 활용) [<a href="https://blog.naver.com/kbs4674/221173415422" target="_blank">참고</a>]
* Gem : unread (댓글, 쪽지 알림) [<a href="https://blog.naver.com/kbs4674/221174702377" target="_blank">참고</a>]
* Gem : kaminary (게시글 목록) [<a href="https://blog.naver.com/kbs4674/221067158208" target="_blank">참고</a>]
    

## 9. 알아두면 좋은 사이트
* 코딩 지식인 - Stackoverflow <a href="http://stackoverflow.com" target="_blank">클릭</a>
* Rails Gem 추천 사이트 <a href="https://www.ruby-toolbox.com/" target="_blank">클릭</a>
* Rails 사용설명 블로그 <a href="http://blog.naver.com/kbs4674" target="_blank">클릭</a>
Facebook Application Template
===========

#템플릿 사용법

###1. https://developers.facebook.com/apps 

- app 등록
- sandbox 모드 수정
- url, domain 지정 
 - 개발 시에는 localhost, http://localhost:3000 
 - production mode 에서는 서비스되는 도메인 주소 사용

###2. copy /config/facebook.yml.original to /config/facebook.yml

###3. add keys to facebook.yml

- app id 와 secret key 입력 

###4. rake db:migrate

- oauth key 가 저장될 db 생성

###5. permission scope 지정

- /config/initializers/omniauth.rb
 - scope: "email, publish_stream" -> 수정

- /app/assets/javascripts/facebook.js.coffee.erb
 - scope: "email, publish_stream" -> 수정

- https://developers.facebook.com/apps 의 Settings에서 Permissions 을 지정
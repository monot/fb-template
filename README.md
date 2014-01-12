Facebook Application Template
===========

템플릿 사용법

1. https://developers.facebook.com/apps 

- app 등록
- sandbox 모드 수정
- url, domain 지정 
	-- 개발 시에는 localhost, http://localhost:3000 
	-- production mode 에서는 서비스되는 도메인 주소 사용

2. copy /config/facebook.yml.original to /config/facebook.yml

3. add keys to facebook.yml

- app id 와 secret key 입력 

4. rake db:migrate

- oauth key 가 저장될 db 생성
 
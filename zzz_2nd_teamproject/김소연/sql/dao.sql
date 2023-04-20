
----------------------------------- MEMBER 관련 ----------------------------------
-- 회원가입
INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERADDR, MEMBERBIRTH, MEMBERPOINT)
  VALUES ('bbb', '111', '신치윤', 'shwoo93@naver.com', '010-6344-4081', '인천시 남동구 만수동 1081-3', '93-11-03', 0);

-- 아이디 중복확인
SELECT * FROM MEMBER WHERE MEMBERID = 'bbb';

-- 이메일 중복확인 -- 해도되고 안해도되고 / 하려면 DDL.sql 에서 member 테이블의 이메일 컬럼을 유니크로 변경

-- 로그인
SELECT * FROM MEMBER WHERE MEMBERID = 'bbb' AND MEMBERPW = '111';

-- 아이디 찾기 (이메일 입력)
SELECT * FROM MEMBER WHERE MEMBEREMAIL = 'shwoo93@naver.com';

-- 비밀번호 찾기 (아이디 입력) -- 후에 이메일로 비밀번호 전송시켜줘도 됨
SELECT * FROM MEMBER WHERE MEMBERID = 'bbb';

-- 회원 정보 수정
UPDATE MEMBER 
  SET MEMBERPW = '222',
      MEMBERNAME = '홍길동',
      MEMBEREMAIL = 'hong@naver.com',
      MEMBERTEL = '010-9898-9898',
      MEMBERADDR = '서울시 서대문구 머시기',
      MEMBERBIRTH = '99/12/12'
  WHERE MEMBERID = 'bbb';

-- 회원 탈퇴
DELETE FROM MEMBER WHERE MEMBERID = 'bbb';





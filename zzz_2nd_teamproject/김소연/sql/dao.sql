
----------------------------------- MEMBER 관련 ----------------------------------
-- 회원 id중복체크
SELECT * FROM MEMBER WHERE MEMBERID = 'aaa';
-- 회원가입
INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERADDR, MEMBERBIRTH, MEMBERAMOUNT, MEMBERPOINT)
    VALUES ('aaa', '111', '김길동', 'kim@naver.com', '010-5468-3213', '서울시 서대문구 신촌동 신촌이젠아카데미','90-11-08', 100000, 100);
-- 로그인
SELECT * FROM MEMBER WHERE MEMBERID = 'aaa' AND MEMBERPW = '111';
-- 아이디 찾기
SELECT * FROM MEMBER WHERE MEMBEREMAIL = 'kim@naver.com';
-- 비밀번호 찾기
SELECT * FROM MEMBER WHERE MEMBERID = 'aaa';
-- mid로 dto가져오기 (로그인 성공시 session에 넣기 위해)
SELECT * FROM MEMBER WHERE MEMBERID = 'aaa';
-- 회원정보 수정
UPDATE MEMBER SET 
        MEMBERPW = '222',
        MEMBERNAME = '이길동',
        MEMBEREMAIL = 'lee@naver.com',
        MEMBERTEL = '010-3333-3333',
        MEMBERADDR = '서울시 마포구 합정동 합정이젠아카데미 1층',
        MEMBERBIRTH = '10/03/23'
    WHERE MEMBERID = 'aaa';
-- 회원탈퇴(작성 글 모두 지우고)
DELETE FROM MEMBER WHERE MEMBERID = 'aaa';
COMMIT;

-- 장바구니 (추가, 리스트, 삭제)
INSERT INTO CART (cartNUM, memberID, productCODE, sizeNUM, colorNUM, QTY, COST)
    VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P001', SIZES_SEQ.NEXTVAL, COLOR_SEQ.NEXTVAL, 2, (SELECT productPRICE FROM PRODUCT WHERE productCODE = 'P001')*2);
SELECT * FROM CART;







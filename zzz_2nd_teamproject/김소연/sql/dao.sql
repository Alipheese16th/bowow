
----------------------------------- MEMBER 관련 ----------------------------------
-- 회원 id중복체크 id = memberIdConfirm
SELECT * FROM MEMBER;
SELECT MEMBERID FROM MEMBER WHERE MEMBERID = 'ddd';
SELECT COUNT(*) FROM MEMBER WHERE MEMBERID = 'aaa';
-- 회원 email중복체크 id = memberMailConfirm
SELECT COUNT(*) FROM MEMBER WHERE MEMBEREMAIL = 'kim@naver.com';

SELECT * FROM MEMBER;
DELETE FROM MEMBER WHERE MEMBERID = 'ddd';
DELETE FROM MEMBER WHERE MEMBERNAME = '김길동';
COMMIT;
DELETE FROM MEMBER WHERE MEMBERNAME = '김소연';
DESC MEMBER;
-- 회원가입 id = joinMember
-- 회원정보 전부 입력했을 때
INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERPOST, memberADDR1, memberADDR2, memberBIRTH)
    VALUES ('ccc', '111', '김길동', 'kim2@naver.com', '010-5468-3213', '02165','서울시 서대문구 신촌동 신촌이젠아카데미','301호','90-11-08');
INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERPOST, MEMBERADDR1, MEMBERADDR2, MEMBERBIRTH)
    VALUES ('egf', '111', '김길동', 'kim3@naver.com', '010-5468-3213', null, null,null,null);
INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERPOST, MEMBERADDR1, MEMBERADDR2)
    VALUES ('egf', '111', '김길동', 'kim2@naver.com', '010-5468-3213', NULL, NULL, NULL);
INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERPOST, MEMBERADDR1, MEMBERADDR2, MEMBERBIRTH)
    VALUES ('fff', '111', '김길동', 'kim4@naver.com', '010-5468-3213', null, null, null, null);
    INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERPOST, MEMBERADDR1, MEMBERADDR2, MEMBERBIRTH)
    VALUES ('rrr', '111', '김소연', 'kim6@naver.com', '010-5468-3213', null, null, null, '');
SELECT * FROM MEMBER;
-- 아이디 찾기 id = searchIdMember
SELECT MEMBERID FROM MEMBER WHERE MEMBERNAME = '김소연' AND MEMBEREMAIL = 'tiffany456@naver.com';

SELECT * FROM MEMBER WHERE MEMBERNAME = '김ㄹ';

-- 비밀번호 찾기 id = searchPwMember
SELECT MEMBERPW FROM MEMBER WHERE MEMBERID = 'aaa';
-- mid로 dto가져오기 (로그인 성공시 session에 넣기 위해) id = getDetailMember
SELECT * FROM MEMBER WHERE MEMBERID = 'aaa';
-- 회원정보 수정 id = modifyMember
UPDATE MEMBER SET 
        MEMBERPW = '222',
        MEMBERNAME = '이길동',
        MEMBEREMAIL = 'lee@naver.com',
        MEMBERTEL = '010-3333-3333',
        MEMBERPOST = '03215', 
        MEMBERADDR1 = '서울시 마포구 합정동',
        MEMBERADDR2 = '합정이젠아카데미 1층',
        MEMBERBIRTH = '10/03/23'
    WHERE MEMBERID = 'aaa';
-- 회원탈퇴(작성 글 모두 지우고) id = deleteMember
DELETE FROM MEMBER WHERE MEMBERID = 'ccc';

----------------------------------- CART 관련 ----------------------------------
-- 장바구니 추가
INSERT INTO CART (cartNUM, memberID, productCODE, sizeNUM, colorNUM, QTY, COST)
    VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P0002', 2, 3, 1, (SELECT productPRICE- PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0002')*2);

-- 장바구니 목록 (상품명, 상품대표이미지, 상품사이즈, 상품색상, 상품수량, 상품가격)
SELECT A.*
    FROM (SELECT C.*, TYPE, PRODUCTNAME, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSIZE, PRODUCTCOLOR  FROM CART C, IMAGE I, PRODUCT P, SIZES S, COLOR CO 
        WHERE C.PRODUCTCODE = P.PRODUCTCODE AND P.PRODUCTCODE = I.PRODUCTCODE AND C.PRODUCTCODE = S.PRODUCTCODE AND C.PRODUCTCODE = CO.PRODUCTCODE 
                                            AND IMAGENUM= 1 AND C.PRODUCTCODE = 'P0001' AND S.SIZENUM = 1 AND CO.COLORNUM=2 ORDER BY CARTNUM)A;


SELECT P.*, QTY, COST, (SELECT PRODUCTCOLOR FROM COLOR CO WHERE CO.COLORNUM = C.COLORNUM) PRODUCTCOLOR, (SELECT PRODUCTSIZE FROM SIZES S WHERE S.SIZENUM = C.SIZENUM) PRODUCTSIZE, TYPE
    FROM CART C, PRODUCT P, IMAGE I WHERE C.PRODUCTCODE = P.PRODUCTCODE AND C.PRODUCTCODE='P0001' AND P.PRODUCTCODE = I.PRODUCTCODE AND IMAGENUM=1;


SELECT P.*, QTY, COST, (SELECT PRODUCTCOLOR FROM COLOR CO WHERE CO.COLORNUM = C.COLORNUM) PRODUCTCOLOR, (SELECT PRODUCTSIZE FROM SIZES S WHERE S.SIZENUM = C.SIZENUM) PRODUCTSIZE, TYPE
    FROM CART C, PRODUCT P, IMAGE I WHERE C.PRODUCTCODE = P.PRODUCTCODE  AND P.PRODUCTCODE = I.PRODUCTCODE AND IMAGENUM=1 AND  C.PRODUCTCODE = (SELECT PRODUCTCODE FROM CART WHERE PRODUCTCODE='P0001');


-- SELECT C.*, TYPE, PRODUCTNAME, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSIZE, PRODUCTCOLOR  FROM CART C, IMAGE I, PRODUCT P, SIZES S, COLOR CO 
    -- WHERE C.PRODUCTCODE = P.PRODUCTCODE AND P.PRODUCTCODE = I.PRODUCTCODE AND C.PRODUCTCODE = S.PRODUCTCODE AND C.PRODUCTCODE = CO.PRODUCTCODE AND IMAGENUM= 1 AND C.PRODUCTCODE = 'P0001' AND S.SIZENUM = 1 AND CO.COLORNUM=2;
-- SELECT * FROM CART;

SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT R.*,(SELECT COUNT(*) FROM GOOD G WHERE G.REVIEWNUM = R.REVIEWNUM) GOODCOUNT FROM REVIEW R ORDER BY GOODCOUNT DESC) A)
    WHERE RN BETWEEN 1 AND 3;


-- 장바구니 전체금액
SELECT SUM(COST) FROM CART;
-- 장바구니 일부 삭제
DELETE FROM CART WHERE CARTNUM = 1;
-- 장바구니 전체 삭제
DELETE FROM CART WHERE MEMBERID = 'aaa';
-- 동일한 상품 담았을 때 수량 수정
INSERT INTO CART (cartNUM, memberID, productCODE, sizeNUM, colorNUM, QTY, COST)
    VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P0001', 1, 2, 2, (SELECT productPRICE- PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0001')*2);
-- 장바구니에 동일한 상품을 담았는지 확인
SELECT * FROM CART WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001' AND SIZENUM = 1 AND COLORNUM = 2;
-- 장바구니에 동일한 상품을 담았을 때 수량 업데이트
UPDATE CART SET 
    QTY = QTY+1,
    COST = COST + 1*(SELECT PRODUCTPRICE- PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0001')
    WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001' AND SIZENUM = 1 AND COLORNUM = 1;
    
    
-----------------------------------  MEMBERGRADE 관련 ----------------------------------
UPDATE MEMBER SET
        MEMBERPOINT = MEMBERPOINT + (400000 * 0.05),
        MEMBERAMOUNT = MEMBERAMOUNT + 400000,
        GRADENO = (SELECT G.GRADENO FROM MEMBER, MEMBERGRADE G WHERE MEMBERAMOUNT + 400000 BETWEEN LOWAMOUNT AND HIAMOUNT AND MEMBERID = 'aaa')
    WHERE MEMBERID = 'aaa';
    -- 1단계 : MEMBERPOINT, MEMBERAMOUNT 수정
    UPDATE MEMBER SET 
            MEMBERPOINT = MEMBERPOINT + (100001 * 0.05),
            MEMBERAMOUNT = MEMBERAMOUNT + 100001
        WHERE MEMBERID = 'aaa';
    -- 2단계 : 수정된 MEMBERAMOUNT 따라 GRADENO 조정 
    SELECT MEMBERNAME, MEMBERAMOUNT, M.GRADENO NOWGRADE, G.GRADENO UPGRADE, LOWAMOUNT, HIAMOUNT
        FROM MEMBER M, MEMBERGRADE G 
        WHERE MEMBERAMOUNT BETWEEN LOWAMOUNT AND HIAMOUNT;
    SELECT G.GRADENO
        FROM MEMBER, MEMBERGRADE G
        WHERE MEMBERAMOUNT BETWEEN LOWAMOUNT AND HIAMOUNT AND MEMBERID = 'aaa'; -- 아이디가 aaa인 데이터의 바뀔등급 
    UPDATE MEMBER SET
        GRADENO = (SELECT G.GRADENO FROM MEMBER, MEMBERGRADE G WHERE MEMBERAMOUNT BETWEEN LOWAMOUNT AND HIAMOUNT AND MEMBERID = 'aaa') -- GRADENO 수정
            WHERE MEMBERID = 'aaa';
    
-----------------------------------  MYPAGE 관련 ----------------------------------
-- 마이페이지 (등급까지 조회)
SELECT M.*, GRADE FROM MEMBER M, MEMBERGRADE G WHERE M.GRADENO = G.GRADENO AND MEMBERID = 'aaa'; -- aaa 등급
SELECT M.*, GRADE FROM MEMBER M, MEMBERGRADE G WHERE M.GRADENO = G.GRADENO AND MEMBERID = 'bbb'; -- bbb 등급
  -- 내 쿠폰함 
  SELECT * 
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT * FROM COUPON WHERE MEMBERID = 'aaa' ORDER BY COUPONNUM DESC)A) 
    WHERE RN BETWEEN 1 AND 2;
  -- 내가 작성한 리뷰 글 목록
    SELECT * 
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT * FROM REVIEW WHERE MEMBERID = 'aaa' ORDER BY REVIEWDATE DESC)A) 
    WHERE RN BETWEEN 1 AND 2;
  -- 내가 작성한 상품 qna 글 목록
    SELECT * 
        FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * FROM QNA WHERE MEMBERID = 'aaa' ORDER BY QNADATE DESC)A) 
        WHERE RN BETWEEN 1 AND 3;
  -- 내가 작성한 1대1문의 글 목록
      SELECT * 
        FROM (SELECT ROWNUM RN, A.*
            FROM (SELECT * FROM INQUIRY WHERE MEMBERID = 'aaa' ORDER BY INQUIRYNUM DESC)A) 
        WHERE RN BETWEEN 1 AND 2;
----------------------------------- REVIEW 관련 ----------------------------------
-- 리뷰 글 목록 (최신순)
SELECT *
    FROM (SELECT ROWNUM RN, R.*
        FROM (SELECT * FROM REVIEW ORDER BY reviewDATE DESC)R)
    WHERE RN BETWEEN 1 AND 3;
SELECT * FROM REVIEW;
-- 리뷰 글 목록 (별점순)
SELECT *
    FROM (SELECT ROWNUM RN, R.*
        FROM (SELECT * FROM REVIEW ORDER BY REVIEWSCORE DESC)R)
        WHERE RN BETWEEN 1 AND 3;
-- 리뷰 글 좋아요 합계
SELECT COUNT(*)CNT FROM GOOD;
    -- MEMBER 추가
    INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERADDR, MEMBERBIRTH, MEMBERPOINT)
        VALUES ('bbb', '222', '김소연', 'sykim@ezen.com', '010-6666-6666', '서울시 서대문구 신촌동 이젠아카데미 2층', '95-01-01', 0);
    -- GOOD 추가
    INSERT INTO GOOD (REVIEWNUM, MEMBERID)
        VALUES ( (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '수정합니다'), 'bbb');
-- 리뷰 글 목록 (좋아요 순서)
-- 1단계
SELECT R.*,(SELECT COUNT(*) FROM GOOD G WHERE G.REVIEWNUM = R.REVIEWNUM) GOODCOUNT FROM REVIEW R ORDER BY GOODCOUNT DESC;
-- 최종단계
SELECT *
    FROM (SELECT ROWNUM RN, A.*
        FROM (SELECT R.*,(SELECT COUNT(*) FROM GOOD G WHERE G.REVIEWNUM = R.REVIEWNUM) GOODCOUNT FROM REVIEW R ORDER BY GOODCOUNT DESC) A)
    WHERE RN BETWEEN 1 AND 3;
-- 좋아요 관련 dao
    -- 리뷰글에 좋아요 한 총 갯수
    SELECT COUNT(*)CNT FROM GOOD WHERE REVIEWNUM = 1;
    -- 회원이 좋아요를 했는지 조회
    SELECT * FROM GOOD WHERE MEMBERID = 'aaa';
    -- 좋아요를 두번 누르면 누른 좋아요가 사라짐
    DELETE FROM GOOD WHERE MEMBERID = 'aaa';
    -- 리뷰글에 좋아요
    INSERT INTO GOOD (REVIEWNUM, MEMBERID)
      VALUES (1, 'aaa');
-- 리뷰 글 갯수 
SELECT COUNT(*)CNT FROM REVIEW;
-- 리뷰 글 등록
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 
  (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '개밥' || '%'), 
  '리뷰제목', '아주 잘 먹어요.', 1, 'review.jpg', '192.168.0.1');
SELECT * FROM REVIEW;
-- 리뷰 글 상세보기
SELECT * FROM REVIEW WHERE REVIEWNUM = 1;
-- 리뷰 글 수정
UPDATE REVIEW SET 
        REVIEWTITLE = '수정합니다',
        REVIEWCONTENT = '수정본문',
        REVIEWSCORE = 4,
        REVIEWIMAGE = 'review2.jpg',
        REVIEWIP = '193.168.0.2'
    WHERE REVIEWNUM = 1;
SELECT * FROM REVIEW;
-- 리뷰 글 삭제
DELETE FROM REVIEW WHERE REVIEWNUM = 1;
-- 리뷰 글에 댓글 작성 전 작업
UPDATE COMMENTS SET COMMENTSTEP = COMMENTSTEP + 1 WHERE COMMENTGROUP = 1 AND COMMENTSTEP > 0;
-- 리뷰 글에 댓글 작성
INSERT INTO COMMENTS (COMMENTNUM, MEMBERID, REVIEWNUM, COMMENTCONTENT, COMMENTGROUP, COMMENTSTEP, COMMENTINDENT, COMMENTIP)
  VALUES (COMMENTS_SEQ.NEXTVAL, 'aaa', 
        (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'),
        '댓글에 댓글답변',1, 1, 1, '192.168.0.23');
-- 댓글 답변 확인용
SELECT MEMBERID, 
    LPAD('└', (COMMENTINDENT*2), ' ')||COMMENTCONTENT, COMMENTGROUP, COMMENTSTEP, COMMENTINDENT 
    FROM COMMENTS ORDER BY COMMENTGROUP DESC, COMMENTSTEP;
SELECT * FROM COMMENTS;
-- 리뷰 글에 댓글 수정
UPDATE COMMENTS SET 
    COMMENTCONTENT = '댓글 바꿀거야'
    WHERE COMMENTNUM = 8;   
-- 리뷰 글에 댓글 삭제 
    -- 1번글을 지울경우 1번글의 1-1 댓글도 삭제
DELETE FROM COMMENTS WHERE COMMENTGROUP = 1 AND (COMMENTSTEP >=0 AND 
    COMMENTSTEP < (SELECT NVL(MIN(COMMENTSTEP),99) FROM COMMENTS WHERE COMMENTGROUP = 1 AND COMMENTSTEP > 0 AND COMMENTINDENT <=0));
-- 리뷰글 조회시 전체글보기, 카테고리별 보기 (패션,푸드,장난감,산책,목욕)
SELECT * FROM REVIEW R, PRODUCT P WHERE R.PRODUCTCODE = P.PRODUCTCODE AND CATEGORY = 'fashion'; 
SELECT * FROM REVIEW R, PRODUCT P WHERE R.PRODUCTCODE = P.PRODUCTCODE AND CATEGORY = 'toy'; 
SELECT * FROM REVIEW R, PRODUCT P WHERE R.PRODUCTCODE = P.PRODUCTCODE AND CATEGORY = 'food'; 
SELECT * FROM REVIEW R, PRODUCT P WHERE R.PRODUCTCODE = P.PRODUCTCODE AND CATEGORY = 'walking'; 
SELECT * FROM REVIEW R, PRODUCT P WHERE R.PRODUCTCODE = P.PRODUCTCODE AND CATEGORY = 'clean';


SELECT CATEGORY FROM PRODUCT;
SELECT * FROM PRODUCT;
COMMIT;









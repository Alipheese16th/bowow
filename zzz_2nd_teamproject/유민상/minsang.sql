CREATE USER user_name IDENTIFIED BY password;
CREATE USER bowow IDENTIFIED BY dog;
GRANT DBA TO bowow;

DROP TABLE PRODUCTIMAGE;
DROP TABLE INQUIRY;
DROP TABLE FAQ;
DROP TABLE QNA;
DROP TABLE MEMBER;
DROP TABLE PRODUCT;
DROP TABLE NOTICE;
DROP TABLE ADMIN;


SELECT P.*, IMAGE FROM PRODUCT P, IMAGE I 
    		WHERE P.PRODUCTCODE = I.PRODUCTCODE AND TYPE='title' ORDER BY PRODUCTDATE DESC;

----------------------------------------------<ADMIN>----------------------------------------------
CREATE TABLE ADMIN(
    adminId VARCHAR2(100) PRIMARY KEY,
    adminPw VARCHAR2(100) NOT NULL,
    adminName VARCHAR2(100) NOT NULL
);
INSERT INTO ADMIN VALUES ('admin', '1234', '관리자'); -- 관리자 추가 DUMMY

-- ADMIN 메인
SELECT * FROM ADMIN;
SELECT ADMINID, QNA.* FROM ADMIN, QNA;S

-- ADMIN 로그인
SELECT * FROM ADMIN WHERE adminId = 'admin' AND adminPw = '111';
SELECT * FROM ADMIN WHERE adminId = 'admin';


----------------------------------------------<NOTICE>----------------------------------------------
CREATE SEQUENCE NOTICE_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE TABLE NOTICE(
    noticeNum NUMBER(4) PRIMARY KEY,
    adminId VARCHAR2(100) REFERENCES ADMIN(adminId) NOT NULL,
    noticeTitle VARCHAR2(500) NOT NULL,
    noticeContent VARCHAR2(4000) NOT NULL,
    noticeDate DATE DEFAULT SYSDATE NOT NULL
);

-- NOTICE DUMMY DATA
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (notice_SEQ.NEXTVAL, 'admin', '제목', '내용');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (notice_SEQ.NEXTVAL, 'admin', '공지사항 입니다', '게시판에서의 폭언은 삼가주세요');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (notice_SEQ.NEXTVAL, 'admin', '필독', '무조건 읽어주세요');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (notice_SEQ.NEXTVAL, 'admin', '두번째 공지사항', '회원가입 후 다양한 기능을 사용하실 수 있습니다!');

-- NOTICE 목록(페이징)
SELECT * FROM
       (SELECT ROWNUM RN, A.* FROM (SELECT * FROM NOTICE ORDER BY NOTICENUM DESC) A)
    WHERE RN BETWEEN 2 AND 4;

-- NOTICE 전체 글 개수
SELECT COUNT(*) FROM NOTICE;

-- NOTICE 글 작성
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (notice_SEQ.NEXTVAL, 'admin', '제목', '내용');

-- NOTICE 글 상세보기(noticeNum)
SELECT * FROM NOTICE WHERE noticeNum = 1;

-- NOTICE 글 수정
UPDATE NOTICE
    SET noticeTitle = '수정제목',
        noticeContent = '수정내용'
    WHERE noticeNum = 1;

-- NOTICE 글 삭제
DELETE FROM NOTICE WHERE noticeNum = 1;


----------------------------------------------<PRODUCT>----------------------------------------------
CREATE TABLE PRODUCT(
    productCode VARCHAR2(100) PRIMARY KEY,
    category VARCHAR2(100) NOT NULL,
    productName VARCHAR2(500) NOT NULL,
    productContent VARCHAR2(4000),
    productPrice NUMBER(10) NOT NULL,
    productDiscount NUMBER(4,1),
    productDate DATE DEFAULT SYSDATE NOT NULL,
    productStock NUMBER(4) NOT NULL,
    productUsed VARCHAR2(1) NOT NULL
);
SELECT * FROM PRODUCT;
-- PRODUCT DUMMY DATA
INSERT INTO PRODUCT (productCode, category, productName, productContent, productPrice, productDiscount, productStock, productUsed)
    VALUES ('p001', '패션', '꽃무늬 드레스', NULL, 33000, 10, 15, 'Y');
INSERT INTO PRODUCT (productCode, category, productName, productContent, productPrice, productDiscount, productStock, productUsed)
    VALUES ('p002', '사료', '스위피 테린', NULL, 2400, 0, 15, 'Y');
INSERT INTO PRODUCT (productCode, category, productName, productContent, productPrice, productDiscount, productStock, productUsed)
    VALUES ('p003', '산책', '하울팟 퍼리파우치', NULL, 21000, 5, 15, 'Y');

-- PRODUCT 등록
INSERT INTO PRODUCT (productCode, category, productName, productContent, productPrice, productDiscount, productStock, productUsed)
    VALUES ('p001', '사료', '꽃무늬드레스', NULL, 33000, 10, 15, 'Y');
    
-- PROUDCT 목록(페이징)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM PRODUCT ORDER BY productCode) A)
	WHERE RN BETWEEN 2 AND 3;

-- PRODUCT 검색(productName)
SELECT * FROM PRODUCT
    WHERE productName LIKE '%'||TRIM(UPPER(' 꽃무늬 '))||'%';

-- PRODUCT 상세보기(productCode)
SELECT * FROM PRODUCT WHERE productCode = 'p001';

-- PRODUCT 수정
UPDATE PRODUCT
		SET productName = '체크무늬 드레스',
		productPrice = 34000,
		productStock = 20
	WHERE productCode = 'p001';
	
-- PRODUCT 삭제
DELETE FROM PRODUCT WHERE productCode = 'p001';


----------------------------------------------<MEMBER>----------------------------------------------
CREATE TABLE MEMBER(
    memberId VARCHAR2(100) PRIMARY KEY,
    memberPw VARCHAR2(100) NOT NULL,
    memberName VARCHAR2(100) NOT NULL,
    memeberEmail VARCHAR2(500) NOT NULL,
    memberTel VARCHAR2(100),
    memberAddr VARCHAR2(500),
    memberBirth DATE,
    memberPoint NUMBER(10) NOT NULL
);
INSERT INTO MEMBER (memberId, memberPw, memberName, memeberEmail, memberPoint)
    VALUES ('aaa', '111', '유민상', 'mmm@naver.com', 5000);
select * from member;
----------------------------------------------<QNA>----------------------------------------------
CREATE SEQUENCE QNA_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE TABLE QNA(
    qnaNum NUMBER(4) PRIMARY KEY,
    memberId VARCHAR2(100) REFERENCES MEMBER(memberId),
    adminId VARCHAR2(100) REFERENCES MEMBER(adminId),
    productCode VARCHAR2(100) REFERENCES PRODUCT(productCode),
    qnaTitle VARCHAR2(500) NOT NULL,
    qnaContent VARCHAR2(4000) NOT NULL,
    qnaDate DATE DEFAULT SYSDATE NOT NULL,
    qnaGroup NUMBER(4) NOT NULL,
    qnaStep NUMBER(4) NOT NULL,
    qnaIndent NUMBER(4) NOT NULL,
    qnaIP VARCHAR2(100) NOT NULL
);

-- QNA DUMMY DATA
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', NULL, '문의제목', '문의내용', QNA_SEQ.CURRVAL, 0, 0 , '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', NULL, '상품문의 제목', '색깔은 어떤게 있나요?', QNA_SEQ.CURRVAL, 0, 0 , '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', NULL, '사료문의 제목', '고양이도 먹어도 되나요?', QNA_SEQ.CURRVAL, 0, 0 , '192.168.0.1');


SELECT * FROM QNA ORDER BY qnaGroup DESC, qnaStep;
    
-- QNA 목록(페이징)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY qnaGroup DESC, qnaStep) A)
	WHERE RN BETWEEN 1 AND 3;
    
-- QNA 검색(제목)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE qnaTitle LIKE '%'||'제'||'%' ORDER BY qnaGroup DESC, qnaStep) A)
	WHERE RN BETWEEN 1 AND 3;
    
-- QNA 검색(본문)
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA WHERE qnaContent LIKE '%'||'내'||'%' ORDER BY qnaGroup DESC, qnaStep) A)
	WHERE RN BETWEEN 1 AND 3;
    
-- QNA 전체 글 개수
SELECT COUNT(*) FROM QNA;

-- QNA 검색(제목) 글 개수
SELECT COUNT(*) FROM QNA WHERE qnaTitle LIKE '%'||'질'||'%';

-- QNA 검색(본문) 글 개수
SELECT COUNT(*) FROM QNA WHERE qnaContent LIKE '%'||'먹'||'%';

-- QNA 작성
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0001', '상품문의 제목', '색깔은 어떤게 있나요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');

-- QNA 상세보기(qnaNum)
SELECT * FROM QNA WHERE qnaNum = 1;

-- QNA 수정
UPDATE QNA SET qnaTitle = 'DDD',
		qnaContent = 'DASDSA'
	WHERE qnaNum = 1;

-- QNA 삭제
DELETE FROM QNA WHERE qnaNum = 1;

-- 회월탈퇴 시 탈퇴회원 QNA 삭제
DELETE FROM QNA WHERE memberId = 'aaa';

-- QNA 답글 전 
UPDATE QNA SET qnaStep = qnaStep + 1
    WHERE qnaGroup = 1 AND qnaStep > 0;
    
-- QNA 답글
INSERT INTO QNA (qnaNum, adminId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'admin', NULL, 'qna답글제목', 'qna답글내용', 2, 1, 1, '192.168.0.11');

select * from admin, qna;
----------------------------------------------<FAQ>----------------------------------------------
CREATE TABLE FAQ(
    faqTitle VARCHAR2(500),
    faqContent VARCHAR2(4000)
);

-- FAQ DUMMY DATA
INSERT INTO FAQ(faqTitle, faqContent)
    VALUES ('자주묻는질문', '자주묻는질문의답');
INSERT INTO FAQ(faqTitle, faqContent)
    VALUES ('자주묻는질문2', '자주묻는질문의답2');
INSERT INTO FAQ(faqTitle, faqContent)
    VALUES ('자주묻는질문3', '자주묻는질문의답3');
INSERT INTO FAQ(faqTitle, faqContent)
    VALUES ('자주묻는질문4', '자주묻는질문의답4');

-- FAQ 목록(페이징)
SELECT * FROM FAQ ORDER BY faqTitle;

-- FAQ 전체 글 개수
SELECT COUNT(*) FROM FAQ;

-- FAQ 등록
INSERT INTO FAQ(faqTitle, faqContent)
    VALUES ('자주묻는질문', '자주묻는질문의답');

-- FAQ 상세보기
SELECT * FROM FAQ WHERE faqTitle = '자주묻는질문4';

-- FAQ 수정
UPDATE FAQ
    SET faqTitle = '111',
        faqContent = '자주묻는질문의답4수정'
    WHERE faqTitle = 'ssss';
    
-- FAQ 삭제
DELETE FROM FAQ WHERE faqTitle = '자주묻는문';

select * from faq;
----------------------------------------------<INQUIRY>----------------------------------------------
CREATE SEQUENCE INQUIRY_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE TABLE INQUIRY(
    inquiryNum NUMBER(4) PRIMARY KEY,
    memberId VARCHAR2(100) REFERENCES MEMBER(memberId) NOT NULL,
    inquiryTitle VARCHAR2(500) NOT NULL,
    inquiryContent VARCHAR2(4000) NOT NULL,
    inquiryEmail VARCHAR2(500) NOT NULL
);

-- INQUIRY DUMMY DATA
INSERT INTO INQUIRY (inquiryNum, memberId, inquiryTitle, inquiryContent, inquiryEmail)
    VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의제목', '문의내용', 'mmm@naver.com');
INSERT INTO INQUIRY (inquiryNum, memberId, inquiryTitle, inquiryContent, inquiryEmail)
    VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의제목2', '문의내용2', 'mmm@naver.com');
INSERT INTO INQUIRY (inquiryNum, memberId, inquiryTitle, inquiryContent, inquiryEmail)
    VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의제목3', '문의내용3', 'mmm@naver.com');

-- INQUIRY 목록

SELECT * FROM INQUIRY ORDER BY INQUIRYNUM DESC;

-- INQUIRY 전체 글 개수
SELECT COUNT(*) FROM INQUIRY;

-- INQUIRY 등록
INSERT INTO INQUIRY (inquiryNum, memberId, inquiryTitle, inquiryContent, inquiryEmail)
    VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의제목', '문의내용', 'mmm@naver.com');

-- INQUIRY 상세보기
SELECT * FROM INQUIRY WHERE inquiryNum = 2;

-- INQUIRY 수정
UPDATE INQUIRY
    SET inquiryTitle = '문의제목 수정',
        inquiryContent = '문의내용 수정',
        inquiryEmail = 'sss@naver.com'
    WHERE inquiryNum = 2;
    
-- INQUIRY 삭제(inquiryNum)
DELETE FROM INQUIRY WHERE inquiryNum = 1;

-- 회월탈퇴 시 탈퇴회원 INQUIRY 삭제
DELETE FROM INQUIRY WHERE memberId = 'aaa';

----------------------------------------------<PRODUCTIMAGE>----------------------------------------------
CREATE SEQUENCE PRODUCTIMAGE_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE TABLE PRODUCTIMAGE(
    imageNum NUMBER(4) PRIMARY KEY,
    productCode VARCHAR2(100) REFERENCES PRODUCT(productCode),
    type VARCHAR2(100),
    image VARCHAR2(500)
);

-- PRODUCTIMAGE DUMMY DATA
INSERT INTO PRODUCTIMAGE (imageNum, productCode, type, image)
    VALUES (PRODUCTIMAGE_SEQ.NEXTVAL, 'p001', '대표', 'image1.jpg');
INSERT INTO PRODUCTIMAGE (imageNum, productCode, type, image)
    VALUES (PRODUCTIMAGE_SEQ.NEXTVAL, 'p001', '본문', 'image2.jpg');
INSERT INTO PRODUCTIMAGE (imageNum, productCode, type, image)
    VALUES (PRODUCTIMAGE_SEQ.NEXTVAL, 'p001', '본문', 'image3.jpg');

-- PRODUCTIMAGE 목록
SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM PRODUCTIMAGE) A ORDER BY RN DESC)
    WHERE RN BETWEEN 2 AND 3;

-- PRODUCTIMAGE 전체 글 개수
SELECT COUNT(*) FROM PRODUCTIMAGE;

-- PRODUCTIMAGE 등록
INSERT INTO PRODUCTIMAGE (imageNum, productCode, type, image)
    VALUES (PRODUCTIMAGE_SEQ.NEXTVAL, 'p001', '대표', 'image1.jpg');

-- PRODUCTIMAGE 상세보기
SELECT * FROM PRODUCTIMAGE WHERE imageNum = 2;

-- PRODUCTIMAGE 수정
UPDATE PRODUCTIMAGE
    SET productCode = 'p001',
        type = '본문',
        image = 'image2.jpg'
    WHERE imageNum = 2;
    
-- PRODUCTIMAGE 삭제(imageNum)
DELETE FROM PRODUCTIMAGE WHERE imageNum = 1;




-- 이미지 출력
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
        (SELECT Q.*, I.IMAGE FROM QNA Q, IMAGE I WHERE Q.PRODUCTCODE=I.PRODUCTCODE(+) AND (TYPE = 'title' OR q.productCode IS NULL) ORDER BY qnaGroup DESC, qnaStep) A)
    WHERE RN BETWEEN 1 AND 26;
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
        (SELECT Q.*, I.IMAGE FROM QNA Q, IMAGE I WHERE Q.PRODUCTCODE=I.PRODUCTCODE(+) AND (TYPE = 'title' OR q.productCode IS NULL) AND qnaTitle LIKE '%'||'품'||'%' ORDER BY qnaGroup DESC, qnaStep) A)
    WHERE RN BETWEEN 1 AND 26;
SELECT * FROM
    (SELECT ROWNUM RN, A.* FROM
        (SELECT Q.*, I.IMAGE FROM QNA Q, IMAGE I WHERE Q.PRODUCTCODE=I.PRODUCTCODE(+) AND (TYPE = 'title' OR q.productCode IS NULL) AND qnaContent LIKE '%'||'d'||'%' ORDER BY qnaGroup DESC, qnaStep) A)
    WHERE RN BETWEEN 1 AND 26;
    
SELECT Q.*, I.IMAGE FROM QNA Q, IMAGE I WHERE Q.PRODUCTCODE=I.PRODUCTCODE(+) AND (TYPE = 'title' OR q.productCode IS NULL) AND Q.QNANUM = 1;
    
    
    
    
SELECT Q.*, I.IMAGE from QNA Q, PRODUCTIMAGE I
    where Q.productCode=I.productCode(+) and i.type='title';
select * from qna where productCode='P0001';
select * from productImage;
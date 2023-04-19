DROP TABLE ADMIN;
DROP TABLE PRODUCT CASCADE CONSTRAINTS;
DROP TABLE QNA;
DROP TABLE NOTICE;


----------------------------------------------<ADMIN>----------------------------------------------
CREATE TABLE ADMIN(
    adminId VARCHAR2(100) PRIMARY KEY,
    adminPw VARCHAR2(100) NOT NULL,
    adminName VARCHAR2(100) NOT NULL
);
INSERT INTO ADMIN VALUES ('admin', '1234', '관리자');
-- ADMIN 로그인
SELECT * FROM ADMIN WHERE adminId = 'admin' AND adminPw = '1234';
SELECT * FROM ADMIN WHERE adminId = 'admin';


----------------------------------------------<PRODUCT>----------------------------------------------
CREATE TABLE PRODUCT(
    productCode VARCHAR2(100) PRIMARY KEY,
    category VARCHAR2(100) NOT NULL,
    productName VARCHAR2(500) NOT NULL,
    productContent VARCHAR2(4000),
    productPrice NUMBER(10) NOT NULL,
    productDiscount NUMBER(4,1),
    productDate DATE DEFAULT SYSDATE,
    productStock NUMBER(4) NOT NULL,
    productUsed VARCHAR2(1) NOT NULL
);
-- PRODUCT 등록
INSERT INTO PRODUCT (prodcutCode, category, productName, productContent, productPrice, productDiscount, productStock, productUsed)
    VALUES ('p001', '패션', '꽃무늬드레스', NULL, 33000, NULL, 15, 'Y');

--PROUDCT 목록
--SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM PRODUCT ORDER BY productDate)
--	WHERE RN BETWEEN 2 AND 4;

--PRODUCT 상세보기
SELECT * FROM PRODUCT WHERE productCode = '2';

--PRODUCT 수정
UPDATE PRODUCT
		SET productName = 'ASD',
		productPrice = '12321',
		productImage1 = 'ASDSA.JSP'
	WHERE productCode = '2';
	
-- PRODUCT 삭제
DELETE FORM PRODUCT WHERE productCode = '2';


----------------------------------------------<QNA>----------------------------------------------
-- QNA 작성
INSERT INTO QNA (qnaNum, qnaTitle, qnaContent, qnaImage, qnaIp, userId)
	VALUES (qna_SEQ.NEXTVAL, '제목', '내용', '첨부파일', '192.168.0.11', 'aaa');

-- QNA 목록
--SELECT * FROM (SELECT ROWNUM RN, A.* FROM (SELECT * FROM QNA ORDER BY qnaNum)
	--WHERE RN BETWEEN 2 AND 4;

-- QNA 상세보기
SELECT * FROM QNA WHERE qnaNum = '1';

-- QNA 수정
UPDATE QNA SET qnaTitle = 'DDD',
		qnaContent = 'DASDSA'
	WHERE qnaNum = '1';

-- QNA 삭제
DELETE FROM QNA WHERE qnaNum = '1';
-- 회월탈퇴 시 QNA 삭제
DELETE FROM QNA WHERE userId = 'aaa'; 


-- QNA 답글
--INSERT INTO QNA ( ) VALUES ( );


----------------------------------------------<NOTICE>----------------------------------------------

INSERT INTO NOTICE (noticeNum, noticeTitle, noticeContent, noticeDate, adminId)
	VALUES (notice_SEQ.NEXTVAL, '제목', '내용', sysdate, 'admin');
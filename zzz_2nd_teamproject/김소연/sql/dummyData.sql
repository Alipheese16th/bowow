
---------------------- 1. ADMIN ------------------------------------------------
INSERT INTO ADMIN VALUES ('admin', '111', '관리자');

SELECT * FROM ADMIN;
---------------------- 2. NOTICE -----------------------------------------------
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '제목', '내용');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '공지사항 입니다', '게시판에서의 폭언은 삼가주세요');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '필독', '무조건 읽어주세요');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '두번째 공지사항', '회원가입 후 다양한 기능을 사용하실 수 있습니다!');

SELECT * FROM NOTICE;
--------------------- 3. PRODUCT ( 카테고리 : fasion / food / toy / walking / clean ) -------------------------
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK, PRODUCTUSED) 
  VALUES ( CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '럭셔리티셔츠', '멋있어요', 3000, 5, 50, 'Y');
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK, PRODUCTUSED)
  VALUES ( CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'toy', '오리장난감', NULL, 33000, 25, 45, 'Y');
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK, PRODUCTUSED) 
  VALUES ( CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'food', '개밥', '맛있어요~', 6000, 5, 50, 'Y');
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK, PRODUCTUSED) 
  VALUES ( CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'walking', '개목줄', '잇템이네요', 7000, 10, 100, 'Y');
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK, PRODUCTUSED) 
  VALUES ( CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'clean', '개샴푸', '제가쓸래요', 5000, 15, 30, 'Y');

SELECT * FROM PRODUCT;
----------------------- 4. SIZES -----------------------------------------------
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 'XL');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 'L');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 'M');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 'SM');

SELECT * FROM SIZES;
------------------------ 5. COLOR ----------------------------------------------
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), '레드');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), '블루');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), '옐로');

SELECT * FROM COLOR;
------------------------- 6. IMAGE (종류 : title / content ) ------------------
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 'title', 'tshirt1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 'title', 'tshirt2.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 'title', 'tshirt3.jpg');

SELECT * FROM IMAGE;
------ 7. MEMBERGRADE (등급 : BRONZE / SILVER / GOLD / PLATINUM / DIAMOND) ------
-- 0~10만 / 10만1 ~ 50만 / 50만1 ~ 100만 / 100만1 ~ 150만 / 150만1 ~ 200만
INSERT INTO MEMBERGRADE (GRADENO, GRADE, LOWAMOUNT, HIAMOUNT)
  VALUES (1, 'BRONZE',0,100000);
INSERT INTO MEMBERGRADE (GRADENO, GRADE, LOWAMOUNT, HIAMOUNT)
  VALUES (2, 'SILVER',100001,500000);
INSERT INTO MEMBERGRADE (GRADENO, GRADE, LOWAMOUNT, HIAMOUNT)
  VALUES (3, 'GOLD',500001,1000000);
INSERT INTO MEMBERGRADE (GRADENO, GRADE, LOWAMOUNT, HIAMOUNT)
  VALUES (4, 'PLATINUM',1000001,1500000);
INSERT INTO MEMBERGRADE (GRADENO, GRADE, LOWAMOUNT, HIAMOUNT)
  VALUES (5, 'DIAMOND',1500001,2000000);

SELECT * FROM MEMBERGRADE;
-------------------------- 8. MEMBER --------------------------------------------
INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERADDR, MEMBERBIRTH, MEMBERPOINT, GRADENO)
  VALUES ('aaa', '111', '신치윤', 'shwoo1103@gmail.com', '010-6344-4081', '인천시 남동구 만수동 1081-3', '93-11-03', 0, 1);

SELECT * FROM MEMBER;
--------------------------- 9. COUPON ------------------------------------------
INSERT INTO COUPON (COUPONNUM, MEMBERID, COUPONNAME, COUPONDISCOUNT)
  VALUES (COUPON_SEQ.NEXTVAL, 'aaa', '2000천원 할인 쿠폰', 2000);

SELECT * FROM COUPON;
---------------------------- 10. CART ------------------------------------------
INSERT INTO CART (CARTNUM, MEMBERID, PRODUCTCODE, SIZENUM, COLORNUM, QTY, COST)
  VALUES (CART_SEQ.NEXTVAL, 'aaa', 
      (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 
      1, 2, 3, 3*(SELECT PRODUCTPRICE FROM PRODUCT WHERE PRODUCTCODE = 'P0001'));

SELECT * FROM CART;
----------------------------- 11. ORDERS ---------------------------------------
INSERT INTO ORDERS (ORDERNUM, MEMBERID, ORDERNAME, ORDERADDR, ORDERTEL)
  VALUES (CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.NEXTVAL,4,'0')), 'aaa', '택배받는사람', '택배주소', '010-9999-9999');

SELECT * FROM ORDERS;
----------------------------- 12. ORDERDETAIL ----------------------------------
INSERT INTO ORDERDETAIL (ODNO, ORDERNUM, PRODUCTCODE, SIZENUM, COLORNUM, QTY, COST)
  VALUES (ORDERDETAIL_SEQ.NEXTVAL, 
          CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.CURRVAL,4,'0')), 
         (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'),
         1, 2, 3, 3*(SELECT PRODUCTPRICE FROM PRODUCT WHERE PRODUCTCODE = 'P0001'));

SELECT * FROM ORDERDETAIL;
----------------------------- 13. FAQ ------------------------------------------
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('자주묻는질문', '자주묻는질문의답');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('자주묻는질문2', '자주묻는질문의답2');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('자주묻는질문3', '자주묻는질문의답3');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('자주묻는질문4', '자주묻는질문의답4');

SELECT * FROM FAQ;
----------------------------- 14. INQUIRY --------------------------------------
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의제목', '문의내용', 'mmm@naver.com');
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의제목2', '문의내용2', 'mmm@naver.com');

SELECT * FROM INQUIRY;
----------------------------- 15. QNA ------------------------------------------
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 
            (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 
            '질문제목', '이 티셔츠 별로에요', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0001', '상품문의 제목', '색깔은 어떤게 있나요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', NULL, '사료문의 제목', '고양이도 먹어도 되나요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');

SELECT * FROM QNA;
----------------------------- 16. REVIEW ---------------------------------------
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 
  (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '럭셔리티셔츠' || '%'), 
  '리뷰제목', '이 티셔츠 이상해요', 1, 'review.jpg', '192.168.0.1');
  
SELECT * FROM REVIEW;
----------------------------- 17. GOOD -----------------------------------------
INSERT INTO GOOD (REVIEWNUM, MEMBERID)
  VALUES ( (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'), 'aaa');

SELECT * FROM GOOD;
----------------------------- 18. COMMENTS -------------------------------------
INSERT INTO COMMENTS (COMMENTNUM, MEMBERID, REVIEWNUM, COMMENTCONTENT, COMMENTGROUP, COMMENTSTEP, COMMENTINDENT, COMMENTIP)
  VALUES (COMMENTS_SEQ.NEXTVAL, 'aaa', 
        (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'),
        '댓글내용 히히',COMMENTS_SEQ.CURRVAL, 0, 0, '192.168.0.23');

SELECT * FROM COMMENTS;



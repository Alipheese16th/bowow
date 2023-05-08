
---------------------- 1. ADMIN ------------------------------------------------
INSERT INTO ADMIN VALUES ('admin', '111', '관리자');

---------------------- 2. NOTICE -----------------------------------------------
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '제목', '내용');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '공지사항 입니다', '게시판에서의 폭언은 삼가주세요');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '필독', '무조건 읽어주세요');
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '두번째 공지사항', '회원가입 후 다양한 기능을 사용하실 수 있습니다!');

--------------------- 3. PRODUCT ( 카테고리 : fashion / food / toy / walking / clean ) -------------------------
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK, PRODUCTUSED) 
  VALUES ( CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '투스투스 쿨 스트랩 티 (코랄)', '· 쿨 에버 섬유로 제작된 나시입니다.
· 신축성이 좋아 더운 여름 활동하기 좋습니다.
· 통기성이 좋아 물에 적셔 입어 쾌적한 느낌을 느낄 수 있게 해줍니다.
· 네 가지 컬러로 제작되었습니다.', 16800, 5, 100, 'Y');

----------------------- 4. SIZES -----------------------------------------------
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), 'S');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), 'M');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), 'L');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), 'XL');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), '2XL');

------------------------ 5. COLOR ----------------------------------------------
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), '빨강');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), '노랑');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), '초록');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), '파랑');

------------------------- 6. IMAGE (종류 : title (딱 1개만 대표이미지) / subTitle (상세보기페이지내에서 타이틀과 슬라이드되는) / content (본문이미지) ) ------------------
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), 'title', 'toostoos_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), 'subTitle', 'toostoos_subTitle1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), 'subTitle', 'toostoos_subTitle2.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, CONCAT('P',LPAD(PRODUCT_SEQ.CURRVAL,4,'0')), 'content', 'toostoos_content.jpg');

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

-------------------------- 8. MEMBER --------------------------------------------
INSERT INTO MEMBER (MEMBERID, MEMBERPW, MEMBERNAME, MEMBEREMAIL, MEMBERTEL, MEMBERPOST, MEMBERADDR1, MEMBERADDR2, MEMBERBIRTH, MEMBERPOINT)
  VALUES ('aaa', '111', '신치윤', 'shwoo1103@gmail.com', '010-6344-4081','12212','인천시 남동구 만수동', '1081-3 201호', '93-11-03', 0);

--------------------------- 9. COUPON ------------------------------------------
INSERT INTO COUPON (COUPONNUM, MEMBERID, COUPONNAME, COUPONDISCOUNT)
  VALUES (COUPON_SEQ.NEXTVAL, 'aaa', '2000천원 할인 쿠폰', 2000);
INSERT INTO COUPON (COUPONNUM, MEMBERID, COUPONNAME, COUPONDISCOUNT)
  VALUES (COUPON_SEQ.NEXTVAL, 'aaa', '3000천원 할인 쿠폰', 3000);
INSERT INTO COUPON (COUPONNUM, MEMBERID, COUPONNAME, COUPONDISCOUNT)
  VALUES (COUPON_SEQ.NEXTVAL, 'aaa', '4000천원 할인 쿠폰', 4000);
  
---------------------------- 10. CART ------------------------------------------
INSERT INTO CART (CARTNUM, MEMBERID, PRODUCTCODE, SIZENUM, COLORNUM, QTY, COST)
  VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P0001', 1, 2, 3, 3*(SELECT PRODUCTPRICE FROM PRODUCT WHERE PRODUCTCODE = 'P0001'));

----------------------------- 11_1. ORDERCODE ---------------------------------------
INSERT INTO ORDERCODE VALUES(CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.NEXTVAL,4,'0')));

----------------------------- 11_2. ORDERS ---------------------------------------
INSERT INTO ORDERS (orderCODE, MEMBERID, totalPrice, ORDERNAME, ORDERPOST, ORDERADDR1, ORDERADDR2, ORDERTEL)
  VALUES (CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.CURRVAL,4,'0')), 'aaa', 100000, '택배받는사람', '12323', '택배기본주소','택배상세주소', '010-9999-9999');

----------------------------- 12. ORDERDETAIL ----------------------------------
INSERT INTO ORDERDETAIL (ODNO, orderCODE, PRODUCTCODE, SIZENUM, COLORNUM, QTY, COST)
  VALUES (ORDERDETAIL_SEQ.NEXTVAL, CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.CURRVAL,4,'0')), 
          'P0001', 1, 2, 3, 3*(SELECT PRODUCTPRICE - PRODUCTPRICE*(PRODUCTDISCOUNT/100) FROM PRODUCT WHERE PRODUCTCODE = 'P0001'));

----------------------------- 13. FAQ ------------------------------------------
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('자주묻는문', '자주묻는질문의답');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('주묻질문2', '자주묻는질문의답2');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('자는질문3', '자주묻는질문의답3');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('주묻는질문4', '자주묻는질문의답4');

----------------------------- 14. INQUIRY --------------------------------------
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의제목', '문의내용', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의제목2', '문의내용2', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);

----------------------------- 15. QNA ------------------------------------------
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0001', '질문제목', '이거 물건이네요', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0001', '상품문의 제목', '색깔은 어떤게 있나요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', NULL, '사료문의 제목', '고양이도 먹어도 되나요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');

----------------------------- 16. REVIEW ---------------------------------------
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0001', '리뷰제목', '좋았습니다 감사합니다', 3, 'n1.jpeg', '192.168.0.1');

----------------------------- 17. GOOD -----------------------------------------
INSERT INTO GOOD (REVIEWNUM, MEMBERID)
  VALUES ( (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'), 'aaa');

----------------------------- 18. COMMENTS -------------------------------------
INSERT INTO COMMENTS (COMMENTNUM, MEMBERID, REVIEWNUM, COMMENTCONTENT, COMMENTGROUP, COMMENTSTEP, COMMENTINDENT, COMMENTIP)
  VALUES (COMMENTS_SEQ.NEXTVAL, 'aaa', 
        (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'),
        '댓글내용 히히',COMMENTS_SEQ.CURRVAL, 0, 0, '192.168.0.23');


commit;



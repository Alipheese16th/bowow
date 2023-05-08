
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
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('교환 배송료나 차액금은 어디서 결제하나요?', '모든 상품의 교환 및 환불처리를 해드리고 있사오나 부득이 다음과 같은 경우는 교환 및 환불이 되지 않습니다.');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('환불이 되지 않았어요.', '반송상품이 도착한 날에 바로 환불 처리를 해드리고 있습니다.');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('반품 시, 받은 박스로만 보내야 하나요?', '반드시 바우와우 배송 박스에 반송하셔야 하는 것은 아닙니다.');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('모든 상품을 구매시 적립 포인트가 지급되나요?', '회원으로 상품을 구매하신 후 상품후기 또는 포토후기 작성해 주시면 소정의 적립금을 지급 해 드리고 있습니다. 상품후기 및 포토후기는 배송완료일로부터 작성 가능하며 3개월 이내에 작성해 주셔야 지급 가능합니다.');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('배송지 주소를 변경하고 싶습니다.', '배송지 변경은 주문상태가 발송전일때 가능하며, 발주완료 또는 배송중인 경우 변경이 어려울 수 있습니다. 불가피하게 배송정보를 변경해야하는 경우 판매자에게 유선 또는 마이페이지의 주문대화를 통해 문의해주시기 바랍니다.');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('장바구니라 무엇인가요?', '마음에 드는 상품들을 담아두었다가 한꺼번에 구매하실 수 있는 기능입니다. 장바구니에 있는 상품을 모두 주문하거나, 원하는 상품만을 선택하여 주문하실 수도 있습니다.');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('주문내역은 어디서 확인하나요?', '	회원가입을 하신 경우, 로그인 후 [마이페이지]에서 조회 가능합니다. ');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('이메일 전송으로 비밀번호 찾기를 신청하였는데 인증메일이 오지 않습니다.', '인증메일이 전송요청 시간으로부터 1시간 이내에 도착되지 않을 경우, 먼저 해당 메일이 스팸메일함 확인 부탁드립니다.');

----------------------------- 14. INQUIRY --------------------------------------
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '배송기간은 얼마나 걸리나요?', '오늘 주문한게 언제쯤 도착할까요?', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '휴일 수령 가능한가요?', '택배가 공휴일에도 방문을 하시나요?', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '교환이나 반품이 언제까지 가능한가요?', '사이즈 교환 후 그것도 안맞으면 반품이 가능한가요?', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의 이메일 수정', '이메일을 잘못 기재했는데 수정이 가능한가요?', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '반품하는 송장 재발급', '반송한 상품의 운송장 번호를 잃어버렸는데 확인이 가능할까요?', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '방문하여 결제', '직접 방문해서 확인하고 구매가 가능한가요?', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '카드 결제 오류', '신용카드 결제 오류가 날 때는 어떻게 해야 하나요?', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);

----------------------------- 15. QNA ------------------------------------------
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0001', '색상 문의', '이 상품으로 어떤 색상들이 있나요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0002', '사이즈 문의', '10kg 강아지한테 어떤 사이즈가 맞을까요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', NULL, '배송비가 모두 같나요? ', '배송비가 항상 동일한가요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0003', '재고 문의', '이 상품으로 L사이즈가 또 언제 들어오나요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0004', '사이즈 문의', '10kg 강아지한테 어떤 사이즈가 맞을까요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', NULL, '그레이하운드', '그레이하운드 종이 입을만한 옷들이 있나요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0005', '어떤 잠금장치인가요?', '목도리가 묶는건가요 아니면 벨크로형태인가요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', 'P0006', '크기감 알려주세요', '작아보이는데 몇kg까지 착용이 가능할까요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');
INSERT INTO QNA (qnaNum, memberId, productCode, qnaTitle, qnaContent, qnaGroup, qnaStep, qnaIndent, qnaIp)
    VALUES (QNA_SEQ.NEXTVAL, 'aaa', NULL, '사료 문의', '생후 3개월된 강아지가 어떤 사료를 먹으면 될까요?', QNA_SEQ.CURRVAL, 0, 0, '192.168.0.1');

----------------------------- 16. REVIEW ---------------------------------------
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0001', '리뷰제목', '좋았습니다 감사합니다', 3, 'n1.jpeg', '192.168.0.1');

----------------------------- 17. GOOD -----------------------------------------
INSERT INTO GOOD (REVIEWNUM, MEMBERID)
  VALUES ( (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'), 'aaa');

----------------------------- 18. COMMENTS -------------------------------------
INSERT INTO COMMENTS (COMMENTNUM, MEMBERID, REVIEWNUM, COMMENTCONTENT,COMMENTIP)
  VALUES (COMMENTS_SEQ.NEXTVAL, 'aaa', 
        (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'),
        '댓글내용 히히', '192.168.0.23');


commit;


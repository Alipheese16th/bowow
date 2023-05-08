
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
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('환불이 되지 않았어요', '반송상품이 도착한 날에 바로 환불 처리를 해드리고 있습니다.');
INSERT INTO FAQ (FAQTITLE, FAQCONTENT) VALUES ('반품 시, 받은 박스로만 보내야 하나요?', '반드시 바우와우 배송 박스에 반송하셔야 하는 것은 아닙니다. ^^');

----------------------------- 14. INQUIRY --------------------------------------
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '비밀번호 설정 문의', '비밀번호를 변경하고싶어요', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);
INSERT INTO INQUIRY (INQUIRYNUM, MEMBERID, INQUIRYTITLE, INQUIRYCONTENT, INQUIRYEMAIL, INQUIRYGROUP, INQUIRYSTEP)
  VALUES (INQUIRY_SEQ.NEXTVAL, 'aaa', '문의내역 이메일 변경', '문의하면서 기재한 이메일을 변경하고싶어요', 'mmm@naver.com', INQUIRY_SEQ.CURRVAL, 0);

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

INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0041', '제일 좋아해요', '베이컨박스 토이 여러개 있는데 이거 젤로 좋아해요. 몽글몽글한 원단이어서 씹는 맛이 있나봐요', 5, 'r1.jpeg', '192.168.0.1');

INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0047', '기호성 좋아요!!!', '냄새도 좋고 강아지들이 엄청 좋아합니다 ! 매번 재구맿ㅐ요', 5, 'r2.jpeg', '192.168.0.1');

INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0053', '완전 추천합니다.', '펫페어에서 물건 구매후 한롤 받아서 사용해 본후 너무 만족해서 구매했어요. 두께감도 톡톡하고 비침 없고 향도 좋고 다 만족합니다.
소형견이라 웅가양이 적어 봉지가 좀 큰감은 있지만 덩치 큰 친구들에겐 사이즈도 딱일거 같아요.', 5, 'r3.jpeg', '192.168.0.1');

INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0039', '딱 위생관리 하기 좋은 사이즈예요.', '발털이 많이 자랐는데 병원까지 데려가면 스트레스일 것 같아 구매해봤어요. 딱 위생관리 하기 좋은 사이즈예요.', 4, 'r4.jpeg', '192.168.0.1');

INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0039', '색상 정말 예뻐요.', '작고 색상 퍼플인데 이쁘네요. 작은 발 깎이기엔 소형이라 큰것보다 확실히 깔끔하게 밀어줄수있어좋아요. 단점은 완충되어도 불빛 색상은 그대로 붉은색이네요ㅜㅜ 소음크고 진동도 커요. 큰 바리깡 사용할땐 발을 빼거나하지않았는데 진동이 크고 소음이 커서그런지 발을 빼내려고하네요. 블프라 쿠폰적용+포인트로 저렴하게구매했어요. 작은것치고 판매가는 비싼편인것같아요', 3, 'r5.jpeg', '192.168.0.1');

INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0040', '너무 좋아해요!!!', '정말 죽도록 좋아해요 말이되나싶어욬ㅋㅋㅋㅋ 짱짱 또살듯', 5, 'r6.jpeg', '192.168.0.1');
   
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0045', '믿고 주문하는 브랜드입니다.', '게눈 감추듯 순식간에 먹어요 야채라고 걱정할 필요같없어요 복슬강아지 좋아하는 반려동물 간식 브랜드입니다', 5, 'r7.jpeg', '192.168.0.1');
  
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0046', '기호성 좋아요!!!', '뼈같은 부산물이 안들어있어 조아요', 5, '', '192.168.0.1');
  
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0046', '보양식 추천합니다.', '아이가 스튜형식을 좋아해요.보양식으로 좋겠어요', 5, 'r8.jpeg', '192.168.0.1');
   
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0054', '디자인 너무 마음에 들어요.', '사용전이지만 사용하기 편리한 디자인이예요~♡', 4, 'r9.jpeg', '192.168.0.1');

INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0056', '추천추천!', '어노인트 워낙 입소문이 많이 난 제품이라 구매해봤는데 , 진짜 순한 제품인 것 같아요 ~', 5, 'r10.jpeg', '192.168.0.1');
  
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0038', '너무 작아요...', '목부분이 조금 더 넓었으면 좋겠어요.', 4, '', '192.168.0.1');
  
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0031', '포인트템으로 추천', '울 검둥이들 산책할때 포인트 주기 딱 좋아요. 쨍한 색감과 캐릭터가 넘 귀엽다는ㅎ', 4, 'r11.jpeg', '192.168.0.1');
  
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0031', '약간 아쉬워요.', '버클이 생각보다 둔탁하고 무거워요. 자견용으로 쓰기에는 조금 부담이 있을 것 같아요. 프린팅이나 웨빙줄 자체는 견고하고 좋습니다.', 4, '', '192.168.0.1');
  
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0023', '정말 좋아해요.', '이거 정말 좋아해요.. 처음에 보고 작아서 조금 놀라긴 했는데 먹이다 보니 적당히 들어있는 것 같아요', 5, 'r12.jpeg', '192.168.0.1');
  
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0023', '엄청 좋아해욬ㅋ', '사진과 실물 똑같어요 잘 먹일게요 감사합니다', 5, '', '192.168.0.1');

  
INSERT INTO REVIEW (REVIEWNUM, MEMBERID, PRODUCTCODE, REVIEWTITLE, REVIEWCONTENT, REVIEWSCORE, REVIEWIMAGE, REVIEWIP)
  VALUES (REVIEW_SEQ.NEXTVAL, 'aaa', 'P0016', '예뻐요 선물하기 좋은거같아요', '예뻐요 선물하기 좋은거같아요', 5, '', '192.168.0.1');


----------------------------- 17. GOOD -----------------------------------------
INSERT INTO GOOD (REVIEWNUM, MEMBERID)
  VALUES ( (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'), 'aaa');

----------------------------- 18. COMMENTS -------------------------------------
INSERT INTO COMMENTS (COMMENTNUM, MEMBERID, REVIEWNUM, COMMENTCONTENT,COMMENTIP)
  VALUES (COMMENTS_SEQ.NEXTVAL, 'aaa', 
        (SELECT REVIEWNUM FROM REVIEW WHERE REVIEWTITLE = '리뷰제목'),
        '댓글내용 히히', '192.168.0.23');


commit;


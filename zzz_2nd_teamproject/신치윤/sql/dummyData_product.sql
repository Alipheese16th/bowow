
-- fashion

INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '몽아미 주 슬리브리스', null, 28000, 10, 100);
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), 'XL');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), 'L');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), 'M');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), 'SM');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), '핑크');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), '옐로우');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), '스카이블루');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), 'title', 'monami_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), 'subTitle', 'monami_subTitle1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), 'subTitle', 'monami_subTitle2.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '몽아미 주 슬리브리스' || '%'), 'content', 'monami_content1.jpg');

INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '하트 여왕 런닝티', null, 27000, 10, 100);
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), 'XL');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), 'L');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), 'M');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), 'SM');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), '블루');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), '레드');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), 'title', 'heartqueen_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), 'subTitle', 'heartqueen_subTitle1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '하트 여왕 런닝티' || '%'), 'content', 'heartqueen_content1.jpg');

INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '시계 토끼 빕', null, 16000, 0, 100);
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '시계 토끼 빕' || '%'), 'title', 'clockrebbit_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '시계 토끼 빕' || '%'), 'content', 'clockrebbit_content1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '시계 토끼 빕' || '%'), 'content', 'clockrebbit_content2.jpg');

INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '밀크 내복티', null, 26000, 0, 100);
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '밀크 내복티' || '%'), 'XL');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '밀크 내복티' || '%'), 'L');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '밀크 내복티' || '%'), 'M');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '밀크 내복티' || '%'), 'SM');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '밀크 내복티' || '%'), 'title', 'milknaebock_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '밀크 내복티' || '%'), 'content', 'milknaebock_content1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '밀크 내복티' || '%'), 'content', 'milknaebock_content2.jpg');

INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '홀리데이 하트 머플러', null, 11000, 0, 100);
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '홀리데이 하트 머플러' || '%'), 'title', 'holidayheart_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '홀리데이 하트 머플러' || '%'), 'content', 'holidayheart_content1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '홀리데이 하트 머플러' || '%'), 'content', 'holidayheart_content2.jpg');

INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '와이키키 블라우스', null, 28000, 0, 100);
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '와이키키 블라우스' || '%'), 'SM');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '와이키키 블라우스' || '%'), 'M');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '와이키키 블라우스' || '%'), 'L');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '와이키키 블라우스' || '%'), 'XL');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'title', 'yqqblous_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'content', 'yqqblous_content1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'content', 'yqqblous_content2.jpg');

INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '꽃 니트 캐미솔', null, 28000, 0, 100);
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'S');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'SM');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'M');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'L');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'XL');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), '2XL');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), '데이지');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), '튤립');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), '까멜리아');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'title', 'flowerneetcamisol_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'subTitle', 'flowerneetcamisol_subTitle1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'subTitle', 'flowerneetcamisol_subTitle2.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'content', 'flowerneetcamisol_content1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'content', 'flowerneetcamisol_content2.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '꽃 니트 캐미솔' || '%'), 'content', 'flowerneetcamisol_content3.jpg');

INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '플럼피 피클 슬리브리스 (4 컬러)', '· 국내산 원단으로 제작되어 튼튼한 티셔츠입니다.
· 신축성이 뛰어난 원단으로 활동성이 높습니다.
· 원단 컬러와 잘 어울리는 로고 패치가 달려있습니다.
· 옷의 뒤집어짐을 최소화 하기위해 등 쪽에 다트봉제 처리를 했습니다.
· 네 가지 컬러로 제작되었습니다.', 17900, 0, 100);
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '플럼피 피클 슬리브리스 (4 컬러)' || '%'), '연두피클');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '플럼피 피클 슬리브리스 (4 컬러)' || '%'), '보라피클');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '플럼피 피클 슬리브리스 (4 컬러)' || '%'), '살구피클');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '플럼피 피클 슬리브리스 (4 컬러)' || '%'), '노랑피클');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '플럼피 피클 슬리브리스 (4 컬러)' || '%'), 'title', 'plumpypeekle4color_title.png');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '플럼피 피클 슬리브리스 (4 컬러)' || '%'), 'content', 'plumpypeekle4color_content1.png');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '플럼피 피클 슬리브리스 (4 컬러)' || '%'), 'content', 'plumpypeekle4color_content2.png');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || '플럼피 피클 슬리브리스 (4 컬러)' || '%'), 'content', 'plumpypeekle4color_content3.jpg');














commit;


-- 예제
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', 'dddd', '멋있어요', 28000, 0, 100);
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'S');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'SM');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'M');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'L');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'XL');
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), '2XL');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), '핑크');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), '옐로우');
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), '스카이블루');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'title', 'dddd_title.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'subTitle', 'dddd_subTitle1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'content', 'dddd_content1.jpg');
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, (SELECT PRODUCTCODE FROM PRODUCT WHERE PRODUCTNAME LIKE '%' || 'dddd' || '%'), 'content', 'dddd_content2.jpg');






commit;

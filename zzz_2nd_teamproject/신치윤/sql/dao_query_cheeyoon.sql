
-------------------------------- product ----------------------------------------

-- 카테고리별 상품 리스트 -- top-n구문 20개씩만, 페이징)
SELECT * FROM 
  (SELECT ROWNUM RN, A.* FROM 
    (SELECT * FROM PRODUCT WHERE CATEGORY = 'fashion' ORDER BY PRODUCTDATE DESC) A)
  WHERE RN BETWEEN 1 AND 10;

-- 상품 갯수 (카테고리별)
SELECT COUNT(*) FROM PRODUCT WHERE CATEGORY = 'fashion';

-- 상품 상세보기
SELECT * FROM PRODUCT WHERE productCode = 'P0001';

-- 상품 검색 (이름, )
SELECT * FROM PRODUCT WHERE productName LIKE '%' || TRIM(' 럭셔리 ') || '%';

-- 상품 등록
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK, PRODUCTUSED) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '꽃무늬 티셔츠', '이뻐요', 5000, 15, 50, 'Y');

-- 상품 사이즈 등록
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, 'P0001', 'XL');

-- 상품 색상 등록
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, 'P0001', '레드');

-- 상품 이미지 등록
INSERT INTO PRODUCTIMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (PRODUCTIMAGE_SEQ.NEXTVAL, 'P0001', 'title', 'flowershirt1.jpg');

-- 상품 수정
UPDATE PRODUCT
		SET CATEGORY = 'food',
    PRODUCTNAME = '맛있는 사료',
    PRODUCTCONTENT = '사료에요 이건',
		productPrice = 34000,
    PRODUCTDISCOUNT = 10,
		productStock = 20
	WHERE productCode = 'P0001';
	
-- 상품 삭제
UPDATE PRODUCT SET PRODUCTUSED = 'N' WHERE PRODUCTCODE = 'P0001';


--------------------------------- ORDERS ---------------------------------------

-- 카트에 상품 담기전 조회 (이미 담겨져있으면 못 담게 하기)
SELECT * FROM CART WHERE PRODUCTCODE = 'P0001';
-- 카트에 담기 (상품코드, 사이즈, 컬러, 수량, 총가격(서브쿼리에서 상품별 할인 적용))
INSERT INTO CART (CARTNUM, MEMBERID, PRODUCTCODE, SIZENUM, COLORNUM, QTY, COST)
  VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P0001', 1, 2, 3, 3*(SELECT PRODUCTPRICE - PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE PRODUCTCODE = 'P0001'));

------ 주문하기 
-- 주문테이블에 데이터 입력
INSERT INTO ORDERS (ORDERNUM, MEMBERID, ORDERNAME, ORDERADDR, ORDERTEL)
  VALUES (CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.NEXTVAL,4,'0')), 'aaa', '택배받는사람', '택배주소', '010-9999-9999');

-- 주문상세테이블에 입력 (상품코드, 사이즈, 컬러, 수량, 총가격(서브쿼리에서 상품별 할인 적용))
INSERT INTO ORDERDETAIL (ODNO, ORDERNUM, PRODUCTCODE, SIZENUM, COLORNUM, QTY, COST)
  VALUES (ORDERDETAIL_SEQ.NEXTVAL, 
          CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.CURRVAL,4,'0')), 
         'P0001',1, 2, 3, 3*(SELECT PRODUCTPRICE - PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE PRODUCTCODE = 'P0001'));

-- 상품 재고 업데이트 (주문한 수량 만큼만)
UPDATE PRODUCT SET PRODUCTSTOCK = PRODUCTSTOCK - 3 WHERE PRODUCTCODE = 'P0001';

-- 장바구니 비우기 (주문상품만)
DELETE FROM CART WHERE PRODUCTCODE = 'P0001' AND MEMBERID = 'aaa';

-- 'aaa'의 주문내역
SELECT * FROM ORDERS WHERE MEMBERID = 'aaa' ORDER BY ORDERDATE DESC;

--------------------------------- NOTICE ---------------------------------------

-- NOTICE 목록(페이징)
SELECT * FROM
       (SELECT ROWNUM RN, A.* FROM (SELECT * FROM NOTICE ORDER BY NOTICEDATE DESC) A)
    WHERE RN BETWEEN 1 AND 10;

-- NOTICE 전체 글 개수
SELECT COUNT(*) FROM NOTICE;

-- NOTICE 글 상세보기(noticeNum)
SELECT * FROM NOTICE WHERE noticeNum = 1;

-- NOTICE 글 작성
INSERT INTO NOTICE (noticeNum, adminId, noticeTitle, noticeContent)
	VALUES (NOTICE_SEQ.NEXTVAL, 'admin', '제목', '내용');

-- NOTICE 글 수정
UPDATE NOTICE
    SET noticeTitle = '수정제목',
        noticeContent = '수정내용'
    WHERE noticeNum = 1;

-- NOTICE 글 삭제
DELETE FROM NOTICE WHERE noticeNum = 1;



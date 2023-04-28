
-------------------------------- product ----------------------------------------

-- 카테고리별 상품 리스트 -- top-n구문 20개씩만, 페이징, 대표이미지 조인)
SELECT * FROM 
  (SELECT ROWNUM RN, A.* FROM 
    (SELECT P.*, IMAGE FROM PRODUCT P, IMAGE I 
      WHERE P.PRODUCTCODE = I.PRODUCTCODE 
        AND TYPE='title' AND CATEGORY = 'fashion' ORDER BY PRODUCTDATE DESC) A)
  WHERE RN BETWEEN 1 AND 10;
-- 상품 갯수 (카테고리별)
SELECT COUNT(*) FROM PRODUCT WHERE CATEGORY = 'fashion';

-- 상품 상세보기
SELECT * FROM PRODUCT WHERE productCode = 'P0001';
-- 특정 상품의 이미지 리스트 가져오기 (상품리스트에서 해당 상품코드의 이미지 필요함)
SELECT * FROM IMAGE WHERE PRODUCTCODE = 'P0001';
-- 상품 상세보기 (사이즈)
SELECT * FROM SIZES WHERE PRODUCTCODE = 'P0001';
-- 상품 상세보기 (색상)
SELECT * FROM COLOR WHERE PRODUCTCODE = 'P0001';

-- 상품 검색 (이름, )
SELECT * FROM 
  (SELECT ROWNUM RN, A.* FROM 
    (SELECT P.*, IMAGE FROM PRODUCT P, IMAGE I 
      WHERE P.PRODUCTCODE = I.PRODUCTCODE 
        AND TYPE='title' AND productName LIKE '%' || TRIM(' 티 ') || '%' ORDER BY PRODUCTDATE DESC) A)
  WHERE RN BETWEEN 1 AND 10;
-- 상품 검색 결과 갯수
SELECT COUNT(*) FROM PRODUCT WHERE productName LIKE '%' || TRIM(' 티 ') || '%';

-- 질문게시판 상품검색용 (모든 상품 탑앤구문없이)
SELECT P.*, IMAGE FROM PRODUCT P, IMAGE I 
    WHERE P.PRODUCTCODE = I.PRODUCTCODE AND TYPE='title' ORDER BY PRODUCTDATE DESC;


--------------------- 관리자기능
-- 상품 등록
INSERT INTO PRODUCT (PRODUCTCODE, CATEGORY, PRODUCTNAME, PRODUCTCONTENT, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK) 
  VALUES (CONCAT('P',LPAD(PRODUCT_SEQ.NEXTVAL,4,'0')), 'fashion', '꽃무늬 티셔츠', '이뻐요', 5000, 15, 50);
-- 상품 사이즈 등록
INSERT INTO SIZES(SIZENUM, PRODUCTCODE, PRODUCTSIZE) 
  VALUES(SIZES_SEQ.NEXTVAL, 'P0001', 'XL');
-- 상품 색상 등록
INSERT INTO COLOR (COLORNUM, PRODUCTCODE, PRODUCTCOLOR) 
  VALUES (COLOR_SEQ.NEXTVAL, 'P0001', '레드');
-- 상품 이미지 등록
INSERT INTO IMAGE (IMAGENUM, PRODUCTCODE, TYPE, IMAGE)
  VALUES (IMAGE_SEQ.NEXTVAL, 'P0001', 'title', 'flowershirt1.jpg');
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

----------------------------------- CART 관련 ----------------------------------

-- 상품상세에서 장바구니에 동일한 상품을 담았는지 확인 (memberId, productCode, sizeNum, colorNum)
SELECT COUNT(*) FROM CART WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001';
SELECT COUNT(*) FROM CART WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001' AND SIZENUM = 1;
SELECT COUNT(*) FROM CART WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001' AND COLORNUM = 2;
SELECT COUNT(*) FROM CART WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001' AND SIZENUM = 1 AND COLORNUM = 2;

-- 메인에서 해당 회원의 장바구니 갯수 /헤더에서 계속 보일 갯수 (param : memberId)
SELECT COUNT(*) FROM CART WHERE MEMBERID = 'aaa';

-- 장바구니에서 장바구니 리스트 (파라미터: 회원아이디)
SELECT C.*, PRODUCTNAME, PRODUCTPRICE, PRODUCTDISCOUNT, PRODUCTSTOCK, IMAGE  FROM CART C, PRODUCT P, IMAGE I
  WHERE C.PRODUCTCODE = P.PRODUCTCODE AND P.PRODUCTCODE = I.PRODUCTCODE AND TYPE = 'title' AND MEMBERID = 'aaa';
-- 장바구니에서 옵션 이름만 보여줄려고 사이즈리스트, 색상리스트 가져오기
SELECT * FROM SIZES;
SELECT * FROM COLOR;

-- 상품상세에서 장바구니에 새 상품 등록 (memberId, productCode, qty, sizeNum, colorNum)
INSERT INTO CART (cartNUM, memberID, productCODE, QTY, COST)
    VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P0013', 1, 1*(SELECT productPRICE- PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0013'));
INSERT INTO CART (cartNUM, memberID, productCODE, sizeNUM, QTY, COST)
    VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P0013', 12, 1, 1*(SELECT productPRICE- PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0013'));
INSERT INTO CART (cartNUM, memberID, productCODE, colorNUM, QTY, COST)
    VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P0013', 12, 1, 1*(SELECT productPRICE- PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0013'));
INSERT INTO CART (cartNUM, memberID, productCODE, sizeNUM, colorNUM, QTY, COST)
    VALUES (CART_SEQ.NEXTVAL, 'aaa', 'P0013', 12, 12, 1, 1*(SELECT productPRICE- PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0013'));
-- 상품상세에서 장바구니에 있던 상품 수량추가 (memberId, productCode, qty, sizeNum, colorNum)
UPDATE CART 
  SET QTY = QTY + 3,
      COST = COST + 3*(SELECT PRODUCTPRICE - PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0001')
  WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001';
UPDATE CART 
  SET QTY = QTY + 3,
      COST = COST + 3*(SELECT PRODUCTPRICE - PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0001')
  WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001' AND SIZENUM = 1;
UPDATE CART 
  SET QTY = QTY + 3,
      COST = COST + 3*(SELECT PRODUCTPRICE - PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0001')
  WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001' AND COLORNUM = 1;
UPDATE CART 
  SET QTY = QTY + 3,
      COST = COST + 3*(SELECT PRODUCTPRICE - PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0001')
  WHERE MEMBERID = 'aaa' AND PRODUCTCODE = 'P0001' AND SIZENUM = 1 AND COLORNUM = 1;

-- 장바구니에서 상품 수량 고정 변경 (cartNum, qty, productCode)
UPDATE CART 
  SET QTY = 3,
      COST = 3*(SELECT PRODUCTPRICE - PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE productCODE = 'P0001')
  WHERE CARTNUM = 11;
-- 장바구니에서 상품 삭제
DELETE FROM CART WHERE CARTNUM = 16;

-- 장바구니에서 해당 회원의 장바구니 전체 비우기
DELETE FROM CART WHERE MEMBERID = 'aaa';


--------------------------------- ORDERS ---------------------------------------

select * from orders;
SELECT * FROM ORDERDETAIL;

-- 주문테이블에 데이터 1행 입력
INSERT INTO ORDERS (orderCode, MEMBERID, ORDERNAME, ORDERPOST, ORDERADDR1, ORDERADDR2, ORDERTEL)
  VALUES (CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.NEXTVAL,4,'0')), 'aaa', '택배받는사람', '12132', '배송지기본주소', '배송지상세주소', '010-9999-9999');

-- 주문상세테이블에 1행 입력 (상품코드, 사이즈, 컬러, 수량, 총가격(서브쿼리에서 상품별 할인 적용))
INSERT INTO ORDERDETAIL (ODNO, orderCode, PRODUCTCODE, SIZENUM, COLORNUM, QTY, COST)
  VALUES (ORDERDETAIL_SEQ.NEXTVAL, CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.CURRVAL,4,'0')), 
         'P0001',12, 12, 3, 3*(SELECT PRODUCTPRICE - PRODUCTPRICE * (PRODUCTDISCOUNT/100) FROM PRODUCT WHERE PRODUCTCODE = 'P0001'));



-- 서브쿼리이용 - 해당 회원의 장바구니 전체주문 (orderCode, productCode, sizeNum, colorNum, qty, cost)
insert into orderdetail (odno, orderCode, productCode, sizeNum, colorNum, qty, cost)
  select orderdetail_seq.nextval, CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.CURRVAL,4,'0')),
          c.productCode, c.sizeNum, c.colorNum, c.qty, c.cost from cart c where memberId = 'aaa';

select * from cart where memberId = 'aaa';

-- 서브쿼리 이용 선택주문 (orderCode, productCode, sizeNum, colorNum, qty, cost, cartNum배열)
insert into orderdetail (odno, orderCode, productCode, sizeNum, colorNum, qty, cost)
  select orderdetail_seq.nextval, CONCAT(TO_CHAR(SYSDATE,'RRMMDD'),LPAD(ORDERS_SEQ.CURRVAL,4,'0')),
          c.productCode, c.sizeNum, c.colorNum, c.qty, c.cost from cart c where memberId = 'aaa' and cartNum in (1, 2, 3 , 4);






-- 주문되고나면

-- 상품 재고 업데이트 (qty, productCode)
UPDATE PRODUCT SET PRODUCTSTOCK = PRODUCTSTOCK - 3 WHERE PRODUCTCODE = 'P0001';

-- 주문한 상품 장바구니 비우기 (cartNum)
DELETE FROM CART WHERE CARTNUM = 1;

-- 'aaa'의 주문내역 (memberId)
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



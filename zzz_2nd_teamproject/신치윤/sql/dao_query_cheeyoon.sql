
-- product

-- 상품 리스트 -- top-n구문 20개씩만, 페이징, 카테고리별 나뉨)

-- 상품 등록


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






















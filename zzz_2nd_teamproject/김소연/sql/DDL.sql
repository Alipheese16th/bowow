
----------------------- drop table ---------------------------------------------
      -- 필요하다면 쓰일 테이블 강제로 삭제 명령어 : cascade constraints

DROP TABLE COMMENTS;
DROP TABLE GOOD;
DROP TABLE REVIEW;
DROP TABLE QNA;
DROP TABLE INQUIRY;
DROP TABLE FAQ;
DROP TABLE ORDERDETAIL;
DROP TABLE ORDERS;
DROP TABLE CART;
DROP TABLE COUPON;
DROP TABLE MEMBER;
DROP TABLE MEMBERGRADE;
DROP TABLE IMAGE;
DROP TABLE COLOR;
DROP TABLE SIZES;
DROP TABLE PRODUCT;
DROP TABLE NOTICE;
DROP TABLE ADMIN;

------------------------ drop sequence -----------------------------------------

DROP SEQUENCE COMMENTS_SEQ;
DROP SEQUENCE REVIEW_SEQ;
DROP SEQUENCE COUPON_SEQ;
DROP SEQUENCE ORDERDETAIL_SEQ;
DROP SEQUENCE ORDERS_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE IMAGE_SEQ;
DROP SEQUENCE COLOR_SEQ;
DROP SEQUENCE SIZES_SEQ;
DROP SEQUENCE PRODUCT_SEQ;
DROP SEQUENCE NOTICE_SEQ;
DROP SEQUENCE QNA_SEQ;
DROP SEQUENCE INQUIRY_SEQ;

------------------------ create table ------------------------------------------

CREATE TABLE ADMIN(
    adminId VARCHAR2(100) PRIMARY KEY,
    adminPw VARCHAR2(100) NOT NULL,
    adminName VARCHAR2(100) NOT NULL
);
CREATE TABLE NOTICE(
    noticeNum NUMBER(4) PRIMARY KEY,
    adminId VARCHAR2(100) REFERENCES ADMIN(adminId) NOT NULL,
    noticeTitle VARCHAR2(500) NOT NULL,
    noticeContent VARCHAR2(4000) NOT NULL,
    noticeDate DATE DEFAULT SYSDATE NOT NULL
);
CREATE TABLE PRODUCT(
  productCODE VARCHAR2(100) PRIMARY KEY,
  CATEGORY VARCHAR2(100) NOT NULL,
  productNAME VARCHAR2(500) NOT NULL,
  productCONTENT VARCHAR2(4000),
  productPRICE NUMBER(10) CHECK(productPRICE > 0) NOT NULL,
  productDISCOUNT NUMBER(4,1),
  productDATE DATE DEFAULT SYSDATE NOT NULL,
  productSTOCK NUMBER(4) CHECK(productSTOCK >= 0) NOT NULL,
  productUSED VARCHAR2(1) NOT NULL
);
CREATE TABLE SIZES(
  sizeNUM NUMBER(4) PRIMARY KEY,
  productCODE VARCHAR2(100) REFERENCES PRODUCT(productCODE) NOT NULL,
  productSIZE VARCHAR2(100) NOT NULL
);
CREATE TABLE COLOR(
  colorNUM NUMBER(4) PRIMARY KEY,
  productCODE VARCHAR2(100) REFERENCES PRODUCT(productCODE) NOT NULL,
  productCOLOR VARCHAR2(100) NOT NULL
);
CREATE TABLE IMAGE(
  imageNUM NUMBER(4) PRIMARY KEY,
  productCODE VARCHAR2(100) REFERENCES PRODUCT(productCODE) NOT NULL,
  TYPE VARCHAR2(100),
  IMAGE VARCHAR2(500)
);
CREATE TABLE MEMBERGRADE(
  GRADENO NUMBER(1,0) PRIMARY KEY,
  GRADE VARCHAR2(100),
  lowAMOUNT NUMBER(10),
  hiAMOUNT NUMBER(10)
);
CREATE TABLE MEMBER(
  memberID VARCHAR2(100) PRIMARY KEY,
  memberPW VARCHAR2(100) NOT NULL,
  memberNAME VARCHAR2(100) NOT NULL,
  memberEMAIL VARCHAR2(500) NOT NULL,
  memberTEL VARCHAR2(100),
  memberADDR VARCHAR2(500),
  memberBIRTH DATE,
  memberAmount NUMBER(10) DEFAULT 0 NOT NULL,
  memberPOINT NUMBER(10) DEFAULT 0 NOT NULL,
  GRADENO NUMBER(1,0) DEFAULT 1 NOT NULL,
  FOREIGN KEY (GRADENO) REFERENCES MEMBERGRADE (GRADENO)
);
CREATE TABLE COUPON(
  couponNUM NUMBER(4) PRIMARY KEY,
  memberID VARCHAR2(100) NOT NULL REFERENCES MEMBER(memberID),
  couponNAME VARCHAR2(100),
  couponDISCOUNT NUMBER(8) NOT NULL
);
CREATE TABLE CART(
  cartNUM NUMBER(4) PRIMARY KEY,
  memberID VARCHAR2(100) REFERENCES MEMBER(memberID) NOT NULL,
  productCODE VARCHAR2(100) REFERENCES PRODUCT(productCODE) NOT NULL,
  sizeNUM NUMBER(4) REFERENCES SIZES(sizeNUM),
  colorNUM NUMBER(4) REFERENCES COLOR(colorNUM),
  QTY NUMBER(3) NOT NULL,
  COST NUMBER(10) NOT NULL
);
CREATE TABLE ORDERS(
  orderNUM VARCHAR2(20) PRIMARY KEY,
  memberID VARCHAR2(100) NOT NULL REFERENCES MEMBER(memberID),
  orderDATE DATE DEFAULT SYSDATE NOT NULL,
  orderNAME VARCHAR2(100) NOT NULL,
  orderADDR VARCHAR2(500) NOT NULL,
  orderTEL VARCHAR2(100) NOT NULL
);
CREATE TABLE ORDERDETAIL(
  ODNO NUMBER(4) PRIMARY KEY,
  orderNUM VARCHAR2(100) NOT NULL REFERENCES ORDERS(orderNUM),
  productCODE VARCHAR2(100) NOT NULL REFERENCES PRODUCT(productCODE),
  sizeNUM NUMBER(4) REFERENCES SIZES(sizeNUM),
  colorNUM NUMBER(4) REFERENCES COLOR(colorNUM),
  QTY NUMBER(3) NOT NULL,
  COST NUMBER(10) NOT NULL
);
CREATE TABLE FAQ(
    faqTITLE VARCHAR2(500),
    faqCONTENT VARCHAR2(4000)
);
CREATE TABLE INQUIRY(
    inquiryNum NUMBER(4) PRIMARY KEY,
    memberId VARCHAR2(100) REFERENCES MEMBER(memberId) NOT NULL,
    inquiryTitle VARCHAR2(500) NOT NULL,
    inquiryContent VARCHAR2(4000) NOT NULL,
    inquiryEmail VARCHAR2(500) NOT NULL
);
CREATE TABLE QNA(
  qnaNUM NUMBER(4) PRIMARY KEY,
  memberID VARCHAR2(100) REFERENCES MEMBER(memberId) NOT NULL,
  productCODE VARCHAR2(100) REFERENCES PRODUCT(productCODE),
  qnaTITLE VARCHAR2(500) NOT NULL,
  qnaCONTENT VARCHAR2(4000) NOT NULL,
  qnaDATE DATE DEFAULT SYSDATE NOT NULL,
  qnaGROUP NUMBER(4) NOT NULL,
  qnaSTEP NUMBER(4) NOT NULL,
  qnaINDENT NUMBER(4) NOT NULL,
  qnaIP VARCHAR2(100) NOT NULL
);
CREATE TABLE REVIEW(
  reviewNUM NUMBER(4) PRIMARY KEY,
  memberID VARCHAR2(100) NOT NULL,
  productCODE VARCHAR2(100) NOT NULL,
  reviewTITLE VARCHAR2(500) NOT NULL,
  reviewCONTENT VARCHAR2(4000) NOT NULL,
  reviewSCORE NUMBER(2),
  reviewIMAGE VARCHAR2(500),
  reviewDATE DATE DEFAULT SYSDATE NOT NULL,
  reviewIP VARCHAR2(100) NOT NULL,
  CONSTRAINT REVIEW_MEMBERID_FK
  FOREIGN KEY (memberID) REFERENCES MEMBER(memberID)
  ON DELETE CASCADE,
  CONSTRAINT PRODUCT_productCODE_FK
  FOREIGN KEY (productCODE) REFERENCES PRODUCT(productCODE)
  ON DELETE CASCADE
);
CREATE TABLE GOOD(
  reviewNUM NUMBER(4),
  memberID VARCHAR2(100),
  CONSTRAINT GOOD_PK PRIMARY KEY(reviewNUM,memberID),
  CONSTRAINT GOOD_MEMBERID_FK
  FOREIGN KEY (MEMBERID) REFERENCES MEMBER(MEMBERID)
  ON DELETE CASCADE,
  CONSTRAINT GOOD_REVIEW_FK
  FOREIGN KEY (reviewNUM) REFERENCES REVIEW(reviewNUM)
  ON DELETE CASCADE
);
CREATE TABLE COMMENTS(
  commentNUM NUMBER(4) PRIMARY KEY,
  memberID VARCHAR2(100) NOT NULL,
  reviewNUM NUMBER(4) NOT NULL,
  commentCONTENT VARCHAR2(4000) NOT NULL,
  commentDATE DATE DEFAULT SYSDATE NOT NULL,
  commentGROUP NUMBER(4) NOT NULL,
  commentSTEP NUMBER(4) NOT NULL,
  commentINDENT NUMBER(4) NOT NULL,
  commentIP VARCHAR2(100) NOT NULL,
  CONSTRAINT COMMENTS_MEMBERID_FK
  FOREIGN KEY (MEMBERID) REFERENCES MEMBER(MEMBERID)
  ON DELETE CASCADE,
  CONSTRAINT COMMENTS_REVIEWNUM_FK
  FOREIGN KEY (reviewNUM) REFERENCES REVIEW(reviewNUM)
  ON DELETE CASCADE
);

-- CREATE SEQUENCE

CREATE SEQUENCE NOTICE_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE PRODUCT_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE SIZES_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE COLOR_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE IMAGE_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE COUPON_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE CART_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE ORDERS_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE ORDERDETAIL_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE INQUIRY_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE QNA_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE REVIEW_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;
CREATE SEQUENCE COMMENTS_SEQ MAXVALUE 9999 NOCACHE NOCYCLE;


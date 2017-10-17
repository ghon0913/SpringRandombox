
/* Drop Tables */

DROP TABLE CART CASCADE CONSTRAINTS;
DROP TABLE GOODS CASCADE CONSTRAINTS;
DROP TABLE JOINMEMBER CASCADE CONSTRAINTS;
DROP TABLE ORDER_INFO CASCADE CONSTRAINTS;
DROP TABLE QNA_BOARD CASCADE CONSTRAINTS;
DROP TABLE REVIEW_BOARD CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE CART
(
	-- 주문 번호
	-- 
	NUM number(5,0) NOT NULL,
	USERID varchar2(15) NOT NULL,
	GCODE varchar2(5) NOT NULL,
	-- 상품 이름
	-- 
	GNAME varchar2(20) NOT NULL,
	-- 상품 가격
	-- 
	GPRICE number(10,0),
	-- 상품 이미지 파일명
	-- 
	GIMAGE varchar2(20) NOT NULL,
	PRIMARY KEY (NUM)
);


CREATE TABLE GOODS
(
	-- 상품 코드
	-- 
	GCODE varchar2(5) NOT NULL,
	-- 상품 카테고리
	-- 
	GCATEGORY varchar2(10) NOT NULL,
	-- 상품 이름
	-- 
	GNAME varchar2(20) NOT NULL,
	-- 상품 가격
	-- 
	GPRICE number(10,0) NOT NULL,
	-- 상품 이미지 파일명
	-- 
	GIMAGE varchar2(10) NOT NULL,
	-- 상품 상세설명 이미지 파일명
	-- 
	GCONTENT_IMAGE varchar2(15) NOT NULL,
	-- 재고 수량
	-- 
	GAMOUNT number(4,0) NOT NULL,
	SELLERID varchar2(15) NOT NULL,
	PRIMARY KEY (GCODE)
);


CREATE TABLE JOINMEMBER
(
	-- 회원 아이디
	USERID varchar2(15) NOT NULL,
	-- 이름
	USERNAME varchar2(10) NOT NULL,
	-- 비밀번호
	PASSWD varchar2(15) NOT NULL,
	-- 이메일
	EMAIL varchar2(30) NOT NULL UNIQUE,
	-- 전화번호
	PHONE varchar2(15) NOT NULL,
	-- 성별
	GENDER varchar2(2) NOT NULL,
	-- 생일
	BIRTHDAY date NOT NULL,
	-- 우편번호 앞 3자리
	POST1 varchar2(3) NOT NULL,
	-- 우편번호 뒷 3자리
	POST2 varchar2(3) NOT NULL,
	-- 주소
	ADDR1 varchar2(500) DEFAULT 'X' NOT NULL,
	-- 상세주소
	ADDR2 varchar2(500) NOT NULL,
	-- 판매자/ 구매자 회원구분
	-- 
	OX varchar2(2) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (USERID)
);


CREATE TABLE ORDER_INFO
(
	-- 구매 번호
	-- 
	NUM number(5,0) NOT NULL,
	USERID varchar2(15) NOT NULL,
	-- 주문자 이름
	-- 
	ORDERNAME varchar2(10) NOT NULL,
	-- 구매자 전화번호
	-- 
	PHONE varchar2(15) NOT NULL,
	-- 구매자 이메일
	-- 
	EMAIL varchar2(30) NOT NULL,
	-- 우편번호 
	-- 앞 3자리
	-- 
	POST1 varchar2(3) NOT NULL,
	-- 우편번호
	-- 뒷 3자리
	-- 
	POST2 varchar2(3) NOT NULL,
	-- 주소
	--  500->50자로바꿈
	ADDR1 varchar2(50) DEFAULT 'X' NOT NULL,
	-- 상세주소
	-- 
	-- 500->50자로바꿈
	ADDR2 varchar2(50) NOT NULL,
	GCODE varchar2(5) NOT NULL,
	-- 상품 이름
	-- 
	GNAME varchar2(20) NOT NULL,
	-- 상품 가격
	-- 
	GPRICE number(10,0) NOT NULL,
	-- 상품 이미지 파일명
	-- 
	GIMAGE varchar2(20) NOT NULL,
	-- 결제 방식
	-- 
	PAYMETHOD varchar2(10) NOT NULL,
	-- 구매 날짜
	-- 
	ORDERDAY date DEFAULT SYSDATE NOT NULL,
	SELLERID varchar2(15),
	PRIMARY KEY (NUM)
);


CREATE TABLE QNA_BOARD
(
	-- 게시물 번호
	-- 
	NUM number(5,0) NOT NULL,
	-- 처리 상태
	-- 
	STATE varchar2(10) DEFAULT '처리중' NOT NULL,
	-- 게시물 제목
	-- 
	TITLE varchar2(100) NOT NULL,
	-- 내용
	-- 
	CONTENT varchar2(1000) NOT NULL,
	-- 작성일
	-- 
	WRITEDAY date DEFAULT SYSDATE NOT NULL,
	-- 조회수
	-- 
	READCNT number(5,0) DEFAULT 0 NOT NULL,
	USERID varchar2(15) NOT NULL,
	GCODE varchar2(5) NOT NULL,
	PRIMARY KEY (NUM)
);


CREATE TABLE REVIEW_BOARD
(
	NUM number(5,0) NOT NULL,
	-- 카테고리
	-- 
	CATEGORY varchar2(10) NOT NULL,
	-- 게시물 제목
	-- 
	TITLE varchar2(100) NOT NULL,
	-- 내용
	-- 
	CONTENT varchar2(1000) NOT NULL,
	-- 작성일
	-- 
	WRITEDAY date DEFAULT SYSDATE NOT NULL,
	-- 조회수
	-- 
	READCNT number(5,0) NOT NULL,
	USERID varchar2(15),
	PRIMARY KEY (NUM)
);



/* Comments */

COMMENT ON COLUMN CART.NUM IS '주문 번호
';
COMMENT ON COLUMN CART.GNAME IS '상품 이름
';
COMMENT ON COLUMN CART.GPRICE IS '상품 가격
';
COMMENT ON COLUMN CART.GIMAGE IS '상품 이미지 파일명
';
COMMENT ON COLUMN GOODS.GCODE IS '상품 코드
';
COMMENT ON COLUMN GOODS.GCATEGORY IS '상품 카테고리
';
COMMENT ON COLUMN GOODS.GNAME IS '상품 이름
';
COMMENT ON COLUMN GOODS.GPRICE IS '상품 가격
';
COMMENT ON COLUMN GOODS.GIMAGE IS '상품 이미지 파일명
';
COMMENT ON COLUMN GOODS.GCONTENT_IMAGE IS '상품 상세설명 이미지 파일명
';
COMMENT ON COLUMN GOODS.GAMOUNT IS '재고 수량
';
COMMENT ON COLUMN JOINMEMBER.USERID IS '회원 아이디';
COMMENT ON COLUMN JOINMEMBER.USERNAME IS '이름';
COMMENT ON COLUMN JOINMEMBER.PASSWD IS '비밀번호';
COMMENT ON COLUMN JOINMEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN JOINMEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN JOINMEMBER.GENDER IS '성별';
COMMENT ON COLUMN JOINMEMBER.BIRTHDAY IS '생일';
COMMENT ON COLUMN JOINMEMBER.POST1 IS '우편번호 앞 3자리';
COMMENT ON COLUMN JOINMEMBER.POST2 IS '우편번호 뒷 3자리';
COMMENT ON COLUMN JOINMEMBER.ADDR1 IS '주소';
COMMENT ON COLUMN JOINMEMBER.ADDR2 IS '상세주소';
COMMENT ON COLUMN JOINMEMBER.OX IS '판매자/ 구매자 회원구분
';
COMMENT ON COLUMN ORDER_INFO.NUM IS '구매 번호
';
COMMENT ON COLUMN ORDER_INFO.ORDERNAME IS '주문자 이름
';
COMMENT ON COLUMN ORDER_INFO.PHONE IS '구매자 전화번호
';
COMMENT ON COLUMN ORDER_INFO.EMAIL IS '구매자 이메일
';
COMMENT ON COLUMN ORDER_INFO.POST1 IS '우편번호 
앞 3자리
';
COMMENT ON COLUMN ORDER_INFO.POST2 IS '우편번호
뒷 3자리
';
COMMENT ON COLUMN ORDER_INFO.ADDR1 IS '주소
 500->50자로바꿈';
COMMENT ON COLUMN ORDER_INFO.ADDR2 IS '상세주소

500->50자로바꿈';
COMMENT ON COLUMN ORDER_INFO.GNAME IS '상품 이름
';
COMMENT ON COLUMN ORDER_INFO.GPRICE IS '상품 가격
';
COMMENT ON COLUMN ORDER_INFO.GIMAGE IS '상품 이미지 파일명
';
COMMENT ON COLUMN ORDER_INFO.PAYMETHOD IS '결제 방식
';
COMMENT ON COLUMN ORDER_INFO.ORDERDAY IS '구매 날짜
';
COMMENT ON COLUMN QNA_BOARD.NUM IS '게시물 번호
';
COMMENT ON COLUMN QNA_BOARD.STATE IS '처리 상태
';
COMMENT ON COLUMN QNA_BOARD.TITLE IS '게시물 제목
';
COMMENT ON COLUMN QNA_BOARD.CONTENT IS '내용
';
COMMENT ON COLUMN QNA_BOARD.WRITEDAY IS '작성일
';
COMMENT ON COLUMN QNA_BOARD.READCNT IS '조회수
';
COMMENT ON COLUMN REVIEW_BOARD.CATEGORY IS '카테고리
';
COMMENT ON COLUMN REVIEW_BOARD.TITLE IS '게시물 제목
';
COMMENT ON COLUMN REVIEW_BOARD.CONTENT IS '내용
';
COMMENT ON COLUMN REVIEW_BOARD.WRITEDAY IS '작성일
';
COMMENT ON COLUMN REVIEW_BOARD.READCNT IS '조회수
';


--
-- 민죵이 없을 때 DB 추가한고 --
--

-- board 시퀀스 생성
create sequence board_seq;

-- cart 시퀀스 생성
create sequence cart_seq;

-- cart의 gName 크기 더크게!
alter table cart
modify (gname varchar2(100));

-- state -> 처리중, readCnt -> 0 로 디폴트
alter table board
modify (state varchar2(10) default '처리중');
alter table board
modify (readCnt NUMBER(5) default 0);

-- answer table 생성
-- (boardnum, answer, userid, sellerid, writeTime)
CREATE TABLE answer
(boardnum NUMBER(4) PRIMARY KEY,
answer varchar2(3000) not null,
userid varchar2(15) not null,
sellerid varchar2(15) not null,
writeTime date DEFAULT sysdate);

--cart에 sellerId추가
alter table cart
add ( sellerId varchar2(15));


---- 세팅 210622_0611

/*계정 생성*/
--CONN system/1234;
--DROP USER J20210503 CASCADE;
--CREATE USER J20210503 IDENTIFIED BY tiger;
--GRANT DBA TO J20210503;


/*계정 접속*/
CONN J20210503/tiger;


---- 210621_0432_포워드엔지니어링_3차통합에서회원타입변경

/* 회원 */
DROP TABLE MEMBER 
	CASCADE CONSTRAINTS;

/* 이력서 */
DROP TABLE RESUME 
	CASCADE CONSTRAINTS;

/* 자기소개서 */
DROP TABLE SELF_INTRO 
	CASCADE CONSTRAINTS;

/* 자격증 */
DROP TABLE LICENCE 
	CASCADE CONSTRAINTS;

/* 세부학력 */
DROP TABLE MY_EDU 
	CASCADE CONSTRAINTS;

/* 경력사항 */
DROP TABLE CAREER 
	CASCADE CONSTRAINTS;

/* 세부자격증 */
DROP TABLE MY_LICENCE 
	CASCADE CONSTRAINTS;

/* 학력 */
DROP TABLE EDU 
	CASCADE CONSTRAINTS;

/* 이력서_자기소개서 */
DROP TABLE RE_SELF_REL 
	CASCADE CONSTRAINTS;

/* 분류 */
DROP TABLE CLASSIFY 
	CASCADE CONSTRAINTS;

/* 채용공고 */
DROP TABLE RECRUIT 
	CASCADE CONSTRAINTS;

/* 공통코드  */
DROP TABLE COMMONCODE 
	CASCADE CONSTRAINTS;

/* 커뮤니티 */
DROP TABLE BOARD 
	CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE COMMENTS 
	CASCADE CONSTRAINTS;

/* 관심공고 */
DROP TABLE LIKE_COMPANY 
	CASCADE CONSTRAINTS;

/* 지원 */
DROP TABLE APPLY 
	CASCADE CONSTRAINTS;

/* 회원 */
CREATE TABLE MEMBER (
	m_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	m_pass VARCHAR2(30), /* 비밀번호 */
	m_birth VARCHAR2(30), /* 생년월일 */
	m_name VARCHAR2(50), /* 이름 */
	m_addr VARCHAR2(200), /* 주소 */
	m_gender VARCHAR2(50), /* 성별 */
	m_email VARCHAR2(30), /* 이메일 */
	m_phone VARCHAR2(50), /* 전화번호 */
	m_tf VARCHAR2(2) /* 탈퇴여부 */
);

CREATE UNIQUE INDEX PK_MEMBER
	ON MEMBER (
		m_id ASC
	);

ALTER TABLE MEMBER
	ADD
		CONSTRAINT PK_MEMBER
		PRIMARY KEY (
			m_id
		);

COMMENT ON TABLE MEMBER IS '회원';

COMMENT ON COLUMN MEMBER.m_id IS '회원아이디';

COMMENT ON COLUMN MEMBER.m_pass IS '비밀번호';

COMMENT ON COLUMN MEMBER.m_birth IS '생년월일';

COMMENT ON COLUMN MEMBER.m_name IS '이름';

COMMENT ON COLUMN MEMBER.m_addr IS '주소';

COMMENT ON COLUMN MEMBER.m_gender IS '성별';

COMMENT ON COLUMN MEMBER.m_email IS '이메일';

COMMENT ON COLUMN MEMBER.m_phone IS '전화번호';

COMMENT ON COLUMN MEMBER.m_tf IS '탈퇴여부';

/* 이력서 */
CREATE TABLE RESUME (
	r_num NUMBER(9) NOT NULL, /* 이력서번호 */
	m_id VARCHAR2(30), /* 회원아이디 */
	r_title VARCHAR2(300), /* 이력서 제목 */
	r_pic VARCHAR2(4000), /* 사진 */
	r_file VARCHAR2(4000), /* 첨부파일 */
	r_date DATE /* 이력서작성일시 */
);

CREATE UNIQUE INDEX PK_RESUME
	ON RESUME (
		r_num ASC
	);

ALTER TABLE RESUME
	ADD
		CONSTRAINT PK_RESUME
		PRIMARY KEY (
			r_num
		);

COMMENT ON TABLE RESUME IS '이력서';

COMMENT ON COLUMN RESUME.r_num IS '이력서번호';

COMMENT ON COLUMN RESUME.m_id IS '회원아이디';

COMMENT ON COLUMN RESUME.r_title IS '이력서 제목';

COMMENT ON COLUMN RESUME.r_pic IS '사진';

COMMENT ON COLUMN RESUME.r_file IS '첨부파일';

COMMENT ON COLUMN RESUME.r_date IS '이력서작성일시';

/* 자기소개서 */
CREATE TABLE SELF_INTRO (
	si_num NUMBER(9) NOT NULL, /* 자기소개서번호 */
	m_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	si_ques VARCHAR2(1000), /* 자소서질문 */
	si_content VARCHAR2(3000) /* 자소서내용 */
);

CREATE UNIQUE INDEX PK_SELF_INTRO
	ON SELF_INTRO (
		si_num ASC
	);

ALTER TABLE SELF_INTRO
	ADD
		CONSTRAINT PK_SELF_INTRO
		PRIMARY KEY (
			si_num
		);

COMMENT ON TABLE SELF_INTRO IS '자기소개서';

COMMENT ON COLUMN SELF_INTRO.si_num IS '자기소개서번호';

COMMENT ON COLUMN SELF_INTRO.m_id IS '회원아이디';

COMMENT ON COLUMN SELF_INTRO.si_ques IS '자소서질문';

COMMENT ON COLUMN SELF_INTRO.si_content IS '자소서내용';

/* 자격증 */
CREATE TABLE LICENCE (
	lc_num NUMBER(3) NOT NULL, /* 자격증 번호 */
	lc_name VARCHAR2(30), /* 자격증 이름 */
	lc_organ VARCHAR2(30) /* 관리 기관 */
);

CREATE UNIQUE INDEX PK_LICENCE
	ON LICENCE (
		lc_num ASC
	);

ALTER TABLE LICENCE
	ADD
		CONSTRAINT PK_LICENCE
		PRIMARY KEY (
			lc_num
		);

COMMENT ON TABLE LICENCE IS '자격증';

COMMENT ON COLUMN LICENCE.lc_num IS '자격증 번호';

COMMENT ON COLUMN LICENCE.lc_name IS '자격증 이름';

COMMENT ON COLUMN LICENCE.lc_organ IS '관리 기관';

/* 세부학력 */
CREATE TABLE MY_EDU (
	r_num NUMBER(9) NOT NULL, /* 이력서번호 */
	edu_num NUMBER(3) NOT NULL, /* 학력 번호 */
	myedu_sdate VARCHAR2(20), /* 재학시작일 */
	myedu_edate VARCHAR2(20), /* 재학종료일 */
	edu_type VARCHAR2(1) /* 졸업구분 */
);

CREATE UNIQUE INDEX PK_MY_EDU
	ON MY_EDU (
		r_num ASC,
		edu_num ASC
	);

ALTER TABLE MY_EDU
	ADD
		CONSTRAINT PK_MY_EDU
		PRIMARY KEY (
			r_num,
			edu_num
		);

COMMENT ON TABLE MY_EDU IS '세부학력';

COMMENT ON COLUMN MY_EDU.r_num IS '이력서번호';

COMMENT ON COLUMN MY_EDU.edu_num IS '학력 번호';

COMMENT ON COLUMN MY_EDU.myedu_sdate IS '재학시작일';

COMMENT ON COLUMN MY_EDU.myedu_edate IS '재학종료일';

COMMENT ON COLUMN MY_EDU.edu_type IS '졸업구분';

/* 경력사항 */
CREATE TABLE CAREER (
	r_num NUMBER(9) NOT NULL, /* 이력서번호 */
	cr_name VARCHAR2(30) NOT NULL, /* 회사명 */
	cr_grade VARCHAR2(20), /* 직급 */
	cr_salary NUMBER, /* 연봉 */
	cr_job VARCHAR2(20), /* 담당업무 */
	cr_sdate VARCHAR2(20), /* 재직시작일 */
	cr_edate VARCHAR2(20) /* 재직종료일 */
);

CREATE UNIQUE INDEX PK_CAREER
	ON CAREER (
		r_num ASC,
		cr_name ASC
	);

ALTER TABLE CAREER
	ADD
		CONSTRAINT PK_CAREER
		PRIMARY KEY (
			r_num,
			cr_name
		);

COMMENT ON TABLE CAREER IS '경력사항';

COMMENT ON COLUMN CAREER.r_num IS '이력서번호';

COMMENT ON COLUMN CAREER.cr_name IS '회사명';

COMMENT ON COLUMN CAREER.cr_grade IS '직급';

COMMENT ON COLUMN CAREER.cr_salary IS '연봉';

COMMENT ON COLUMN CAREER.cr_job IS '담당업무';

COMMENT ON COLUMN CAREER.cr_sdate IS '재직시작일';

COMMENT ON COLUMN CAREER.cr_edate IS '재직종료일';

/* 세부자격증 */
CREATE TABLE MY_LICENCE (
	r_num NUMBER(9) NOT NULL, /* 이력서번호 */
	lc_num NUMBER(3) NOT NULL, /* 자격증 번호 */
	mylc_date VARCHAR2(20) /* 취득날짜 */
);

CREATE UNIQUE INDEX PK_MY_LICENCE
	ON MY_LICENCE (
		r_num ASC,
		lc_num ASC
	);

ALTER TABLE MY_LICENCE
	ADD
		CONSTRAINT PK_MY_LICENCE
		PRIMARY KEY (
			r_num,
			lc_num
		);

COMMENT ON TABLE MY_LICENCE IS '세부자격증';

COMMENT ON COLUMN MY_LICENCE.r_num IS '이력서번호';

COMMENT ON COLUMN MY_LICENCE.lc_num IS '자격증 번호';

COMMENT ON COLUMN MY_LICENCE.mylc_date IS '취득날짜';

/* 학력 */
CREATE TABLE EDU (
	edu_num NUMBER(3) NOT NULL, /* 학력 번호 */
	edu_school VARCHAR2(40), /* 학교명 */
	edu_job VARCHAR2(40) /* 전공 */
);

CREATE UNIQUE INDEX PK_EDU
	ON EDU (
		edu_num ASC
	);

ALTER TABLE EDU
	ADD
		CONSTRAINT PK_EDU
		PRIMARY KEY (
			edu_num
		);

COMMENT ON TABLE EDU IS '학력';

COMMENT ON COLUMN EDU.edu_num IS '학력 번호';

COMMENT ON COLUMN EDU.edu_school IS '학교명';

COMMENT ON COLUMN EDU.edu_job IS '전공';

/* 이력서_자기소개서 */
CREATE TABLE RE_SELF_REL (
	r_num NUMBER(9) NOT NULL, /* 이력서번호 */
	si_num NUMBER(9) NOT NULL, /* 자기소개서번호 */
	si_order NUMBER /* 배열순서 */
);

CREATE UNIQUE INDEX PK_RE_SELF_REL
	ON RE_SELF_REL (
		r_num ASC,
		si_num ASC
	);

ALTER TABLE RE_SELF_REL
	ADD
		CONSTRAINT PK_RE_SELF_REL
		PRIMARY KEY (
			r_num,
			si_num
		);

COMMENT ON TABLE RE_SELF_REL IS '이력서_자기소개서';

COMMENT ON COLUMN RE_SELF_REL.r_num IS '이력서번호';

COMMENT ON COLUMN RE_SELF_REL.si_num IS '자기소개서번호';

COMMENT ON COLUMN RE_SELF_REL.si_order IS '배열순서';

/* 분류 */
CREATE TABLE CLASSIFY (
	rc_num NUMBER(30) NOT NULL, /* 채용공고번호 */
	bclass NUMBER(10) NOT NULL, /* 대분류 */
	mclass NUMBER(10) NOT NULL /* 중분류 */
);

CREATE UNIQUE INDEX PK_CLASSIFY
	ON CLASSIFY (
		rc_num ASC,
		bclass ASC,
		mclass ASC
	);

ALTER TABLE CLASSIFY
	ADD
		CONSTRAINT PK_CLASSIFY
		PRIMARY KEY (
			rc_num,
			bclass,
			mclass
		);

COMMENT ON TABLE CLASSIFY IS '분류';

COMMENT ON COLUMN CLASSIFY.rc_num IS '채용공고번호';

COMMENT ON COLUMN CLASSIFY.bclass IS '대분류';

COMMENT ON COLUMN CLASSIFY.mclass IS '중분류';

/* 채용공고 */
CREATE TABLE RECRUIT (
	rc_num NUMBER(30) NOT NULL, /* 채용공고번호 */
	rc_name VARCHAR2(20), /* 기업이름 */
	rc_title VARCHAR2(100), /* 공고제목 */
	rc_content VARCHAR2(300), /* 공고내용 */
	rc_scrap VARCHAR2(4000), /* 공고스크랩 */
	rc_salary NUMBER(30), /* 채용연봉 */
	rc_link VARCHAR2(200), /* 홈페이지주소 */
	rc_date DATE, /* 공고일 */
	rc_view NUMBER /* 지도좌표 */
);

CREATE UNIQUE INDEX PK_RECRUIT2
	ON RECRUIT (
		rc_num ASC
	);

ALTER TABLE RECRUIT
	ADD
		CONSTRAINT PK_RECRUIT2
		PRIMARY KEY (
			rc_num
		);

COMMENT ON TABLE RECRUIT IS '채용공고';

COMMENT ON COLUMN RECRUIT.rc_num IS '채용공고번호';

COMMENT ON COLUMN RECRUIT.rc_name IS '기업이름';

COMMENT ON COLUMN RECRUIT.rc_title IS '공고제목';

COMMENT ON COLUMN RECRUIT.rc_content IS '공고내용';

COMMENT ON COLUMN RECRUIT.rc_scrap IS '공고스크랩';

COMMENT ON COLUMN RECRUIT.rc_salary IS '채용연봉';

COMMENT ON COLUMN RECRUIT.rc_link IS '홈페이지주소';

COMMENT ON COLUMN RECRUIT.rc_date IS '공고일';

COMMENT ON COLUMN RECRUIT.rc_view IS '지도좌표';

/* 공통코드  */
CREATE TABLE COMMONCODE (
	bclass NUMBER(10) NOT NULL, /* 대분류 */
	mclass NUMBER(10) NOT NULL, /* 중분류 */
	clvalue VARCHAR2(20) /* 내용 */
);

CREATE UNIQUE INDEX PK_COMMONCODE
	ON COMMONCODE (
		bclass ASC,
		mclass ASC
	);

ALTER TABLE COMMONCODE
	ADD
		CONSTRAINT PK_COMMONCODE
		PRIMARY KEY (
			bclass,
			mclass
		);

COMMENT ON TABLE COMMONCODE IS '공통코드 ';

COMMENT ON COLUMN COMMONCODE.bclass IS '대분류';

COMMENT ON COLUMN COMMONCODE.mclass IS '중분류';

COMMENT ON COLUMN COMMONCODE.clvalue IS '내용';

/* 커뮤니티 */
CREATE TABLE BOARD (
	bd_code NUMBER(3) NOT NULL, /* 게시글코드 */
	bd_num NUMBER NOT NULL, /* 게시글번호 */
	m_id VARCHAR2(30), /* 회원아이디 */
	subject VARCHAR2(100), /* 제목 */
	content VARCHAR2(4000), /* 내용 */
	category NUMBER(3), /* 카테고리 */
	read_count NUMBER, /* 조회수 */
	reg_date DATE, /* 등록일 */
	tags VARCHAR2(300), /* 태그 */
	is_adopted NUMBER(1), /* 채택여부 */
	file_name VARCHAR2(255), /* 첨부파일명 */
	ref NUMBER, /* 답변간그룹 */
	re_step NUMBER, /* 그룹내순서 */
	re_level NUMBER /* 그룹내레벨 */
);

CREATE UNIQUE INDEX PK_BOARD3
	ON BOARD (
		bd_code ASC,
		bd_num ASC
	);

ALTER TABLE BOARD
	ADD
		CONSTRAINT PK_BOARD3
		PRIMARY KEY (
			bd_code,
			bd_num
		);

COMMENT ON TABLE BOARD IS '커뮤니티';

COMMENT ON COLUMN BOARD.bd_code IS '게시글코드';

COMMENT ON COLUMN BOARD.bd_num IS '게시글번호';

COMMENT ON COLUMN BOARD.m_id IS '회원아이디';

COMMENT ON COLUMN BOARD.subject IS '제목';

COMMENT ON COLUMN BOARD.content IS '내용';

COMMENT ON COLUMN BOARD.category IS '카테고리';

COMMENT ON COLUMN BOARD.read_count IS '조회수';

COMMENT ON COLUMN BOARD.reg_date IS '등록일';

COMMENT ON COLUMN BOARD.tags IS '태그';

COMMENT ON COLUMN BOARD.is_adopted IS '채택여부';

COMMENT ON COLUMN BOARD.file_name IS '첨부파일명';

COMMENT ON COLUMN BOARD.ref IS '답변간그룹';

COMMENT ON COLUMN BOARD.re_step IS '그룹내순서';

COMMENT ON COLUMN BOARD.re_level IS '그룹내레벨';

/* 댓글 */
CREATE TABLE COMMENTS (
	bd_code NUMBER(3) NOT NULL, /* 게시글코드 */
	bd_num NUMBER NOT NULL, /* 게시글번호 */
	bd_cm_num NUMBER NOT NULL, /* 댓글번호 */
	m_id VARCHAR2(30), /* 회원아이디 */
	content VARCHAR2(4000), /* 내용 */
	reg_date DATE, /* 등록일 */
	ref NUMBER, /* 답변간그룹 */
	re_step NUMBER, /* 그룹내순서 */
	re_level NUMBER /* 그룹내레벨 */
);

CREATE UNIQUE INDEX PK_COMMENTS2
	ON COMMENTS (
		bd_code ASC,
		bd_num ASC,
		bd_cm_num ASC
	);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT PK_COMMENTS2
		PRIMARY KEY (
			bd_code,
			bd_num,
			bd_cm_num
		);

COMMENT ON TABLE COMMENTS IS '댓글';

COMMENT ON COLUMN COMMENTS.bd_code IS '게시글코드';

COMMENT ON COLUMN COMMENTS.bd_num IS '게시글번호';

COMMENT ON COLUMN COMMENTS.bd_cm_num IS '댓글번호';

COMMENT ON COLUMN COMMENTS.m_id IS '회원아이디';

COMMENT ON COLUMN COMMENTS.content IS '내용';

COMMENT ON COLUMN COMMENTS.reg_date IS '등록일';

COMMENT ON COLUMN COMMENTS.ref IS '답변간그룹';

COMMENT ON COLUMN COMMENTS.re_step IS '그룹내순서';

COMMENT ON COLUMN COMMENTS.re_level IS '그룹내레벨';

/* 관심공고 */
CREATE TABLE LIKE_COMPANY (
	m_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	rc_num NUMBER(30) NOT NULL, /* 채용공고번호 */
	rc_cnt NUMBER(2) /* 관심현황 */
);

CREATE UNIQUE INDEX PK_LIKE_COMPANY
	ON LIKE_COMPANY (
		m_id ASC,
		rc_num ASC
	);

ALTER TABLE LIKE_COMPANY
	ADD
		CONSTRAINT PK_LIKE_COMPANY
		PRIMARY KEY (
			m_id,
			rc_num
		);

COMMENT ON TABLE LIKE_COMPANY IS '관심공고';

COMMENT ON COLUMN LIKE_COMPANY.m_id IS '회원아이디';

COMMENT ON COLUMN LIKE_COMPANY.rc_num IS '채용공고번호';

COMMENT ON COLUMN LIKE_COMPANY.rc_cnt IS '관심현황';

/* 지원 */
CREATE TABLE APPLY (
	m_id VARCHAR2(30) NOT NULL, /* 회원아이디 */
	rc_num NUMBER(30) NOT NULL, /* 채용공고번호 */
	r_num NUMBER(9), /* 이력서번호 */
	a_date DATE, /* 지원날짜 */
	ap_cnt NUMBER(2) /* 지원현황 */
);

CREATE UNIQUE INDEX PK_APPLY
	ON APPLY (
		m_id ASC,
		rc_num ASC
	);

ALTER TABLE APPLY
	ADD
		CONSTRAINT PK_APPLY
		PRIMARY KEY (
			m_id,
			rc_num
		);

COMMENT ON TABLE APPLY IS '지원';

COMMENT ON COLUMN APPLY.m_id IS '회원아이디';

COMMENT ON COLUMN APPLY.rc_num IS '채용공고번호';

COMMENT ON COLUMN APPLY.r_num IS '이력서번호';

COMMENT ON COLUMN APPLY.a_date IS '지원날짜';

COMMENT ON COLUMN APPLY.ap_cnt IS '지원현황';

ALTER TABLE RESUME
	ADD
		CONSTRAINT FK_MEMBER_TO_RESUME
		FOREIGN KEY (
			m_id
		)
		REFERENCES MEMBER (
			m_id
		);

ALTER TABLE SELF_INTRO
	ADD
		CONSTRAINT FK_MEMBER_TO_SELF_INTRO
		FOREIGN KEY (
			m_id
		)
		REFERENCES MEMBER (
			m_id
		);

ALTER TABLE MY_EDU
	ADD
		CONSTRAINT FK_RESUME_TO_MY_EDU
		FOREIGN KEY (
			r_num
		)
		REFERENCES RESUME (
			r_num
		);

ALTER TABLE MY_EDU
	ADD
		CONSTRAINT FK_EDU_TO_MY_EDU
		FOREIGN KEY (
			edu_num
		)
		REFERENCES EDU (
			edu_num
		);

ALTER TABLE CAREER
	ADD
		CONSTRAINT FK_RESUME_TO_CAREER
		FOREIGN KEY (
			r_num
		)
		REFERENCES RESUME (
			r_num
		);

ALTER TABLE MY_LICENCE
	ADD
		CONSTRAINT FK_LICENCE_TO_MY_LICENCE
		FOREIGN KEY (
			lc_num
		)
		REFERENCES LICENCE (
			lc_num
		);

ALTER TABLE MY_LICENCE
	ADD
		CONSTRAINT FK_RESUME_TO_MY_LICENCE
		FOREIGN KEY (
			r_num
		)
		REFERENCES RESUME (
			r_num
		);

ALTER TABLE RE_SELF_REL
	ADD
		CONSTRAINT FK_RESUME_TO_RE_SELF_REL
		FOREIGN KEY (
			r_num
		)
		REFERENCES RESUME (
			r_num
		);

ALTER TABLE RE_SELF_REL
	ADD
		CONSTRAINT FK_SELF_INTRO_TO_RE_SELF_REL
		FOREIGN KEY (
			si_num
		)
		REFERENCES SELF_INTRO (
			si_num
		);

ALTER TABLE CLASSIFY
	ADD
		CONSTRAINT FK_COMMONCODE_TO_CLASSIFY
		FOREIGN KEY (
			bclass,
			mclass
		)
		REFERENCES COMMONCODE (
			bclass,
			mclass
		);

ALTER TABLE CLASSIFY
	ADD
		CONSTRAINT FK_RECRUIT_TO_CLASSIFY
		FOREIGN KEY (
			rc_num
		)
		REFERENCES RECRUIT (
			rc_num
		);

ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_MEMBER_TO_BOARD2
		FOREIGN KEY (
			m_id
		)
		REFERENCES MEMBER (
			m_id
		);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT FK_BOARD_TO_COMMENTS2
		FOREIGN KEY (
			bd_code,
			bd_num
		)
		REFERENCES BOARD (
			bd_code,
			bd_num
		);

ALTER TABLE COMMENTS
	ADD
		CONSTRAINT FK_MEMBER_TO_COMMENTS
		FOREIGN KEY (
			m_id
		)
		REFERENCES MEMBER (
			m_id
		);

ALTER TABLE LIKE_COMPANY
	ADD
		CONSTRAINT FK_MEMBER_TO_LIKE_COMPANY
		FOREIGN KEY (
			m_id
		)
		REFERENCES MEMBER (
			m_id
		);

ALTER TABLE LIKE_COMPANY
	ADD
		CONSTRAINT FK_RECRUIT_TO_LIKE_COMPANY
		FOREIGN KEY (
			rc_num
		)
		REFERENCES RECRUIT (
			rc_num
		);

ALTER TABLE APPLY
	ADD
		CONSTRAINT FK_RESUME_TO_APPLY
		FOREIGN KEY (
			r_num
		)
		REFERENCES RESUME (
			r_num
		);

ALTER TABLE APPLY
	ADD
		CONSTRAINT FK_MEMBER_TO_APPLY
		FOREIGN KEY (
			m_id
		)
		REFERENCES MEMBER (
			m_id
		);

ALTER TABLE APPLY
	ADD
		CONSTRAINT FK_RECRUIT_TO_APPLY
		FOREIGN KEY (
			rc_num
		)
		REFERENCES RECRUIT (
			rc_num
		);







---------------



/*자기소개서, 이력서 시퀀스 생성*/
DROP SEQUENCE self_intro_seq;
DROP SEQUENCE resume_seq;
DROP SEQUENCE recruit_seq;
CREATE SEQUENCE self_intro_seq INCREMENT BY 1 START WITH 100 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE resume_seq INCREMENT BY 1 START WITH 100 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE recruit_seq INCREMENT BY 1 START WITH 2000 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;




---------------


/*210621_0436_데이터익스포트.sql*/


--------------------------------------------------------
--  파일이 생성됨 - 월요일-6월-21-2021   
--------------------------------------------------------
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('iin22','1234','222222','jack','seoul','1','iin22@naver.com','01011112222','1');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('iin33','1234','222222','김기수','seoul','1','iin33@naver.com','01011112222','1');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('iin44','1234','222222','이지은','seoul','2','iin44@naver.com','01011112222','1');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('noi5176@gmail.com',null,null,null,null,null,'noi5176@gmail.com',null,'1');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('asdasd','1234','22220911','asdasd','12341234','male','asd@asd','12341234','1');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('이마트','1234','20110503','강희석','서울 성동구 성수동2가 333-16 이마트본사','대형 마트','24,649명','14조 2천억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('신세계 푸드','1234','19791011','송현석','서울 성동구 성수일로56, 4-7층','기관 구내식당업','3,444명','1조 2,261억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('쿠팡','1234','20130215','강한승/박대준','서울 송파구 송파대로570, 18층','전자상거래 소매업','6,372명','13조 9,257억 6,800만원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('admin','1234','222222','이지은','seoul','2','iin44@naver.com','01011112222','3');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('마키나락스','1234','20171221','윤성호/이재혁','서울 서초구 서초대로77길 17, 12층','솔루션·SI·CRM·ERP','-','9억 2,250만원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('현대IT','1234','20131121','장제만','서울 강동구 상일로10길 36 (상일동, 세종텔레콤지식산업센터) 5층 현대아이티','전기·전자·제어','60명 ','233억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('중앙대병원','1234','-','이한준','서울 동작구 흑석로102','종합 병원','-','2,341억 6,908만원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('에버랜드','1234','-','정금용','경기 용인시 처인구 에버랜드로 199 (전대리, 삼성에버랜드) 에버랜드','서비스업','-','-','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('롯데월드','1234','19870301','최홍훈','서울 송파구 잠실동 40-1 호텔롯데 롯데월드','서비스업','2,400명','4,000억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('삼성화재','1234','19520126','최영무','서울 중구 을지로1가 87 삼성화재빌딩 16층','증권·보험·카드','5,607명','23조 6천억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('버거킹','1234','20121121','문영주','서울 종로구 삼봉로 71 (수송동, G타워) G타워 2F','음식료·외식·프랜차이즈','900명','-','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('하나은행','1234','19670130','함영주','서울 서초구 남부순환로 2351 (서초동, 국제방송교류재단) 2층 KEB하나은행 방배남출장소','은행·금융','13,000명','-','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('한화솔루션','1234','19740427','이구영/김희철/류두형/김동관/김은수','서울 중구 청계천로 86 (장교동, 한화빌딩) 한화케미칼','화학·에너지·환경','5,533명','5조 7,173억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('트리플제이','1234','20201218','주성돈','서울 영등포구 여의나루로 67 (여의도동, 신송빌딩) 1205호-이에스19호','컨설팅·연구·조사','30명','-','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('루이비통','1234','19910918','안토니마이클패트릭르드루','서울 강남구 삼성로 511 (삼성동, 골든타워) 골든타워','백화점·유통·도소매','809명','1조 467억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('농협','1234','20070417','박태선','서울 영등포구 여의도동 45-3 NH농협캐피탈빌딩','캐피탈·대출','372명','4,148억 9천만원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('여기어때','1234','20150921','최문석','서울 강남구 봉은사로 479 (삼성동) 479타워 11층','포털·컨텐츠·커뮤니티','410명','1,000억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('유니드','1234','19800510','이화영/정의승','서울 중구 을지로5길 19 (수하동, FERRUM TOWER) 17층 유니드','화학·에너지·환경','450명','8,140억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('리치몬트','1234','19970401','이진원','서울 중구 퇴계로 100 스테이트타워 남산','백화점·유통·도소매','980명','1조 382억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('이안한방병원','1234','-','김동호','경기 오산시 대원로 23 (원동) 이안한방병원','의료','-','-','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('엔아이티','1234','19990423','박종문','경북 경산시 삼풍동 300 섬유기계연구소 301호','소프트웨어 도매업','7명','15억 4천만원','0');

REM INSERTING into RECRUIT
SET DEFINE OFF;
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1000,'신세계 푸드','안전관리자 정규직 채용','./image/hireLogo.png','./image/hire.png',3500,'www.shinsegaefood.com',to_date('21/05/02','RR/MM/DD'),3754533981270502329);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1001,'쿠팡','풀스택 개발자 채용','./image/copanglogo.png','./image/copanghire.png',4500,'https://rocketyourcareer.kr.coupang.com/%ec%a7%81%eb%ac%b4/-/principal-web-full-stack-engineer-coupang-play/24450/19446668',to_date('21/04/28','RR/MM/DD'),3751581481270989293);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1002,'이마트','STAFF채용','./image/emartlogo.png','./image/emarthire.png',2700,'https://rocketyourcareer.kr.coupang.com/%ec%a7%81%eb%ac%b4/-/principal-web-full-stack-engineer-coupang-play/24450/19446668',to_date('21/05/30','RR/MM/DD'),3757132071270227761);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1003,'마키나락스','백엔드 개발자 채용','./image/makinarockslogo.png','./image/markinarockshire.png',5400,'https://www.makinarocks.ai/',to_date('21/05/26','RR/MM/DD'),3750056551270254046);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1004,'현대IT','개발자 채용','./image/Hyundailogo.png','./image/Hyundaihire.png',2800,'http://www.hyundai-ite.com/index.jsp',to_date('21/03/16','RR/MM/DD'),3750731961270621945);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1005,'중앙대병원','간호사 계약직 채용','./image/caulogo.png','./image/cauhire.png',4400,'http://recruit.caumc.or.kr/index.asp',to_date('21/04/15','RR/MM/DD'),3750680941269608074);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1006,'에버랜드','의상팀 담당 채용','./image/everlandlogo.png','./image/everlandhire.png',3000,'https://www.everland.com/',to_date('21/05/05','RR/MM/DD'),3729449111272034936);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1007,'롯데월드','캐스트 채용','./image/lotteworldlogo.png','./image/lotteworldhire.png',2800,'https://adventure.lotteworld.com/',to_date('21/04/13','RR/MM/DD'),3751111581270981670);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1008,'삼성화재','자산 인프라 투자 운용 채용','./image/samsaunglogo.png','./image/samsunghire.png',6000,'http://www.samsungcareers.com/rec/apply/ComResumeServlet?cmd=pstMain#',to_date('21/05/09','RR/MM/DD'),3749599921270263614);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1009,'버거킹','캐스트 채용','./image/bugerlogo.png','./image/bugerhire.png',4000,'https://www.burgerking.co.kr/#/home',to_date('21/04/14','RR/MM/DD'),3750315491270492977);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1010,'하나은행','대학생 인턴모집 ','./image/hanalogo.png','./image/hanahire.png',2500,'https://www.kebhana.com/ ',to_date('21/04/15','RR/MM/DD'),3751082021270218835);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1011,'한화솔루션','정규직 통합 채용','./image/hanhwalogo.png','./image/hanhwahire.png',5000,'https://www.hanwhasolutions.com/ko/ ',to_date('21/04/16','RR/MM/DD'),3756750631269859413);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1012,'트리플제이','각 부문 정규 채용','./image/JJJlogo.png','./image/JJJhire.png',3800,'https://www.jobkorea.co.kr/Recruit/Co_Read/C/triplej0108/Company_name/%ED%8A%B8%EB%A6%AC%ED%94%8C%EC%A0%9C%EC%9D%B4%E3%88%9C ',to_date('21/04/17','RR/MM/DD'),3757326431270154353);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1013,'루이비통','신입/경력 채용','./image/loulogo.png','./image/louhire.png',4700,'https://kr.louisvuitton.com/kor-kr/homepage ',to_date('21/04/18','RR/MM/DD'),3756096101269812033);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1014,'농협','채용형 인턴','./image/nonglogo.png','./image/nonghire.png',2400,'https://banking.nonghyup.com/nhbank.html ',to_date('21/04/19','RR/MM/DD'),3755896361269755734);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1015,'여기어때','전직군 모집','./image/ylogo.png','./image/yhire.png',3000,'https://www.gccompany.co.kr/ ',to_date('21/04/20','RR/MM/DD'),3751310341270527679);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1016,'유니드','신입사원 채용','./image/youneedlogo.png','./image/youneedhire.png',2800,'http://www.unid.co.kr/kor/index.php ',to_date('21/04/21','RR/MM/DD'),3758717811270025525);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1017,'리치몬트','판매직 모집','./image/richlogo.png','./image/richhire.png',4500,'https://www.richemont.com/en/home/ ',to_date('21/06/11','RR/MM/DD'),3586459971277656784);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1018,'이안한방병원','간호조무사 모집','./image/eanlogo.png','./image/eanhire.png',3700,'http://ianclinic.co.kr/ ',to_date('21/06/01','RR/MM/DD'),3612631721283384182);
Insert into RECRUIT (RC_NUM,RC_NAME,RC_TITLE,RC_CONTENT,RC_SCRAP,RC_SALARY,RC_LINK,RC_DATE,RC_VIEW) values (1019,'엔아이티','개발자 채용','./image/nitlogo.png','./image/nithire.png',5500,'http://www.nitgs.com/',to_date('21/06/06','RR/MM/DD'),3597083101265783106);

REM INSERTING into BOARD
SET DEFINE OFF;
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,1,'iin22','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,to_date('20/07/28','RR/MM/DD'),'#언택트#취준',0,'community/fileSave/default_info.png',1,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,145,'iin22','임직원의 동기부여를 담당하는 인사관리!','Q1
담당하고 계신 업무를 소개해 주세요.

경영지원실 인사관리팀에서 C 담당하고 있습니다. HR C 제뉴원사이언스의 구성원이 회사의 목표 달성과 임직원 자신의 성장을 이룰 수 있도록, 임직원 동기부여를 위해 최적화된 보상과 평가, 복리후생 제도를 수립하고 운영하는 직무입니다.


Q2
담당하신 직무의 가장 큰 매력은 무엇인가요?

인사제도를 기획하고 이를 운영했을 때, 구성원의 만족감을 높이고 동기부여가 돼 결국 조직의 성과로 연결되는 모습을 볼 수 있는 점이 HR 직무의 가장 큰 매력이 아닐까 합니다. 또 회사의 입장에서 직원의 얘기를 듣고, 직원의 입장에서 문제를 해결하는 직무라는 점도 큰 매력이죠.


Q3
하루 일과가 궁금합니다.

신규로 입사하는 직원이 있다면 입사에 필요한 각종 서류 작성, 4대보험 취득 등의 업무를 수행합니다. 또 매월 급여일이 다가오는 시기엔 한 달간의 임직원 근무 생활을 모두 확인?종합해보며 임직원의 소중한 급여를 산정, 지급하는 업무도 수행합니다. 정기적인 관리 업무 외에도 하루 동안 사내 메신저 및 이메일을 통해 임직원이 남긴 문의사항이나 건의사항에 대해 수시로 피드백을 합니다. 피드백과 더불어, 이러한 문의?건의사항을 취합하여 사내 제도에 최대한 반영될 수 있도록 하고 있습니다. 마지막으로 전반적인 HR 주요 이슈 사항을 찾아보거나 HR 관련 제도 변화에 대한 연구를 합니다. 또 타 회사의 HR 제도를 참고하여 팀원들과 함께 우리 회사의 HR 제도 기획과 운영에 참고할만한 부분은 없는지, 실제 제도에 적용했을 때 어떻게 작용할 것인지 등에 대해 논의하고 또 시뮬레이션을 해보며 하루 일과를 종료합니다.


Q4
“이 업무를 할 때에는 OOO가 가장 필요하다!”

우선 타인을 존중하는 태도가 필요합니다. HR은 모든 임직원을 대해야 합니다. 따라서 타인을 존중하는 태도가 없다면 결국 현실과 동떨어진 방향으로 제도가 운영될 수 밖에 없습니다. 두 번째로 공정함 입니다. 회사의 입장과 직원의 입장 사이에서 어느 한쪽으로 치우치지 않아야 합니다. 특히 직원을 평가하는 제도를 구축하고, 그 평가에 따라 보상을 하는 직무이기 때문에 나로 인해 부당한 대우를 받는 직원이 생기지 않도록 하는 것이 중요합니다. 마지막으로 철저한 윤리관과 보안의식 입니다. 모든 임직원의 정보를 다루는 위치에 있기 때문에 소중한 임직원의 정보를 철저히 보호하겠다는 윤리관과 보안의식이 필수입니다.


Q5
해당 직무의 전망에 대해서 어떻게 생각하시나요?

저는 ‘취준’하는 후배들에게 추천할 만큼 HR의 전망은 좋다고 봅니다. 모든 조직에서 필요로 하는 역할이기도 하며, 무엇보다 조직의 본질이 곧 ‘사람’이라는 점 때문입니다. 사람을 존중하고, 또 사랑할 수 있는 사람이라면 HR직무를 맡는데 어려움이 없을 것입니다.',0,42,to_date('21/06/13','RR/MM/DD'),'#인사·교육·노무 #(주)제뉴원사이언스',0,'community/fileSave/genuone.jpg',145,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,147,'iin22','[답변]','힘내세요...',0,0,to_date('21/06/20','RR/MM/DD'),null,0,null,146,2,2);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,146,'iin22','이직 관련 질문드립니다.','1년 안됐는데 이직할지 고민이에요.',0,9,to_date('21/06/20','RR/MM/DD'),'#이직#질문#신입',0,'community/fileSave/default_qna.png',146,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,148,'iin22','[답변]','화이팅',0,0,to_date('21/06/20','RR/MM/DD'),null,0,null,146,3,2);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,131,'iin33','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>',null,1,to_date('21/08/04','RR/MM/DD'),'#언택트#취준',0,'community/fileSave/default_info.png',131,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,96,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',96,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,97,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',97,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,98,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',98,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,99,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',99,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,100,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',100,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,101,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',101,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,102,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',102,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,103,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',103,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,104,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',104,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,105,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',105,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,106,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',106,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,107,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',107,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,108,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',108,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,109,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',109,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,110,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',110,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,111,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',111,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,112,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',112,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,113,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',113,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,114,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',114,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,115,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',115,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,116,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',116,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,117,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',117,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,118,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',118,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,119,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',119,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,132,'noi5176@gmail.com','반갑습니당','^^',0,3,to_date('21/06/12','RR/MM/DD'),null,0,'community/fileSave/default_info.png',132,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,133,'iin22','asdasd','asdasd',0,4,to_date('21/06/12','RR/MM/DD'),null,0,'community/fileSave/default_info.png',133,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,134,'iin22','도지도지도지','asdasd',0,26,to_date('21/06/12','RR/MM/DD'),'#도지#강아지#귀엽당',0,'community/fileSave/Doge.jpg',134,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,22,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',22,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,94,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',94,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,24,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',24,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,27,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',27,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,29,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',29,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,32,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',32,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,34,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',34,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,37,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',37,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,40,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',40,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,42,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',42,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,45,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',45,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,47,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',47,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,50,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',50,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,52,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',52,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,55,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',55,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,57,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',57,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,60,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',60,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,62,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',62,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,65,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',65,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,68,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',68,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,70,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',70,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,73,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',73,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,75,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',75,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,78,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',78,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,80,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',80,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,83,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',83,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,85,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',85,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,88,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',88,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,90,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',90,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,135,'iin22','질문드려요 정말 고민이에요 답변해주세요오','냉무',0,13,to_date('21/06/19','RR/MM/DD'),'#질문#답변부탁#고민',0,'community/fileSave/default_qna.png',135,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,95,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',95,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,36,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',36,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,2,'iin22','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,0,to_date('20/07/28','RR/MM/DD'),'#마케팅#인터뷰',0,'community/fileSave/default_info.png',2,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,38,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',38,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,3,'iin22','<기업별 연봉 인기순위 TOP 10>','냉무',null,0,to_date('20/07/29','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',3,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,121,'iin33','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,to_date('21/05/28','RR/MM/DD'),'#언택트#취준',0,'community/fileSave/default_info.png',121,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,122,'iin44','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,0,to_date('21/05/28','RR/MM/DD'),'#마케팅#인터뷰',0,'community/fileSave/default_info.png',122,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,123,'iin22','<기업별 연봉 인기순위 TOP 10>','냉무',null,0,to_date('21/05/29','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',123,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,124,'iin22','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,to_date('21/06/28','RR/MM/DD'),'#언택트#취준',0,'community/fileSave/default_info.png',124,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,125,'iin33','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,0,to_date('21/06/28','RR/MM/DD'),'#마케팅#인터뷰',0,'community/fileSave/default_info.png',125,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,126,'iin22','<기업별 연봉 인기순위 TOP 10>','냉무',null,0,to_date('21/06/29','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',126,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,127,'iin44','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,2,to_date('21/07/28','RR/MM/DD'),'#언택트#취준',0,'community/fileSave/default_info.png',127,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,128,'iin33','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,1,to_date('21/07/28','RR/MM/DD'),'#마케팅#인터뷰',0,'community/fileSave/default_info.png',128,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,129,'iin22','<기업별 연봉 인기순위 TOP 10>','냉무',null,2,to_date('21/07/29','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',129,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,130,'iin44','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,3,to_date('21/08/03','RR/MM/DD'),'#언택트#취준',0,'community/fileSave/default_info.png',130,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,12,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',12,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,13,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',13,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,14,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',14,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,15,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',15,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,16,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',16,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,17,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',17,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,18,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',18,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,19,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',19,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,20,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',20,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,21,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',21,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,23,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',23,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,25,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',25,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,26,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',26,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,28,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',28,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,30,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',30,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,31,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',31,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,33,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',33,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,35,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',35,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,39,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',39,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,41,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',41,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,43,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',43,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,44,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',44,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,46,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',46,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,48,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',48,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,49,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',49,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,51,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',51,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,53,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',53,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,54,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',54,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,56,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',56,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,58,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',58,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,59,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',59,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,61,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',61,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,63,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',63,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,64,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',64,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,66,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',66,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,67,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',67,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,69,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',69,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,71,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',71,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,72,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',72,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,74,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',74,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,76,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',76,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,77,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',77,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,79,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',79,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,81,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',81,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,82,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',82,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,84,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',84,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,86,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',86,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,87,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',87,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,89,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',89,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,91,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',91,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,92,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',92,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,93,'iin22','더미용','냉무',null,0,to_date('21/01/03','RR/MM/DD'),'#연봉',0,'community/fileSave/default_info.png',93,1,1);

REM INSERTING into COMMENTS
SET DEFINE OFF;
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,1,1,'iin44','꿀팁감사합니다!!',to_date('21/05/29','RR/MM/DD'),1,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,1,3,'iin22','네^^',to_date('21/05/29','RR/MM/DD'),1,2,2);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,1,5,'iin22','대댓글테스트용5',to_date('21/05/30','RR/MM/DD'),1,3,2);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,1,7,'iin22','대댓글테스트용7',to_date('21/05/30','RR/MM/DD'),1,4,3);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,1,6,'iin22','대댓글테스트용6',to_date('21/05/30','RR/MM/DD'),1,5,2);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,1,2,'iin33','좋아요',to_date('21/05/29','RR/MM/DD'),2,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,1,4,'iin44','굿굿',to_date('21/05/29','RR/MM/DD'),4,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,131,1,'iin44','꿀팁감사합니다!!',to_date('21/05/29','RR/MM/DD'),1,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,131,3,'iin22','네^^',to_date('21/05/29','RR/MM/DD'),1,2,2);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,131,5,'iin22','대댓글테스트용5',to_date('21/05/30','RR/MM/DD'),1,3,2);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,131,7,'iin22','대댓글테스트용7',to_date('21/05/30','RR/MM/DD'),1,4,3);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,131,6,'iin22','대댓글테스트용6',to_date('21/05/30','RR/MM/DD'),1,5,2);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,131,2,'iin33','좋아요',to_date('21/05/29','RR/MM/DD'),2,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,131,4,'iin44','굿굿',to_date('21/05/29','RR/MM/DD'),4,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,145,1,'iin22','정말좋네요',to_date('21/06/20','RR/MM/DD'),1,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,145,2,'iin22','그러게요',to_date('21/06/20','RR/MM/DD'),1,2,2);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (2,146,1,'iin22','응원합니다.',to_date('21/06/20','RR/MM/DD'),1,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (2,146,2,'iin22','화이팅!!',to_date('21/06/20','RR/MM/DD'),2,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (2,146,3,'iin22','감사합니다.',to_date('21/06/20','RR/MM/DD'),1,2,2);
REM INSERTING into COMMONCODE
SET DEFINE OFF;
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,0,'지역');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,10,'서울');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,11,'대전');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,12,'대구');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,13,'부산');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,14,'광주');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,15,'경기');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,16,'강원');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,17,'충청');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,18,'호남');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,19,'영남');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (10,20,'제주');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (20,0,'업종');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (20,10,'IT');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (20,11,'금융');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (20,12,'의료');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (20,13,'서비스');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (30,0,'근무형태');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (30,10,'정규직');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (30,11,'계약직');
Insert into COMMONCODE (BCLASS,MCLASS,CLVALUE) values (30,12,'인턴');

REM INSERTING into CLASSIFY
SET DEFINE OFF;
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1000,10,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1000,20,13);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1000,30,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1001,10,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1001,20,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1001,30,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1002,10,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1002,20,13);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1002,30,11);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1003,10,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1003,20,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1003,30,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1004,10,16);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1004,20,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1004,30,12);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1005,10,18);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1005,20,12);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1005,30,11);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1006,10,15);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1006,20,13);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1006,30,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1007,10,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1007,20,13);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1007,30,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1008,10,10);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1008,20,11);
Insert into CLASSIFY (RC_NUM,BCLASS,MCLASS) values (1008,30,10);






-------------------

/*커밋*/
commit;
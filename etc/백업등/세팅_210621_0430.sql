---- 세팅 210607_1518_1차통합

/*계정 생성*/
--CONN system/1234;
--DROP USER J20210503 CASCADE;
--CREATE USER J20210503 IDENTIFIED BY tiger;
--GRANT DBA TO J20210503;


/*계정 접속*/
CONN J20210503/tiger;


---- 210610_1509_포워드엔지니어링
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
	m_name VARCHAR2(10), /* 이름 */
	m_addr VARCHAR2(200), /* 주소 */
	m_gender VARCHAR2(10), /* 성별 */
	m_email VARCHAR2(30), /* 이메일 */
	m_phone VARCHAR2(20), /* 전화번호 */
	m_tf VARCHAR2(1) /* 탈퇴여부 */
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
	rc_date DATE NOT NULL, /* 공고일 */
	rc_view NUMBER(30) /* 공고조회수 */
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

COMMENT ON COLUMN RECRUIT.rc_view IS '공고조회수';

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
	rc_num NUMBER(30) NOT NULL /* 채용공고번호 */
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

---- 커뮤니티 관련 데이터 입력
--210602_1243_커뮤니티샘플데이터
--커뮤니티 관련 멤버 생성
INSERT INTO MEMBER VALUES('iin22','1234','222222','jack','seoul','1','iin22@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin33','1234','222222','김기수','seoul','1','iin33@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin44','1234','222222','이지은','seoul','2','iin44@naver.com','01011112222','1');

--커뮤니티 게시글 생성 
INSERT INTO board VALUES(001,1,'iin22','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,TO_DATE('2020-07-28 13:20:30','YYYY-MM-DD HH24:MI:SS'),'#언택트#취준',0,null,1,1,1);
INSERT INTO board VALUES(001,2,'iin22','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,0,TO_DATE('2020-07-28 14:20:30','YYYY-MM-DD HH24:MI:SS'),'#마케팅#인터뷰',0,null,2,1,1);
INSERT INTO board VALUES(001,3,'iin22','<기업별 연봉 인기순위 TOP 10>','냉무',null,0,TO_DATE('2020-07-29 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,3,1,1);
INSERT INTO board VALUES(001,121,'iin33','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,TO_DATE('2021-05-28 13:20:30','YYYY-MM-DD HH24:MI:SS'),'#언택트#취준',0,null,121,1,1);
INSERT INTO board VALUES(001,122,'iin44','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,0,TO_DATE('2021-05-28 14:20:30','YYYY-MM-DD HH24:MI:SS'),'#마케팅#인터뷰',0,null,122,1,1);
INSERT INTO board VALUES(001,123,'iin22','<기업별 연봉 인기순위 TOP 10>','냉무',null,0,TO_DATE('2021-05-29 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,123,1,1);
INSERT INTO board VALUES(001,124,'iin22','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,TO_DATE('2021-06-28 13:20:30','YYYY-MM-DD HH24:MI:SS'),'#언택트#취준',0,null,124,1,1);
INSERT INTO board VALUES(001,125,'iin33','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,0,TO_DATE('2021-06-28 14:20:30','YYYY-MM-DD HH24:MI:SS'),'#마케팅#인터뷰',0,null,125,1,1);
INSERT INTO board VALUES(001,126,'iin22','<기업별 연봉 인기순위 TOP 10>','냉무',null,0,TO_DATE('2021-06-29 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,126,1,1);
INSERT INTO board VALUES(001,127,'iin44','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,TO_DATE('2021-07-28 13:20:30','YYYY-MM-DD HH24:MI:SS'),'#언택트#취준',0,null,127,1,1);
INSERT INTO board VALUES(001,128,'iin33','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,0,TO_DATE('2021-07-28 14:20:30','YYYY-MM-DD HH24:MI:SS'),'#마케팅#인터뷰',0,null,128,1,1);
INSERT INTO board VALUES(001,129,'iin22','<기업별 연봉 인기순위 TOP 10>','냉무',null,0,TO_DATE('2021-07-29 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,129,1,1);
INSERT INTO board VALUES(001,130,'iin44','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,TO_DATE('2021-08-03 13:20:30','YYYY-MM-DD HH24:MI:SS'),'#언택트#취준',0,null,130,1,1);
INSERT INTO board VALUES(001,131,'iin33','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>언택트 취준 꿀팁 내용입니다!<br>',null,0,TO_DATE('2021-08-04 11:00:23','YYYY-MM-DD HH24:MI:SS'),'#언택트#취준',0,null,131,1,1);

--커뮤니티 글 더미용
INSERT INTO board VALUES(001,12,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,12,1,1);
INSERT INTO board VALUES(001,13,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,13,1,1);
INSERT INTO board VALUES(001,14,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,14,1,1);
INSERT INTO board VALUES(001,15,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,15,1,1);
INSERT INTO board VALUES(001,16,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,16,1,1);
INSERT INTO board VALUES(001,17,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,17,1,1);
INSERT INTO board VALUES(001,18,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,18,1,1);
INSERT INTO board VALUES(001,19,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,19,1,1);
INSERT INTO board VALUES(001,20,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,20,1,1);
INSERT INTO board VALUES(001,21,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,21,1,1);
INSERT INTO board VALUES(001,22,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,22,1,1);
INSERT INTO board VALUES(001,23,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,23,1,1);
INSERT INTO board VALUES(001,24,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,24,1,1);
INSERT INTO board VALUES(001,25,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,25,1,1);
INSERT INTO board VALUES(001,26,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,26,1,1);
INSERT INTO board VALUES(001,27,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,27,1,1);
INSERT INTO board VALUES(001,28,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,28,1,1);
INSERT INTO board VALUES(001,29,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,29,1,1);
INSERT INTO board VALUES(001,30,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,30,1,1);
INSERT INTO board VALUES(001,31,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,31,1,1);
INSERT INTO board VALUES(001,32,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,32,1,1);
INSERT INTO board VALUES(001,33,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,33,1,1);
INSERT INTO board VALUES(001,34,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,34,1,1);
INSERT INTO board VALUES(001,35,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,35,1,1);
INSERT INTO board VALUES(001,36,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,36,1,1);
INSERT INTO board VALUES(001,37,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,37,1,1);
INSERT INTO board VALUES(001,38,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,38,1,1);
INSERT INTO board VALUES(001,39,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,39,1,1);
INSERT INTO board VALUES(001,40,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,40,1,1);
INSERT INTO board VALUES(001,41,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,41,1,1);
INSERT INTO board VALUES(001,42,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,42,1,1);
INSERT INTO board VALUES(001,43,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,43,1,1);
INSERT INTO board VALUES(001,44,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,44,1,1);
INSERT INTO board VALUES(001,45,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,45,1,1);
INSERT INTO board VALUES(001,46,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,46,1,1);
INSERT INTO board VALUES(001,47,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,47,1,1);
INSERT INTO board VALUES(001,48,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,48,1,1);
INSERT INTO board VALUES(001,49,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,49,1,1);
INSERT INTO board VALUES(001,50,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,50,1,1);
INSERT INTO board VALUES(001,51,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,51,1,1);
INSERT INTO board VALUES(001,52,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,52,1,1);
INSERT INTO board VALUES(001,53,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,53,1,1);
INSERT INTO board VALUES(001,54,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,54,1,1);
INSERT INTO board VALUES(001,55,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,55,1,1);
INSERT INTO board VALUES(001,56,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,56,1,1);
INSERT INTO board VALUES(001,57,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,57,1,1);
INSERT INTO board VALUES(001,58,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,58,1,1);
INSERT INTO board VALUES(001,59,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,59,1,1);
INSERT INTO board VALUES(001,60,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,60,1,1);
INSERT INTO board VALUES(001,61,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,61,1,1);
INSERT INTO board VALUES(001,62,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,62,1,1);
INSERT INTO board VALUES(001,63,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,63,1,1);
INSERT INTO board VALUES(001,64,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,64,1,1);
INSERT INTO board VALUES(001,65,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,65,1,1);
INSERT INTO board VALUES(001,66,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,66,1,1);
INSERT INTO board VALUES(001,67,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,67,1,1);
INSERT INTO board VALUES(001,68,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,68,1,1);
INSERT INTO board VALUES(001,69,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,69,1,1);
INSERT INTO board VALUES(001,70,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,70,1,1);
INSERT INTO board VALUES(001,71,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,71,1,1);
INSERT INTO board VALUES(001,72,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,72,1,1);
INSERT INTO board VALUES(001,73,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,73,1,1);
INSERT INTO board VALUES(001,74,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,74,1,1);
INSERT INTO board VALUES(001,75,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,75,1,1);
INSERT INTO board VALUES(001,76,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,76,1,1);
INSERT INTO board VALUES(001,77,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,77,1,1);
INSERT INTO board VALUES(001,78,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,78,1,1);
INSERT INTO board VALUES(001,79,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,79,1,1);
INSERT INTO board VALUES(001,80,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,80,1,1);
INSERT INTO board VALUES(001,81,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,81,1,1);
INSERT INTO board VALUES(001,82,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,82,1,1);
INSERT INTO board VALUES(001,83,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,83,1,1);
INSERT INTO board VALUES(001,84,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,84,1,1);
INSERT INTO board VALUES(001,85,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,85,1,1);
INSERT INTO board VALUES(001,86,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,86,1,1);
INSERT INTO board VALUES(001,87,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,87,1,1);


INSERT INTO board VALUES(001,88,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,88,1,1);
INSERT INTO board VALUES(001,89,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,89,1,1);
INSERT INTO board VALUES(001,90,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,90,1,1);
INSERT INTO board VALUES(001,91,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,91,1,1);
INSERT INTO board VALUES(001,92,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,92,1,1);
INSERT INTO board VALUES(001,93,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,93,1,1);
INSERT INTO board VALUES(001,94,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,94,1,1);
INSERT INTO board VALUES(001,95,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,95,1,1);
INSERT INTO board VALUES(001,96,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,96,1,1);
INSERT INTO board VALUES(001,97,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,97,1,1);
INSERT INTO board VALUES(001,98,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,98,1,1);
INSERT INTO board VALUES(001,99,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,99,1,1);
INSERT INTO board VALUES(001,100,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,100,1,1);
INSERT INTO board VALUES(001,101,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,101,1,1);
INSERT INTO board VALUES(001,102,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,102,1,1);
INSERT INTO board VALUES(001,103,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,103,1,1);
INSERT INTO board VALUES(001,104,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,104,1,1);
INSERT INTO board VALUES(001,105,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,105,1,1);
INSERT INTO board VALUES(001,106,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,106,1,1);
INSERT INTO board VALUES(001,107,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,107,1,1);
INSERT INTO board VALUES(001,108,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,108,1,1);
INSERT INTO board VALUES(001,109,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,109,1,1);
INSERT INTO board VALUES(001,110,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,110,1,1);
INSERT INTO board VALUES(001,111,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,111,1,1);
INSERT INTO board VALUES(001,112,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,112,1,1);
INSERT INTO board VALUES(001,113,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,113,1,1);
INSERT INTO board VALUES(001,114,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,114,1,1);
INSERT INTO board VALUES(001,115,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,115,1,1);
INSERT INTO board VALUES(001,116,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,116,1,1);
INSERT INTO board VALUES(001,117,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,117,1,1);
INSERT INTO board VALUES(001,118,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,118,1,1);
INSERT INTO board VALUES(001,119,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,119,1,1);
INSERT INTO board VALUES(001,120,'iin22','더미용','냉무',null,0,TO_DATE('2021-01-03 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,120,1,1);


--커뮤니티 댓글 생성
INSERT INTO comments VALUES(001,1,1,'iin44','꿀팁감사합니다!!',TO_DATE('2021-05-29 11:00:30','YYYY-MM-DD HH24:MI:SS'),1,1,1);
INSERT INTO comments VALUES(001,1,3,'iin22','네^^',TO_DATE('2021-05-29 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,2,2);
INSERT INTO comments VALUES(001,1,5,'iin22','대댓글테스트용5',TO_DATE('2021-05-30 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,3,2);
INSERT INTO comments VALUES(001,1,7,'iin22','대댓글테스트용7',TO_DATE('2021-05-30 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,4,3);
INSERT INTO comments VALUES(001,1,6,'iin22','대댓글테스트용6',TO_DATE('2021-05-30 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,5,2);
INSERT INTO comments VALUES(001,1,2,'iin33','좋아요',TO_DATE('2021-05-29 11:01:30','YYYY-MM-DD HH24:MI:SS'),2,1,1);
INSERT INTO comments VALUES(001,1,4,'iin44','굿굿',TO_DATE('2021-05-29 11:03:30','YYYY-MM-DD HH24:MI:SS'),4,1,1);

INSERT INTO comments VALUES(001,131,1,'iin44','꿀팁감사합니다!!',TO_DATE('2021-05-29 11:00:30','YYYY-MM-DD HH24:MI:SS'),1,1,1);
INSERT INTO comments VALUES(001,131,3,'iin22','네^^',TO_DATE('2021-05-29 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,2,2);
INSERT INTO comments VALUES(001,131,5,'iin22','대댓글테스트용5',TO_DATE('2021-05-30 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,3,2);
INSERT INTO comments VALUES(001,131,7,'iin22','대댓글테스트용7',TO_DATE('2021-05-30 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,4,3);
INSERT INTO comments VALUES(001,131,6,'iin22','대댓글테스트용6',TO_DATE('2021-05-30 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,5,2);
INSERT INTO comments VALUES(001,131,2,'iin33','좋아요',TO_DATE('2021-05-29 11:01:30','YYYY-MM-DD HH24:MI:SS'),2,1,1);
INSERT INTO comments VALUES(001,131,4,'iin44','굿굿',TO_DATE('2021-05-29 11:03:30','YYYY-MM-DD HH24:MI:SS'),4,1,1);


---------
----채용공고테이블 데이터 (1차통합210604)

insert into COMMONCODE values(10,00,'지역');
insert into commoncode values(10,10,'서울');
insert into commoncode values(10,11,'대전');
insert into commoncode values(10,12,'대구');
insert into commoncode values(10,13,'부산');
insert into commoncode values(10,14,'광주');
insert into commoncode values(10,15,'경기');
insert into commoncode values(10,16,'강원');
insert into commoncode values(10,17,'충청');
insert into commoncode values(10,18,'호남');
insert into commoncode values(10,19,'영남');
insert into commoncode values(10,20,'제주');
insert into commoncode values(20,00,'업종');
insert into commoncode values(20,10,'IT');
insert into commoncode values(20,11,'금융');
insert into commoncode values(20,12,'의료');
insert into commoncode values(20,13,'서비스');
insert into commoncode values(30,00,'근무형태');
insert into commoncode values(30,10,'정규직');
insert into commoncode values(30,11,'계약직');
insert into commoncode values(30,12,'인턴');

insert into recruit values(1000,'신세계 푸드','안전관리자 정규직 채용','./image/hireLogo.png','./image/hire.png',3500,'www.shinsegaefood.com','21/05/02',0);
insert into recruit values(1001,'쿠팡','풀스택 개발자 채용','./image/copanglogo.png','./image/copanghire.png',4500,'https://rocketyourcareer.kr.coupang.com/%ec%a7%81%eb%ac%b4/-/principal-web-full-stack-engineer-coupang-play/24450/19446668','21/04/28',0);
insert into recruit values(1002,'이마트','STAFF채용','./image/emartlogo.png','./image/emarthire.png',2700,'https://rocketyourcareer.kr.coupang.com/%ec%a7%81%eb%ac%b4/-/principal-web-full-stack-engineer-coupang-play/24450/19446668','21/05/30',0);
insert into recruit values(1003,'마키나락스','백엔드 개발자 채용','./image/makinarockslogo.png','./image/markinarockshire.png',5400,'https://www.makinarocks.ai/','21/05/26',0);
insert into recruit values(1004,'현대IT','개발자 채용','./image/Hyundailogo.png','./image/Hyundaihire.png',2800,'http://www.hyundai-ite.com/index.jsp','21/03/16',0);
insert into recruit values(1005,'중앙대병원','간호사 계약직 채용','./image/caulogo.png','./image/cauhire.png',4400,'http://recruit.caumc.or.kr/index.asp','21/04/15',0);
insert into recruit values(1006,'에버랜드','의상팀 담당 채용','./image/everlandlogo.png','./image/everlandhire.png',3000,'https://www.everland.com/','21/05/05',0);
insert into recruit values(1007,'롯데월드','캐스트 채용','./image/lotteworldlogo.png','./image/lotteworldhire.png',2800,'https://adventure.lotteworld.com/','21/04/13',0);
insert into recruit values(1008,'삼성화재','자산 인프라 투자 운용 채용','./image/samsaunglogo.png','./image/samsunghire.png',6000,'http://www.samsungcareers.com/rec/apply/ComResumeServlet?cmd=pstMain#','21/05/09',0);


insert into classify values(1000,10,10);
insert into classify values(1000,20,13);
insert into classify values(1000,30,10);
insert into classify values(1001,10,10);
insert into classify values(1001,20,10);
insert into classify values(1001,30,10);
insert into classify values(1002,10,10);
insert into classify values(1002,20,13);
insert into classify values(1002,30,11);
insert into classify values(1003,10,10);
insert into classify values(1003,20,10);
insert into classify values(1003,30,10);
insert into classify values(1004,10,16);
insert into classify values(1004,20,10);
insert into classify values(1004,30,12);
insert into classify values(1005,10,18);
insert into classify values(1005,20,12);
insert into classify values(1005,30,11);
insert into classify values(1006,10,15);
insert into classify values(1006,20,13);
insert into classify values(1006,30,10);
insert into classify values(1007,10,10);
insert into classify values(1007,20,13);
insert into classify values(1007,30,10);
insert into classify values(1008,10,10);
insert into classify values(1008,20,11);
insert into classify values(1008,30,10);




----------

/*자기소개서, 이력서 시퀀스 생성*/
DROP SEQUENCE self_intro_seq;
DROP SEQUENCE resume_seq;
CREATE SEQUENCE self_intro_seq INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE resume_seq INCREMENT BY 1 START WITH 1 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;


/*커밋*/
commit;
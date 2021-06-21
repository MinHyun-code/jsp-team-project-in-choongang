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


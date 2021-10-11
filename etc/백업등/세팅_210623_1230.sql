---- 세팅 210623_1230

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
CREATE SEQUENCE self_intro_seq INCREMENT BY 1 START WITH 1001 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE resume_seq INCREMENT BY 1 START WITH 1001 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;
CREATE SEQUENCE recruit_seq INCREMENT BY 1 START WITH 2001 MINVALUE 1 MAXVALUE 9999 NOCYCLE NOCACHE NOORDER;




---------------

/*멤버*/
insert into member values('sol333','333','20210522','임다솔','인천','female','abc@gmail.com','010-1234-5678','1');
insert into member values('mh777','777','20210307','안민현','경상도','male','def@naver.com','010-2222-5555','1');

INSERT INTO MEMBER VALUES('min33','1234','222222','김민준','seoul','male','abc100@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('seojun','1234','222223','이서준','seoul','male','abc101@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('yeye','1234','222224','박예준','seoul','male','abc102@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('dodo77','1234','222225','최도윤','seoul','male','abc103@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('sioo','1234','222226','정시우','seoul','male','abc104@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('joo99','1234','222227','김주원','seoul','male','abc105@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('hajoon','1234','222228','이하준','seoul','male','abc106@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('jiho','1234','222229','박지호','seoul','male','abc107@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('hoo999','1234','222230','최지후','seoul','male','abc108@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('junjun','1234','222231','정준서','seoul','male','abc109@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin110','1234','222232','김샛별','seoul','female','def110@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin111','1234','222233','이현우','seoul','male','def111@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin112','1234','222234','박도현','seoul','male','def112@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin113','1234','222235','최지훈','seoul','male','def113@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin114','1234','222236','정건우','seoul','male','def114@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin115','1234','222237','김우진','seoul','male','def115@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin116','1234','222238','이선우','seoul','male','def116@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin117','1234','222239','박서진','seoul','male','def117@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin118','1234','222240','최민재','seoul','male','def118@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin119','1234','222241','정현준','seoul','male','def119@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin120','1234','222242','김연우','seoul','male','god120@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin121','1234','222243','이유준','seoul','male','god121@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin122','1234','222244','박정우','seoul','male','god122@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin123','1234','222245','최승우','seoul','male','god123@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin124','1234','222246','정승현','seoul','male','god124@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin125','1234','222247','김시윤','seoul','male','god125@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin126','1234','222248','이준혁','seoul','male','god126@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin127','1234','222249','박은우','seoul','male','god127@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin128','1234','222250','최지환','seoul','male','god128@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin129','1234','222251','정승민','seoul','male','god129@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin130','1234','222252','김지우','seoul','male','bts130@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin131','1234','222253','이유찬','seoul','male','bts131@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin132','1234','222254','박윤우','seoul','male','bts132@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin133','1234','222255','최민성','seoul','male','bts133@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin134','1234','222256','정준영','seoul','male','bts134@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin135','1234','222257','김시후','seoul','male','bts135@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin136','1234','222258','이진우','seoul','male','bts136@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin137','1234','222259','박지원','seoul','male','bts137@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin138','1234','222260','최수현','seoul','male','bts138@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin139','1234','222261','정재윤','seoul','male','bts139@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin140','1234','222262','김시현','seoul','male','sbss140@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin141','1234','222263','이동현','seoul','male','sbss141@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin142','1234','222264','박수호','seoul','male','sbss142@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin143','1234','222265','최태윤','seoul','male','sbss143@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin144','1234','222266','정민규','seoul','male','sbss144@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin145','1234','222267','김재원','seoul','male','sbss145@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin146','1234','222268','이한결','seoul','male','sbss146@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin147','1234','222269','박민우','seoul','male','sbss147@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin148','1234','222270','최재민','seoul','male','sbss148@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin149','1234','222271','정은찬','seoul','male','sbss149@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin150','1234','222272','김윤호','seoul','female','yh150@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin151','1234','222273','이시원','seoul','female','sw151@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin152','1234','222274','박이준','seoul','female','yj152@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin153','1234','222275','최민찬','seoul','female','mc153@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin154','1234','222276','정지안','seoul','female','ja154@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin155','1234','222277','김시온','seoul','female','so155@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin156','1234','222278','이성민','seoul','female','sm156@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin157','1234','222279','박준호','seoul','female','jh157@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin158','1234','222280','최승준','seoul','female','sj158@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin159','1234','222281','정성현','seoul','female','sh159@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin160','1234','222282','김이안','seoul','female','ya160@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin161','1234','222283','이현서','seoul','female','hs161@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin162','1234','222284','박재현','seoul','female','sh162@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin163','1234','222285','최하율','seoul','female','hy163@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin164','1234','222286','정지한','seoul','female','jh164@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin165','1234','222287','김우빈','seoul','female','wb165@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin166','1234','222288','이태민','seoul','female','tm166@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin167','1234','222289','박지성','seoul','female','iin167@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin168','1234','222290','최예성','seoul','female','ii168@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin169','1234','222291','정민호','seoul','female','wb169@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin170','1234','222292','김태현','seoul','female','wb170@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin171','1234','222293','이지율','seoul','female','wb171@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin172','1234','222294','박민혁','seoul','female','wb172@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin173','1234','222295','최서우','seoul','female','wb173@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin174','1234','222296','정성준','seoul','female','wb174@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin175','1234','222297','김은호','seoul','female','tm175@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin176','1234','222298','이규민','seoul','female','tm176@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin177','1234','222299','박정민','seoul','female','tm177@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin178','1234','222300','최준','seoul','female','tm178@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin179','1234','222301','정지민','seoul','female','tm179@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin180','1234','222302','김윤성','seoul','female','hy180@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin181','1234','222303','이율','seoul','female','hy181@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin182','1234','222304','박윤재','seoul','female','hy182@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin183','1234','222305','최하람','seoul','female','hy183@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin184','1234','222306','정하진','seoul','female','hy184@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin185','1234','222307','김민석','seoul','female','hy185@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin186','1234','222308','이준수','seoul','female','hy186@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin187','1234','222309','박은성','seoul','female','hy187@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin188','1234','222310','최태양','seoul','female','hy188@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin189','1234','222311','정예찬','seoul','female','hs189@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin190','1234','222312','김준희','seoul','female','hs190@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin191','1234','222313','이도훈','seoul','female','hs191@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin192','1234','222314','박하민','seoul','female','hs192@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin193','1234','222315','최준성','seoul','female','hs193@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin194','1234','222316','정건','seoul','female','jh194@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin195','1234','222317','김지완','seoul','female','jh195@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin196','1234','222318','이현수','seoul','female','jh196@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin197','1234','222319','박승원','seoul','female','jh197@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin198','1234','222320','최강민','seoul','female','jh198@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('iin199','1234','222321','정정현','seoul','female','jh199@naver.com','01011112222','1');



------------------

/*이력서 기능 내 검색 관련 데이터*/
insert into edu values (1, '경성고등학교', '문과');
insert into edu values (2, '선유고등학교', '문과');
insert into edu values (3, '상암고등학교', '이과');
insert into edu values (4, '충암고등학교', '이과');
insert into edu values (5, '서울여자고등학교', '이과');
insert into edu values (6, '강서고등학교', '이과');
insert into edu values (7, '영일고등학교', '이과');
insert into edu values (8, '홍익대학교', '컴퓨터공학전공');
insert into edu values (9, '홍익대학교', '신소재공학전공');
insert into edu values (10, '홍익대학교', '영어영문학과');
insert into edu values (11, '홍익대학교', '불어불문학과');
insert into edu values (12, '서울대학교', '영어영문학과');
insert into edu values (13, '서울대학교', '불어불문학과');
insert into edu values (14, '서울대학교', '컴퓨터공학전공');
insert into edu values (15, '서울대학교', '신소재공학전공');
insert into edu values (16, '연세대학교', '컴퓨터공학전공');
insert into edu values (17, '연세대학교', '신소재공학전공');
insert into edu values (18, '연세대학교', '불어불문학과');
insert into edu values (19, '연세대학교', '영어영문학과');
insert into edu values (20, '고려대학교', '영어영문학과');
insert into edu values (21, '고려대학교', '불어불문학과');
insert into edu values (22, '고려대학교', '신소재공학전공');
insert into edu values (23, '고려대학교', '컴퓨터공학전공');
insert into edu values (24, '고려대학교', '지구환경과학과');

insert into licence VALUES ( 1, '텔레마케팅관리사', '한국산업인력공단');
insert into licence VALUES ( 2, '전기기사', '한국산업인력공단');
insert into licence VALUES ( 3, '정보처리기사', '한국산업인력공단');
insert into licence VALUES ( 4, '컴퓨터활용능력1급', '대한상공회의소');
insert into licence VALUES ( 5, '컴퓨터활용능력2급', '대한상공회의소');
insert into licence VALUES ( 6, '한국사능력검정1급', '국사편찬위원회');
insert into licence VALUES ( 7, '한국사능력검정2급', '국사편찬위원회');
insert into licence VALUES ( 8, '한국사능력검정3급', '국사편찬위원회');
insert into licence VALUES ( 9, '네트워크관리사', '한국정보통신자격협회');
insert into licence VALUES ( 10, '공인중개사', '한국산업인력공단');
insert into licence VALUES ( 11, '전자캐드기능사', '한국산업인력공단');
insert into licence VALUES ( 12, '공인노무사', '고용노동부');
insert into licence VALUES ( 13, '산업보건지도사', '고용노동부');
insert into licence VALUES ( 14, '사회복지사 1급', '보건복지부');
insert into licence VALUES ( 15, '보건교사', '교육부');
insert into licence VALUES ( 16, '사서교사', '교육부');
insert into licence VALUES ( 17, '정교사', '교육부');
insert into licence VALUES ( 18, '변호사', '법무부');
insert into licence VALUES ( 19, '공인회계사', '금융위원회');
insert into licence VALUES ( 20, '보험계리사', '금융위원회');
insert into licence VALUES ( 21, '보험중개사', '금융위원회');

-----------------


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
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('마키나락스','1234','20171221','윤성호/이재혁','서울 서초구 서초대로77길 17, 12층','솔루션·SI·CRM·ERP','32명','9억 2,250만원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('현대IT','1234','20131121','장제만','서울 강동구 상일로10길 36 5층 현대아이티','전기·전자·제어','60명 ','233억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('중앙대병원','1234','19770204','이한준','서울 동작구 흑석로102','종합 병원','573명','2,341억 6,908만원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('에버랜드','1234','19760403','정금용','경기 용인시 처인구 에버랜드로 199 에버랜드','서비스업','2,472명','3,725억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('롯데월드','1234','19870301','최홍훈','서울 송파구 잠실동 40-1 호텔롯데 롯데월드','서비스업','2,400명','4,000억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('삼성화재','1234','19520126','최영무','서울 중구 을지로1가 87 삼성화재빌딩 16층','증권·보험·카드','5,607명','23조 6천억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('버거킹','1234','20121121','문영주','서울 종로구 삼봉로 71 G타워 2F','음식료·외식·프랜차이즈','900명','2,730억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('하나은행','1234','19670130','함영주','서울 서초구 남부순환로 2351 2층 KEB하나은행 방배남출장소','은행·금융','13,000명','6조 3천억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('한화솔루션','1234','19740427','이구영/김희철/류두형/김동관/김은수','서울 중구 청계천로 86 한화케미칼','화학·에너지·환경','5,533명','5조 7,173억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('트리플제이','1234','20201218','주성돈','서울 영등포구 여의나루로 67 1205호-이에스19호','컨설팅·연구·조사','30명','8억 3,530만원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('루이비통','1234','19910918','안토니마이클패트릭르드루','서울 강남구 삼성로 511 골든타워','백화점·유통·도소매','809명','1조 467억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('농협','1234','20070417','박태선','서울 영등포구 여의도동 45-3 NH농협캐피탈빌딩','캐피탈·대출','372명','4,148억 9천만원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('여기어때','1234','20150921','최문석','서울 강남구 봉은사로 479 479타워 11층','포털·컨텐츠·커뮤니티','410명','1,000억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('유니드','1234','19800510','이화영/정의승','서울 중구 을지로5길 19 17층 유니드','화학·에너지·환경','450명','8,140억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('리치몬트','1234','19970401','이진원','서울 중구 퇴계로 100 스테이트타워 남산','백화점·유통·도소매','980명','1조 382억원','0');
Insert into MEMBER (M_ID,M_PASS,M_BIRTH,M_NAME,M_ADDR,M_GENDER,M_EMAIL,M_PHONE,M_TF) values ('이안한방병원','1234','20010408','김동호','경기 오산시 대원로 23 이안한방병원','의료','43명','15억 1,150만원','0');
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

저는 ‘취준’하는 후배들에게 추천할 만큼 HR의 전망은 좋다고 봅니다. 모든 조직에서 필요로 하는 역할이기도 하며, 무엇보다 조직의 본질이 곧 ‘사람’이라는 점 때문입니다. 사람을 존중하고, 또 사랑할 수 있는 사람이라면 HR직무를 맡는데 어려움이 없을 것입니다.',0,45,to_date('21/06/13','RR/MM/DD'),'#인사·교육·노무 #(주)제뉴원사이언스',0,'community/fileSave/genuone.jpg',145,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,147,'iin22','[답변]','힘내세요...',0,0,to_date('21/06/20','RR/MM/DD'),null,0,null,146,2,2);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,146,'iin22','이직 관련 질문드립니다.','1년 안됐는데 이직할지 고민이에요.',0,14,to_date('21/06/20','RR/MM/DD'),'#이직#질문#신입',0,'community/fileSave/default_qna.png',146,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,148,'iin22','[답변]','화이팅',0,0,to_date('21/06/20','RR/MM/DD'),null,0,null,146,3,2);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,131,'iin33','<기업별 연봉 인기순위 TOP 10>','기업별 연봉 인기순위 TOP 10',null,1,to_date('21/08/04','RR/MM/DD'),'#언택트#취준',0,'community/fileSave/default_info.png',131,1,1);
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
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,135,'iin22','질문드려요 정말 고민이에요 답변해주세요','안녕하세요.

회사 2곳에 합격했는데 회사 선택 하는 데 중요한 고려 사항으로 뭐가 있을까요??',0,17,to_date('21/06/19','RR/MM/DD'),'#질문#답변부탁#고민',0,'community/fileSave/default_qna.png',135,1,1);
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
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,149,'iin22','취준생의 고민','마음이 많이 불안한 것 같애요. 밖에 나가기가 두렵고....괜히 가족들 보면 눈치 보고, 친구 연락 피하게 되고
친척 어른들 전화오면 내 얘기 물어볼까봐 전화 오는 게 반갑지 않고...
취업준비 기간이 길어지니 가끔씩 공고를 보면 ''나에게 이건 적성에 맞을까?'' 하면서 지원도 머뭇 거리고......
''나이가 많은데 나를 뽑아주긴 할까?'' 하는 생각이 들어 가끔씩 우울해지는 것 같아요.',0,1003,to_date('21/06/22','RR/MM/DD'),'#취업준비 #진로',0,'community/fileSave/default_qna.png',149,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,150,'iin33','[답변]','현재 많은 취준생들이 코로나로 인해 상황적인 요인으로 취업문이 좁아져 준비하고 있는 기간이 길어지고 있습니다. 불확실성에서 취업을 준비하는 것 자체가 많은 스트레스를 받게 하는데, 다른 사람들을 보며 속도를 비교하면 불안감과 압박감도 더 심해지기 마련입니다. 취업 기간이 길어진다고 해도 글쓴이님이 취업을 위해 지금까지 노력해온 것과 글쓴이님의 존재의 가치는 사라지는 것이 아니에요. 조금 더 글쓴이님이 가지고 계신 자원을 믿어주셨으면 좋겠어요. 지금까지 잘해오셨습니다.',0,0,to_date('21/06/22','RR/MM/DD'),null,0,null,149,2,2);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,151,'iin22','기업 44%, 하반기 인턴사원 뽑는다','기업 10곳 중 4곳 이상은 올 하반기 인턴을 채용할 계획이 있는 것으로 나타났다.

구인구직 매칭 플랫폼 사람인(www.saramin.co.kr, 대표 김용환)이 기업 416개사를 대상으로 ‘하반기 인턴 채용 계획’을 조사한 결과, 44%가 ‘인턴을 채용한다’고 밝혔다. 지난해 하반기에 인턴을 채용한 곳은 전체 기업의 32.9%인데 비해, 올해는 11.1%p 증가한 셈이다.

이들 기업들이 올 하반기에 인턴을 채용하려는 이유는 단연 ‘부족한 인력을 보충하기 위해서’(77%, 복수응답)가 1위였다. 다음으로 ‘업무 지원 인력이 필요해서’(32.8%), ‘사업 확장 등의 계획이 있어서’(14.8%), ‘사전 검증 후 채용하기 위해서’(13.1%), ‘정부 지원을 받을 수 있어서’(13.1%), ‘우수 인재를 선점할 수 있어서’(8.7%) 등의 순이었다.

하반기에 인턴으로 채용 예정인 인원은 평균 3명이었다. 채용 인원 역시 지난해에 비해 ‘늘었다’는 응답(43.7%)이 ‘줄었다’(4.9%)는 답변의 9배 가량 됐다.

하반기 인턴을 채용할 시기는 ‘6월’(36.6%)에 집중돼 있었다. 이어 ‘7월’(23.5%), ‘9월’(15.8%), ‘8월’(12%), ‘10월’(7.1%) 등의 순이었다.

하반기 채용하는 인턴 형태는 ‘정규직 전환형만 채용’(65.6%), ‘정규직 전환형과 기간제 체험형 모두 채용’(24%), ‘기간제 체험형만 채용’(10.4%)의 순으로, 정규직 전환형을 채용하는 기업이 89.6%에 달했다. 이 때, 정규직 전환형 인턴을 채용하는 기업들(164개사)이 계획 중인 정규직 전환 비율은 평균 35%로 집계됐다.

기간제 체험형을 뽑는 기업(63개사)들도 인턴 수료자들에 대해 추후 입사 지원 시 특전을 제공한다고 답했다. 구체적으로는 ‘서류 전형 면제’(47.6%, 복수응답), ‘1차 면접 전형 면제’(46%), ‘가산점 부여’(38.1%), ‘인적성 전형 면제’(19%) 등이 있었다.

하반기 인턴을 채용할 직무는 주로 ‘영업/영업관리’(19.7%, 복수응답), ‘제조/생산’(15.3%), ‘IT/정보통신’(15.3%), ‘연구개발’(14.8%), ‘서비스’(11.5%), ‘기획/전략’(10.4%) 등이었다.

인턴들의 근무 기간은 평균 4.8개월로 집계됐으며, 인턴 기간 중 지급하는 급여는 평균 월 210만원(세전)이었다.

그렇다면, 하반기 인턴 채용 평가 시에는 어떤 점을 중요하게 평가할까.
먼저, 서류 전형에서 가장 중요하게 보는 것으로는 단연 ‘관련 직무 경험’(58.5%)이 압도적으로 많았다. 이밖에 ‘전공’(18%), ‘자격증’(7.7%), ‘대외활동 경험’(3.8%), ‘학력’(3.3%) 등이 있었다.

면접에서는 ‘직무 적합성’(33.3%), ‘성실성’(23.5%), ‘실무 경험’(14.2%), ‘열정과 도전정신’(11.5%), ‘조직 융화력’(7.7%), 등을 중요하게 평가한다고 답했다.

정규직 전환 시에는 무엇을 볼까.


가장 중요한 평가 기준으로는 ‘업무 역량’(29%)을 첫 번째로 꼽았다. 계속해서 ‘태도 및 성실성’(20.2%), ‘성장 가능성과 잠재력’(16.9%), ‘직무 적합성’(12%), ‘업무 습득 속도’(12%) 등의 순이었다.

사람인의 임민욱 팀장은 “사상 초유의 팬데믹 사태가 이어지고 있으나, 백신 접종과 수출 호조 등 경기 회복에 대한 기대감으로 지난해보다 인턴을 뽑으려는 기업이 다소 늘어난 것으로 보인다”며, “특히, 정규직 전환을 전제로 인턴을 채용하는 경우도 많아 지금부터 인턴 공고를 적극 찾아보고 지원하는 것이 하반기 취업 성공을 이끄는 지름길이 될 것”이라고 말했다.',0,386,to_date('21/06/22','RR/MM/DD'),'#뉴스 #인턴 #하반기 #취준',0,'community/fileSave/intern.png',151,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,152,'iin22','IT 비전공 구직자 36%, IT 개발 직무 취업 하고파','디지털 전환과 언택트로 IT 개발자들에 대한 구인 수요가 빠르게 늘어나고, 처우도 좋아지는 등 변화가 불어 닥치면서 컴퓨터공학 등 IT 분야를 전공하지 않은 구직자들도 IT 개발 직무로 취업을 원하는 것으로 나타났다.

구인구직 매칭 플랫폼 사람인(www.saramin.co.kr, 대표 김용환)이 IT 이외 전공의 구직자 1,131명을 대상으로 ‘IT 개발 직무 취업 희망’ 여부를 조사한 결과, 36.3%가 ‘IT 개발 직무로 취업하고 싶다’고 밝혔다.

전공 분야를 벗어나 개발 직무로 취업하고 싶은 이유는 ‘앞으로 계속 유망한 직무여서’(71.8%, 복수응답)라는 응답이 가장 많았다. 다음으로 ‘수요가 많아 취업이 잘 될 것 같아서’(39.7%), ‘타 직무보다 연봉이 높아서’(24.8%), ‘IT 업종 회사에서 중심이 되는 일을 하고 싶어서’(16.1%), ‘나의 특기, 적성에 맞는 것 같아서’(11.4%) 등의 순이었다.

구체적으로 취업하고 싶은 개발 직무는 ‘앱(응용프로그램) 개발’(23.8%, 복수응답)이 1위였으며, 근소한 차이로 ‘웹 개발’(22.9%)이 뒤를 이었다. 계속해서 ‘데이터베이스·DBA’(18%), ‘네트워크·보안’(17.8%), ‘게임 개발’(13.4%), ‘시스템개발’(12.4%), ‘데이터 사이언스’(10.5%), ‘퍼블리싱·UI 개발’(10.5%) 등이 있었으며, ‘무엇이든 상관없다’는 응답도 22.4%였다.

그렇다면, 실제로 IT 개발 직무 취업을 준비하는 이들은 얼마나 될까.

개발 직무 취업을 원하는 구직자(411명)의 절반(45.5%)가량은 현재 개발 직무 취업을 위해 노력하고 있다고 밝혔다.

구체적으로는 ‘코딩 등 관련 학원 수강’(45.5%, 복수응답), ‘코딩 등 관련 인강, 서적 등으로 독학’(34.8%), ‘정부의 관련 지원책 활용’(34.2%), ‘주변 지인들로부터 조언, 도움 구함’(23%), ‘IT·컴퓨터 계열로 전공 변경(전과) 준비’(13.4%) 등의 준비를 하고 있었다.

개발 직무 취업을 위해 들이는 비용은 월 평균 38만원으로 집계됐다. 자세히 살펴보면, ‘10만원 미만’(21.4%), ‘20~30만원 미만’(16.6%), ‘30~40만원 미만’(14.4%), ‘10~20만원 미만’(12.3%), ‘40~50만원 미만’(10.7%), ‘90~100만원 미만’(8.6%) 등의 순이었다.

그렇다면, 구직자들의 전공에 대한 만족도는 어떨까.


전체 응답자의 10명 중 7명(71.7%)이 과거로 돌아간다면 전공을 바꾸고 싶다고 밝혔다.

바꾸고 싶은 전공은 단연 ‘IT·컴퓨터 계열’(47.9%)이 1위였다. 계속해서 ‘의료계열’(13.2%), ‘사회·경상계열’(8.9%), ‘예체능계열’(8.9%), ‘공학계열(IT·컴퓨터 제외)’(7.6%) 등의 순이었다.',0,343,to_date('21/06/22','RR/MM/DD'),'#IT#비전공#개발#컴퓨터#데이터사이언스#뉴스',0,'community/fileSave/itnonmajor.png',152,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,153,'iin22','“기업 80%, 면접 시 갑질 논란 걱정… ‘자기 검열’ 노력”','면접 진행 시 면접관의 잘못된 발언과 태도가 온라인 상에서 논란이 돼 기업 브랜드 이미지에 부정적인 영향을 주는 경우가 종종 있다. 실제로 기업 인사담당자들은 면접 시 갑질이나 차별 발언 등 논란에 대한 우려를 가지고 있으며, 최근 들어 면접 시 자기 검열을 강화하고 있는 것으로 나타났다.

구인구직 매칭플랫폼 사람인(www.saramin.co.kr 대표 김용환)이 기업 261개사를 대상으로 ‘면접 갑질 논란 우려’에 대해 조사한 결과, 무려 80.1%가 논란에 대해 우려하고 있다고 답했다.

커뮤니티나 SNS 등을 통해 면접 관련 논란이 크게 퍼지는 경우가 늘면서 부담을 가지는 것으로 풀이된다. 이러한 부담감으로 인해 면접관들은 면접 시 자기검열을 ‘강화하고 있다’(69.9%)고 답했다.

자기검열을 강화하는 이유로는 ‘회사 이미지 관리를 위해’(62.3%, 복수응답)라는 답변이 단연 많았다. 이어 ‘좋은 인재를 뽑기 위해서’(56.8%), ‘면접 갑질이 사회적인 이슈가 되어서’(39.7%), ‘문제 발생 시 불이익을 받을 수 있어서’(15.8%), ‘회사의 내부 방침이어서’(8.2%), ‘지원자로부터 안 좋은 피드백을 받은 적이 있어서’(6.2%) 등의 의견이 있었다.

조심하는 질문 유형으로는 ‘성차별 소지가 있는 질문’(79.5%, 복수응답)이 1위를 차지했다. 다음으로 ‘애인 유무 등 개인사 관련 질문’(61.6%), ‘부모, 집안 등 배경 관련 질문’(56.2%), ‘신체 조건, 외모 관련 질문’(52.1%), ‘출신학교 등 학력, 학벌 관련 질문’(48.6%), ‘정치 성향 질문’(42.5%), ‘종교 관련 질문’(36.3%), ‘나이 관련 질문’(28.1%) 등의 순이었다.

태도 측면에서 하고 있는 노력으로는 ‘지원자 자소서 숙지 등 사전 준비’(53.4%, 복수응답)를 첫 번째로 꼽았다. 면접 시 서류를 전혀 검토하지 않고 오는 등 면접관의 성의 없고 미흡한 준비가 논란이 되는 경우가 많기 때문인 것으로 보인다.
이외에도 ‘바른 자세로 착석 등 전반적 태도’(46.6%), ‘입·퇴장 시 인사 등 기본 매너’(43.2%), ‘지원자에 대한 반말 자제’(47.9%), ‘면접 시간에 지각하지 않도록 함’(39%), ‘말을 끊지 않는 등 경청 노력’(47.3%), ‘지원자 질문에 대한 성심 어린 답변’(39%)을 하는 등의 노력을 하고 있었다.

면접관 개인의 자기검열은 강화되는 추세지만, 기업 차원의 노력은 아직 부족한 것으로 나타났다.

면접관 교육이나 면접 관련 매뉴얼을 제공하는 기업은 10곳 중 3곳(29.9%)에 그쳤다. 특히, 기업규모별 편차가 컸다. 대기업 62.5%가 면접관 교육을 받거나 매뉴얼이 있다고 응답한 반면, ‘중소기업’은 23.1%에 그쳐 약 3배 가량 차이를 보였다. ',0,26,to_date('21/06/22','RR/MM/DD'),'#면접#인사담당자#기업#뉴스',0,'community/fileSave/interview.png',153,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,154,'iin22','맞춤형 상담으로 취뽀하자! 청년도전 지원사업',' 코로나 19로 취업이 어려워지면서 구직활동을 포기하는, 이른바 ''니트(Not in Education, Employment or Training)''족 청년들이 증가하고 있습니다. 현대경제연구원에 따르면 지난해 국내 니트족은 2019년보다 약 24.2% 증가했다고 하는데요. 오늘은 이런 청년들에게 도움이 될 <청년도전 지원사업>을 소개해드립니다! 


청년도전 지원사업은 6개월간 취업 이력이나 직업훈련 참여 이력이 없는 ‘구직단념 청년’들이 다시 취업 의지를 가질 수 있도록 지원하는 프로그램입니다.  

본 프로그램은 20개 내외의 지역별 지자체 청년센터를 통해 만나볼 수 있습니다. 바로 오늘인 4월 1일부터 사업에 참여할 지역 청년센터를 모집하는데요. 선정 후 5월부터는 청년센터를 중심으로 고용센터, 대학일자리센터, 자치단체(사회복지), 청소년 지원센터 등과 협업을 통해 지역의 구직단념청년을 직접 발굴·모집하고 프로그램 참여를 지원합니다. 높은 접근성으로 많은 청년이 손쉽게 활용할 수 있을 것으로 예상됩니다!


특히 본 사업은 구직단념 청년을 선제적으로 발굴하고 청년들의 노동시장 진입을 지원하기 위해 1:1 밀착상담, 사례관리, 자신감 회복, 대인관계 능력 향상 등 심리상담과 진로탐색, 자기소개서·이력서 컨설팅, 진로·직업상담, 1:1 멘토링, 등 취업역량 강화 과정을 2~3개월간의 모듈형 프로그램으로 운영합니다.

이 기회를 잘 잡는다면 청년들의 취업 의욕을 끌어 올리고 취뽀할 수 있겠죠?

올해 청년도전 지원사업은 전국 238개소 지자체 청년센터 중, 20개 내외의 지자체 청년센터를 4월중으로 선정하고, 5월부터는 본격적으로 참가할 청년들을 모집할 예정인데요. 이번엔 총 5천 명의 청년들을 대상으로 지원하니, 추후에 선정된 지자체 청년센터, 참여방법 등 더 자세한 소식이 나오는 대로 청정이가 바로 알려드리겠습니다! ',0,17,to_date('21/06/22','RR/MM/DD'),'#청년#지원#복지',0,'community/fileSave/youthsupport.png',154,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,156,'sol333','합격 통보 후 확인사항','전화로 합격 통보를 받게 된다면, 연봉 말고 또 확인해야 할 사항들에는 어떤 것들이 있나요?

연봉에 대한 얘기를 할 때 퇴직금은 별도인 건지도 여쭈어봐야 하는 건가요?',0,3,to_date('21/06/22','RR/MM/DD'),'#합격',0,'community/fileSave/default_qna.png',156,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (1,155,'iin22','데브툴즈 - 사회에 변화를 만들어내는 서비스 기획!','Q1
담당하고 계신 업무를 소개해 주세요.

웹/앱 서비스 기획을 담당하고 있습니다. 앱 개발에 앞서 관련조사, 사업계획, 기능 및 화면 정의, UI 설계를 진행합니다. 이에 따라 기능명세, 스토리보드, 플로우차트 등을 작성하며, 개선을 위해 산출물을 바탕으로 개발자들과 커뮤니케이션 합니다. 앱 출시 이후, 서비스 개선까지 담당하고 있습니다.




Q2
담당 직무를 선택하게 된 특별한 계기나 이유가 있나요?

제가 기획한 서비스가 사회에 변화를 만들 수 있다는 것이 가장 큰 이유입니다. 변화가 없는 것은 존재 이유가 없다는 것이 제 철학이며, 새로운 것을 만들어 세상을 변화시키는 일 이야말로 제가 살아있는 이유를 증명해줍니다.




Q3
회사에서 커리어를 위해 어떤 부분에서 도움을 주나요?

업무 관련 강의 수강료, 도서 구입비를 지원합니다. 또한, 주기적으로 교육을 진행합니다. 커리어에 가장 도움이 되었던 부분이 사내에서 진행하는 교육입니다. 많은 강의를 들어봤지만, 데브툴즈 사내교육만큼 직접적으로 도움이 되었던 적이 없습니다.




Q4
직무 전문성을 위해 노력하시는 부분이 있나요?

매일 아침 신문을 읽고 출근합니다. 기획자는 논리적으로 사고해야 하며 트렌드에 민감해야 합니다. 그러한 자질을 기르기 위해서 신문구독이 가성비가 좋다고 생각합니다. 여가시간에는 마케팅 기획, 사업 기획, UI 디자인 등 업무 관련 학습을 하고 있습니다.




Q5
“이 업무를 할 때에는 OOO가 가장 필요하다!”

''글쓰기''가 0순위입니다. 자신의 생각을 명확하게 글로 정리할 수 있어야 사용자를 이해할 수 있고, 개발자를 이해시킬 수 있기 때문입니다.




Q6
업무 하실 때 어떤 프로그램을 사용하시나요?

기획 문서 작성을 위해 Excel과 Powerpoint를 가장 많이 사용합니다. UI설계 시 Adobe XD와 Marvel을 사용하며, 협업툴로 Zeplin이 있습니다.',0,64,to_date('21/06/22','RR/MM/DD'),'#인터뷰#데트툴즈#서비스기획자',0,'community/fileSave/devtools.png',155,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,157,'sol333','26살 승무원 준비','중학교때 부터 승무원이 꿈이었던 26살 여자 입니다.
현재 중국어학과 전공했구 토익, 토익스피킹, 중국어 자격증 갱신 중입니다..
하반기 때 쯤에 국제선 풀리면 휴직 승무원들 복귀시키고, 내년 상반기에는 신입을 뽑지 않을까 하는 희망에 준비중이며,
공항 업무가 도움이 될까 싶어서 여기저기 5년차 경력을 쌓았고 최근에 공항에서 일하고 있는데,
캐빈과 다른 업무이기에 관두고 다른 경력을 쌓아볼까 합니다..
26살 승무원이나 취준생은 많이 늦은걸까요...
승무원만 바라보고 왔는데, 제2의 어떤걸 해야할지 몰라서 막막하네요ㅠㅠ',0,0,to_date('21/06/22','RR/MM/DD'),'#승무원#취직#공부',0,'community/fileSave/default_qna.png',157,1,1);
Insert into BOARD (BD_CODE,BD_NUM,M_ID,SUBJECT,CONTENT,CATEGORY,READ_COUNT,REG_DATE,TAGS,IS_ADOPTED,FILE_NAME,REF,RE_STEP,RE_LEVEL) values (2,158,'mh777','퇴직금 관련 질문드립니다.','1.퇴직금은 한 화사에서 1년을 채우면 받을 수 있는 건가요? 햇수로 1년을 말하는건지 근무일 수로 세는건가요?

2.처음 회사 들어올때 월급에 퇴직금 포함이라고 들었는데 회사 사정이 어려워져 몇달전부터 주2일 출근하고있습니다. 이런 경우에는 어떻게 되는건가요?',0,1,to_date('21/06/22','RR/MM/DD'),'#퇴직금#퇴직',0,'community/fileSave/default_qna.png',158,1,1);
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
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (2,149,1,'iin44','힘내세요!!',to_date('21/06/22','RR/MM/DD'),1,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,151,3,'sol333','하반기에 취준했으면 좋겠어요.',to_date('21/06/22','RR/MM/DD'),3,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,151,1,'iin33','좋은 정보 감사드립니다.',to_date('21/06/22','RR/MM/DD'),1,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,151,2,'mh777','오',to_date('21/06/22','RR/MM/DD'),2,1,1);
Insert into COMMENTS (BD_CODE,BD_NUM,BD_CM_NUM,M_ID,CONTENT,REG_DATE,REF,RE_STEP,RE_LEVEL) values (1,151,4,'iin22','넵^^',to_date('21/06/22','RR/MM/DD'),1,2,2);



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
insert into classify values(1009,10,14);
insert into classify values(1009,20,13);
insert into classify values(1009,30,10);
insert into classify values(1010,10,15);
insert into classify values(1010,20,11);
insert into classify values(1010,30,12);
insert into classify values(1011,10,16);
insert into classify values(1011,20,13);
insert into classify values(1011,30,10);
insert into classify values(1012,10,15);
insert into classify values(1012,20,13);
insert into classify values(1012,30,10);
insert into classify values(1013,10,13);
insert into classify values(1013,20,13);
insert into classify values(1013,30,10);
insert into classify values(1014,10,18);
insert into classify values(1014,20,11);
insert into classify values(1014,30,12);
insert into classify values(1015,10,13);
insert into classify values(1015,20,13);
insert into classify values(1015,30,10);
insert into classify values(1016,10,13);
insert into classify values(1016,20,13);
insert into classify values(1016,30,10);
insert into classify values(1017,10,10);
insert into classify values(1017,20,13);
insert into classify values(1017,30,10);
insert into classify values(1018,10,19);
insert into classify values(1018,20,12);
insert into classify values(1018,30,10);
insert into classify values(1019,10,20);
insert into classify values(1019,20,10);
insert into classify values(1019,30,10);

REM INSERTING into SELF_INTRO
SET DEFINE OFF;
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (1,'sol333','성장과정','자라온 환경이 사람의 성품을 결정짓는 데 있어서 많은 영향을 미친다고 생각합니다. 성장하는 데 있어서 부족함 없이 3남매의 2째 딸로 부모님의 극진한 사랑을 받으며 자라왔습니다. 삼형제가 의견이 맞지 않을 때 도 있었지만, ‘거울은 먼저 웃지 않는다'''' 라는 가훈을 바탕으로  서로 조금씩 양보하며 웃음을 보이는 삶을 살기위해 노력했습니다. 오빠 동생과 다투기보다는 어떠한 문제가 있을시 서로 타협하고 양보하며, 돈독한 남매의 관계를 유지해 왔습니다. 그 점에서 싸워야만 문제해결이 되는 것이 아니라  먼저 손을 내밀고 충분한 대화를 통해 좋은 결과가 나올 수 있다는 것을 알았습니다. 지금도 대인관계에서 어떠한 문제가 생길 시 무작정 화부터 내는 것이 아니라, 대화로 모든 문제를 해결하려 노력합니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (2,'sol333','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (3,'sol333','성격의장단점','먹구름이 껴도 그 주변은 밝게 빛난다 ’ 라는 말이 있습니다. 이는 어려운 일이 닥쳐도 희망을 잃지 말라는 뜻입니다. 지난봄 처음으로 혼자 반을 맡을 때였습니다. 학기 초 , 혼자 맡는 첫 반에 학부모님들이 아이들을 맡기시는데 많은 걱정을 하는 모습을 보였습니다. 학부모님들에게 저에 대한 믿음을 드리는 방법에 대해 잘 몰랐고 , 학기 초에는 많은 걱정을 했습니다. 하지만 아이들에게 진심을 다해 다가갔고 , 더 즐거운 반을 만들기 위해 아이들의 학습을 위해  고민하고 노력 했습니다. 그 결과 아이들이 등원하는데 즐거움을 느꼈고 , 한글을 어려워했던 아이들이 한글자한글자 읽기 시작하면서 학부모님들이 저에 대한 신뢰가 쌓여갔습니다. 노력을 통해 어렵기만 했던 일이 재미있고 편안하게 느껴졌습니다. 이렇듯 어떤 어려운 상황이 닥쳐와도 적응해 나갈 수 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (4,'sol333','강점','책임감이 강하고 감정이 섬세합니다. 주어진 업무에 대해 완벽히 수행하겠다는 의지가 강하여 업무가 종료될 때까지 해당 업무에 대한 최고의 집중력을 가집니다. 감정이 섬세하여 꼼꼼히 업무에 대한 실수가 있는지 두 번 이상의 검토를 하여 완벽을 추구합니다. 또한, 창의력이 뛰어나 기존의 해결방법과는 다른 저만의 해결방법으로 문제를 해결하는 경우가 많았습니다. 기존의 방법이 더 쉽고 이해하기 쉬운 것이라면 수용을 하는 편이며, 문제해결뿐만 아니라 아이디어 제시, 기존 해결 방법 응용 등 역할을 충분히 할 수 있습니다.
저는 한 가지에 몰두하여 다른 것들을 잊어버릴 때가 있습니다. 그래서 항상 메모하고 계획을 세우는 습관을 지녀 해야 할 것들을 점검하도록 노력합니다. 또한, 완벽주의적인 성향 때문에 한 업무를 완벽히 수행하지 못하면 다른 업무를 할 때도 완벽히 수행하지 못한 업무가 생각나 집중하기 어려워합니다. 그래서 완벽히 수행하지 못한 업무가 있을 시 부족한 부분은 메모하고, 다음 업무부터는 이러한 실수를 하지 않겠다고 다짐하여 업무 수행 능력이 증진되도록 노력하고 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (5,'sol333','지원 분야의 관련 직무를 수행한 경험 중 대표적인 일','대학교 4학년 때 ''''지진감지기'''' 프로젝트를 진행했습니다. 팀원은 총 3명으로 3개월간 데이터베이스 구축, 웹 페이지 개발, 안드로이드 앱 개발을 나눠 진행하였습니다. 그 중 저의 역할은 안드로이드 앱 개발이었으며 목표는 서버와 앱을 연동하고 웹 페이지와 같은 역할을 하는 앱을 개발하는 것이었습니다. 자바 프로그래밍 기초, 자바프로그래밍 심화, 모바일 응용 설계 등의 과목을 통해 기본적인 지식을 가지고 있다면 충분히 만들 수 있다고 생각했습니다. 하지만 프로젝트 진행 과정을 경험하며 전체적인 앱을 만든다는 것과 학교 교육에서 배운 지식은 차이가 컸습니다. 특히 정상 작동하는 웹페이지를 모바일에서 구현했을 때 오류가 나타나 큰 어려움을 겪게 되었습니다. 몇가지 오류를 말씀드리자면 이미지 클릭 시 알림창이 뜨지 않는 오류, 관리자만 들어갈 수 있도록 제한한 페이지에 사용자도 들어갈 수 있는 오류, 모니터와 모바일 간의 화면 크기 차이 때문에 이미지와 표가 잘려 보이는 문제가 있었습니다. 이 오류들을 해결하기 위해 저는 포기하지 않고 개인학습과 더불어 팀원들과 정보를 교류했습니다. stack overflow 사이트, 안드로이드 스튜디오 도서, youtube 영상 등 많은 자료를 찾아보고 코딩을 수정하는 활동을 하였고 자바와 앱 개발에 대해 더욱 공부하게 되었습니다. 이렇게 얻은 앱 개발 지식을 기반으로 오류가 없는 앱을 개발할 수 있었습니다. 이후 저는 Android APP 개발자로 직무를 정하고 현재는 JAVA 위주의 공부들을 해오고 자바의 정석 도서를 읽고 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (6,'sol333','최근 본인이 경험한 가장 어려웠던 일','대학교 캡스톤 디자인 공모전에서 ''''재활균형기''''라는 개발 프로젝트를 한 적이 있습니다. 여기서 가장 제가 어려웠던 경험이 바로 처음 해본 웹페이지 개발로 저의 한계를 경험하고 그것을 극복하고자 했던 시간이 인상에 남아 있습니다. 이 프로젝트는 발판의 센서를 통해 사람의 체중이 고르게 분포되어 있는지에 대한 자세 교정 의료기기와 연동하는 웹 페이지, 데이터베이스 구축을 하는 프로젝트였습니다. 팀원들과 합심하여 웹 페이지 개발을 하였는데 기초 지식 없이 처음으로 웹 개발을 하는 거라 상당히 어려움이 많았습니다. 개발 과정에서 경험이 없던 저희 팀은 밤새 인터넷과 서적을 뒤지며 온전한 기능을 하도록 노력하였습니다. 그러나 제출 마감 시간은 다가오는데 진전은 없어서 답답한 상황이었습니다. 졸업한 선배에게 조언을 구하고 교수님께 자문했습니다. 그 자문을 토대로 다시 코딩을 작성했으며 좋은 결과물을 만들 수 있었습니다. 그래서 모르는 것이 생겼을 때 주위와 빠르게 협력하는 방법이 시간을 절약하고 팀원들의 사기를 돋울 방법이라고 생각했습니다. 하지만 뒤풀이 과정에서 과제를 숙고하고 검토하는 과정에서 또 한 번의 배움을 가졌습니다. 구글링과 시간을 더 들였다면 팀원들 스스로 해결이 가능한 문제였다는 것을 알게 되어 부끄러웠습니다. 처음이라고 어렵다고 당연하다는 듯이 생각하지 말고, 처음부터 하나하나 맞춰가면 해결할 수 있는 문제가 대부분이라는 것을 알게 됐습니다. 이후 프로젝트나 과제에서 저는 어려운 문제에 봉착했을 때 미루지 않고 문제해결을 하고자 하는 의지와 방법을 찾는 저 자신을 볼 수 있었습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (7,'sol333','직무에 관한 노력','학교 교육 ''''자바 프로그래밍 기초'''', ''''자바프로그래밍 심화''''를 수강함으로써 자바에 대한 기초와 기본 지식 등을 얻을 수 있었고, ''''모바일 응용 설계''''를 수강함으로써 앞서 말한 자바 교육에서 얻은 자바 지식을 기반으로 앱 개발까지 할 수 있었습니다. 그리고 더 나아가 프로젝트명 ''''지진감지기''''의 웹 페이지 개발, 데이터베이스 구축, 안드로이드 앱 개발 중 안드로이드 앱 개발 역할을 맡아 진행하였고 개발직으로 들어가기 위해서는 정보처리기사 자격증이 필수라고 들었기 때문에 2020년 응시자 격을 충족하였을 때 시험을 응시하여 취득하였습니다. 학교 교육에서 공부한 것도 있었지만 처음 보는 내용이 많아 자격증을 준비 함으로써 지식을 더욱 넓힐 수 있었습니다. 그리고 현재까지도 자바와 안드로이드를 중점적으로 공부하고 있습니다. 또한, APP 개발 분야의 선배들, 현직자들과 끊임없이 소통하면서 회사에서 요구하는 역량에 대해서도 학습을 이어가며 개인 포트폴리오를 풍족하게 채우고자 노력 중입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (8,'mh777','성장과정','요즘 시대에 흔치 않은 4남매로 자라왔고, 고등학생 때부터 기숙사 생활을 하면서 조직 생활에 어울리는 친화력과 희생정신을 키워왔습니다. 앞으로 회사 생활을 할 때 저만의 이익을 추구하기보다 회사를 위해 판단하고 행동할 수 있다는 점은 저의 장점입니다. 저는 다양한 조직의 구성원으로 생활해왔으며 대를 위하여 소를 희생한다는 개념을 이해하고 있고, 개인의 편의나 욕심보다 조직의 이익을 위한 결정을 내리고 수행하는 일에 익숙합니다.
이러한 저의 성향을 보여줄 수 있는 사례는 중 가장 기억에 남는 것은 대학 재학 중 생산직 아르바이트로 근무하면서 팀을 성공적으로 이끌었던 것입니다. 저희 팀은 20대 초중반으로 이루어져 있었고, 아르바이트 특성상 금방 그만두는 사람이 많았습니다. 교대 근무 중 갑자기 결원이 생기면 일정 조정이 불가피했는데, 이때 근무하겠다는 사람이 없을 때마다 제가 나서서 근무를 자청했습니다. 그러한 일이 몇 번 있고 나서는 저를 통해서 근무 일정을 조정하는 것이 자리 잡았습니다. 저는 오전/오후 근무자를 아우르며 교대 근무 일정을 효율적으로 조정하였고 갑작스러운 결원이 생겼을 때에도 빠르게 대처하였습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (9,'mh777','지원동기','저는 기업의 과거 발자취와 현재의 위상도 중요하지만, 미래를 대하는 자세를 가장 중요하게 생각합니다. 쿠팡은 더욱 가볍고 안전한 자동차를 만들기 위한 TWB, Hydroforming, Hot stamping 등 공법을 적용한 자동차 부품 소재 개발에 힘쓰고 있습니다. 또한, 연비 절감을 위한 노력과 배기가스를 줄여 궁극적으로 지구 온난화를 해결하고자 하는 의지를 보이고 있습니다. 이 과정에서 기술 개발과 인재 양성에 집중하여 장기적으로 발전 가능성을 확장하는 행보 역시 눈에 띄었습니다.
그동안 국내뿐만 아니라 세계 시장에서 인정받은 뛰어난 기술력을 바탕으로 과거부터 현재까지 발전을 거듭해왔고, 나아가서 미래를 위해 노력하는 쿠팡의 모습에 깊은 감명을 받아 지원하게 되었습니다. 현재의 위상에 만족하지 않고 미래 인류의 안전과 행복, 지구 환경을 보전하는 일에 힘쓰는 기업에서 일하게 된다면 비록 생산 단계 일부를 맡고 있을 뿐일지라도 내가 하는 일이 세계에 보탬이 된다는 자긍심을 가지고 높은 직무 만족도를 느낄 수 있을 것으로 생각했기 때문입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (10,'mh777','성격의장단점','먹구름이 껴도 그 주변은 밝게 빛난다 ’ 라는 말이 있습니다. 이는 어려운 일이 닥쳐도 희망을 잃지 말라는 뜻입니다. 지난봄 처음으로 혼자 반을 맡을 때였습니다. 학기 초 , 혼자 맡는 첫 반에 학부모님들이 아이들을 맡기시는데 많은 걱정을 하는 모습을 보였습니다. 학부모님들에게 저에 대한 믿음을 드리는 방법에 대해 잘 몰랐고 , 학기 초에는 많은 걱정을 했습니다. 하지만 아이들에게 진심을 다해 다가갔고 , 더 즐거운 반을 만들기 위해 아이들의 학습을 위해  고민하고 노력 했습니다. 그 결과 아이들이 등원하는데 즐거움을 느꼈고 , 한글을 어려워했던 아이들이 한글자한글자 읽기 시작하면서 학부모님들이 저에 대한 신뢰가 쌓여갔습니다. 노력을 통해 어렵기만 했던 일이 재미있고 편안하게 느껴졌습니다. 이렇듯 어떤 어려운 상황이 닥쳐와도 적응해 나갈 수 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (11,'mh777','강점','책임감이 강하고 감정이 섬세합니다. 주어진 업무에 대해 완벽히 수행하겠다는 의지가 강하여 업무가 종료될 때까지 해당 업무에 대한 최고의 집중력을 가집니다. 감정이 섬세하여 꼼꼼히 업무에 대한 실수가 있는지 두 번 이상의 검토를 하여 완벽을 추구합니다. 또한, 창의력이 뛰어나 기존의 해결방법과는 다른 저만의 해결방법으로 문제를 해결하는 경우가 많았습니다. 기존의 방법이 더 쉽고 이해하기 쉬운 것이라면 수용을 하는 편이며, 문제해결뿐만 아니라 아이디어 제시, 기존 해결 방법 응용 등 역할을 충분히 할 수 있습니다.
저는 한 가지에 몰두하여 다른 것들을 잊어버릴 때가 있습니다. 그래서 항상 메모하고 계획을 세우는 습관을 지녀 해야 할 것들을 점검하도록 노력합니다. 또한, 완벽주의적인 성향 때문에 한 업무를 완벽히 수행하지 못하면 다른 업무를 할 때도 완벽히 수행하지 못한 업무가 생각나 집중하기 어려워합니다. 그래서 완벽히 수행하지 못한 업무가 있을 시 부족한 부분은 메모하고, 다음 업무부터는 이러한 실수를 하지 않겠다고 다짐하여 업무 수행 능력이 증진되도록 노력하고 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (12,'mh777','지원 분야의 관련 직무를 수행한 경험 중 대표적인 일','대학교 4학년 때 ''''지진감지기'''' 프로젝트를 진행했습니다. 팀원은 총 3명으로 3개월간 데이터베이스 구축, 웹 페이지 개발, 안드로이드 앱 개발을 나눠 진행하였습니다. 그 중 저의 역할은 안드로이드 앱 개발이었으며 목표는 서버와 앱을 연동하고 웹 페이지와 같은 역할을 하는 앱을 개발하는 것이었습니다. 자바 프로그래밍 기초, 자바프로그래밍 심화, 모바일 응용 설계 등의 과목을 통해 기본적인 지식을 가지고 있다면 충분히 만들 수 있다고 생각했습니다. 하지만 프로젝트 진행 과정을 경험하며 전체적인 앱을 만든다는 것과 학교 교육에서 배운 지식은 차이가 컸습니다. 특히 정상 작동하는 웹페이지를 모바일에서 구현했을 때 오류가 나타나 큰 어려움을 겪게 되었습니다. 몇가지 오류를 말씀드리자면 이미지 클릭 시 알림창이 뜨지 않는 오류, 관리자만 들어갈 수 있도록 제한한 페이지에 사용자도 들어갈 수 있는 오류, 모니터와 모바일 간의 화면 크기 차이 때문에 이미지와 표가 잘려 보이는 문제가 있었습니다. 이 오류들을 해결하기 위해 저는 포기하지 않고 개인학습과 더불어 팀원들과 정보를 교류했습니다. stack overflow 사이트, 안드로이드 스튜디오 도서, youtube 영상 등 많은 자료를 찾아보고 코딩을 수정하는 활동을 하였고 자바와 앱 개발에 대해 더욱 공부하게 되었습니다. 이렇게 얻은 앱 개발 지식을 기반으로 오류가 없는 앱을 개발할 수 있었습니다. 이후 저는 Android APP 개발자로 직무를 정하고 현재는 JAVA 위주의 공부들을 해오고 자바의 정석 도서를 읽고 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (13,'mh777','최근 본인이 경험한 가장 어려웠던 일','대학교 캡스톤 디자인 공모전에서 ''''재활균형기''''라는 개발 프로젝트를 한 적이 있습니다. 여기서 가장 제가 어려웠던 경험이 바로 처음 해본 웹페이지 개발로 저의 한계를 경험하고 그것을 극복하고자 했던 시간이 인상에 남아 있습니다. 이 프로젝트는 발판의 센서를 통해 사람의 체중이 고르게 분포되어 있는지에 대한 자세 교정 의료기기와 연동하는 웹 페이지, 데이터베이스 구축을 하는 프로젝트였습니다. 팀원들과 합심하여 웹 페이지 개발을 하였는데 기초 지식 없이 처음으로 웹 개발을 하는 거라 상당히 어려움이 많았습니다. 개발 과정에서 경험이 없던 저희 팀은 밤새 인터넷과 서적을 뒤지며 온전한 기능을 하도록 노력하였습니다. 그러나 제출 마감 시간은 다가오는데 진전은 없어서 답답한 상황이었습니다. 졸업한 선배에게 조언을 구하고 교수님께 자문했습니다. 그 자문을 토대로 다시 코딩을 작성했으며 좋은 결과물을 만들 수 있었습니다. 그래서 모르는 것이 생겼을 때 주위와 빠르게 협력하는 방법이 시간을 절약하고 팀원들의 사기를 돋울 방법이라고 생각했습니다. 하지만 뒤풀이 과정에서 과제를 숙고하고 검토하는 과정에서 또 한 번의 배움을 가졌습니다. 구글링과 시간을 더 들였다면 팀원들 스스로 해결이 가능한 문제였다는 것을 알게 되어 부끄러웠습니다. 처음이라고 어렵다고 당연하다는 듯이 생각하지 말고, 처음부터 하나하나 맞춰가면 해결할 수 있는 문제가 대부분이라는 것을 알게 됐습니다. 이후 프로젝트나 과제에서 저는 어려운 문제에 봉착했을 때 미루지 않고 문제해결을 하고자 하는 의지와 방법을 찾는 저 자신을 볼 수 있었습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (14,'mh777','직무에 관한 노력','학교 교육 ''''자바 프로그래밍 기초'''', ''''자바프로그래밍 심화''''를 수강함으로써 자바에 대한 기초와 기본 지식 등을 얻을 수 있었고, ''''모바일 응용 설계''''를 수강함으로써 앞서 말한 자바 교육에서 얻은 자바 지식을 기반으로 앱 개발까지 할 수 있었습니다. 그리고 더 나아가 프로젝트명 ''''지진감지기''''의 웹 페이지 개발, 데이터베이스 구축, 안드로이드 앱 개발 중 안드로이드 앱 개발 역할을 맡아 진행하였고 개발직으로 들어가기 위해서는 정보처리기사 자격증이 필수라고 들었기 때문에 2020년 응시자 격을 충족하였을 때 시험을 응시하여 취득하였습니다. 학교 교육에서 공부한 것도 있었지만 처음 보는 내용이 많아 자격증을 준비 함으로써 지식을 더욱 넓힐 수 있었습니다. 그리고 현재까지도 자바와 안드로이드를 중점적으로 공부하고 있습니다. 또한, APP 개발 분야의 선배들, 현직자들과 끊임없이 소통하면서 회사에서 요구하는 역량에 대해서도 학습을 이어가며 개인 포트폴리오를 풍족하게 채우고자 노력 중입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (15,'min33','성장과정','자라온 환경이 사람의 성품을 결정짓는 데 있어서 많은 영향을 미친다고 생각합니다. 성장하는 데 있어서 부족함 없이 3남매의 2째 딸로 부모님의 극진한 사랑을 받으며 자라왔습니다. 삼형제가 의견이 맞지 않을 때 도 있었지만, ‘거울은 먼저 웃지 않는다'''' 라는 가훈을 바탕으로  서로 조금씩 양보하며 웃음을 보이는 삶을 살기위해 노력했습니다. 오빠 동생과 다투기보다는 어떠한 문제가 있을시 서로 타협하고 양보하며, 돈독한 남매의 관계를 유지해 왔습니다. 그 점에서 싸워야만 문제해결이 되는 것이 아니라  먼저 손을 내밀고 충분한 대화를 통해 좋은 결과가 나올 수 있다는 것을 알았습니다. 지금도 대인관계에서 어떠한 문제가 생길 시 무작정 화부터 내는 것이 아니라, 대화로 모든 문제를 해결하려 노력합니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (16,'min33','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (17,'min33','성격의장단점','먹구름이 껴도 그 주변은 밝게 빛난다 ’ 라는 말이 있습니다. 이는 어려운 일이 닥쳐도 희망을 잃지 말라는 뜻입니다. 지난봄 처음으로 혼자 반을 맡을 때였습니다. 학기 초 , 혼자 맡는 첫 반에 학부모님들이 아이들을 맡기시는데 많은 걱정을 하는 모습을 보였습니다. 학부모님들에게 저에 대한 믿음을 드리는 방법에 대해 잘 몰랐고 , 학기 초에는 많은 걱정을 했습니다. 하지만 아이들에게 진심을 다해 다가갔고 , 더 즐거운 반을 만들기 위해 아이들의 학습을 위해  고민하고 노력 했습니다. 그 결과 아이들이 등원하는데 즐거움을 느꼈고 , 한글을 어려워했던 아이들이 한글자한글자 읽기 시작하면서 학부모님들이 저에 대한 신뢰가 쌓여갔습니다. 노력을 통해 어렵기만 했던 일이 재미있고 편안하게 느껴졌습니다. 이렇듯 어떤 어려운 상황이 닥쳐와도 적응해 나갈 수 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (18,'min33','강점','책임감이 강하고 감정이 섬세합니다. 주어진 업무에 대해 완벽히 수행하겠다는 의지가 강하여 업무가 종료될 때까지 해당 업무에 대한 최고의 집중력을 가집니다. 감정이 섬세하여 꼼꼼히 업무에 대한 실수가 있는지 두 번 이상의 검토를 하여 완벽을 추구합니다. 또한, 창의력이 뛰어나 기존의 해결방법과는 다른 저만의 해결방법으로 문제를 해결하는 경우가 많았습니다. 기존의 방법이 더 쉽고 이해하기 쉬운 것이라면 수용을 하는 편이며, 문제해결뿐만 아니라 아이디어 제시, 기존 해결 방법 응용 등 역할을 충분히 할 수 있습니다.
저는 한 가지에 몰두하여 다른 것들을 잊어버릴 때가 있습니다. 그래서 항상 메모하고 계획을 세우는 습관을 지녀 해야 할 것들을 점검하도록 노력합니다. 또한, 완벽주의적인 성향 때문에 한 업무를 완벽히 수행하지 못하면 다른 업무를 할 때도 완벽히 수행하지 못한 업무가 생각나 집중하기 어려워합니다. 그래서 완벽히 수행하지 못한 업무가 있을 시 부족한 부분은 메모하고, 다음 업무부터는 이러한 실수를 하지 않겠다고 다짐하여 업무 수행 능력이 증진되도록 노력하고 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (19,'min33','지원 분야의 관련 직무를 수행한 경험 중 대표적인 일','대학교 4학년 때 ''''지진감지기'''' 프로젝트를 진행했습니다. 팀원은 총 3명으로 3개월간 데이터베이스 구축, 웹 페이지 개발, 안드로이드 앱 개발을 나눠 진행하였습니다. 그 중 저의 역할은 안드로이드 앱 개발이었으며 목표는 서버와 앱을 연동하고 웹 페이지와 같은 역할을 하는 앱을 개발하는 것이었습니다. 자바 프로그래밍 기초, 자바프로그래밍 심화, 모바일 응용 설계 등의 과목을 통해 기본적인 지식을 가지고 있다면 충분히 만들 수 있다고 생각했습니다. 하지만 프로젝트 진행 과정을 경험하며 전체적인 앱을 만든다는 것과 학교 교육에서 배운 지식은 차이가 컸습니다. 특히 정상 작동하는 웹페이지를 모바일에서 구현했을 때 오류가 나타나 큰 어려움을 겪게 되었습니다. 몇가지 오류를 말씀드리자면 이미지 클릭 시 알림창이 뜨지 않는 오류, 관리자만 들어갈 수 있도록 제한한 페이지에 사용자도 들어갈 수 있는 오류, 모니터와 모바일 간의 화면 크기 차이 때문에 이미지와 표가 잘려 보이는 문제가 있었습니다. 이 오류들을 해결하기 위해 저는 포기하지 않고 개인학습과 더불어 팀원들과 정보를 교류했습니다. stack overflow 사이트, 안드로이드 스튜디오 도서, youtube 영상 등 많은 자료를 찾아보고 코딩을 수정하는 활동을 하였고 자바와 앱 개발에 대해 더욱 공부하게 되었습니다. 이렇게 얻은 앱 개발 지식을 기반으로 오류가 없는 앱을 개발할 수 있었습니다. 이후 저는 Android APP 개발자로 직무를 정하고 현재는 JAVA 위주의 공부들을 해오고 자바의 정석 도서를 읽고 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (20,'min33','최근 본인이 경험한 가장 어려웠던 일','대학교 캡스톤 디자인 공모전에서 ''''재활균형기''''라는 개발 프로젝트를 한 적이 있습니다. 여기서 가장 제가 어려웠던 경험이 바로 처음 해본 웹페이지 개발로 저의 한계를 경험하고 그것을 극복하고자 했던 시간이 인상에 남아 있습니다. 이 프로젝트는 발판의 센서를 통해 사람의 체중이 고르게 분포되어 있는지에 대한 자세 교정 의료기기와 연동하는 웹 페이지, 데이터베이스 구축을 하는 프로젝트였습니다. 팀원들과 합심하여 웹 페이지 개발을 하였는데 기초 지식 없이 처음으로 웹 개발을 하는 거라 상당히 어려움이 많았습니다. 개발 과정에서 경험이 없던 저희 팀은 밤새 인터넷과 서적을 뒤지며 온전한 기능을 하도록 노력하였습니다. 그러나 제출 마감 시간은 다가오는데 진전은 없어서 답답한 상황이었습니다. 졸업한 선배에게 조언을 구하고 교수님께 자문했습니다. 그 자문을 토대로 다시 코딩을 작성했으며 좋은 결과물을 만들 수 있었습니다. 그래서 모르는 것이 생겼을 때 주위와 빠르게 협력하는 방법이 시간을 절약하고 팀원들의 사기를 돋울 방법이라고 생각했습니다. 하지만 뒤풀이 과정에서 과제를 숙고하고 검토하는 과정에서 또 한 번의 배움을 가졌습니다. 구글링과 시간을 더 들였다면 팀원들 스스로 해결이 가능한 문제였다는 것을 알게 되어 부끄러웠습니다. 처음이라고 어렵다고 당연하다는 듯이 생각하지 말고, 처음부터 하나하나 맞춰가면 해결할 수 있는 문제가 대부분이라는 것을 알게 됐습니다. 이후 프로젝트나 과제에서 저는 어려운 문제에 봉착했을 때 미루지 않고 문제해결을 하고자 하는 의지와 방법을 찾는 저 자신을 볼 수 있었습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (21,'min33','직무에 관한 노력','학교 교육 ''''자바 프로그래밍 기초'''', ''''자바프로그래밍 심화''''를 수강함으로써 자바에 대한 기초와 기본 지식 등을 얻을 수 있었고, ''''모바일 응용 설계''''를 수강함으로써 앞서 말한 자바 교육에서 얻은 자바 지식을 기반으로 앱 개발까지 할 수 있었습니다. 그리고 더 나아가 프로젝트명 ''''지진감지기''''의 웹 페이지 개발, 데이터베이스 구축, 안드로이드 앱 개발 중 안드로이드 앱 개발 역할을 맡아 진행하였고 개발직으로 들어가기 위해서는 정보처리기사 자격증이 필수라고 들었기 때문에 2020년 응시자 격을 충족하였을 때 시험을 응시하여 취득하였습니다. 학교 교육에서 공부한 것도 있었지만 처음 보는 내용이 많아 자격증을 준비 함으로써 지식을 더욱 넓힐 수 있었습니다. 그리고 현재까지도 자바와 안드로이드를 중점적으로 공부하고 있습니다. 또한, APP 개발 분야의 선배들, 현직자들과 끊임없이 소통하면서 회사에서 요구하는 역량에 대해서도 학습을 이어가며 개인 포트폴리오를 풍족하게 채우고자 노력 중입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (22,'seojun','성장과정','자라온 환경이 사람의 성품을 결정짓는 데 있어서 많은 영향을 미친다고 생각합니다. 성장하는 데 있어서 부족함 없이 3남매의 2째 딸로 부모님의 극진한 사랑을 받으며 자라왔습니다. 삼형제가 의견이 맞지 않을 때 도 있었지만, ‘거울은 먼저 웃지 않는다'''' 라는 가훈을 바탕으로  서로 조금씩 양보하며 웃음을 보이는 삶을 살기위해 노력했습니다. 오빠 동생과 다투기보다는 어떠한 문제가 있을시 서로 타협하고 양보하며, 돈독한 남매의 관계를 유지해 왔습니다. 그 점에서 싸워야만 문제해결이 되는 것이 아니라  먼저 손을 내밀고 충분한 대화를 통해 좋은 결과가 나올 수 있다는 것을 알았습니다. 지금도 대인관계에서 어떠한 문제가 생길 시 무작정 화부터 내는 것이 아니라, 대화로 모든 문제를 해결하려 노력합니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (23,'seojun','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (24,'seojun','성격의장단점','먹구름이 껴도 그 주변은 밝게 빛난다 ’ 라는 말이 있습니다. 이는 어려운 일이 닥쳐도 희망을 잃지 말라는 뜻입니다. 지난봄 처음으로 혼자 반을 맡을 때였습니다. 학기 초 , 혼자 맡는 첫 반에 학부모님들이 아이들을 맡기시는데 많은 걱정을 하는 모습을 보였습니다. 학부모님들에게 저에 대한 믿음을 드리는 방법에 대해 잘 몰랐고 , 학기 초에는 많은 걱정을 했습니다. 하지만 아이들에게 진심을 다해 다가갔고 , 더 즐거운 반을 만들기 위해 아이들의 학습을 위해  고민하고 노력 했습니다. 그 결과 아이들이 등원하는데 즐거움을 느꼈고 , 한글을 어려워했던 아이들이 한글자한글자 읽기 시작하면서 학부모님들이 저에 대한 신뢰가 쌓여갔습니다. 노력을 통해 어렵기만 했던 일이 재미있고 편안하게 느껴졌습니다. 이렇듯 어떤 어려운 상황이 닥쳐와도 적응해 나갈 수 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (25,'seojun','직무에 관한 노력','학교 교육 ''''자바 프로그래밍 기초'''', ''''자바프로그래밍 심화''''를 수강함으로써 자바에 대한 기초와 기본 지식 등을 얻을 수 있었고, ''''모바일 응용 설계''''를 수강함으로써 앞서 말한 자바 교육에서 얻은 자바 지식을 기반으로 앱 개발까지 할 수 있었습니다. 그리고 더 나아가 프로젝트명 ''''지진감지기''''의 웹 페이지 개발, 데이터베이스 구축, 안드로이드 앱 개발 중 안드로이드 앱 개발 역할을 맡아 진행하였고 개발직으로 들어가기 위해서는 정보처리기사 자격증이 필수라고 들었기 때문에 2020년 응시자 격을 충족하였을 때 시험을 응시하여 취득하였습니다. 학교 교육에서 공부한 것도 있었지만 처음 보는 내용이 많아 자격증을 준비 함으로써 지식을 더욱 넓힐 수 있었습니다. 그리고 현재까지도 자바와 안드로이드를 중점적으로 공부하고 있습니다. 또한, APP 개발 분야의 선배들, 현직자들과 끊임없이 소통하면서 회사에서 요구하는 역량에 대해서도 학습을 이어가며 개인 포트폴리오를 풍족하게 채우고자 노력 중입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (26,'yeye','성장과정','자라온 환경이 사람의 성품을 결정짓는 데 있어서 많은 영향을 미친다고 생각합니다. 성장하는 데 있어서 부족함 없이 3남매의 2째 딸로 부모님의 극진한 사랑을 받으며 자라왔습니다. 삼형제가 의견이 맞지 않을 때 도 있었지만, ‘거울은 먼저 웃지 않는다'''' 라는 가훈을 바탕으로  서로 조금씩 양보하며 웃음을 보이는 삶을 살기위해 노력했습니다. 오빠 동생과 다투기보다는 어떠한 문제가 있을시 서로 타협하고 양보하며, 돈독한 남매의 관계를 유지해 왔습니다. 그 점에서 싸워야만 문제해결이 되는 것이 아니라  먼저 손을 내밀고 충분한 대화를 통해 좋은 결과가 나올 수 있다는 것을 알았습니다. 지금도 대인관계에서 어떠한 문제가 생길 시 무작정 화부터 내는 것이 아니라, 대화로 모든 문제를 해결하려 노력합니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (27,'yeye','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (28,'yeye','성격의장단점','먹구름이 껴도 그 주변은 밝게 빛난다 ’ 라는 말이 있습니다. 이는 어려운 일이 닥쳐도 희망을 잃지 말라는 뜻입니다. 지난봄 처음으로 혼자 반을 맡을 때였습니다. 학기 초 , 혼자 맡는 첫 반에 학부모님들이 아이들을 맡기시는데 많은 걱정을 하는 모습을 보였습니다. 학부모님들에게 저에 대한 믿음을 드리는 방법에 대해 잘 몰랐고 , 학기 초에는 많은 걱정을 했습니다. 하지만 아이들에게 진심을 다해 다가갔고 , 더 즐거운 반을 만들기 위해 아이들의 학습을 위해  고민하고 노력 했습니다. 그 결과 아이들이 등원하는데 즐거움을 느꼈고 , 한글을 어려워했던 아이들이 한글자한글자 읽기 시작하면서 학부모님들이 저에 대한 신뢰가 쌓여갔습니다. 노력을 통해 어렵기만 했던 일이 재미있고 편안하게 느껴졌습니다. 이렇듯 어떤 어려운 상황이 닥쳐와도 적응해 나갈 수 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (29,'yeye','직무에 관한 노력','학교 교육 ''''자바 프로그래밍 기초'''', ''''자바프로그래밍 심화''''를 수강함으로써 자바에 대한 기초와 기본 지식 등을 얻을 수 있었고, ''''모바일 응용 설계''''를 수강함으로써 앞서 말한 자바 교육에서 얻은 자바 지식을 기반으로 앱 개발까지 할 수 있었습니다. 그리고 더 나아가 프로젝트명 ''''지진감지기''''의 웹 페이지 개발, 데이터베이스 구축, 안드로이드 앱 개발 중 안드로이드 앱 개발 역할을 맡아 진행하였고 개발직으로 들어가기 위해서는 정보처리기사 자격증이 필수라고 들었기 때문에 2020년 응시자 격을 충족하였을 때 시험을 응시하여 취득하였습니다. 학교 교육에서 공부한 것도 있었지만 처음 보는 내용이 많아 자격증을 준비 함으로써 지식을 더욱 넓힐 수 있었습니다. 그리고 현재까지도 자바와 안드로이드를 중점적으로 공부하고 있습니다. 또한, APP 개발 분야의 선배들, 현직자들과 끊임없이 소통하면서 회사에서 요구하는 역량에 대해서도 학습을 이어가며 개인 포트폴리오를 풍족하게 채우고자 노력 중입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (30,'dodo77','성장과정','자라온 환경이 사람의 성품을 결정짓는 데 있어서 많은 영향을 미친다고 생각합니다. 성장하는 데 있어서 부족함 없이 3남매의 2째 딸로 부모님의 극진한 사랑을 받으며 자라왔습니다. 삼형제가 의견이 맞지 않을 때 도 있었지만, ‘거울은 먼저 웃지 않는다'''' 라는 가훈을 바탕으로  서로 조금씩 양보하며 웃음을 보이는 삶을 살기위해 노력했습니다. 오빠 동생과 다투기보다는 어떠한 문제가 있을시 서로 타협하고 양보하며, 돈독한 남매의 관계를 유지해 왔습니다. 그 점에서 싸워야만 문제해결이 되는 것이 아니라  먼저 손을 내밀고 충분한 대화를 통해 좋은 결과가 나올 수 있다는 것을 알았습니다. 지금도 대인관계에서 어떠한 문제가 생길 시 무작정 화부터 내는 것이 아니라, 대화로 모든 문제를 해결하려 노력합니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (31,'dodo77','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (32,'dodo77','성격의장단점','먹구름이 껴도 그 주변은 밝게 빛난다 ’ 라는 말이 있습니다. 이는 어려운 일이 닥쳐도 희망을 잃지 말라는 뜻입니다. 지난봄 처음으로 혼자 반을 맡을 때였습니다. 학기 초 , 혼자 맡는 첫 반에 학부모님들이 아이들을 맡기시는데 많은 걱정을 하는 모습을 보였습니다. 학부모님들에게 저에 대한 믿음을 드리는 방법에 대해 잘 몰랐고 , 학기 초에는 많은 걱정을 했습니다. 하지만 아이들에게 진심을 다해 다가갔고 , 더 즐거운 반을 만들기 위해 아이들의 학습을 위해  고민하고 노력 했습니다. 그 결과 아이들이 등원하는데 즐거움을 느꼈고 , 한글을 어려워했던 아이들이 한글자한글자 읽기 시작하면서 학부모님들이 저에 대한 신뢰가 쌓여갔습니다. 노력을 통해 어렵기만 했던 일이 재미있고 편안하게 느껴졌습니다. 이렇듯 어떤 어려운 상황이 닥쳐와도 적응해 나갈 수 있습니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (33,'dodo77','직무에 관한 노력','학교 교육 ''''자바 프로그래밍 기초'''', ''''자바프로그래밍 심화''''를 수강함으로써 자바에 대한 기초와 기본 지식 등을 얻을 수 있었고, ''''모바일 응용 설계''''를 수강함으로써 앞서 말한 자바 교육에서 얻은 자바 지식을 기반으로 앱 개발까지 할 수 있었습니다. 그리고 더 나아가 프로젝트명 ''''지진감지기''''의 웹 페이지 개발, 데이터베이스 구축, 안드로이드 앱 개발 중 안드로이드 앱 개발 역할을 맡아 진행하였고 개발직으로 들어가기 위해서는 정보처리기사 자격증이 필수라고 들었기 때문에 2020년 응시자 격을 충족하였을 때 시험을 응시하여 취득하였습니다. 학교 교육에서 공부한 것도 있었지만 처음 보는 내용이 많아 자격증을 준비 함으로써 지식을 더욱 넓힐 수 있었습니다. 그리고 현재까지도 자바와 안드로이드를 중점적으로 공부하고 있습니다. 또한, APP 개발 분야의 선배들, 현직자들과 끊임없이 소통하면서 회사에서 요구하는 역량에 대해서도 학습을 이어가며 개인 포트폴리오를 풍족하게 채우고자 노력 중입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (34,'hajoon','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (35,'jiho','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (36,'hoo999','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (37,'junjun','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');
Insert into SELF_INTRO (SI_NUM,M_ID,SI_QUES,SI_CONTENT) values (38,'iin110','지원동기','타원에서 교사로 근무하면서,  변화하는 교육 패러다임에 맞춘 교육방식의 다양성에 대하여 절실히 느끼게 되었습니다.  귀원의 보육동향 및 트렌드를 반영한 다양한 교육제도가 교사로서 저의 지향점과 부합하여 지원하게 되었습니다.
노력하는 사람이 더 좋은 대우를 받습니다. 귀원에서 아이들을 가르치게 된다면 항상 배움에 매진하는 사람이 되고 싶습니다. 또한 아이들에게도 항상 스스로 발전할 수 있도록 노력하는 사람이 되라고 가르치고 싶습니다. 
또한 교사 한 명의 개인역량 보다는 동료교사들과의 신뢰와 믿음, 협동심이 더욱더 큰 결과를 얻어낼 수 있습니다. 그래서 저의 큰 장점인 타고난 적응력과 사회력으로 동료교사들과 협업을 통하여 다양한 가치를 창출해 내고 싶습니다. 
입사 후에도 원에서 생활을 함에 있어 업무에 충실하며 신뢰를 받는 사람, 학부모님들이 믿고 아이들을 맡길 수 있는 사람, 자기개발에도 충실한 사람이 되도록 최선을 다해 노력할 것입니다.');


REM INSERTING into RESUME
SET DEFINE OFF;
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (1,'sol333','열정과 책임감으로 똘똘 뭉친 인재, 여기 있습니다!','fileSave/sol333_picture.jpg','fileSave/포트폴리오.show',to_date('21/05/21','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (2,'mh777','이력서','fileSave/mypic2.jpg','fileSave/포트폴리오.show',to_date('21/05/02','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (3,'min33','김민준 이력서','fileSave/mypic3.jpg','fileSave/포트폴리오.show',to_date('21/05/04','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (4,'seojun','이력서','fileSave/mypic3.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (5,'yeye','박예준 이력서','fileSave/mypic5.jpg','fileSave/포트폴리오.show',to_date('21/05/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (6,'dodo77','이력서','fileSave/mypic3.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (7,'sioo','이력서','fileSave/mypic2.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (8,'joo99','이력서','fileSave/mypic5.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (9,'hajoon','이력서','fileSave/mypic3.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (10,'jiho','이력서','fileSave/mypic5.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (11,'hoo999','이력서','fileSave/mypic3.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (12,'junjun','이력서','fileSave/mypic2.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (13,'iin110','이력서','fileSave/mypic4.jpg','fileSave/포트폴리오.show',to_date('21/04/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (14,'sol333','임다솔 이력서','fileSave/sol333_picture.jpg','fileSave/포트폴리오.show',to_date('21/05/21','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (15,'sol333','인사경력 2년 삼성 기업에 지원하는 임다솔입니다.','fileSave/sol333_picture.jpg','fileSave/포트폴리오.show',to_date('21/05/22','RR/MM/DD'));
Insert into RESUME (R_NUM,M_ID,R_TITLE,R_PIC,R_FILE,R_DATE) values (16,'sol333','열심히 하겠습니다!','fileSave/sol333_picture.jpg','fileSave/포트폴리오.show',to_date('21/05/22','RR/MM/DD'));

REM INSERTING into RE_SELF_REL
SET DEFINE OFF;
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (1,1,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (1,2,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (1,3,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (1,5,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (2,8,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (2,9,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (2,10,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (2,12,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (2,13,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (3,15,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (3,16,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (3,17,null);
Insert into RE_SELF_REL (R_NUM,SI_NUM,SI_ORDER) values (3,19,null);

REM INSERTING into MY_EDU
SET DEFINE OFF;
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (1,1,'2010-03-01','2013-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (1,10,'2013-03-01','2017-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (2,2,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (2,11,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (3,3,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (3,12,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (4,4,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (4,13,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (5,6,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (5,14,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (6,2,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (6,8,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (7,4,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (7,20,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (8,3,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (8,12,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (9,4,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (9,13,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (10,6,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (10,14,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (11,2,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (11,8,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (12,4,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (12,20,'2015-03-01','2019-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (13,4,'2012-03-01','2015-02-28','1');
Insert into MY_EDU (R_NUM,EDU_NUM,MYEDU_SDATE,MYEDU_EDATE,EDU_TYPE) values (13,13,'2015-03-01','2019-02-28','1');


REM INSERTING into MY_LICENCE
SET DEFINE OFF;
Insert into MY_LICENCE (R_NUM,LC_NUM,MYLC_DATE) values (1,3,'2020-06-20');
Insert into MY_LICENCE (R_NUM,LC_NUM,MYLC_DATE) values (1,6,'2016-06-30');
Insert into MY_LICENCE (R_NUM,LC_NUM,MYLC_DATE) values (2,3,'2019-08-30');

REM INSERTING into CAREER
SET DEFINE OFF;
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (1,'에듀윌','대리',4200,'콘텐츠 기획','2017-04-01','2019-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (2,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (3,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (4,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (5,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (6,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (7,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (8,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (9,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (10,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (11,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (12,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');
Insert into CAREER (R_NUM,CR_NAME,CR_GRADE,CR_SALARY,CR_JOB,CR_SDATE,CR_EDATE) values (13,'현대제철','사원',4500,'마케팅','2019-02-20','2020-02-20');




REM INSERTING into APPLY
SET DEFINE OFF;
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('min33',1001,3,to_date('21/06/11','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('seojun',1001,4,to_date('21/06/11','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('yeye',1001,5,to_date('21/06/18','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('dodo77',1001,6,to_date('21/06/18','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('sioo',1001,7,to_date('21/06/20','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('joo99',1001,8,to_date('21/06/20','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('hajoon',1001,9,to_date('21/06/21','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('jiho',1001,10,to_date('21/06/21','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('hoo999',1001,11,to_date('21/06/22','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('junjun',1001,12,to_date('21/06/22','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('iin110',1001,13,to_date('21/06/22','RR/MM/DD'),1);

Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('sol333',1013,1,to_date('21/06/22','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('sol333',1000,14,to_date('21/06/22','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('sol333',1018,16,to_date('21/06/23','RR/MM/DD'),1);
Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('sol333',1007,1,to_date('21/06/23','RR/MM/DD'),1);


Insert into APPLY (M_ID,RC_NUM,R_NUM,A_DATE,AP_CNT) values ('mh777',1001,2,to_date('21/06/23','RR/MM/DD'),1);


REM INSERTING into LIKE_COMPANY
SET DEFINE OFF;
Insert into LIKE_COMPANY (M_ID,RC_NUM,RC_CNT) values ('sol333',1006,1);
Insert into LIKE_COMPANY (M_ID,RC_NUM,RC_CNT) values ('sol333',1017,1);
Insert into LIKE_COMPANY (M_ID,RC_NUM,RC_CNT) values ('sol333',1013,1);
Insert into LIKE_COMPANY (M_ID,RC_NUM,RC_CNT) values ('sol333',1007,1);
Insert into LIKE_COMPANY (M_ID,RC_NUM,RC_CNT) values ('sol333',1015,1);

-------------------

/*커밋*/
commit;
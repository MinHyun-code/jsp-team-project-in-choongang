--커뮤니티 관련 멤버 생성
INSERT INTO MEMBER VALUES('ino22','1234','222222','jack','seoul','1','ino22@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('ino33','1234','222222','김기수','seoul','1','ino33@naver.com','01011112222','1');
INSERT INTO MEMBER VALUES('ino44','1234','222222','이지은','seoul','2','ino44@naver.com','01011112222','1');

--커뮤니티 게시글 생성 
INSERT INTO board VALUES(001,1,'ino22','[HOT] 언택트 집.콕. 취준 꿀팁','언택트 취준 꿀팁 내용입니다!',null,0,TO_DATE('2021-05-28 13:20:30','YYYY-MM-DD HH24:MI:SS'),'#언택트#취준',0,null,1,1,1);
INSERT INTO board VALUES(001,2,'ino22','브랜드 홍보의 달인, 마케팅 기획자','냉무',null,0,TO_DATE('2021-05-28 14:20:30','YYYY-MM-DD HH24:MI:SS'),'#마케팅#인터뷰',0,null,2,1,1);
INSERT INTO board VALUES(001,3,'ino22','<기업별 연봉 인기순위 TOP 10>','냉무',null,0,TO_DATE('2021-05-29 00:00:30','YYYY-MM-DD HH24:MI:SS'),'#연봉',0,null,3,1,1);

--커뮤니티 댓글 생성
INSERT INTO comments VALUES(001,1,1,'ino44','꿀팁감사합니다!!',TO_DATE('2021-05-29 11:00:30','YYYY-MM-DD HH24:MI:SS'),1,1,1);
INSERT INTO comments VALUES(001,1,2,'ino33','좋아요',TO_DATE('2021-05-29 11:01:30','YYYY-MM-DD HH24:MI:SS'),2,1,1);
INSERT INTO comments VALUES(001,1,3,'ino22','네^^',TO_DATE('2021-05-29 11:02:30','YYYY-MM-DD HH24:MI:SS'),1,2,2);
INSERT INTO comments VALUES(001,1,4,'ino44','굿굿',TO_DATE('2021-05-29 11:03:30','YYYY-MM-DD HH24:MI:SS'),4,1,1);
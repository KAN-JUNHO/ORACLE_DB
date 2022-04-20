--ON 절, 좌우외부조인 사용하라
--1) 각 과목의 과목명과 담당 교수의 교수명을 검색하라
SELECT *
FROM COURSE c
LEFT JOIN PROFESSOR p on c.pno = p.PNO;
--2) 화학과 학생의 기말고사 성적을 모두 검색하라
SELECT s.sno, s.SNAME, c.CNAME, r.RESULT
FROM student s
JOIN score r ON (s.SNO = r.SNO)
JOIN COURSE c ON (r.CNO = c.CNO)
WHERE s.MAJOR = '화학';
--3) 유기화학과목 수강생의 기말고사 시험점수를 검색하라
SELECT r.SNO ,result
FROM SCORE r
JOIN COURSE c ON r.CNO=c.CNO
WHERE cname='유기화학';

--4) 화학과 학생이 수강하는 과목을 담당하는 교수의 명단을 검색하라
SELECT DISTINCT pname
FROm PROFESSOR p 
JOIN COURSE c ON p.PNO = c.PNO
JOIN SCORE r ON r.CNO = c.CNO
JOIN STUDENT s ON s.SNO = r.SNO
WHERE s.MAJOR = '화학';
--5) 모든 교수의 명단과 담당 과목을 검색한다
SELECT pno, pname, cname
FROM PROFESSOR
LEFT JOIN COURSE USING(pno);

--6) 모든 교수의 명단과 담당 과목을 검색한다(단 모든 과목도 같이 검색한다)
SELECT pno,pname,cname
FROM PROFESSOR
FULL JOIN COURSE USING(pno);








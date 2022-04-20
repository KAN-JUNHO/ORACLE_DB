--<단일 행 함수를 이용하세요>
--1) 교수들이 부임한 달에 근무한 일수는 몇 일인지 검색하세요
SELECT PNO,PNAME, HIREDATE, LAST_DAY(TRUNC(HIREDATE))- TRUNC(HIREDATE)+1
FROM PROFESSOR;
--2) 교수들의 오늘까지 근무한 주가 몇 주인지 검색하세요
SELECT PNO,PNAME,TRUNC((sysdate-HIREDATE+1)/7) "일한 주"
FROM PROFESSOR;

--3) 1991년에서 1995년 사이에 부임한 교수를 검색하세요
SELECT PNO,PNAME,HIREdate
FROM PROFESSOR
WHERE TRUNC(HIREDATE) BETWEEN '1991/01/01' AND '1995/12/31';

--4) 학생들의 4.5 환산 평점을 검색하세요(단 소수 이하 둘째자리까지)
SELECT Sno ,sname, ROUND(avr/4.0*4.5,2)
FROM student;
--ON ��, �¿�ܺ����� ����϶�
--1) �� ������ ������ ��� ������ �������� �˻��϶�
SELECT *
FROM COURSE c
LEFT JOIN PROFESSOR p on c.pno = p.PNO;
--2) ȭ�а� �л��� �⸻��� ������ ��� �˻��϶�
SELECT s.sno, s.SNAME, c.CNAME, r.RESULT
FROM student s
JOIN score r ON (s.SNO = r.SNO)
JOIN COURSE c ON (r.CNO = c.CNO)
WHERE s.MAJOR = 'ȭ��';
--3) ����ȭ�а��� �������� �⸻��� ���������� �˻��϶�
SELECT r.SNO ,result
FROM SCORE r
JOIN COURSE c ON r.CNO=c.CNO
WHERE cname='����ȭ��';

--4) ȭ�а� �л��� �����ϴ� ������ ����ϴ� ������ ����� �˻��϶�
SELECT DISTINCT pname
FROm PROFESSOR p 
JOIN COURSE c ON p.PNO = c.PNO
JOIN SCORE r ON r.CNO = c.CNO
JOIN STUDENT s ON s.SNO = r.SNO
WHERE s.MAJOR = 'ȭ��';
--5) ��� ������ ��ܰ� ��� ������ �˻��Ѵ�
SELECT pno, pname, cname
FROM PROFESSOR
LEFT JOIN COURSE USING(pno);

--6) ��� ������ ��ܰ� ��� ������ �˻��Ѵ�(�� ��� ���� ���� �˻��Ѵ�)
SELECT pno,pname,cname
FROM PROFESSOR
FULL JOIN COURSE USING(pno);








--<���� �� �Լ��� �̿��ϼ���>
--1) �������� ������ �޿� �ٹ��� �ϼ��� �� ������ �˻��ϼ���
SELECT PNO,PNAME, HIREDATE, LAST_DAY(TRUNC(HIREDATE))- TRUNC(HIREDATE)+1
FROM PROFESSOR;
--2) �������� ���ñ��� �ٹ��� �ְ� �� ������ �˻��ϼ���
SELECT PNO,PNAME,TRUNC((sysdate-HIREDATE+1)/7) "���� ��"
FROM PROFESSOR;

--3) 1991�⿡�� 1995�� ���̿� ������ ������ �˻��ϼ���
SELECT PNO,PNAME,HIREdate
FROM PROFESSOR
WHERE TRUNC(HIREDATE) BETWEEN '1991/01/01' AND '1995/12/31';

--4) �л����� 4.5 ȯ�� ������ �˻��ϼ���(�� �Ҽ� ���� ��°�ڸ�����)
SELECT Sno ,sname, ROUND(avr/4.0*4.5,2)
FROM student;
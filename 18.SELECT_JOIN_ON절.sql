--[ON ��]
--; �������� ����ϴ�(���� ������ ��������� ǥ��)
--� ���ΰ� �� ������ ��� ǥ���� �� �ִ�.

--1)�� ����� �ٹ��μ��� �˻��ϼ���
--�����
SELECT eno,ename,dept.dno,dname
FROM emp
JOIN dept ON emp.dno = dept.dno;

--2) ���� ������ ����ϴ� ����� �޿� ����� �˻��ϼ���
--�� ����
SELECT eno, ename, job, grade
FROM emp
JOIN salgrade ON sal BETWEEN losal and hisal
WHERE job = '����';

--ON ���� WHERE���� �����ϰ� �Ϲ� ���ǵ� �� �� ������
--�Ʒ�ó�� �ϴ� ���� ����õ
SELECT eno, ename, job, grade
FROM emp
JOIN salgrade ON sal BETWEEN losal and hisal
AND job = '����';


--3) ������ �μ���� �޿������ �˻��ϼ���
--��Ģ�� ���ϴ� ���� ����
--(1) WHERE �� ����� : �������ǰ� �Ϲ������� ���� ���
--(2) NATURAL JOIN : �ڵ����� �������� ��ü� ����, 2���̻� ���� �� ��� �Ұ�
--(3) USING �� : ����� ǥ��, �������ǰ� �Ϲ������� �и�, �����
--(4) ON �� : ����� ǥ��, �������ǰ� �Ϲ������� �и�,�����/�� ����
--������� USING �� 
--�� ������ ON ��

SELECT eno,ename,dname,grade
FROM emp
JOIN dept USING(dno)
JOIN salgrade ON sal BETWEEN losal and hisal;

--4) ������ �̸��� �������̸��� �˻��ϼ���
-- �ڱ� ��������: On���� ǥ��
SELECT  e1.ENO, e1.ENAME, e2.ENO, e2.ENAME
FROM emp e1
JOIN emp e2 ON e1.mgr=e2.eno;


--[�¿� �ܺ� ����(LEFT RIGHT OUTER JOIN)]
--; (+)��ȣ�� �ϴ� �ܺ������� ���߿� ���ʿ��� ��밡���ϴ�.
--  ������ ���⼭ �ϴ� ����� ����ϸ� ��ġ ���ʿ� (+)�� �Ѱ�
--  ���� ǥ���� �����ϴ�.

5) ȫ�浿 ����� �߰��غ���
INSERT INTO emp(eno,ename,job)
VALUES('3006','ȫ�浵','����');

COMMIT;

SELECT *from emp;
SELECT * FROM dept;

--6)��� �̸��� �Ҽ� �μ��� �˻��ϼ���
RIGHT JOIN == RIGHT OUTER JOIN
LEFT JOIN == LEFT OUTER JOIN
FULL JOIN == FULL OUTER JOIN

SELECT eno,ename,dno,dname
FROM emp 
JOIN dept USING(dno);

SELECT eno,ename,dno,dname
FROM emp 
RIGHT JOIN dept USING(dno);

SELECT eno,ename,dno,dname
FROM emp 
LEFT JOIN dept USING(dno);

SELECT eno,ename,dno,dname
FROM emp 
FULL JOIN dept USING(dno);





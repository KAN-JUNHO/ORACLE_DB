���� ���� - ���� �� ��������
; ���� ������ �� ���� ������ �����Ͽ� �ϳ��� ��������
ǥ���ϴ� ���̴�
1) ���� �� ��������
 ; ���������� �ϳ��� �÷����� �ϳ��� ���� �˻��Ѵ�
2) ���� �� ��������
 ; ���������� �ϳ��� �÷����� ���� ���� ���� �˻��Ѵ�
3) ���� �� ��������
 ; ���������� ���� ���� �÷��� �˻��Ѵ�

4) ���� ������ WHERE ��, HAVING ���� ���� �������� �ַ�
 ���δ�. FROM ���� ���̴� ��쵵 �ִ�.
 FROM ���� ���������� ���� ��츦 �ζ��κ�(Inline View)
 ��� �Ѵ�

SELECT �÷�, ...
FROM ���̺�
WHERE �÷� <���� �� ������> (SELECT ��: Sub Query);
1) ���� �� �����ڰ� �������� �ݵ�� ���������� ���
 ���� 1���� �˻��ž� �Ѵ�
2) ���� ������ �ݵ�� ��ȣ�� ���´�
3) ���� ������ ���� ���� ���� ���� ����ȴ�
4) ���� ������ �˻��� ������� ���� ������ ���ȴ�
5) ���� �� ������ �����ʿ� ����Ѵ�
   (=, <, >, <=, >=, !=)
6) WHERE ���� ����� ���� ���ڿ� Ÿ����
  SELECT ���� 1:1 �������谡 �Ǿ�� �Ѵ�.

1)�迬�ƺ��� �޿��� ���� �޴� ����� �˻��Ѵ�
--1) �迬���� �޿��� �˻��Ѵ�
SELECT eno,ename,sal
FROM emp
WHERE ename='�迬��';
--2) �迬���� �޿��� ���Ͽ� �� ���� �޴� ����� �˻��Ѵ�
SELECT eno, ename, sal
  FROM emp
  WHERE sal>3300;
  
SELECT eno, ename, sal
  FROM emp
  WHERE sal>(SELECT sal
              FROM emp
              WHERE ename='�迬��');

             
2)������ ������ ������ �л��� ������ �˻��϶�
--������ 3���̶� ���� �� �����ڸ� ����� ���� ����
--�׷��� Error �� �߻��ߴ�
SELECT avr
  FROM student
  WHERE sname='����';
  
SELECT sno, sname, avr
  FROM student
  WHERE avr=(SELECT avr
              FROM student
              WHERE sname='����'
              AND sname!='����');

���� �� ���� ���� (������� ���� ���� ���̴�)
SELECT sno, sname, avr
  FROM student
  WHERE avr IN (1.99,3.21,4);
  
SELECT sno, sname, avr
 FROM student
 WHERE avr IN (SELECT avr
               FROM student
               WHERE sname='����')
 AND sname != '����';
             
�����ϱ� ���� ���� �� ���������� �����ϴ� ���
1) '=' �����ڴ� 'IN'�����ڷ� �ٲ۴� - ������ ���������� ��ȯ
2) �ε�ȣ(<, >, <=, >=)�� any, all - ������ ���������� ��ȯ 
  �����ڸ� �߰��Ѵ�
3) Max, Min �׷� �Լ��� ����Ѵ� - ���� ���߿� 1���� ����



3) �迬�ƿ� �μ��� �ٸ��� ������ ������ �ϴ� ����� ������ �˻��϶�
 a) �迬�ƿ� �μ��� �ٸ��� - Sub Query
 SELECT dno
 FROM emp
 WEHRE ename='�迬��';
 b) �迬�ƿ� ������ ������ �Ѵ� - Sub Query
 SELECT job
 FROM emp
 WHERE ename='�迬��';
 c) �� ������ ����� ������ �˻��Ѵ� - Main Query
 SELECT *
   FROM emp
   WHERE dno != '2'
   AND job='ȸ��'
   AND ename !='�迬��';

 SELECT *
   FROM emp
   WHERE dno != ( SELECT dno
                 FROM emp
                 WEHRE ename='�迬��')
   AND job= (SELECT job
               FROM emp
               WHERE ename='�迬��')
   AND ename !='�迬��';

         
4) �μ� �� ���� �޿��� ���� �޴� �μ��� �˻��϶�
--1) �μ��� ��� �ִ�޿� ���
SELECT AVG(sal)
  FROM emp
  GROUP BY dno;
SELECT MAX(AVG(sal))
  FROM emp
  GROUP BY dno;
--2) ��ġ�ϴ� �μ��� ���
SELECT dno, AVG(sal)
  FROM emp
  GROUP BY dno
  HAVING AVG(sal)=4984.75;

SELECT dno, AVG(sal)
  FROM emp
  GROUP BY dno
  HAVING AVG(sal)=(SELECT MAX(AVG(sal))
                    FROM emp
                    GROUP BY dno);

5) �λ꿡�� �ٹ��ϴ� ����� ������ �˻��Ѵ�
  a) �λ꿡 �ٹ��ϴ� �μ���ȣ
  SELECT dno
    FROM dept
    WHERE loc='�λ�';
  b) �ش� �μ���ȣ�� ��ġ�ϴ� ����� ���� �˻�
  SELECT *
    FROM emp
    WHERE dno='20';
    
  SELECT *
    FROM emp
    WHERE dno=(SELECT dno
                  FROM dept
                  WHERE loc='�λ�');

  SELECT *
    FROM emp
    JOIN dept USING(dno)
    WHERE loc='�λ�';








DML(Data Manipulation Language)��?
; �����ͺ��̽��� �����͸� �Է�,����,�����ϴ� ����̴�
  SELECT ������ �ٸ��� �����ͺ��̽��� ������ �����ϴ� 
  �۾��� ���������� SELECT ���� ���ؼ� �ξ� ���Ǳ��
  ��ȹ�ǰ� ����Ǿ�� �Ѵ�.
  �̷��� DML �۾��� �������� �޸� ������ �۾�������
  ����� �䱸������ �̸� ���� ����Ŭ�� DML �۾���
  Ʈ������̶�� ������ �����Ѵ�.
  
INSERT, UPDATE, DELETE

INSERT INTO ���̺� [(�÷�, �÷�, ...)]
VALUES (��, ��, ...);
1) INSERT ���� �ϳ��� �ุ�� �����Ѵ�
2) �÷� ����Ʈ�� VALUE ���� ���� �ݵ�� 1:1�� �����ȴ�
3) ���̺��� ��� �÷��� ���� �Է��ϴ� ��� �÷� ����Ʈ��
  ������ �� �ִ�
  VALUE ���� ����ϴ� ���� ������ DESC ������� Ȯ�ε�
  ���̺��� �÷� ������ ��ġ�ؾ� �Ѵ�
4) �ԷµǴ� ���� ���ڰ� �ƴ� ��� �ݵ�� ���� �ο��ȣ��
  ����Ѵ�
5) INSERT ���忡�� ������ �÷��� null ���� �Էµȴ�
6) ������� null ���� null�� ����Ѵ�
7) �� ��� DEFAULT �� ����ϸ� DEFAULT ���� �Էµȴ�.

UPDATE ���̺�
SET �÷�=��, �÷�=��, ...
[WHERE ����];
1) �÷��� ���� �����Ѵ�
2) WHERE ���� �����ϸ� ��� ���� ������ �÷� ���� �����ȴ�
3) ���� �÷��� ���� ���ÿ� ������ �� �ִ�
4) �� ��ſ� DEFAULT �� ����ϸ� ���̺� ���ǵ� 
   DEFAULT ������ ����ȴ�
   
DELETE FROM ���̺�
[WHERE ����];
1) ������� �����͸� �����Ѵ�
2) ������ ���� ��� ���̺��� ��� ���� �����Ѵ�
3) ���̺��� �����ص� ���̺��� �������� ������
   ������ �ʴ´�(������ �����ϰ� �ִ�)
   

TCL(Transaction Control Language)
; COMMIT, ROLLBACK
COMMIT;
1) (Ʈ�����)�۾��� �Ϸ��Ѵ�
2) ��� DML ������ ������ �� �۾��� �Ϸ��� ��
  �ݵ�� �ʿ��ϴ�
  
ROLLBACK;
1) �۾��� ����Ѵ�
2) ��� DML ������ ������ �� �۾��� ����� ��
  �ݵ�� �ʿ��ϴ�.
   
   
1) dept ���̺��� ��� �����͸� ������ ���� ROLLBACK ��
COMMIT �� ������ ���� ����� Ȯ���Ѵ�

SELECT * FROM dept;

DELETE FROM dept;

SELECT * FROM dept;

ROLLBACK;

SELECT * FROM dept;

DELETE FROM dept;

SELECT * FROM dept;

COMMIT;

ROLLBACK;

SELECT * FROM dept;

   

2) emp�� dept���̺��� ��� �����͸� �����Ѵ�

SELECT * FROM emp;

SELECT * FROM dept;

DELETE FROM emp;

SELECT * FROM emp;

COMMIT;

SELECT * FROM dept;
DELETE FROM dept;

ROLLBACK;

SELECT * FROM emp;
SELECT * FROM dept;





3) emp ���̺� �Ʒ� ������ �Է��ϼ���
--1901 ���ؿ� �丮      2020-02-01 5000 2000 10
--1902 �ڼ��� ����        2020-01-12 6000 3000 20
--1903 ����   ����        2020-02-12  2000 100 30
--1904 ���� ���          2020-02-10 9999 9999 40

INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1901', '���ؿ�', '�丮', '2020-02-01', 5000, 2000, '10');
INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1902', '�ڼ���', '����', '2020-01-12', 6000, 3000, '20');
INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1903', '����', '����', '2020-02-12', 2000, 100, '30');
INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1904', '����', '���', '2020-02-10', 9999, 9999, '40');
 
SELECT * FROM emp;

ROLLBACK;

SELECT * FROM emp;

COMMIT;

SELECT * FROM emp;

�����͸� ���� �� �ڷ����� ��ġ���Ѿ� �Ѵ� - ���� ������
9999 -> '��õ' : �̷��� ������ ������ �߻��Ѵ�

INSERT INTO emp(eno, ename, job, hdate, sal, comm, dno)
 VALUES('1905', '����', '���', '2020-02-10', '��õ', 9999, '50');

4) 
emp 
��� : 1910
�̸� : �峪��
�Ի��� : 2020-01-02:07:15:29


5) ���� ��¥ ���İ� �ȸ����Ƿ� �Է� ������ �߻��Ѵ�
INSERT INTO emp(eno, ename, hdate)
 VALUES('1910', '�峪��', '2020-01-02:07:15:29');
 
ALTER SESSION SET nls_date_format='YYYY/MM/DD:HH24:MI:SS';

ROLLBACK;

ALTER SESSION SET nls_date_format='YY/MM/DD';

INSERT INTO emp(eno, ename, hdate)
 VALUES('1910', '�峪��', 
      TO_DATE('2020-01-02:07:15:29', 'YYYY/MM/DD:HH24:MI:SS'));
      
COMMIT;

SELECT * FROM emp;

 a) TO_DATE �Լ��� ����ϸ� �Է°����ϴ�


emp 
��� : 1911
�̸� : �質��
�Ի��� : 2020-01-02:07:15:29



6) TO_DATE�� �̿��ϸ� ���ϴ� ��¥�� �ð���
--���� ���˰� ��ġ���� �ʾƵ� ������ �� �ִ�.
--TO_CHAR�� �̿��ϸ� ���� ���� ���˰� �ٸ� �ð� ������
--����� �� �ִ�.

SELECT * FROM emp;

SELECT eno, ename, TO_CHAR(hdate, 'YYYY-MM-DD:HH24:MI:SS')
 FROM emp;


7) ��¥�� ����Ǵ� ����Ʈ ���� Ȯ���Ѵ�
ALTER SESSION SET nls_date_format='YYYY-MM-DD:HH24:MI:SS';

INSERT INTO emp(eno, hdate)
 VALUES('1', TO_DATE('2000', 'YYYY'));
INSERT INTO emp(eno, hdate)
 VALUES('2', TO_DATE('99', 'YY'));
INSERT INTO emp(eno, hdate)
 VALUES('3', TO_DATE('99', 'RR'));
INSERT INTO emp(eno, hdate)
 VALUES('4', sysdate);
 
COMMIT;

SELECT * FROM emp;

8) �̽�ö�� �μ���ȣ�� 10������ �����ϰ� �޿��� 10% �λ�����
--1) �̽�ö ���� DELETE �� INSERT
--2) �̽�ö ���� UPDATE
SELECT dno, ename 
 FROM emp
 WHERE ename='�̽�ö';
 
UPDATE emp SET
 dno='10', sal=sal*1.1
 WHERE ename='�̽�ö';
 
COMMIT;

SELECT dno, sal, ename 
 FROM emp
 WHERE ename='�̽�ö';


--���� �� �Լ� - �����Լ�
--; ���α׷��Ӵ� ������ SQL ���� ���س�
--  ����Ŭ�� �����ϴ� �Լ��� ���� ��뿡�� ������ ����
--  But, SQL ���� �� �����ؾ� �Ǵ� ������ �ִ�
--  1) �����͸� ���α׷����� ����ó���ϴ� �ͺ���
--     DBMS���� ó���ؼ� ����� �޾ƿ��� ����
--     ���ɻ� �ξ� ����
--  2) ��Ű��ó �鿡�� ���α׷��� �޾ƿ� �����
--     �����ִµ� �ַ��ϰ�, DBMS�� �����͸� ����/ó��
--     �� �����ϸ� �� ���� ������ ������ �и��� �̷��
--     ���Ƿ� �������� ����ȴ�
--     (���α׷��� DBMS�� ������ ������ �Ǿ
--     ����/���������� ����)
--
--�����Լ�
--LOWER ���ڿ��� �ҹ��ڷ� ��ȯ�Ѵ�
--UPPER ���ڿ��� �빮�ڷ� ��ȯ�Ѵ�
--INITCAP ù���ڸ� �빮�ڷ� �������� �ҹ��ڷ�
----
--1)ERP �μ��� �ִ� ������ �˻��Ѵ�
SELECT * FROM dept;

SELECT loc "ERP �μ� ����", dname �μ���
  FROM dept
  WHERE UPPER(dname) ='ERP';

SELECT loc "ERP �μ� ����", dname �μ���
  FROM dept
  WHERE LOWER(dname) ='erp';

SELECT loc "ERP �μ� ����", dname �μ���
  FROM dept
  WHERE INITCAP(dname) ='Erp';


--���ڿ����Լ�
--SUBSTR ���ڿ����� ������ ��ġ�� ���ڿ��� ��ȯ(���ڿ�, ��ġ, ����)
        SUBSTR('oracle', 1, 2) => 0
--LENGTH ���ڿ��� ���̸� ��ȯ
        LENGTH('oragle') => 6
--INSTR ������ ������ ��ġ�� ����
      INSTR('oracle', 'a') => 3
--TRIM ���ξ ���̾ �߶󳽴�
     TRIM('o' FROM 'oracle') => racle
LPAD, RPAD ������ ���ڿ��� ���̸�ŭ ��κп�
           ���ڸ� ä���
           LPAD('20000', 10, '*')
           => *****20000
CONCAT('��', '����') => �迬��

2)�μ� ��� ��ġ�� �ϳ��� �÷����� �˻��Ѵ�
--CONCAT�� ���ڿ��� �������ִ� �Լ�����
SELECT CONCAT(dname,loc)
  FROM dept;

SELECT CONCAT(dname,' '||loc)
  FROM dept;

SELECT dname||' '||loc
  FROM dept;

--�� ������� �ʴ´�
--�ֳ��ϸ� || �� �� ���� ����Ѵ�


3) �μ���� ���̸� ����϶�
SELECT dname, LENGTH(dname)
FROM dept;

4) SUBSTR�Լ��� �̿��ؼ� �÷��� �Ϻ� ���븸�� �˻��Ѵ�
SELECT ename,
      SUBSTR(ename,2),    --2���� ���ں���
      SUBSTR(ename,-2),   --�ڿ��� 2��° ���ں���
      SUBSTR(ename,1,2),  -- 1��° ���ں��� 2����
      SUBSTR(ename,-2,2)  -- �ڿ��� 2��° ���ں��� 2����
  FROM emp;

5) ��� �̸��� 'a'�� ��Ÿ���� ��ġ�� ����Ѵ�
SELECT INSTR('database','a'),
       INSTR('database','a',3),
       INSTR('database','a',1,3)
FROM dual;

SELECT ename, INSTR(ename, '��')
  FROM emp;
  
SELECT *
  FROM emp
  WHERE INSTR(ename,'��')=1;


--6) TRIM �Լ��� �̿� �پ��� ������� ���ڿ��� �˻��Ѵ�

SELECT TRIM('��' from '���Ⳳ'),
       TRIM(leading '��' from '���Ⳳ'),
       TRIM(trailing '��' from '���Ⳳ'),
       TRIM('��' from '�������Ⳳ�Ⳳ����')
FROM dual;

TRIM�� �ַ� ���� ���ڸ� �����ϴµ� ���� ���ȴ�
�Է� �� 'ȫ�浿' �̷��� �Է����� �ʰ�
' ȫ�浿', 'ȫ�浿 ' �ԷµǴ� ��찡 �ִ�
�̶� ename='ȫ�浿';
TRIM(ename)='ȫ�浿' �� �ϸ� �յ��� ���鹮�ڸ� �������ش�

7) �̸��� �޿��� ���� 10�÷����� �˻��Ѵ�
SELECT eno,RPAD(ename,10,'*'), LPAD(sal,10,'*')
  FROM emp;

8) �μ����� ������ ���ڸ� �����ϰ� �˻��Ѵ�
SELECT dno,SUBSTR(dname,1,LENGTH(dname)-1)
  FROM dept;

--����ġȯ�Լ�
--TRANSLATE : ���ڴ��� ġȯ�� ���� �����Ѵ�
--            TRANSLATE('oracle', 'o', '#')
--            => #racle
--REPLACE : ���ڿ����� ġȯ�� ���� �����Ѵ�
--            REPLACE('oracle', 'or', '##')
--            => ##acle

-- REPLACE�� �� ���� ����
9)
SELECT TRANSLATE('World of Warcraft', 'Wo','-*') Translate,
       REPLACE('World of Wacraft','Wo','--') Replace
FROM dual;









���� �� �Լ� - ����, ��¥�� �Լ�

ROUND : �׳� ���� �Ҽ����� �ݿø��ؼ� ������
        ROUND(m, n)
        n�ڸ����� �ݿø��Ѵ�
        ROUND(123.4567, 3) => 123.457
TRUNC : TRUNC(m, n)
        n�ڸ� �̸��� �����Ѵ�
        TRUNC(123.4567, 3) => 123.456
MOD : MOD(m, n)
      m�� n���� ���� ������ ����Ѵ�
      MOD(10, 4) => 2
POWER : POWER(m, n)
        m�� n�� ����Ѵ�
        POWER(2, 4) => 16
CEIL  : CEIL(m)
        m���� ū ���� ���� ������ ã�´�
        CEIL(2.34) => 3
FLOOR : FLOOR(m)
        m���� ���� ���� ū ���� ã�´�
        FLOOR(2.34) => 2
ABS : ABS(m)
      m�� ���밪�� ����Ѵ�
      ABS(-4) => 4
SQRT :  SQRT(m)
        m�� �������� ����Ѵ�
        SQRT(9) => 3
SIGN : SIGN(m)
        m�� ������ �� -1, ����� �� 1, 0�̸� 0�� ��ȯ
        SIGN(-3) => -1
        
1)�پ��� ���� �Լ��� �̿��� ����� Ȯ���Ѵ�
SELECT ROUND(98.765),TRUNC(98.765),
       ROUND(98.765,2), TRUNC(98.765,2)
  FROM dual;

SELECT MOD(19,3), MOD(-19,3)
FROM dual;

2)�μ��� ������ ����Ѵ�. �� 100���� �̸��� �����Ѵ�
SELECT eno,ename,TRUNC(sal*12+NVL(comm,0),-2) ����
FROM emp;
        
SELECT TRUNC(19786.786,2), TRUNC(19786.786,-2)
FROM dual;
--��¥ �Լ�

3)���� �ð��� �˻�����

SELECT SYSdate
FROM dual;

ALTER SESSION SET nls_date_format='YYYY/MM/DD:HH24:MI:SS';

SELECT SYSdate
FROM dual;

4)�迬���� 
���� ��¥, �Ի� ����, �Ի��Ϸκ��� ���ñ��� �Ⱓ,
�Ի��� ���� 100���� ������ ���� �˻��ϰ�
��¥ ������ ����� ����
ALTER SESSION SET nls_date_format='YY/MM/DD';

SELECT sysdate, hdate, TRUNC(sysdate-hdate), hdate+100
  FROM emp
  WHERE ename='�迬��';



��¥ + ���� = ��¥(�ϼ� ���� ��¥)
��¥ - ���� = ��¥(�ϼ� ���� ��¥)
��¥ + ����/24 = ��¥ (�ð��� ���� ��¥)
��¥ - ��¥ = ���� (�� ��¥ ���� ��(�ϼ�))

��¥ �Լ��� �ַ� ȸ�� ����� ���� ����Ѵ�
ERP �ַ��, SI ȸ��



YYYY : �⵵
MM : ��
DD : ��¥
HH : �ð�
MI : ��
SS : ��
        
ROUND : ROUND(��¥, ����)
        ���Ŀ� ���߾� �ݿø��� ��¥�� ��ȯ�Ѵ�
        ROUND(sysdate, 'DD') => 2020/02/26
TRUNC : TRUNC(��¥, ����)
        ���Ŀ� ���߾� ������ ��¥�� ��ȯ�Ѵ�
        TRUNC(sysdate, 'YYYY') => 2020/01/01
MONTHS_BETWEEN : MONTHS_BETWEEN(��¥1, ��¥2)
                 �� ��¥���� �Ⱓ�� �� ���� ����Ѵ�
                 MONTHS_BETWEEN('2020/03/01', '2020/04/01')
                 => 1
ADD_MONTHS : ADD_MONTHS(��¥, n);
             ��¥�� n���� ���� ��¥�� ����Ѵ�
             ADD_MONTHS('2020/03/01', 23)
             => '2022/02/01'
NEXT_DAY : NEXT_DAY(��¥, ����)
           ��¥ ���� ������ ���Ͽ� �ش��ϴ� ��¥�� ���
           ���� ǥ���� 'sun', '�Ͽ���', 1�� ����
           �پ��� ǥ���� �����ϴ�
LAST_DAY : LAST_DAY(��¥)
           ��¥�� ������ ���� ������ ��¥�� ���
           LAST_DAY('2020/02/25') => 2020/02/29
        

5) ���ڿ� ��¥�� �ݿø��Ͽ� ����Ѵ�
SELECT sysdate, 
  ROUND(sysdate,'YY') ��,
  ROUND(sysdate,'MM') ��,
  ROUND(sysdate,'DD') ��
FROM DUAL;

6) ���ڿ� ��¥�� �����Ͽ� ����Ѵ�
SELECT sysdate,
       TRUNC(sysdate, 'YY') ��,
       TRUNC(sysdate, 'MM') ��,
       TRUNC(sysdate, 'DD') ��
FROM DUAL;

7) �迬�ư� ���ñ��� ���� �ϼ��� �˻��Ѵ�
�Ի����� �����ϱ� ���� +1�� �����
SELECT TRUNC(sysdate,'DD')-TRUNC(hdate,'DD') + 1 "���� ��"
FROM emp
WHERE ename = '�迬��';

8) 20�� �μ� �������� ������� �ٹ��� ���� ���� �˻��Ѵ�
SELECT eno,ename,TRUNC(MONTHS_BETWEEN(sysdate,hdate)) �ٹ�����
FROM emp
WHERE dno='20';

9) 20�� �μ������� �Ի� 100��° �Ǵ� ���� 10��° �Ǵ� ���� �˻��Ѵ�
SELECT eno,ename, hdate �Ի���, hdate+99 "�Ի� 100��°",
       ADD_MONTHS(hdate,10*12) "�Ի� 10��° �Ǵ� ��"
FROM emp
WHERE dno='20';

10) 20�� �μ������� �Ի��� ���� ù ��° �Ͽ����� �˻��Ѵ�
SELECT eno,ename,hdate,NEXT_DAY(hdate,'�Ͽ���') "�Ի� �� ù��° �Ͽ���"
FROM emp
WHERE dno='20';

SELECT NEXT_DAY(sysdate,'�Ͽ���') "�������� �Ͽ���"
FROM emp;

11) 20�� �μ������� �Ի��� ���� ������ ��¥��
�Ի��� �޿� �ٹ� �ϼ��� �˻��Ѵ�
SELECT eno,ename,hdate,
    LAST_DAY(hdate) "�Ի��� �� ������ ��¥",
    LAST_DAY(TRUNC(hdate))-TRUNC(hdate) "�Ի��� �� �ٹ��ϼ�"
FROM emp
WHERE dno='20';
--(�� �Ի����� �ٹ��Ͽ��� �����Ѵ�)











      
      
      
      
      
      
      
      
      
      
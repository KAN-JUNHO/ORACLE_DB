���� ���� - ���� ��, ���� ��

SELECT �÷�, ...
FROM ���̺�
WHERE �÷� <���� �� ������> (SELECT�� : Sub Query��);
1) ���� ������ ���� ���� ���� �˻��Ǵ� ������
   ���� �� ���� ������� �Ѵ�
2) ���� �� ���� ������ ���� �� �����ڸ� �̿��Ѵ�
3) ���� �� �������� ����
  IN : �˻��� ���߿� �ϳ��� ��ġ�ϸ� ���̴�
  ANY : �˻��� ���߿� ���ǿ� �´� ���� �ϳ� �̻� ������
        ���̴�
  ALL : ��� �˻��� ���� ���ǿ� �¾ƾ� ���̴�
  
1) 20�� �μ������ ������ �����ڷκ��� �����޴� ����� �˻��Ѵ�
1) 20�� �μ������� �����ڰ� ���� ���� �� �ִ�
SELECT dno, mgr
FROm emp
WHERE dno='20';

SELECT * 
FROM emp
WHERE mgr IN('0202',1002)
AND dno != '20';

SELECT * 
FROM emp
WHERE mgr != (SELECT dno, mgr
            FROm emp
            WHERE dno='20')
AND dno != '20';
2) ���������� ����� �� ������ ������ �� ���� ���
   ���� �� �����ڸ� �̿��Ͽ� ���� �� ���������� �ۼ��Ѵ�

2) 10�� �μ����麸�� �޿��� ���� ����� �˻��Ѵ�
SELECT eno,ename,dno,sal
FROM emp
WHERE sal < ALL(SELECT sal
                FROM emp
                WHERE dno='10')
AND dno!='10';

SELECT eno, ename, dno, sal
  FROM emp
  WHERE sal < (SELECT MIN(sal)
                FROM emp
                WHERE dno='10')
  AND dno!='10';

���� �� �����ڿ� �׷� �Լ�
���� �� �������� ALL �̳� ANY �� ������ ����
�׷� �Լ��� �̿��ؼ� ǥ���� �� �ִ�.
ALL : ��� �� ���ǿ� �¾ƾ� ��
ANY : ��� �߿� �ϳ���
�÷� > ALL => �÷� > MAX : ���� ū ������ ũ��
�÷� < ALL => �÷� < MIN : ���� ���� ������ �۴�
�÷� > ANY => �÷� > MIN : ���� ���� ������ ũ��
�÷� < ANY => �÷� < MAX : ���� ū ������ �۴�


3) 20�� �μ������ ���ʽ��� ���� ����� �˻��Ѵ�
SELECT dno,eno,ename,comm
  FROM emp
  WHERE comm IN (SELECT NVL(comm,0)
                 FROM emp
                 WHERE dno='20')
  AND dno!='20';

--null �� 0���� ġȯ�ؼ� �˻������� �Ǵ��� ������ �Ѵ�

               



���� �� ���� ����
SELECT �÷�,...
FROM ���̺�
WHERE (�÷�1, �÷�2, ...) IN (SELECT �� : Sub Query ��);
1) ���� ������ SELECT ���� ���� ���� �÷��� �˻��Ѵ�
2) ���� ���� �÷��� �˻��ϴ� ���� ���� ���� �̿��� ����
   �ݵ�� �� ��� �÷��� 1:1 �����Ǿ�� �Ѵ�
3) ���� �� ���� �������� ���� ������ �˻� ����� ���� �ϳ���
  ���̶�� '='������ ����� ���������� �ǵ��� 'IN'�����ڸ�
  ����Ѵ�.

4) ���ϴð� ������ �������� ������ �����鼭 ������ ���� �����
�˻��Ѵ�.

SELECT mgr,job
  FROM emp
  WHERE ename='���ϴ�';
  
SELECT eno,ename,mgr,job
  FROM emp
  WHERE (mgr,job) in (SELECT mgr, job
                      FROM emp
                      WHERE ename='���ϴ�')
  AND ename!='���ϴ�';
  

���ϴ� ����� 1�� �����Ѵٸ� ���� �� ���������� ������
���� �ִ�. ���ϴ� ����� ���� ���̸� ���� �� ���������θ�
�����ϴ�.

SELECT eno,ename,mgr,job
  FROM emp
  WHERE mgr = (SELECT mgr
                FROM emp
                WHERE ename='���ϴ�')
  AND job = (SELECT job
              FROM emp
              WHERE ename='���ϴ�')
  AND ename!='���ϴ�';
  



5) �� �μ����� �ּ� �޿��� �޴� ����� ������ �˻��Ѵ�
(�̸�, �޿�)
SELECT dno, MIN(sal)
  FROM emp
  GROUP BY dno;

SELECT dno,sal "�μ��� �ּұ޿�",eno,ename
  FROM emp
  WHERE (dno,sal) IN (SELECT dno, MIN(sal)
                      FROM emp
                      GROUP BY dno);













  
  
  
  
  
  
  
  
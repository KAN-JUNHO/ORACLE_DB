�׷� �Լ�
; �˻��� ���� ���� �̿��Ͽ� ��������� ����ϴ� �Լ�

MAX  ���� �߿� �ִ밪�� ��ȯ
MIN  ���� �߿� �ּҰ��� ��ȯ
AVG  ��հ��� ���
COUNT ��ȯ�� ���� ���� ���
SUM  ������ ���
STDDEV ǥ�������� ���
VARIANCE �л��� ���

1) null ���� ���õȴ� - null �� �ǹ̴� '�� �� ����', '�������� �ʾҴ�'
2) �ݵ�� 1���� ������ ��ȯ�Ѵ�
3) GROUP BY ���� �Ϲ� �÷��� ����� �� ����

1) ����� ��� �޿��� �˻��Ѵ�
SELECT sal
 FROM emp;

SELECT AVG(sal), ROUND(AVG(sal)) 
 FROM emp;
 
2) ����鿡�� ���޵� ���ʽ� ���հ� ���ʽ� ����� �˻��Ѵ�
SELECT SUM(comm) "���ʽ� ����",
       ROUND(AVG(comm)) "���ʽ� ���",
       COUNT(comm)  "���� �ο�",
       ROUND(AVG(NVL(comm,0)))  "ȯ�� ���",
       COUNT(*)     "��ü �ο�"
 FROM emp;

3) ���ʽ����� null �� �ƴ� ��� ���� ����ϼ���
SELECT COUNT(*)-COUNT(comm)
 FROM emp;
 
SELECT COUNT(*)
 FROM emp
 WHERE comm IS NULL;
 
SELECT COUNT(*)
 FROM emp
 WHERE comm IS NOT NULL;


�׷� �Լ��� GROUP BY ��

SELECT �÷� OR �׷� �Լ�...
FROM ���̺�
WHERE ����
GROUP BY �׷���
ORDER BY ���Ĵ��;

1) �׷��Լ��� �Բ� ���Ǵ� �Ϲ� �÷��� 
  �ݵ�� GROUP BY ���� ����Ǿ�� �Ѵ�
2) GROUP BY ���� ������� ������
   ORA-00937 ������ �߻��Ѵ�

3) ������ ��� �޿�, ��� ������ �˻��Ѵ�
--ORA-00937 : ī��θ�Ƽ�� ��ġ���� �ʴ´�
--AVG �Լ��� 1���� �����
--job �� �ళ����ŭ �����
SELECT job ����, ROUND(AVG(sal)) ��ձ޿�,
       ROUND(AVG(sal*12+NVL(comm,0))) ��տ���
 FROM emp;
 
��� ���� ������ 14���̴�
SELECT job ����
 FROM emp;

��� ���� ������ 1���̴�(�׷��Լ�)
SELECT ROUND(AVG(sal)) ��ձ޿�,
       ROUND(AVG(sal*12+NVL(comm,0))) ��տ���
 FROM emp;

* �׷� �Լ��� �Բ� ���Ǵ� �Ϲ� �÷���
�ݵ�� GROUP BY �� ����Ǿ�� �Ѵ�

SELECT job ����, ROUND(AVG(sal)) ��ձ޿�,
       ROUND(AVG(sal*12+NVL(comm,0))) ��տ���
 FROM emp
 GROUP BY job;

5) �μ��� ��� �޿�, ��� ������ �˻��Ѵ�
SELECT dno, ROUND(AVG(sal)),
       ROUND(AVG(sal*12+NVL(comm,0)))
 FROM emp
 GROUP BY dno;
 
SELECT dno, dname, ROUND(AVG(sal)),
       ROUND(AVG(sal*12+NVL(comm,0)))
 FROM emp
 JOIN dept USING(dno)
 GROUP BY dno, dname;


--TO_CHAR(AVG(result), '99.99') "�⸻ ���"







�׷� �Լ��� Having ��
; �׷� �Լ��� ������ ������ �Ϲ� ���ǰ� ����ϴ� ������ �ٸ���.
�Ϲ� ������ ��� �÷��� ���� ���� ���ǰ� ���ϸ� ������
�׷� �Լ��� ����� �������� �ϴ� ��� GROUP BY ���� 
��� ������ ���� ��� ���� �޶����Ƿ� ���ǿ� �׷� �Լ��� 
���Ե� ��� �̰��� �Ϲ� ���ǰ� ������ ������ ó���� �� ����
SQL �� �̸� ���� HAVING ���� �����Ѵ�.

HAVING ���� ���� �߿� �׷� �Լ��� ���Ե� �͸��� ��Ƽ�
����ϴ� �����̴�.

SELECT �÷� or �׷��Լ�...
FROM ���̺�
WHERE �Ϲ� ����
GROUP BY �׷���(�Ϲ��÷�)
HAVING �׷��Լ���������
ORDER BY ���� ���;
1) HAVING : ���� �߿� �׷��Լ��� �����ϴ� ���� ���
2) HAVING ���� GROUP BY �� �ڿ� ����Ѵ�
3) HAVING ���� �ؼ��� WHERE ���� �����ϴ�
   �ٸ� �׷� �Լ��� �����ϴ� ������ 
   HAVING ���� �ؾ߸� �Ѵ�


1) �μ����� ��ձ޿��� 3000�̻��� �μ��� ����ϼ���
SELECT dno,ROUND(AVG(sal)) ��ձ޿�
  FROM emp
  GROUP BY dno;

�׷��Լ� ������ WHERE ���� ����� �� ����

SELECT dno,ROUND(AVG(sal)) ��ձ޿�
  FROM emp
  WHERE ROUND(AVG(sal)) >= 3000
  GROUP BY dno;
  
SELECT dno,ROUND(AVG(sal)) ��ձ޿�
  FROM emp
  GROUP BY dno
  HAVING ROUND(AVG(sal)) >= 3000;
  


2) 20�� �μ��� �ƴϸ鼭 ��ձ޿��� 3000�̻��� �μ��� ����ϼ���
SELECT dno,ROUND(AVG(sal)) ��ձ޿�
  FROM emp
  WHERE dno != '20'
  GROUP BY dno
  HAVING ROUND(AVG(sal)) >= 3000;


1)GROUP BY ���� ���� �׷� �Լ� ��� ���� ��ȭ


2) �μ��� �޿� ����� 3õ �޷� �̸��� �μ��� �μ���ȣ��
��� �޿��� �˻��Ѵ�
SELECT dno, ROUND(AVG(sal))
  FROM emp
  GROUP BY dno
  HAVING ROUND(AVG(sal)) < 3000;

3) ���� ������ �ƴ� �μ��� �ο����� �˻��ϼ���

SELECT dno,job,COUNT(*) �ο���
FROM emp
WHERE job != '����'
GROUP BY dno, job;

SELECT dno,COUNT(*) �ο���
  FROM emp
  GROUP BY dno;

4) �׷��Լ��� ������ �ƴ� ���� WHERE ���� ����Ѵ�

5) HAVING ���� �׷��Լ��� �����̳�
GROUP BY �� ����� �÷��� ������ �����ϴ�
�׷��� HAVING ���� �׷��Լ��� ���Ǹ� ����ϰ�
GROUP BY �� �ִ� �÷��̶� WHERE ���� ����ϴ� ����
�����Ѵ�.
























1) �л��� ��� ������ ���� ���Ŀ� ���� �Ҽ��� ���� 2�ڸ����� �˻��ϼ���
'OOO �л��� ��� ������ O.OO�Դϴ�.'

SELECT sno,sname,TO_CHAR(avr,'0.99')  avg
FROM student;

2) ������ �������� ���� �������� ǥ���ϼ���
'OOO ������ �������� YYYY�� MM�� DD���Դϴ�.'
SELECT PNO,PNAME,TO_CHAR(HIREDATE,'YYYY"�� "MM"�� "DD"���Դϴ�.') ����
FROM PROFESSOR;

3) �����߿� 3���� ������ ������ ����� �˻��ϼ���
SELECT * 
FROM PROFESSOR
WHERE TO_CHAR(hiredate,'MM')=03;
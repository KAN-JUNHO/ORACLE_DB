1) ȭ�а��� �����ϰ� �л����� ���� ����� �˻��ϼ���
SELECT sno,AVG(avr)
  FROM student
  WHERE major != 'ȭ��'
  GROUP BY sno;
    
2) ȭ�а��� ������ �� �а��� ��� ���� �߿� ������ 2.0 �̻��� ������ �˻��ϼ���
SELECT sno,AVG(avr)
  FROM student
  WHERE major != 'ȭ��'
  GROUP BY sno
  HAVING AVG(avr) > 2.0;
    
3) �⸻��� ����� 60�� �̻��� �л��� ������ �˻��ϼ���(�й��� �⸻��� ���)
SELECT sno, AVG(result)
  FROM score
  GROUP BY sno
  HAVING AVG(result) >= 60;     
4) ���� �������� 3���� �̻��� ������ ������ �˻��ϼ���(������ȣ, �̸��� ��� ������)

SELECT pno,pname, SUM(st_num)
  FROM PROFESSOR
  NATURAL JOIN course
  GROUP BY pno, pname
  HAVING SUM(st_num) >= 3;






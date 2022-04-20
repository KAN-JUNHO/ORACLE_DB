<���� ������ ����ϼ���>
1) ���캸�� ������ ����� �л��� �й��� �̸��� �˻��ϼ���
SELECT sname,avr 
FROM STUDENT
WHERE avr > (SELECT avr 
                FROM student
                WHERE sname='����');


2) ����� ������ �г� �л� �߿� ������ �縶���� ������ �л��� �˻��ϼ���
SELECT sname,avr,syear 
  FROM student
  WHERE avr = (SELECT avr 
                  FROM student
                  WHERE sname='�縶��')
  AND syear = (SELECT syear
                  FROM student
                  WHERE sname='����');

3) ���캸�� �Ϲ� ȭ�а����� ������ �� ���� �л��� ����� ������ �˻��ϼ���
SELECT s.sno, sname, grade
FROM student s, course c, score r, scgrade g
WHERE s.sno=r.sno AND r.cno=c.cno AND result BETWEEN loscore AND hiscore
AND cname='�Ϲ�ȭ��'
AND grade > (SELECT grade
             FROM student s, course c, score r, scgrade g
             WHERE s.sno=r.sno AND r.cno=c.cno
             AND result BETWEEN loscore AND hiscore
             AND sname='����'
             AND cname='�Ϲ�ȭ��')
AND sname!='����';


SELECT s.sno, sname, result
FROM student s, course c, score r
WHERE s.sno=r.sno AND r.cno=c.cno
AND cname='�Ϲ�ȭ��'
AND result < (SELECT result
             FROM student s, course c, score r
             WHERE s.sno=r.sno AND r.cno=c.cno
             AND sname='����'
             AND cname='�Ϲ�ȭ��')
AND sname!='����';


4) �ο����� ���� ���� �а��� �˻��ϼ���
SELECT major, COUNT(*)
 FROM student
 GROUP BY major;
 
SELECT MAX(COUNT(*))
 FROM student
 GROUP BY major;
 
SELECT major, COUNT(*)
FROM student
GROUP BY major
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM student
                   GROUP BY major);


5) �л� �� �⸻��� ������ ���� ���� �л��� ������ �˻��ϼ���
SELECT s.sno, sname,AVG(result)
FROM student s, score r
WHERE s.sno=r.sno
GROUP BY s.sno, sname
HAVING AVG(result) = (SELECT MIN(AVG(result))
                      FROM score
                      GROUP BY sno);










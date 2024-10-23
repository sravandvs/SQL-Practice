DECLARE
			   TYPE r_cur IS REF CURSOR RETURN emp%ROWTYPE;
			   v_cur       r_cur;
			   Emp_rec     emp%ROWTYPE;
			BEGIN
			   DBMS_OUTPUT.PUT_LINE( 'Department 10 Employee Details');
			   DBMS_OUTPUT.PUT_LINE( '------------------------------');

			   OPEN V_CUR
			    FOR SELECT *
			          FROM emp
			         WHERE deptno = 10;
			   LOOP
			      FETCH V_CUR
			       INTO Emp_rec;

			      EXIT WHEN v_cur%NOTFOUND;

			      DBMS_OUTPUT.PUT_LINE( Emp_rec.EMPNO||' '||Emp_rec.ENAME||' '||Emp_rec.JOB||' '||
			                            Emp_rec.MGR||' '||Emp_rec.HIREDATE||' '||Emp_rec.SAL||' '||
			                            Emp_rec.COMM||' '||Emp_rec.DEPTNO);
			   END LOOP;
			   CLOSE V_CUR;

			   DBMS_OUTPUT.PUT_LINE( ' ');
			   DBMS_OUTPUT.PUT_LINE( 'Salesman Details in EMP Table');
			   DBMS_OUTPUT.PUT_LINE( '-----------------------------');

			   OPEN v_cur
			    FOR SELECT *
			          FROM emp
			         WHERE job = 'SALESMAN';
			   LOOP
			      FETCH V_CUR
			       INTO Emp_rec;

			      EXIT WHEN v_cur%notfound;

			      DBMS_OUTPUT.PUT_LINE( Emp_rec.EMPNO||' '||Emp_rec.ENAME||' '||Emp_rec.JOB||' '||
			                            Emp_rec.MGR||' '||Emp_rec.HIREDATE||' '||Emp_rec.SAL||' '||
			                            Emp_rec.COMM||' '||Emp_rec.DEPTNO);
			   END LOOP;

			   CLOSE V_CUR;
		        END;

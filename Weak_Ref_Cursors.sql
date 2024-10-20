DECLARE

TYPE r_cur IS REF CURSOR;
 v_cur       r_cur;
 v_empno     emp.empno%TYPE;
 v_ename     emp.ename%TYPE;
 v_job       emp.job%TYPE;
 v_dname     dept.dname%TYPE;
 v_deptno    dept.deptno%TYPE;
 v_stid      students.stid%TYPE;
 v_gender    students.gender%TYPE;
BEGIN
   DBMS_OUTPUT.PUT_LINE('Department Details');
   DBMS_OUTPUT.PUT_LINE('------------------');
   OPEN v_cur
     FOR SELECT deptno,
                dname
            FROM dept;
    LOOP
      FETCH v_cur INTO v_deptno, v_dname;

      EXIT WHEN v_cur%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(v_deptno||' '||v_dname);
    END LOOP;
    CLOSE v_cur;

    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('Employee Details');
    DBMS_OUTPUT.PUT_LINE('----------------');

    OPEN v_cur
      FOR SELECT empno,
                 ename,
                 job FROM EMP;
    LOOP
      FETCH v_cur INTO v_empno, v_ename, v_job;

      EXIT WHEN v_cur%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(v_empno||' '||v_ename||' '||v_job);
    END LOOP;
    CLOSE v_cur;

    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('Student Details');
    DBMS_OUTPUT.PUT_LINE('---------------');

    OPEN v_cur

    FOR SELECT stid,
               gender
               FROM STUDENTS;

    LOOP
       FETCH v_cur INTO v_stid, v_gender;

       EXIT WHEN v_cur%NOTFOUND;

       DBMS_OUTPUT.PUT_LINE(v_stid||' '||v_gender);
    END LOOP;
    CLOSE v_cur;
END;
/
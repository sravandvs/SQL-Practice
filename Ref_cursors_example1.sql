DECLARE
   TYPE get_dtls IS REF CURSOR;
   v_csr     get_dtls;
   vn_empno  NUMBER;
   vc_ename  VARCHAR2(20);
   vc_job    VARCHAR2(20);
   vn_deptno NUMBER;
   vc_dname  VARCHAR2(20);
   vc_loc    VARCHAR2(20);
   vn_stdid  NUMBER;
   vc_sname  VARCHAR2(20);
   vc_gndr   VARCHAR2(6);
   vn_grade  NUMBER;
   vc_sec    VARCHAR2(1);
BEGIN
   DBMS_OUTPUT.PUT_LINE('Employee Details');
   DBMS_OUTPUT.PUT_LINE('----------------');
   OPEN v_csr FOR SELECT EMPNO
                         ,ENAME
                         ,JOB
                     FROM EMP;

   LOOP
      FETCH v_csr INTO vn_empno,vc_ename, vc_job;
      EXIT WHEN v_csr%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(RPAD(vn_empno,10,' ')||RPAD(vc_ename,15,' ')||vc_job);
   END LOOP;

   CLOSE v_csr;
   DBMS_OUTPUT.PUT_LINE(' ');
   DBMS_OUTPUT.PUT_LINE(' ');
   DBMS_OUTPUT.PUT_LINE('Department Details');
   DBMS_OUTPUT.PUT_LINE('------------------');

   OPEN v_csr FOR SELECT * FROM DEPT;

   LOOP
      FETCH v_csr INTO vn_deptno, vc_dname, vc_loc;
      EXIT WHEN v_csr%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(RPAD(vn_deptno,5,' ')||RPAD(vc_dname,15,' ')||vc_loc);
   END LOOP;

   CLOSE v_csr;

   DBMS_OUTPUT.PUT_LINE(' ');
   DBMS_OUTPUT.PUT_LINE(' ');
   DBMS_OUTPUT.PUT_LINE('Student Details');
   DBMS_OUTPUT.PUT_LINE('---------------');

   OPEN v_csr FOR SELECT STID
                        ,NAME
                        ,DECODE(GENDER,'M','Male','Female')
                        ,grade
                        ,Section
                    FROM STUDENT;

   LOOP
      FETCH v_csr INTO vn_stdid, vc_sname, vc_gndr, vn_grade, vc_sec;
      EXIT WHEN v_csr%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(RPAD(vn_stdid,5,' ')||RPAD(vc_sname,15,' ')||RPAD(vc_gndr,8,' ')
                            ||RPAD(vn_grade,5,' ')||vc_sec);
   END LOOP;

   CLOSE v_csr;
END;
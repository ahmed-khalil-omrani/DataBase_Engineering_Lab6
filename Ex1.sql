Set serverOutPut On;

--1:
Declare 
    Cursor c_project is
        select pr.codep , pr.namep from Project pr,Participation pa
        where pr.codep=pa.codep
        order by pa.empnum;
    v_project c_project%rowtype;
    e_nodata Exception;
Begin 
    open c_project; 
    loop 
        fetch c_project into v_project;
        exit when c_project%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('codeP: '||v_project.codep||' nameP: '||v_project.namep);
    END Loop;  
    if(c_project%rowcount=0)then
        raise e_nodata;
    end if;
    Exception
        when e_nodata then
            DBMS_OUTPUT.PUT_LINE('no data found');
        when others then
            DBMS_OUTPUT.PUT_LINE('cursur erreur'||SQLERRM);
    close c_project;
END;

--2:
Declare 
    cursor c_emp is
        select e.empnum , e.empname , count(p.codeP)as nb_project from emp e, participation p
        where e.empnum=p.empnum
        group by e.empnum ,e.empname;
    v_emp c_emp%ROWTYPE;
    e_nodata Exception;

Begin
    open c_emp;
    Loop
        Fetch c_emp Into v_emp;
        exit when c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('empnum: '||v_emp.empnum||' empname:'||v_emp.empname||' number of projects: '||v_emp.nb_project);
    END LOOP;
    IF(c_emp%rowcount=0)then
        raise e_nodata;
    end if;
    close c_emp;
    Exception
        when e_nodata then
            DBMS_OUTPUT.PUT_LINE('no data found');
        when others then
            DBMS_OUTPUT.PUT_LINE('cursor erreur'||SQLERRM);

End;
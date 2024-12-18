---a:

Declare
    v_highsalary emp.salary%type;
    function max_sal_dep(p_deptnum emp.deptnum%type) Return emp.salary%type is
        v_highsalary emp.salary%type;
        e_nodata Exception;
        begin 
        select max(salary) into v_highsalary from emp
        where deptnum=p_deptnum;
        
        if(v_highsalary is null)then
            raise e_nodata;
        End if;
        return v_highsalary;
        Exception 
            when e_nodata then
                DBMS_OUTPUT.PUT_LINE('no data');
                return null;
            when others then
                DBMS_OUTPUT.PUT_LINE('erreur'||SQLERRM);
                return null;
        
    end max_sal_dep;
    
          
Begin
     v_highsalary:=max_sal_dep(20);
     DBMS_OUTPUT.PUT_LINE(v_highsalary);

End;
---b:

create or replace Function max_sal_dep(p_deptnum emp.deptnum%type) return emp.deptnum%type is
    v_hightsalary emp.salary%type;
    e_nodata exception;
    begin
        select max(salary) into v_hightsalary from emp
        where deptnum=p_deptnum;
        if ( v_hightsalary is null)then
            raise e_nodata; 
            return null;
        ELSE
            return v_hightsalary;
        end if;
        exception 
            when e_nodata then
                DBMS_OutPUT.PUT_LINE('no data');
            when others then
                DBMS_OUTPUT.PUT_LINE('erreur'||SQLERRM);
                return null;
end;

Declare
    v_hightsalary emp.salary%type;   
begin 
    v_hightsalary:=max_sal_dep(20);
    DBMS_OUTPUT.PUT_LINE(v_hightsalary);
end;

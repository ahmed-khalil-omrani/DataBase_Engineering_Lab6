Declare 
    Procedure ListProject is
        v_codep participation.codep%type;
        e_nodata exception;
        cursor c_part is
            select distinct(codeP) from participation;
        begin 
            open c_part;
            loop 
                fetch c_part into v_codep;
                exit when c_part%notfound;
                DBMS_OUTPUT.PUT_LINE(v_codep);
            end loop;
            if(c_part%rowcount=0)  then
                raise e_nodata;
            end if;
            Exception
                when e_nodata then
                    DBMS_OUTPUT.PUT_LINE('no data');
                when others then
                     DBMS_OUTPUT.PUT_LINE('erreur'||SQLERRM);
            close c_part;
    end ListProject;
begin
    ListProject;
END;
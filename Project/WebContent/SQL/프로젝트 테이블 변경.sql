select * from match where to_char(match_day,'yyyyy/mm/dd') < to_char(sysdate,'yyyyy/mm/dd')
  				order by match_day desc;
                
select * from EMPLOYEES order by HIRE_DATE desc;

ALTER table member add(NAME VARCHAR2(20));
ALTER table member modify NAME not null;

commit;





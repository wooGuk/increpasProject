select * from batting;
--예상결과가 같을 경우
update
(
    select b.*,m.RESULT
    from batting b, match m
    where b.match_code = m.match_code
      and  m.RESULT is not null
      and b.AC_RESULT is null
)
set AC_RESULT = RESULT
  , BAT_AVG = BAT_COST*2
where RE_RESULT = RESULT;
--예상결과가 다를 경우
update
(
    select b.*,m.RESULT
    from batting b, match m
    where b.match_code = m.match_code
      and  m.RESULT is not null
      and b.AC_RESULT is null
)
set AC_RESULT = RESULT
  , BAT_AVG = 0
where RE_RESULT != RESULT;

                               
  
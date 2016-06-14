select * from match;
insert into match values(match_seq.NEXTVAL,10,3,sysdate,3);
insert into match values(match_seq.NEXTVAL,6,1,sysdate,1);
insert into match values(match_seq.NEXTVAL,2,7,sysdate,2);
insert into match values(match_seq.NEXTVAL,4,9,sysdate,9);
insert into match values(match_seq.NEXTVAL,5,8,sysdate,5);

insert into match(MATCH_CODE,HOME_CODE,AWAY_CODE,MATCH_DAY) values(match_seq.NEXTVAL,6,3,sysdate);
insert into match(MATCH_CODE,HOME_CODE,AWAY_CODE,MATCH_DAY) values(match_seq.NEXTVAL,2,4,sysdate);
insert into match(MATCH_CODE,HOME_CODE,AWAY_CODE,MATCH_DAY) values(match_seq.NEXTVAL,7,5,sysdate);
insert into match(MATCH_CODE,HOME_CODE,AWAY_CODE,MATCH_DAY) values(match_seq.NEXTVAL,1,8,sysdate);
insert into match(MATCH_CODE,HOME_CODE,AWAY_CODE,MATCH_DAY) values(match_seq.NEXTVAL,9,10,sysdate);

commit;


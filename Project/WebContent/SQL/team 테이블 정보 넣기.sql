select * from team;
--팀정보 등록
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'Doosan',1,'43','17','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'NCDinos',2,'36','19','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'NexenHeros',3,'30','28','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'LGTwins',4,'27','28','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'SamsungLions',5,'28','32','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'LotteGiants',6,'27','32','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'SKWyvengs',7,'27','33','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'KiaTigers',8,'24','32','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'HanhwaEagles',9,'24','34','','');
insert into team(TEAM_CODE,NAME,RANK,WIN,LOSE,TEAM_AVG,TEAM_ERA)
values (team_seq.nextval,'KTWiz',9,'24','34','','');
commit;

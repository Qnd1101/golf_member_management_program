drop table tbl_teacher_202201;
create table tbl_teacher_202201(
	teacher_code char(3) primary key,
	teacher_name varchar2(15),
	class_name varchar2(20),
	class_price number(8),
	teacher_regist_date varchar2(8)
);

insert into tbl_teacher_202201 values('100', '이초급', '초급반', 100000, '20220101');
insert into tbl_teacher_202201 values('200', '김중급', '중급반', 200000, '20220102');
insert into tbl_teacher_202201 values('300', '박고급', '고급반', 300000, '20220103');
insert into tbl_teacher_202201 values('400', '정심화', '심화반', 400000, '20220104');

drop table tbl_member_202201;
create table tbl_member_202201(
	c_no char(5) primary key,
	c_name varchar2(15),
	phone varchar2(11),
	address varchar2(50),
	grade varchar2(6)
);

insert into tbl_member_202201 values('10001', '홍길동', '01011112222', '서울시 강남구', '일반');
insert into tbl_member_202201 values('10002', '장발장', '01022223333', '성남시 분당구', '일반');
insert into tbl_member_202201 values('10003', '임꺽정', '01033334444', '대전시 유성구', '일반');
insert into tbl_member_202201 values('20001', '성춘향', '01044445555', '부산시 서구', 'VIP');
insert into tbl_member_202201 values('20002', '이몽룡', '01055556666', '대구시 북구', 'VIP');

drop table tbl_class_202201;
create table tbl_class_202201(
	regist_month varchar2(6),
	c_no char(5),
	class_area varchar2(15),
	tuition number(8),
	teacher_code char(3),
	primary key(regist_month, c_no)
);

insert into tbl_class_202201 values('202203', '10001', '서울본원', 100000, '100');
insert into tbl_class_202201 values('202203', '10002', '성남분원', 100000, '100');
insert into tbl_class_202201 values('202203', '10003', '대전분원', 200000, '200');
insert into tbl_class_202201 values('202203', '20001', '부산분원', 150000, '300');
insert into tbl_class_202201 values('202203', '20002', '대구분원', 200000, '400');

--- 강사조회 ---
강사코드, 강사명, 강의명, 수강료, 강사자격취득일
select teacher_code as 강사코드, 
	teacher_name as 강사명, 
	class_name as 강의명,
	'\' || to_char(class_price, 'FM99,999,999') as 수강료,
	substr(teacher_regist_date, 1, 4) || '년' || 
	substr(teacher_regist_date, 5, 2) || '월' || 
	substr(teacher_regist_date, 7, 2) || '일' as 강사자격취득일
from tbl_teacher_202201;

--- 회원정보조회 ---
수강월, 회원번호, 회원명, 강의명, 강의장소, 수강료, 등급
select substr(regist_month, 1, 4) || '년' || 
	substr(regist_month, 5, 2) || '월' as 수강월,
	me.c_no as 회원번호, c_name as 회원명, class_name as 강의명, class_area as 강의장소,
	'\' || to_char(tuition, 'FM99,999,999') as 수강료,
	grade as 등급
from tbl_teacher_202201 th, tbl_member_202201 me, tbl_class_202201 cl
where th.teacher_code = cl.teacher_code and me.c_no = cl.c_no;

--- 강사매출현황 ---
강사코드, 강의명, 강사명, 총매출
select th.teacher_code as 강사코드, 
	class_name as 강의명, 
	teacher_name as 강사명, 
	'\' || to_char(sum(tuition), 'FM99,999,999') as 수강료
from tbl_teacher_202201 th, tbl_member_202201 me, tbl_class_202201 cl
where th.teacher_code = cl.teacher_code and me.c_no = cl.c_no
group by th.teacher_code, class_name, teacher_name
order by 강사코드;
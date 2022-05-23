-- Creating Table
CREATE TABLE `classroom` (`classroom_id` SMALLINT,`student_id` TINYINT);
INSERT INTO `classroom` (`classroom_id`,`student_id`) VALUES 
 ('123','1'), 
 ('234','2'), 
 ('123','4');

CREATE TABLE `students` (`student_id` TINYINT,`name` VARCHAR(10),`age` TINYINT);
INSERT INTO `students` (`student_id`,`name`,`age`) VALUES 
 ('1','john','15'), 
 ('2','marqueez','16'), 
 ('3','chip','14'), 
 ('4','marley','14');

-- A. Find out what classroom that has no students on those table using SQL

select classroom_id from classroom
where student_id not in (select DISTINCT student_id from students);

-- B. Could you display what classroom_id that each student has ? use SQL

select name, classroom_id
from students a
left join classroom b
on a.student_id = b.student_id;

-- C. Create a group for students that have age > 15 is called “high school” and age < 16 called “middle school”, and count how many students that belong to that group.

select
	case 
    	when age > 15 then 'High School'
        when age < 16 then 'Middle School'
	end student_group,
    count(student_id)
from students
group by 1;

-- D. Create SQL that give output that marqueez is the oldest student

select * from students order by age desc limit 1;

-- E. Find out the cumulative age from the students table for each student record

select *, 
	(
     select sum(age) 
     from students b 
     where a.student_id >= b.student_id
    ) as cumulative_sum
from students a;

-- F Summary Tabel A and B

-- Insight: All classrooms has been fully filled by the students. But not all the students have their own class
-- Question: Where the students who don't have any class go to?

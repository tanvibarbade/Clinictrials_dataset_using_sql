use sql_project;
-- 1. Add index name fast on Name
create index fast on clinictrial(Name(10));

-- 2. Describe the schema of table
describe clinictrial;

-- 3. Find average of Age
select avg(age) from clinictrial;

-- 4. Find minimum of Age
select min(age) as min_age from clinictrial;

-- 5. Find maximum of Age
select max(age) as max_age from clinictrial;

-- 6. Find average age of those were pregnant and not pregnant
select pregnant,round(avg(age),2) as avg_age 
from clinictrial 
group by pregnant;

-- 7. Find average blood pressure of those had drug reaction and did not had drug reaction
select Drug_reaction , round(avg(BP),2) as avg_BP
from clinictrial
group by Drug_reaction;

-- 8. Add new column name as ‘Age_group’ and those having age between 16 & 21
-- should be categorized as Low, more than 21 and less than 35 should be 
-- categorized as Middle and above 35 should be categorized as High.
alter table clinictrial
add Age_group enum("Low","Middle","High");

SET SQL_SAFE_UPDATES = 0;

update clinictrial
set Age_group = 
case when age between 16 and 21 then "Low"
when age between 21 and 35 then "Middle"
when age >35 then "High"
end;

-- 9. Change ‘Age’ of Reetika to 32
update clinictrial 
set age = 32
where name = "Reetika";

-- 10. Change name of Reena as Shara’
update clinictrial
set name="Shara"
where name = "Reena";

-- 11. Remove Chlstrl column
alter table clinictrial
drop column chlstrl;

-- 12. Select only Name, Age and BP
select name, age, BP from clinictrial;

-- 13. Select ladies whose first name starts with ‘E
select name from clinictrial
where name like "E%";

-- 14. Select ladies whose Age_group were Low
select name, age_group from clinictrial 
where age_group = "Low";

-- 15. Select ladies whose Age_group were High
select name, age_group from clinictrial 
where age_group = "High";

-- 16. Select ladies whose name starts with ‘A’ and those were pregnant 
select name, pregnant from clinictrial
where age_group like "A%" and pregnant = "yes";

-- 17. Identify ladies whose BP was more than 120 
select name, BP from clinictrial 
where BP > 120;

-- 18. Identify ladies whose BP was between 100 and 120 
select name , BP from clinictrial 
where BP between 100 and 120;

-- 19. Identify ladies who had low anxiety aged less than 30
select name,age,anxty_lh from clinictrial
where age < 30 and anxty_lh = "no";

-- 20.Select ladies whose name ends with ‘i’
select name from clinictrial 
where name like "%i";

-- 21. Select ladies whose name ends with ‘a’ 
select name from clinictrial 
where name like "%a";

-- 22.Select ladies whose name starts with ‘K’
select name from clinictrial 
where name like "k%";

-- 23.Select ladies whose name have ‘a’ anywhere 
select name from clinictrial 
where name like "%a%";

-- 24. Order ladies in ascending way based on ‘BP’
select * from clinictrial 
order by BP asc;

-- 25. Order ladies in descending way based on ‘Age’
select * from clinictrial 
order by age desc;
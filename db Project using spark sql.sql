-- Databricks notebook source
select * from emp_attrition;

-- COMMAND ----------

-- DBTITLE 1,Tota employee
select sum(EmployeeCount) as emp_count from emp_attrition

-- COMMAND ----------

-- DBTITLE 1,attrition division
Select Attrition, sum(EmployeeCount) as emp_count from emp_attrition
group by 1

-- COMMAND ----------

-- DBTITLE 1,Age Analysis - find out which particular age attrition is high (18-24, 25-31, 32-38, 39-45, 46-52, 52+)
select sum(EmployeeCount) as emp_count_by_age,
case when age between 20 and 25 then '20-25' when age between 26 and 32 then '26-32' when age between 33 and 40 then '33-40' else '40+' end age_group
from emp_attrition
where attrition = 'Yes'
group by 2

-- COMMAND ----------

-- DBTITLE 1,Attrition by Department
select department, sum(EmployeeCount) as emp_count_by_department from emp_attrition
where attrition ='Yes'
group by 1
order by 2

-- COMMAND ----------

-- DBTITLE 1,Attrition by Education
select sum(EmployeeCount) as emp_count_by_education, Education, 
case when Education = 1 then 'Below College' when Education = 2 then 'College' when Education = 3 then 'Bachelors' when Education = 4 then 'Master' when Education = 5 then 'Doctor' else 'NA' end Education_Level
from emp_attrition
where attrition ='Yes'
group by 2
order by 1

-- COMMAND ----------

-- DBTITLE 1,Attrition by Envirnment Satisfaction
select sum(EmployeeCount) as emp_count_by_environmentsatisfaction, EnvironmentSatisfaction
, 
case when EnvironmentSatisfaction
 = 1 then ' Low' when EnvironmentSatisfaction
 = 2 then 'Medium' when EnvironmentSatisfaction
 = 3 then 'High' when EnvironmentSatisfaction
 = 4 then 'Highly Satisfied' else 'NA' end EnvironmentSatisfactionLevel
from emp_attrition
where attrition ='Yes'
group by 2
order by 2 asc

-- COMMAND ----------

-- DBTITLE 1,Attrition by Job Satisfaction
select sum(EmployeeCount) as emp_count_by_JobSatisfaction, JobSatisfaction
, 
case when JobSatisfaction
 = 1 then ' Low' when JobSatisfaction
 = 2 then 'Medium' when JobSatisfaction
 = 3 then 'High' when JobSatisfaction
 = 4 then 'Highly Satisfied' else 'NA' end JobSatisfactionLevel
from emp_attrition
where attrition ='Yes'
group by 2
order by 2 asc

-- COMMAND ----------

select sum(EmployeeCount) as emp_count_by_biztravel, 
BusinessTravel
from emp_attrition
where attrition ='Yes'
Group by 2

-- COMMAND ----------

-- Insights that we got from the above data 
-- 1. Employee age between 26-32 are leaving the organization
-- 2. R&D department people left
-- 3. 99 people with bachelor's degree left
-- 4. 72 employees are not satified with environment location left 
-- 5. 156 employees who biz travels rarely left

-- COMMAND ----------



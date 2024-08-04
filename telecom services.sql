use telecom_services;

-- 1 -- 
select  count(*) as total_customers from customer_churn_lists;

-- 2 --
select avg(age) as average_age from customer_churn_lists 
where customer_status = 'churned';

--  3 -- 
select contract, count(*) as count from customer_churn_lists 
where customer_status = 'churned' 
group by contract 
order by count desc; 

-- 6 -- 
select customer_id, total_charges, customer_status from customer_churn_lists 
where customer_status = 'churned' 
order by total_charges desc;

-- 7 -- 
SELECT 
    customer_status,
    SUM(total_charges) AS total_charges_for_churned
FROM 
    customer_churn_lists
WHERE 
    customer_status = 'churned';  

SELECT 
    customer_status,
    SUM(total_charges) AS total_charges_for_non_churned
FROM 
    customer_churn_lists
WHERE 
    customer_status IN ('stayed', 'joined')
GROUP BY 
    customer_status;
    
    -- 8 -- 
select avg(monthly_charge) as average_monthly_charge 
from customer_churn_lists
where customer_status = 'churned' ; 

-- 9 --

select customer_id, online_security, online_backup, customer_status
from customer_churn_lists 
where online_security = 'yes' and  
online_backup ='yes' 
and customer_status In('stayed','joined') ; 

-- 11 -- 
select gender, married, avg(total_charges) as total_charges 
from customer_churn_lists
group by gender, married; 

-- 12 -- 

select 
case 
when age < 20 then 'under 20' 
when age  between 20 and 29 then '20-29' 
when age between 30 and 39 then  '30-39' 
when age between 40 and 49 then '40-49' 
when age between 50 and 59 then '50-59' 
when age between 60 and 69 then '60-69' 
when age between 70 and 80 then '70+' 
end as age_group,
avg(Monthly_Charge) as average_monthly_charges from customer_churn_lists 
where  customer_status = 'churned'
group by age_group; 



select monthly_charges, total_charges,
avg(monthly_charges) as average_monthly_charges, avg(total_charges) as average_total_charges
from customer_churn_list 
where customer_status ='churned' 
group by contract_type and internet_service_type;

-- 15 -- 
select multiple_lines, streaming_TV,
    avg(monthly_charge) as average_monthly_charges 
    from customer_churn_lists
    where multiple_lines = 'yes' and streaming_tv = 'yes';
    
    -- 16 -- 
    select customer_id, multiple_lines, internet_service, online_security, online_backup, device_protection_plan,
    premium_tech_support, streaming_tv, streaming_movies, streaming_music, unlimited_data
    from customer_churn_lists 
    where customer_status = 'churned' 
    and multiple_lines = 'yes' 
    and internet_service = 'yes' 
    and online_security ='yes'
    and online_backup ='yes' 
    and device_protection_plan='yes' 
    and premium_tech_support = 'yes' 
    and streaming_tv ='yes' 
    and streaming_movies ='yes' 
    and streaming_music='yes' 
    and unlimited_data='yes';
    
    -- 17 -- 
    select  streaming_tv, streaming_movies, streaming_music,
avg(age) as average_age,
sum(total_charges) as total_charges from customer_churn_lists 
where  streaming_tv ='yes' 
and streaming_movies ='yes' 
and streaming_music='yes' 
group by streaming_tv, streaming_movies, streaming_music;
    
-- 19 --
select
    contract,
    internet_type,
    avg (Monthly_Charge) as Average_Monthly_Charges,
    SUM(Total_Charges) as Total_Charges
from
    customer_churn_lists
where 
    customer_status = 'churned'
group by
    contract,
    internet_Type;
    
    
    
    
    

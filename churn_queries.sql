use churn;

show tables;

select * from churn_modelling limit 20;

select count(CustomerId) as Total_customer from churn_modelling;

select count(distinct CustomerId) as Unique_Customers from churn_modelling;

select sum(NumOfProducts) as total_products from churn_modelling;

select sum(distinct NumOfProducts) as unique_products from churn_modelling;

select max(CreditScore) as High_creditscore from churn_modelling;

select min(CreditScore) as low_creditscore from churn_modelling;

select avg(CreditScore) as avg_creditscore from churn_modelling;

select Geography, count(distinct Geography) as Unique_locations from churn_modelling group by Geography;

select max(Tenure) as High_Tenure from churn_modelling;

select min(Tenure) as low_Tenure from churn_modelling;

select avg(Tenure) as avg_Tenure from churn_modelling;

select max(Age) as high_age from churn_modelling;
select Surname,Age from churn_modelling order by Age desc limit 1;
select Surname, Age from churn_modelling where Age=(select max(Age) as high_age from churn_modelling);

select min(Age) as low_age from churn_modelling;
select Surname,Age from churn_modelling order by Age asc limit 1;
select Surname, Age from churn_modelling where Age=(select min(Age) as low_age from churn_modelling);

select avg(Age) as avg_age from churn_modelling;
select Surname, Age from churn_modelling where Age=(select round(avg(Age)) as avg_age from churn_modelling);

select count(distinct Age) as unique_ages from churn_modelling;

select Gender, Surname, CreditScore from churn_modelling order by CreditScore desc limit 1;

select Gender, Surname, CreditScore from churn_modelling order by CreditScore asc limit 1;

select Gender, avg(CreditScore) as avg_score from churn_modelling group by Gender order by avg_score desc limit 1;

select Gender, Surname, CreditScore from churn_modelling where CreditScore=(select max(CreditScore) from churn_modelling);

select Surname, CreditScore from churn_modelling where CreditScore = (select max(CreditScore) from churn_modelling);

select count(IsActiveMember) from churn_modelling where IsActiveMember=1;

select count(IsActiveMember) from churn_modelling where IsActiveMember=0;

select count(HasCrCard) from churn_modelling where HasCrCard=1;

select count(HasCrCard) from churn_modelling where HasCrCard=0;

select Gender, count(HasCrCard) as total from churn_modelling where HasCrCard=1 group by Gender;

select Gender, count(HasCrCard) as total from churn_modelling where HasCrCard=0 group by Gender;

select Geography, count(*) as ActiveCrHolders from churn_modelling where IsActiveMember=1 and HasCrCard=1 group by Geography;

select count(Exited) from churn_modelling where Exited = 1;
select count(Exited) from churn_modelling where Exited = 0;

select Geography, max(CreditScore) from churn_modelling group by Geography;

select Geography, min(CreditScore) from churn_modelling group by Geography;

select avg(EstimatedSalary) as avg_est_sal from churn_modelling ;

select Gender, avg(EstimatedSalary) as avg_est_sal from churn_modelling group by Gender;

select  Surname, CreditScore, Gender, max(CreditScore) over (partition by Gender order by CreditScore desc rows between unbounded preceding and unbounded following) as "max_CS" from churn_modelling;

select Surname,CreditScore,dense_rank() over(order by CreditScore) as "CS_ranked" from churn_modelling;

select Surname, Age
from (
    select 
        Surname,
        Age,
        dense_rank() over(order by Age desc) as age_rank_desc,
        dense_rank() over(order by Age asc)  as age_rank_asc
    from churn_modelling
) t
where age_rank_desc = 1 or age_rank_asc = 1;


select
    CustomerId,
    Surname,
    CreditScore,
    avg(CreditScore) over() as overall_avg_score,
    CreditScore - avg(CreditScore) over() as deviation_from_avg
from churn_modelling;

select
    Geography,
    Surname,
    CreditScore,
    rank() over(partition by Geography order by CreditScore desc) as geo_rank
from churn_modelling;

select
    Surname,
    CreditScore,
    ntile(4) over(order by CreditScore desc) as credit_quartile
from churn_modelling;

select
    Geography,
    count(*) as active_credit_holders
from churn_modelling
where IsActiveMember = 1 and HasCrCard = 1
group by Geography;











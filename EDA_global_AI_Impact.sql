select * from global_ai_content_impact_dataset;
/*Create a Copy table*/
create table global_ai_content_impact_dataset_copy
like global_ai_content_impact_dataset;
insert global_ai_content_impact_dataset_copy
select *
from global_ai_content_impact_dataset;

select * from global_ai_content_impact_dataset_copy;

/* Count Records per country*/
select Country, count(*) as record_count
from global_ai_content_impact_dataset_copy
group by Country
order by record_count;

/*Average AI adoption rate by country*/
select Country, avg(`AI Adoption Rate (%)`) as avg_adoption_rate
from global_ai_content_impact_dataset_copy
group by Country
order by avg_adoption_rate desc;

/*Year with highest average revenu increas*/
select Year, avg(`Revenue Increase Due to AI (%)`) as avg_revenue_increase
from global_ai_content_impact_dataset_copy
group by Year
order by avg_revenue_increase desc
limit 1;

/*Top 5 countries with highest job loss due to AI*/
select Country, avg(`Job Loss Due to AI (%)`) as avg_job_loss
from global_ai_content_impact_dataset_copy
group by Country
order by avg_job_loss desc
limit 5;

/* Industries with highest human-AI collaboration rate*/
select Industry, avg(`Human-AI Collaboration Rate (%)`) as avg_collaboration
from global_ai_content_impact_dataset_copy
group by Industry
order by avg_collaboration desc;

/*Countries where AI adoption >50% but revenue increase <20%*/
select Country, Industry, Year 
from global_ai_content_impact_dataset_copy 
where `AI Adoption Rate (%)` >50
and `Revenue Increase Due to AI (%)` <20;

/*Top 3 most used AI tool overall*/
select `Top AI Tools Used`, count(*)
as usage_count 
from global_ai_content_impact_dataset_copy
group by `Top AI Tools Used`
order by usage_count desc
limit 3;

/*Industries with Highest consumer trust in AI*/
select Industry, avg(`Consumer Trust in AI (%)`) as avg_trust
from global_ai_content_impact_dataset_copy
group by Industry
order by avg_trust desc;

/* YoY comparison of AI adoption for specific country*/
select `Year`, avg(`AI Adoption Rate (%)`) as adoption_rate
from global_ai_content_impact_dataset_copy
where Country = 'USA'
group by `Year` 
order by `Year`;

/*Countries with strict regulation but high AI adoption(>70%)*/
select Country, avg(`AI Adoption Rate (%)`) as avg_adoption
from global_ai_content_impact_dataset_copy
where `Regulation Status` = 'Strict'
group by Country
having avg(`AI Adoption Rate (%)`) > 70;

/*Records where job loss is high (>30%) but collaboration is also high (>60%)*/
select Country, Industry, Year, `Job Loss Due to AI (%)`, `Human-AI Collaboration Rate (%)`
from global_ai_content_impact_dataset_copy
where `Job Loss Due to AI (%)` >30
and `Human-AI Collaboration Rate (%)` >60;

/*Ranking Countries by market share of AI companies*/
select Country, avg(`Market Share of AI Companies (%)`) as avg_market_share
from global_ai_content_impact_dataset_copy
group by Country
order by avg_market_share desc
limit 10;

/* Comparison of gaming industry metrics across countries*/
select Country, avg(`AI Adoption Rate (%)`) as adoption,
avg(`Revenue Increase Due to AI (%)`) as revenue,
avg(`Job Loss Due to AI (%)`) as job_loss
from global_ai_content_impact_dataset_copy
where Industry = 'Gaming'
group by Country
order by adoption desc;

/*Yearly trend of AI-generated content volume*/
select Year, sum(`AI-Generated Content Volume (TBs per year)`) as total_content
from global_ai_content_impact_dataset_copy
group by Year
order by Year;

/* Year with the highest average job loss*/
select Year, avg(`Job Loss Due to AI (%)`) as avg_job_loss
from global_ai_content_impact_dataset_copy
group by Year
order by avg_job_loss desc
limit 1;

select * from global_ai_content_impact_dataset_copy;
create database p2;
use p2;

select * from workation;
# top 5 countries having maximum wifi speed
SELECT Country,Average_wifi_speed
FROM workation
ORDER BY Average_Wifi_speed desc
LIMIT 5;

#top 3 cities having maximum no of tourist attractions
SELECT City, Tourist_Attractions
FROM workation
ORDER BY Tourist_Attractions DESC
LIMIT 3;

#find the count of each country in top 10 cities having highest avg wifi speed
SELECT Country, COUNT(Country)as city_count
FROM workation
GROUP BY Country
ORDER BY avg(average_wifi_speed) desc
LIMIT 10;

#which are the cities with an avg wifi speed greater than 50 mbps 
#and avg price of a meal at a local, mid level restaurant less than 10 pounds
select city, country,Average_Wifi_speed,
 Avg_cost_of_a_meal_at_a_local_midlevel_restaurant
 from workation
 where Average_Wifi_speed>50
 and Avg_cost_of_a_meal_at_a_local_midlevel_restaurant < 10;

#total number of coworking spacesand what percentage of them are located in the top 10 cities
#with highest no of coworking spaces

#list the cities which have less than the overall avg in
#avg price of one bedroom apartment per month
Select city,country,Avg_price_of_one_bedroom_apartment_per_month
from workation
where Avg_price_of_one_bedroom_apartment_per_month<(
select Avg(Avg_price_of_one_bedroom_apartment_per_month)
from workation);
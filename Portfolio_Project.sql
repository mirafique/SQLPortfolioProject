use Project;
/*Part 1: Basics
#1.Loading and Exploring Data*/
#========================================================================================================================
#Explore the structure and first 10 rows of each table.
#========================================================================================================================
select * from information_schema.tables;
describe badges;
show create table badges;
select * from badges limit 10;
Select count(badges) as Record_Count from badges,comments;
describe comments;
select * from comments limit 10;
describe post_history;
select * from post_history limit 10;
describe post_links;
select * from post_links limit 10;
describe posts;
select * from posts limit 10;
describe post_ansers;
select * from post_answers limit 10;
describe tags;
select * from tags limit 10;
describe users;
select * from users limit 10;
describe votes;
select * from votes limit 10;
#==============================================================================
#identify the total number of records in each table.
#==============================================================================
select table_name,table_rows from information_schema.tables where table_name in('badges','comments','post_history','post_links','posts','post_answers','tags','users','votes');
#2. Filtering and Sorting
#=============================================================================
#Find all posts with a comment_count greater than 2
#=============================================================================
select * from posts where View_count>100;
select * from comments where Year(creation_date)="2024" order by creation_date; #dataset doesn't have any record for 2005
#============================================================================
#3. Simple Aggregations
#Count the total number of badges
#Calculate the average score of posts grouped y post_type_id
select name,count(name) from badges group by name;
select post_type_id,avg(score) from posts group by post_type_id;

#===========================================================================
#Part 2: Joins
# 1. Basi Joins
#Combine the post_history and posts tables to display the title of
#posts and the corresponding changes made in the post history.
#Join the users table with badges to find the total badges earned by each user.
select * from users;
select * from badges;

select a.title as post_titel, b.`text` as postHistory_title from posts a Inner join post_history b on a.id=b.post_id ;
select u.display_name,b.`name`, count(b.`name`) as total_badges from users u inner join badges b on u.id=b.user_id group by 1,2;

#============================================================================
/*2. Multi-Table Joins
○ Fetch the titles of posts (posts), their comments (comments), and the
users who made those comments (users).
○ Combine post_links with posts to list related questions.
○ Join the users, badges, and comments tables to find the users who have
earned badges and made comments*/



select * from comments;
select * from likes;
select * from users;
select * from photos;
select * from photo_tags;

-- Rewarding most loyal users
-- show 5 oldest users
SELECT 
    *
FROM
    users
ORDER BY created_at ASC
LIMIT 5;


-- Abondon Account
-- Show who never posted a single photo
SELECT 
    u.id, u.username
FROM
    users u
        LEFT JOIN
    photos p ON u.id = p.user_id
WHERE
    p.user_id IS NULL;
    
 -- Declaring Contest Winner
 -- Show user got most likes on single photo
SELECT 
    users.username, user_id, photo_id, COUNT(*) AS most_liked
FROM
    likes
        INNER JOIN
    users ON users.id = likes.user_id
GROUP BY photo_id
ORDER BY most_liked DESC
LIMIT 1; 

-- Hashtag Researching 
-- Show top 5 most commenly used hashtags
SELECT 
    id, tag_name, count(*) AS tag_count
FROM
    tags
inner join photo_tags    
on  photo_tags.tag_id= tags.id
GROUP BY tag_name
ORDER BY tag_count desc
limit 5;


-- Launch Ad Campaign
-- Show which day of week do most users register on
SELECT 
    DAYNAME(created_at) AS week_day_creation,
    COUNT(created_at) AS count_week_day
FROM
    users
GROUP BY week_day_creation
ORDER BY count_week_day DESC;


-- User Engagement
-- Show how many times does avg users posts 
SELECT 
    COUNT(DISTINCT image_url) AS total_no_photos,
    COUNT(DISTINCT user_id) AS no_of_users,
    COUNT(DISTINCT image_url) / COUNT(DISTINCT user_id) AS average_user_posts
FROM
    photos;
        
        
-- Bots and Fake Accounts
-- Users (bots) who have liked every single photo on the site
SELECT 
    id, username
FROM
    users
WHERE
    id = All (SELECT 
            user_id
        FROM
            likes
        WHERE
            user_id = photo_id)


			
					
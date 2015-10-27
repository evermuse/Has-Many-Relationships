--  -- Create a query to get all fields from the users table

-- select * from users;

-- -- get all fields from the posts table where the user_id is 100

-- select * from posts where user_id = '100';

-- -- get all posts fields, the user's first name, and the user's last name, from the posts table where the user's id is 200

-- select *, users.first_name, users.last_name
-- from users
-- inner join posts
-- on users.id = user_id
-- where user_id = '200';

-- --  get all posts fields, and the user's username, from the posts table where the user's first name is 'Norene' and the user's last_name is 'Schmitt'

-- select *, users.username
-- from posts
-- inner join users
-- on users.id = user_id
-- where first_name = 'Norene' AND last_name = 'Schmitt';

-- -- get usernames from the users table where the user has created a post after January 1, 2015

-- select username
-- from users
-- inner join posts
-- on users.id = user_id
-- where posts.created_at > 'January 1, 2015';

-- --  get the post title, post content, and user's username where the user who created the post joined before January 1, 2015

-- select posts.title, posts.content, users.username
-- from posts
-- inner join users
-- on users.id = user_id
-- where users.created_at > 'January 1, 2015';

-- -- get the all rows in the comments table, showing post title (aliased as 'Post Title'), and the all the comment's fields

-- select posts.title as Title, *
-- from comments
-- inner join posts
-- on posts.id = posts_id;

-- -- get the all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created before January 1, 2015

-- select *, posts.title as post_title, posts.url as post_url, comments.body as comment_body
-- from comments
-- inner join posts
-- on posts.id = posts_id
-- where posts.created_at < 'January 1, 2015';

-- -- all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the post was created after January 1, 2015

-- select *, posts.title as post_title, posts.url as post_url, comments.body as comment_body
-- from comments
-- inner join posts
-- on posts.id = posts_id
-- where posts.created_at > 'January 1, 2015';

-- all rows in the comments table, showing post title (aliased as post_title), post url (ailased as post_url), and the comment body (aliased as comment_body) where the comment body contains the word 'USB'

-- select *,  posts.title as post_title, posts.url as post_url, comments.body as comment_body
-- from comments
-- inner join posts
-- on posts.id = posts_id
-- where comments.body like '%USB%';

-- -- get the post title (aliased as post_title), first name of the author of the post, last name of the author of the post, and comment body (aliased to comment_body), where the comment body contains the word 'matrix'

-- select posts.title as post_title, users.first_name, users.last_name, comments.body as comment_body
-- from comments
-- inner join users
-- on users.id = comments.users_id
-- inner join posts
-- on posts.id = posts_id
-- where comments.body like '%matrix%';

-- -- get the first name of the author of the comment, last name of the author of the comment, and comment body (aliased to comment_body), where the comment body contains the word 'SSL' and the post content contains the word 'dolorum'

-- select users.first_name, users.last_name, comments.body as comment_body
-- from comments
-- inner join users
-- on users.id = comments.users_id
-- inner join posts
-- on posts.id = posts_id
-- where comments.body like '%SSL%' AND posts.content like '%dolorum%';

-- get the first name of the author of the post (aliased to post_author_first_name), last name of the author of the post (aliased to post_author_last_name), the post title (aliased to post_title), username of the author of the comment (aliased to comment_author_username), and comment body (aliased to comment_body), where the comment body contains the word 'SSL' or 'firewall' and the post content contains the word 'nemo'

select users.first_name as post_author_first_name, users.last_name as post_author_last_name, posts.title as post_title, users.username as comment_author_username, comments.body as comment_body
from comments
inner join users
on users.id = comments.users_id
inner join posts
on posts.id = posts_id
where comments.body ~* 'SSL|firewall' AND posts.content like '%nemo%';
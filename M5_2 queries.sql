-- INSERT INTO tags VALUES (DEFAULT, 'tag1'), (DEFAULT, 'tag2'), (DEFAULT, 'tag3'), (DEFAULT, 'tag4'), (DEFAULT, 'tag5'), (DEFAULT, 'tag6');

-- INSERT INTO videos VALUES (DEFAULT, 'title1', 'description1', 1, 'file1', 1.1, 'url1', 1, 1, 1, 'public'), 
-- 	(DEFAULT, 'title2', 'description2', 2, 'file2', 2.1, 'url2', 2, 2, 2, 'hidden'), 
--  (DEFAULT, 'title3', 'description3', 3, 'file3', 3.1, 'url3', 3, 3, 3, 'private'), 
--  (DEFAULT, 'title4', 'description4', 4, 'file4', 4.1, 'url4', 4, 4, 4, 'public'), 
--  (DEFAULT, 'title5', 'description5', 5, 'file5', 5.1, 'url5', 5, 5, 5, 'hidden'), 
--  (DEFAULT, 'title6', 'description6', 6, 'file6', 6.1, 'url6', 6, 6, 6, 'private'), 
--  (DEFAULT, 'title7', 'description7', 7, 'file7', 7.1, 'url7', 7, 7, 7, 'public'), 
--  (DEFAULT, 'title8', 'description8', 8, 'file8', 8.1, 'url8', 8, 8, 8, 'hidden'), 
--  (DEFAULT, 'title9', 'description9', 9, 'file9', 9.1, 'url9', 9, 9, 9, 'private'), 
--  (DEFAULT, 'title10', 'description10', 10, 'file10', 10.1, 'url10', 10, 10, 10, 'public')

-- INSERT INTO videostotags VALUES (DEFAULT, 1, 1), (DEFAULT, 2, 2), (DEFAULT, 2, 3), (DEFAULT, 3, 4), (DEFAULT, 3, 5), (DEFAULT, 4, 6),
-- 	(DEFAULT, 5, 1), (DEFAULT, 6, 2), (DEFAULT, 6, 3), (DEFAULT, 7, 4), (DEFAULT, 8, 5), (DEFAULT, 9, 6), (DEFAULT, 10, 1)

-- INSERT INTO user VALUES (DEFAULT, 'email1', 'password1', 'user1', '2001-01-01', 'F', 'country1', '11111'),
-- INSERT INTO user VALUES (DEFAULT, 'email2', 'password2', 'user2', '2002-02-02', 'M', 'country2', '22222'),
-- 	(DEFAULT, 'email3', 'password3', 'user3', '2003-03-03', 'F', 'country3', '33333'),
-- 	(DEFAULT, 'email4', 'password4', 'user4', '2004-04-04', 'M', 'country4', '44444'),
-- 	(DEFAULT, 'email5', 'password5', 'user5', '2005-05-05', 'F', 'country5', '55555')

-- INSERT INTO usertovideos VALUES (DEFAULT, 1, 1, DEFAULT), (DEFAULT, 1, 2, DEFAULT), (DEFAULT, 2, 3, DEFAULT),
-- 	(DEFAULT, 2, 4, DEFAULT), (DEFAULT, 3, 5, DEFAULT), (DEFAULT, 3, 6, DEFAULT), (DEFAULT, 4, 7, DEFAULT),
--  (DEFAULT, 4, 8, DEFAULT), (DEFAULT, 5, 9, DEFAULT), (DEFAULT, 5, 10, DEFAULT)

-- INSERT INTO playlists VALUES (DEFAULT, 'playlist1', DEFAULT, 'public'), (DEFAULT, 'playlist2', DEFAULT, 'private'),
-- 	(DEFAULT, 'playlist3', DEFAULT, 'public'), (DEFAULT, 'playlist4', DEFAULT, 'private'), (DEFAULT, 'playlist5', DEFAULT, 'public'),
--  (DEFAULT, 'playlist6', DEFAULT, 'private'), (DEFAULT, 'playlist7', DEFAULT, 'public')
    
-- INSERT INTO usertoplaylists VALUES (DEFAULT, 1, 1), (DEFAULT, 2, 2), (DEFAULT, 2, 3), (DEFAULT, 3, 4), (DEFAULT, 4, 5), (DEFAULT, 4, 6),
-- 	(DEFAULT, 5, 7)
    
-- INSERT INTO playliststovideos VALUES (DEFAULT, 1, 1), (DEFAULT, 1, 2), (DEFAULT, 1, 3), (DEFAULT, 2, 4), (DEFAULT, 3, 5), (DEFAULT, 3, 6),
-- 	(DEFAULT, 4, 7), (DEFAULT, 5, 8), (DEFAULT, 5, 9), (DEFAULT, 6, 10), (DEFAULT, 7, 1), (DEFAULT, 7, 1)

-- !!! Aquí he creat un canal inexistent per defecte per posar als users que no en tenen. Seria correcte?
-- INSERT INTO channels VALUES (DEFAULT, '-', '-', 0), (DEFAULT, 'channel1', 'descript1', DEFAULT), 
-- 	(DEFAULT, 'channel2', 'descript2', DEFAULT), (DEFAULT, 'channel3', 'descript3', DEFAULT),
--  (DEFAULT, 'channel4', 'descript4', DEFAULT)

-- INSERT INTO usertochannels VALUES (DEFAULT, 1, 1), (DEFAULT, 2, 2), (DEFAULT, 3, 3), (DEFAULT, 3, 4), (DEFAULT, 4, 5)

-- INSERT INTO subscriptors VALUES (DEFAULT, 1, 1), (DEFAULT, 2, 2), (DEFAULT, 3, 3), (DEFAULT, 3, 4)

-- INSERT INTO usertosubscriptors VALUES (DEFAULT, 2), (DEFAULT, 4), (DEFAULT, 4)

-- A continuació, els segments comentats no consegueixo que funcionin.
SELECT u.id, u.name AS client, u.email, c.name AS channel, c.description, p.name AS playlist, p.status, 
	v.title AS video, v.likes, v.dislikes, t.name AS tag
-- 	, u.name AS subscriptor
FROM user u, channels c, usertochannels utc, playlists p, usertoplaylists utp, playliststovideos ptv, 
	videos v, tags t, videostotags vtt
    -- , subscriptors s, usertosubscriptors uts
WHERE (u.id = utc.user_id AND c.id = utc.channels_id AND u.id = utp.user_id AND p.id = utp.playlists_id
	AND p.id = ptv.playlists_id AND v.id = ptv.videos_id AND v.id = vtt.videos_id AND t.id = vtt.tags_id
    -- AND u.id = uts.user_id AND c.id = s.channels_id AND uts.id = s.usertosubscriptors_id
    )
-- INSERT INTO users VALUES (DEFAULT, 'email1', 'password1', 'username1', '2001-01-01', 'f', 'country1', 11111, 'free'),
--  (DEFAULT, 'email2', 'password2', 'username2', '2002-02-02', 'm', 'country2', 22222, 'premium'),
--     (DEFAULT, 'email3', 'password3', 'username3', '2003-03-03', 'f', 'country3', 33333, 'premium'),
--     (DEFAULT, 'email4', 'password4', 'username4', '2004-04-04', 'm', 'country4', 44444, 'free');
    
-- INSERT INTO subscription VALUES (DEFAULT, 2, '2012-02-02', '2013-02-02', 'creditcard'),
--     (DEFAULT, 3, '2013-03-03', '2014-03-03', 'paypal');
       
-- INSERT INTO payments VALUES (DEFAULT, 2, DEFAULT, 200),
-- 	(DEFAULT, 2, DEFAULT, 220),
--     (DEFAULT, 3 DEFAULT, 300),
--     (DEFAULT, 3, DEFAULT, 330);

-- INSERT INTO card VALUES(DEFAULT, 1, '22222222222222222', '2020-02-00', 222);
    
-- INSERT INTO paypal VALUES(DEFAULT, 2, 'ppuser1');

-- INSERT INTO playlists VALUES (DEFAULT, 'playlist1', 1, DEFAULT, 'active', NULL, 'y'),
-- 	(DEFAULT, 'playlist2', 2, DEFAULT, 'active', NULL, 'n'),
--     (DEFAULT, 'playlist3', 3, DEFAULT, 'active', NULL, 'y'),
--     (DEFAULT, 'playlist4', 4, DEFAULT, 'active', NULL, 'n'),
--     (DEFAULT, 'playlist5', 5, DEFAULT, 'active', NULL, 'y'),
--     (DEFAULT, 'playlist6', 6, DEFAULT, 'erased', 2020-01-01, 'n'),
--     (DEFAULT, 'playlist7', 7, DEFAULT, 'erased', 2021-01-01, 'n');

-- INSERT INTO userstoplaylists VALUES (DEFAULT, 1, 1), (DEFAULT, 2, 2), (DEFAULT, 3, 3), (DEFAULT, 4, 4), (DEFAULT, 4, 5),
-- 	(DEFAULT, 4, 6), (DEFAULT, 3, 7);

-- INSERT INTO songs VALUES (DEFAULT, 'song1', '00:01:00', 1), (DEFAULT, 'song2', '00:02:00', 2), (DEFAULT, 'song3', '00:03:00', 3),
-- 	(DEFAULT, 'song4', '00:04:00', 4), (DEFAULT, 'song5', '00:05:00', 5), (DEFAULT, 'song6', '00:06:00', 6);
    
-- INSERT INTO songstoplaylists VALUES (DEFAULT, 1, 1), (DEFAULT, 2, 2), (DEFAULT, 3, 3), (DEFAULT, 4, 4), (DEFAULT, 5, 5),
-- 	(DEFAULT, 6, 6), (DEFAULT, 7, 1), (DEFAULT, 1, 2), (DEFAULT, 1, 3), (DEFAULT, 2, 3), (DEFAULT, 2, 4);

-- INSERT INTO songstoactive VALUES (DEFAULT, 1, 2, 2, DEFAULT), (DEFAULT, 1, 3, 3, DEFAULT), (DEFAULT, 3, 2, 2, DEFAULT),
-- 	(DEFAULT, 3, 4, 4, DEFAULT), (DEFAULT, 5, 4, 4, DEFAULT);

-- INSERT INTO favoritesong VALUES (DEFAULT, 1, 1), (DEFAULT, 2, 2), (DEFAULT, 3, 3), (DEFAULT, 4, 4), (DEFAULT, 1, 5), (DEFAULT, 1, 6),
-- 	(DEFAULT, 2, 4), (DEFAULT, 2, 6), (DEFAULT, 3, 5), (DEFAULT, 4, 6);
    
-- INSERT INTO artist VALUES (DEFAULT, 'artist1', 'url1'), (DEFAULT, 'artist2', 'url2'), (DEFAULT, 'artist2', 'url1');

-- INSERT INTO album VALUES (DEFAULT, 'album1', 1, 1991, 'url1'), (DEFAULT, 'album2', 2, 1992, 'url2'), 
-- 	(DEFAULT, 'album3', 2, 1993, 'url3');

-- INSERT INTO songstoalbum VALUES (DEFAULT, 1, 1), (DEFAULT, 2, 2), (DEFAULT, 3, 3), (DEFAULT, 1, 4), (DEFAULT, 2, 5), (DEFAULT, 3, 6);


-- !!! No sé com afegir al diagrama els apartats de cançó favorita, afegides per altres usuaris, favorits de l'usuari 
-- 	i artistes relacionats.

SELECT u.username, u.email, u.country, u.type, s.created, s.method, pl.name AS playlist, pl.type, pl.shared, sg.name AS song
FROM users u, subscription s, playlists pl, userstoplaylists utp, songs sg, songstoplaylists stp
WHERE (u.id = s.users_id AND u.id = utp.users_id AND pl.id = utp.playlists_id AND pl.id = stp.playlists_id AND sg.id = stp.songs_id
    )
UNION
SELECT u.username, u.email, u.country, u.type, NULL, NULL, pl.name AS playlist, pl.type, pl.shared, sg.name AS song
FROM users u, playlists pl, userstoplaylists utp, songs sg, songstoplaylists stp
WHERE (u.type LIKE 'free' AND u.id = utp.users_id AND pl.id = utp.playlists_id AND pl.id = stp.playlists_id AND sg.id = stp.songs_id
    )
ORDER BY username, playlist
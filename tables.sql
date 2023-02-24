-- Quiz 2

DROP TABLE IF EXISTS albums CASCADE;
DROP TABLE IF EXISTS tracks;

CREATE TABLE albums (
    album_id serial PRIMARY KEY,
    album_name TEXT NOT NULL,
    label TEXT NOT NULL,
    create_at timestamp(0) with time zone NOT NULL DEFAULT NOW ()
);

CREATE TABLE tracks (
    track_id serial PRIMARY KEY,
    song_name text NOT NULL,
    artist_name text NOT NULL,
    producer text NOT NULL,
    song_length time,
    album_id integer REFERENCES albums(album_id),
    create_at timestamp(0) with time zone NOT NULL DEFAULT NOW ()
);

INSERT INTO albums (album_name,label)
VALUES ('508-507-2209', 'Atlantic Records'),
('Kamikaze', 'Shady Records'),
('Cure Pain Riddim', 'Good Good Production'),
('Mwaka Moon', 'Capitol Records'),
('Binge', 'Bad Boy'),
('Blank Face LP', 'TDE'),
('Hookman For Hire', 'Lost Boro Entertainment'),
('ADHD', 'Twenty Nine Music Group'),
('Recovery', 'Shady Records'),
('Beerbongs & Bentleys', 'Republic Records');

INSERT INTO tracks (song_name,artist_name,producer,song_length, album_id)
VALUES ('Just Like You', 'Joyner Lucas', 'Decap', '00:02:54',1),
('Kamikaze', 'Eminem', 'Eminem', '00:03:56', 2),
('Lucky you', 'Eminem', 'Boi-1da', '00:04:04', 2),
('Where were u', 'Jahmiel', 'Jahmiel', '00:03:01', 3),
('God Knows', 'Kalash', 'Kalash', '00:03:26', 4),
('Lately', 'MGK', 'Ronny J', '00:03:15', 5),
('Forever', 'Joyner Lucas', 'Allen Pitter', '00:05:43',1),
('Fall', 'Eminem', 'Eminem', '00:04:22',2),
('Big League', 'Mavado', 'Mavado', '00:03:27', 3),
('Venom', 'Eminem', 'Eminem', '00:04:29',2),
('That Part (Black Hippy Remix)', 'Schoolboy Q', 'Sunwave', '00:04:49', 6),
('I am Sorry', 'Joyner Lucas', 'The Cratez', '00:05:49',1),
('Everthing Mi Want', 'Masicka', 'Masicka', '00:03:46', 3),
('Bigger than Life', 'Nipsey Hustle', 'Shuko', '00:05:03', 7),
('I Love', 'Joyner Lucas', 'TheSkyBeats', '00:03:30', 8),
('Devils Work', 'Joyner Lucas', 'SoSpecial', '00:04:45', 8),
('25 To Life', 'Eminem', 'DJ Khalil', '00:04:01', 9),
('Space Bound', 'Eminem', 'Jim Jonsin', '00:04:38', 9),
('Not Afraid', 'Eminem', 'Boi-1da', '00:04:10', 9),
('Rockstar', 'Post Malone', 'Bell', '00:03:38', 10),
('Psycho', 'Post Malone', 'Bell', '00:03:41', 10);

--Query One:

SELECT T.song_name, A.album_name
FROM tracks AS T
INNER JOIN albums AS A
ON T.album_id = A.album_id
ORDER BY song_name;

--Query Two:

SELECT A.album_name, T.song_name
FROM albums AS A
INNER JOIN tracks AS T
ON A.album_id = T.album_id
ORDER BY album_name;

--Query Three:
SELECT albums.album_name, COUNT(tracks.track_id) 
FROM tracks
LEFT JOIN albums 
ON tracks.album_id = albums.album_id
GROUP BY album_name;

--Query Four:

SELECT tracks.song_name, COUNT(albums.album_id) 
FROM albums
LEFT JOIN tracks 
ON albums.album_id = tracks.album_id
GROUP BY song_name;

-- Create the players table
CREATE TABLE players (
	player_id SERIAL PRIMARY KEY,
	username VARCHAR(50),
	country VARCHAR(50),
	level INTEGER,
	created_at DATE
);

-- Create the matches table
CREATE TABLE matches (
	match_id SERIAL PRIMARY KEY,
	match_player_id INTEGER REFERENCES players(player_id) ON DELETE CASCADE,
	mode VARCHAR(50),
	score INTEGER,
	result VARCHAR(10) CHECK (result IN ('win', 'loss')),
	played_at DATE
);

-- Insert sample players
INSERT INTO players (username, country, level, created_at)
VALUES
	('ShadowFox', 'Türkiye', 12, '2026-01-15'),
	('PixelQueen', 'Almanya', 25, '2026-02-03'),
	('IronWolf', 'Türkiye', 8, '2026-03-21'),
	('NovaStrike', 'Brezilya', 31, '2026-04-10'),
	('LunaBlade', 'Japonya', 3, '2026-10-28');

-- Insert sample matches
INSERT INTO matches (match_player_id, mode, score, result, played_at)
VALUES
	(1, 'ranked', 1450, 'win', '2026-10-20'),
	(1, 'casual', 980, 'loss', '2026-10-21'),
	(2, 'ranked', 2100, 'win', '2026-10-21'),
	(2, 'ranked', 1870, 'win', '2026-10-22'),
	(2, 'casual', 1200, 'loss', '2026-10-23'),
	(3, 'casual', 640, 'loss', '2026-10-24'),
	(4, 'ranked', 2450, 'win', '2026-10-25'),
	(4, 'ranked', 2300, 'loss', '2026-10-26');
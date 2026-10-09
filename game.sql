-- =============================================================
-- game.sql  ·  SQL Werkplaats, hoofdstuk 5
-- Maakt de database 'game' (leaderboard van Pixel Runner) en vult hem.
-- Voer dit bestand uit als één script.
-- LET OP: bestaat 'game' al, dan wordt hij eerst verwijderd.
-- =============================================================
DROP DATABASE IF EXISTS game;

CREATE DATABASE game;

USE game;

CREATE TABLE gebruiker (
    gebruiker_id   INT          PRIMARY KEY,
    gebruikersnaam VARCHAR(30)  NOT NULL UNIQUE,
    email          VARCHAR(100) NOT NULL,
    land           VARCHAR(50),
    aangemaakt_op  DATE
);

CREATE TABLE highscore (
    highscore_id INT      PRIMARY KEY AUTO_INCREMENT,
    gebruiker_id INT      NOT NULL,
    score        INT      NOT NULL,
    level        INT,
    gespeeld_op  DATETIME,
    FOREIGN KEY (gebruiker_id) REFERENCES gebruiker(gebruiker_id)
);

INSERT INTO gebruiker (gebruiker_id, gebruikersnaam, email, land, aangemaakt_op) VALUES
(1, 'PixelPia', 'pia@example.com', 'Nederland', '2026-01-12'),
(2, 'NoScopeNoah', 'noah@example.com', 'Nederland', '2026-01-15'),
(3, 'LunaLag', 'luna@example.com', 'België', '2026-02-03'),
(4, 'CaptainCrash', 'kevin@example.com', 'Nederland', '2026-02-20'),
(5, 'Byte_Bram', 'bram@example.com', 'Nederland', '2026-03-01'),
(6, 'ZoëZoom', 'zoe@example.com', 'België', '2026-03-18'),
(7, 'GlitchGirl', 'sara@example.com', 'Duitsland', '2026-04-02'),
(8, 'TurboTim', 'tim@example.com', 'Nederland', '2026-05-09'),
(9, 'MoMoney', 'mohammed@example.com', 'Nederland', '2026-06-21'),
(10, 'SilentSam', 'sam@example.com', 'Duitsland', '2026-08-30');

INSERT INTO highscore (highscore_id, gebruiker_id, score, level, gespeeld_op) VALUES
(1, 1, 12450, 7, '2026-09-01 19:12:00'),
(2, 1, 15890, 9, '2026-09-05 20:45:00'),
(3, 1, 9870, 5, '2026-09-12 16:03:00'),
(4, 1, 18320, 10, '2026-09-20 21:30:00'),
(5, 2, 8760, 4, '2026-09-02 15:20:00'),
(6, 2, 11200, 6, '2026-09-09 18:44:00'),
(7, 2, 13050, 7, '2026-09-25 22:10:00'),
(8, 3, 21400, 12, '2026-09-03 20:00:00'),
(9, 3, 19870, 11, '2026-09-14 19:35:00'),
(10, 3, 23990, 13, '2026-09-28 21:05:00'),
(11, 4, 3150, 2, '2026-09-04 14:12:00'),
(12, 4, 4210, 2, '2026-09-06 14:55:00'),
(13, 4, 2890, 1, '2026-09-18 13:40:00'),
(14, 4, 5020, 3, '2026-09-27 15:15:00'),
(15, 5, 10500, 6, '2026-09-07 17:25:00'),
(16, 5, 14780, 8, '2026-09-21 20:18:00'),
(17, 6, 16640, 9, '2026-09-08 19:50:00'),
(18, 6, 17010, 9, '2026-09-16 20:22:00'),
(19, 6, 20550, 11, '2026-09-29 21:48:00'),
(20, 7, 7340, 4, '2026-09-10 16:30:00'),
(21, 7, 9980, 5, '2026-09-19 17:05:00'),
(22, 8, 25480, 14, '2026-09-11 23:15:00'),
(23, 8, 24100, 13, '2026-09-17 22:40:00'),
(24, 8, 26900, 15, '2026-09-30 23:55:00'),
(25, 9, 6120, 3, '2026-09-13 12:10:00'),
(26, 9, 0, 1, '2026-09-15 12:45:00'),
(27, 9, 8450, 4, '2026-09-26 13:30:00');

-- Controle: 10 gebruikers en 27 highscores
SELECT (SELECT COUNT(*) FROM gebruiker) AS gebruikers,
       (SELECT COUNT(*) FROM highscore) AS highscores;

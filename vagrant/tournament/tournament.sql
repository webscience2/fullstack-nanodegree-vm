-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE  IF EXISTS tournament; 
CREATE DATABASE tournament; 

\c tournament

DROP TABLE IF EXISTS player;
-- PLAYER table
CREATE TABLE player (
    player_id SERIAL primary key,
    name  varchar(40) NOT NULL CHECK (name <> '')
); 

DROP TABLE IF EXISTS match;
-- MATCH table
CREATE TABLE match (
    match_id serial primary key,
    pida integer NOT NULL references player(player_id),
    pidb integer NOT NULL references player(player_id),
    result integer NOT NULL references player(player_id)
);

--Create a view with sorted ranked players.
CREATE VIEW ranking AS 
select player_id as player_id ,name as name,
                sum
                   (case when player_id=result then 1
                    else 0
                    END) as wins,
                count(distinct(match_id)) as match_count
                from player
                left outer join match on
                (match.pida=player_id or match.pidb=player_id)
                group by player_id order by WINS desc;


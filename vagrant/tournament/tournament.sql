-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE  IF EXISTS tournament; 

CREATE DATABASE tournament; 

DROP TABLE IF EXISTS player;
-- PLAYER table
CREATE TABLE player (
    player_id SERIAL primary key,
    name  varchar(40) NOT NULL CHECK (name <> ''),
    wins integer, 
    player_losses integer,
    ranking integer
); 

DROP TABLE IF EXISTS match;
-- MATCH table
CREATE TABLE match (
    match_id serial primary key,
    pida integer NOT NULL,
    pidb integer NOT NULL,
    result integer NOT NULL
);

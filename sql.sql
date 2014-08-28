DROP TABLE song;

ALTER TABLE song DROP PRIMARY KEY;

ALTER TABLE album DROP INDEX FK_1nh34aosh1k5u4d8psyf915ty;
ALTER TABLE album DROP column genre;
DROP TABLE album;

delete from store;
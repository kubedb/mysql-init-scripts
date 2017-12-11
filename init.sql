CREATE DATABASE IF NOT EXISTS test;

use test;

CREATE TABLE IF NOT EXISTS Dashboard(
	id int,
    version int,
    slug varchar(255),
    title varchar(255),
    data text NOT NULL,
    org_id int NOT NULL
)



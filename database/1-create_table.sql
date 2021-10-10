CREATE DATABASE ezcook
go
CREATE TABLE usertable(
                          id_user  int NOT NULL  PRIMARY KEY,
                          username VARCHAR(255) UNIQUE NOT NULL,
                          password_user VARCHAR(255) NOT NULL,
                          fullname VARCHAR(255) NOT NULL,
                          email VARCHAR(255) NOT NULL,
                          createddate TIMESTAMP ,
                          modifieddate TIMESTAMP,
                          id_role int
)
    go
CREATE TABLE roletb(
                          id_role   int NOT NULL PRIMARY KEY,
                          name_role VARCHAR(255) UNIQUE NOT NULL,
                          createddate TIMESTAMP ,
                          modifieddate TIMESTAMP
)
    go
CREATE TABLE commenttable(
                             id_comment   int NOT NULL  PRIMARY KEY,
                             id_user  int NOT NULL,
                             content_comment TEXT  NOT NULL,
                             time_comment TIMESTAMP ,
                             createddate TIMESTAMP ,
                             modifieddate TIMESTAMP,
                             id_food int

)
    go

CREATE TABLE food(
                     id_food   int NOT NULL PRIMARY KEY,
                     name_food VARCHAR(255) UNIQUE NOT NULL,
                     image VARCHAR(255) NULL,
                     content_food TEXT  NOT NULL,
                     link_video VARCHAR(255),
                     createddate TIMESTAMP ,
                     modifieddate TIMESTAMP,
                     id_foodtype INT
)
    go
CREATE TABLE foodtype(
                         id_foodtype   int NOT NULL  PRIMARY KEY,
                         name_foodtype VARCHAR(255) UNIQUE NOT NULL,
                         createddate TIMESTAMP ,
                         modifieddate TIMESTAMP
)

CREATE TABLE statisticstable(
                                id_statistics   int NOT NULL PRIMARY KEY,
                                visits  int ,
                                comment_count  int ,
                                createddate TIMESTAMP ,
                                modifieddate TIMESTAMP
)
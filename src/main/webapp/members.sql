use jsp_db;

create table members(
  id varchar(20),       
  passwd varchar(20),
  name varchar(20),
  email varchar(20),
  manager int DEFAULT 0,
  PRIMARY KEY(id)
)
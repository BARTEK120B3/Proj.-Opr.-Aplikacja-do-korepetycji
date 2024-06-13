CREATE USER "admin"@"#" IDENTIFIED BY "123";
GRANT ALL PRIVILEGES ON tutorsFind.* TO "admin"@"#" WITH GRANT OPTION;

CREATE USER "user"@"#" IDENTIFIED BY "456";
GRANT SELECT,INSERT ON tutorsFind.* TO "user"@"#";

CREATE USER "userUpdate"@"#" IDENTIFIED BY "789";
GRANT UPDATE ON tutorsFind.* TO "userUpdate"@"#";

CREATE USER "userDelete"@"#" IDENTIFIED BY "098";
GRANT DELETE ON tutorsFind.* TO "userDelete"@"#";




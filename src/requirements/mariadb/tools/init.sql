ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';

-- созданиe пользователя с настраиваемыми правами
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;
-- grant all privileges on mydb database to user
-- CREATE — позволяет пользователю создавать новые таблицы или базы данных
-- DROP — позволяет пользователю удалять таблицы или базы данных
-- DELETE — позволяет пользователю удалять строки из таблиц
-- INSERT — позволяет пользователю вставлять строки в таблицы
-- SELECT — позволяет пользователю выполнять команду SELECT для чтения данных из базы
-- UPDATE — позволяет пользователю обновлять строки таблицы
-- GRANT type_of_permission ON database_name.table_name TO 'username'@'localhost';
-- SHOW GRANTS FOR 'username'@'localhost';
-- mysql -u [username] -p // login as a user [username]
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO '$MYSQL_USER'@'%';

FLUSH PRIVILEGES; -- not necessary, to tell the server to reload the grant tables, server reloads the grant tables instantly
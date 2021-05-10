@echo off
rem Recover PostgreSQL database backup

rem Run the batch script:
rem recoverDb.bat hdiventerprise-YY_MM_DD.sql

rem Set the following properties inside the script:
rem PG_FILENAME: The name of the file to be restored. It is the first argument of the batch. 
rem PG_BIN: Path to PostgreSQL installation folder.
rem PG_HOST: The ip of the server where the database is.
rem PG_PORT: The port where postgreSQL is lintening. The default value is 5432
rem PG_DATABASE: The name of the database. Default value is hdiventerprise.
rem PG_OWNER: The owner of the restored database. Default value is hdiv.
rem PG_USER: The user of the database. Default value is hdiv.
rem PGPASSWORD: The password of the database. Default value is hdiv-enterprise.
rem PG_PATH: The path where backups are stored. Default backup script uses backup folder, so default values is backup.

@echo Restoring database

SET PG_FILENAME=%1
SET PG_BIN="{postgresql_path}\bin\"
SET PG_HOST=localhost
SET PG_PORT=5432
SET PG_DATABASE=hdiventerprise
SET PG_OWNER=hdiv
SET PG_USER=hdiv
rem set password using PGPASSWORD variable or using pgpass file: https://www.postgresql.org/docs/9.3/libpq-pgpass.html
SET PGPASSWORD=hdiv-enterprise
SET PG_PATH=backup

%PG_BIN%dropdb.exe -h %PG_HOST% -p %PG_PORT% -U %PG_USER% --if-exists %PG_DATABASE%

%PG_BIN%createdb.exe -h %PG_HOST% -p %PG_PORT% -U %PG_USER% -O %PG_OWNER% %PG_DATABASE%

%PG_BIN%pg_restore.exe -h %PG_HOST% -p %PG_PORT% -U %PG_USER% -d %PG_DATABASE% -v "%PG_PATH%\%PG_FILENAME%"

@echo Database %PG_DATABASE% restored from file %PG_PATH%\%PG_FILENAME%

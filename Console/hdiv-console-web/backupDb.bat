@echo off
rem Create PostgreSQL database backup

rem Run the batch script:
rem backupDb.bat

rem Set the following properties inside the script:
rem PG_BIN: Path to pg_dump.exe including the executable.
rem PG_HOST: The ip of the server where the database is.
rem PG_PORT: The port where postgreSQL is lintening. The default value is 5432
rem PG_DATABASE: The name of the database. Default value is hdiventerprise.
rem PG_USER: The user of the database. Default value is hdiv.
rem PGPASSWORD: The password of the database. Default value is hdiv-enterprise.
rem PG_PATH: The path where backups are stored.

@echo off
SET PG_BIN="{postgresql_path}\pg_dump.exe"
SET PG_HOST=localhost
SET PG_PORT=5432
SET PG_DATABASE=hdiventerprise
SET PG_USER=hdiv
rem set password using PGPASSWORD variable or using pgpass file: https://www.postgresql.org/docs/9.3/libpq-pgpass.html
SET PGPASSWORD=hdiv-enterprise
SET PG_PATH=backup

@echo Backup database: %PG_DATABASE%

FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO set DTS=%%a
set CUR_DATE=%DTS:~0,4%_%DTS:~4,2%_%DTS:~6,2%
SET PG_FILENAME=%PG_PATH%\%PG_DATABASE%_%CUR_DATE%.backup

%PG_BIN% -Fc -h %PG_HOST% -p %PG_PORT% -U %PG_USER% %PG_DATABASE% > %PG_FILENAME%

@echo Backup finished: %PG_FILENAME%
#!/bin/bash

# Recover PostgreSQL database backup

# Run the script:
# recoverDb.sh hdiventerprise-YY_MM_DD.sql

# Set the following properties inside the script:
# PG_FILENAME: The name of the file to be restored. It is the first argument of the batch. 
# PG_BIN: Path to PostgreSQL installation folder.
# PG_HOST: The ip of the server where the database is.
# PG_PORT: The port where postgreSQL is lintening. The default value is 5432
# PG_DATABASE: The name of the database. Default value is hdiventerprise.
# PG_OWNER: The owner of the restored database. Default value is hdiv.
# PG_USER: The user of the database. Default value is hdiv.
# PGPASSWORD: The password of the database. Default value is hdiv-enterprise.
# PG_PATH: The path where backups are stored. Default backup script uses backup folder, so default values is backup.

echo "Restoring database"

PG_FILENAME=$1
PG_HOST=localhost
PG_PORT=5432
PG_DATABASE=hdiventerprise
PG_OWNER=hdiv
PG_USER=hdiv
# set password using PGPASSWORD variable or using pgpass file: https://www.postgresql.org/docs/9.3/libpq-pgpass.html
PGPASSWORD=hdiv-enterprise
PG_PATH=./backup

dropdb -h $PG_HOST -p $PG_PORT -U $PG_USER --if-exists $PG_DATABASE

createdb -h $PG_HOST -p $PG_PORT -U $PG_USER -O $PG_OWNER $PG_DATABASE

pg_restore -h $PG_HOST -p $PG_PORT -U $PG_USER -d $PG_DATABASE -v "$PG_PATH/$PG_FILENAME"

echo "Database $PG_DATABASE restored from file $PG_PATH/$PG_FILENAME"

#!/bin/bash

# Create PostgreSQL database backup

# Run the script:
# backupDb.sh

# Set the following properties inside the script:
# PG_HOST: The ip of the server where the database is.
# PG_PORT: The port where postgreSQL is lintening. The default value is 5432
# PG_DATABASE: The name of the database. Default value is hdiventerprise.
# PG_USER: The user of the database. Default value is hdiv.
# PGPASSWORD: The password of the database. Default value is hdiv-enterprise.
# PG_PATH: The path where backups are stored. Default backup script uses backup folder, so default values is backup.

PG_HOST=localhost
PG_PORT=5432
PG_DATABASE=hdiventerprise
PG_USER=hdiv
# set password using PGPASSWORD variable or using pgpass file: https://www.postgresql.org/docs/9.3/libpq-pgpass.html
PGPASSWORD=hdiv-enterprise
PG_PATH="./backup"

DATE=$(date +"%y_%m_%d")
FILE="$PG_DATABASE-$DATE"

mkdir -p $PG_PATH

PG_BAK_NOW () {
  pg_dump -Fc -h $PG_HOST -p $PG_PORT -U $PG_USER $PG_DATABASE -f $FILE.backup
}

echo "Dumped to $FILE.backup"

cd $PG_PATH
if [ -f "$FILE" ];
then
  rm $FILE
  PG_BAK_NOW
else
  PG_BAK_NOW
fi

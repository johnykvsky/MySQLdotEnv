#!/bin/sh

#sample .env entry: DATABASE_URL=mysql://user:pass@db:3306/dbname

if [ "$1" != "" ]; then
    DB_ENV_PATH="$1"
else
    echo "Missing path to .env file"
    exit 0
fi

if [ -f "$DB_ENV_PATH" ]; then
    DIR=$(readlink -f "$DB_ENV_PATH")
else 
    echo "$DB_ENV_PATH does not exist"
fi

DATABASE_URL=$(cat "$DB_ENV_PATH" | sed -n -e '/^DATABASE_URL=/p')

DB_PASSWORD=$(echo "$DATABASE_URL" | sed -e 's/.*\/\/\(.*\)@.*/\1/' | sed 's/.*://')
DB_USER=$(echo "$DATABASE_URL" | sed -e 's/.*\/\/\(.*\)@.*/\1/' | sed 's/:.*//')
DB_PORT=$(echo "$DATABASE_URL" | sed -e 's/.*@\(.*\)\/.*/\1/' | sed 's/.*://')
DB_HOST=$(echo "$DATABASE_URL" | sed -e 's/.*@\(.*\)\/.*/\1/' | sed 's/:.*//')
DB_DATABASE=$(echo "$DATABASE_URL" | sed -e 's/.*\///')

mysql -u$DB_USER -p$DB_PASSWORD -h$DB_HOST $DB_DATABASE
#!/bin/sh
SMF_ROOT="$1"
if [ -z "$SMF_ROOT" ]; then
  cat >&2 <<EOF
Syntax:
  $0 /path/to/smf/installation/
EOF
  exit 1
fi
set -e
SQL_FILE=`dirname $0`/`basename $0 .sh`.sql
PHP_FILE=`dirname $0`/`basename $0 .sh`.php
php "$PHP_FILE" "$SMF_ROOT" | (
read DB_USER
read DB_PASSWORD
read DB_NAME
mysql "-u$DB_USER" "-p$DB_PASSWORD" "$DB_NAME" < "$SQL_FILE"
)


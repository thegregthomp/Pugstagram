#!/bin/bash
echo "SN ENV: $ENV"
if [ "$ENV" == "DEV" ]; then
	forever /Development/bin/www
elif [ "$ENV" == "PROD" ]; then
	forever var/www/bin/www
else
	echo "NO ENV"
fi
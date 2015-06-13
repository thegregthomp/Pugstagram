#!/bin/sh

elif [ "$ENV" == "PROD" ]; then
	forever /bin/www
else
	forever var/www/bin/www
fi
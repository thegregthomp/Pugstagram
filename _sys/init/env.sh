#!/bin/bash

if [ "$ENV" == "DEV" ]; then
	echo "ENV is $ENV"
elif [ "$ENV" == "PROD" ]; then
	echo "ENV is $ENV"
else
	echo "NO ENV"
fi
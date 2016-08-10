#!/bin/bash

# Set current working directory to the directory the deploy script is in
cd "$(dirname "$0")"

DOCKER_HOME=../
BACKUP_FOLDER=./backup

# Create backup folder if needed
if [ ! -d $BACKUP_FOLDER ]; then
	mkdir $BACKUP_FOLDER
fi

if [ -f *.jar ]; then
	echo "Overwriting jarfile in $DOCKER_HOME/backend/"
	mv $DOCKER_HOME/backend/*.jar $BACKUP_FOLDER/
	mv *.jar $DOCKER_HOME/backend/
fi

if [ -f client.zip ]; then
	echo "Overwriting content in $DOCKER_HOME/frontend/"
	zip -r $BACKUP_FOLDER/client.zip $DOCKER_HOME/frontend/content
	rm -rf $DOCKER_HOME/frontend/content
	unzip client.zip -d $DOCKER_HOME/frontend/content
	rm client.zip
fi

cd $DOCKER_HOME
docker-compose build
docker-compose up -d

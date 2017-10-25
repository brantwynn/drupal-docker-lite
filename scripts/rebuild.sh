#!/bin/bash

. "${0%/*}/util/init.sh"

docker-compose pull
docker-compose build --pull

if [ $? -ne 0 ]; then
  echo "There was an error re-building. Please consult the log and file an issue if appropriate"
  exit 1
fi

docker-compose down
${0%/*}/start.sh

if [ $? -ne 0 ]; then
  exit 1
fi

echo "Better, stronger, faster, I have been rebuilt"

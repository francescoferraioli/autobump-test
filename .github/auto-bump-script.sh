#!/usr/bin/env bash

AUTOBUMPS=$(echo $AUTOBUMP_RUN | tr ";" "\n")

for AUTOBUMP in $AUTOBUMPS
do
    echo "> [$AUTOBUMP]"
    BRANCH=$(   echo "${AUTOBUMP}" | sed 's/\(.*\)|.*|.*|.*|.*/\1/')
    NAME=$(     echo "${AUTOBUMP}" | sed 's/.*|\(.*\)|.*|.*|.*/\1/')
    DIR=$(      echo "${AUTOBUMP}" | sed 's/.*|.*|\(.*\)|.*|.*/\1/')
    BUMP=$(     echo "${AUTOBUMP}" | sed 's/.*|.*|.*|\(.*\)|.*/\1/')
    VERSION=$(  echo "${AUTOBUMP}" | sed 's/.*|.*|.*|.*|\(.*\)/\1/')
    echo "> [$BRANCH]"
    echo "> [$NAME]"
    echo "> [$DIR]"
    echo "> [$BUMP]"
    echo "> [$VERSION]"

    git checkout $BRANCH
    [ ! -z "$DIR" ] && pushd $DIR
    npm version $VERSION
    git add package.json
    git commit -m "Bump $BUMP on $NAME ($VERSION)"
    git push
    [ ! -z "$DIR" ] && popd
done
#!/usr/bin/env bash

AUTOBUMPS=$(echo $AUTOBUMP_RUN | tr ";" "\n")

for AUTOBUMP in $AUTOBUMPS
do
    echo "> [$AUTOBUMP]"
done
#!/bin/bash

echo "*********************"
echo "*** Pushing image ***"
echo "*********************"

IMAGE="maven-project"

echo "*** Logging in ***"
docker login -u <docker-registry> -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG <docker-registry>/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push <docker-registry>/$IMAGE:$BUILD_TAG
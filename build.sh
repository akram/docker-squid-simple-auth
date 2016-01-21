#!/usr/bin/env bash
cd $(dirname $0)
docker build -t akram/docker-squid-simple-auth .
docker build -t akrambenaissi/docker-squid-simple-auth .
docker tag -f $(docker build . |grep built | cut -f3 -d\ ) docker-squid-simple-auth:latest


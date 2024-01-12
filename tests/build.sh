#!/usr/bin/env bash
cp -rf docker/* ./
rm -f README.md 
mv README-new.md README.md 
docker buildx build . --output type=docker,name=elestio4test/gitlab:latest | docker load

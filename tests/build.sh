#!/usr/bin/env bash
cp -rf docker/* ./
docker buildx build . --output type=docker,name=elestio4test/gitlab:latest | docker load

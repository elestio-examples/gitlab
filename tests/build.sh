#!/usr/bin/env bash
cp docker/* ./
docker buildx build . --output type=docker,name=elestio4test/gitlab:latest | docker load
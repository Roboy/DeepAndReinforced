#!/usr/bin/env bash
xhost +local:root
docker run -v $(pwd):/root/develDeepAndReinforced -itp 11111:11311 --network=host deepandreinforced/rl:latest

#!/usr/bin/env bash
xhost +local:root
docker run -v $(pwd):/root/develDeepAndReinforced -itp 11111:11311 --network=host 22ae61b3ad48
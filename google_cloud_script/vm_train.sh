#!/usr/bin/env bash
# Launch this training script from within the Virtual Machine on Gcloud
RESULTS_DIR=./training_results
mkdir ${RESULTS_DIR} && docker run -v ${RESULTS_DIR}:${RESULTS_DIR} deepandreinforced/rl:latest /bin/bash /root/DeepAndReinforced/google_cloud_script_train_docker.sh

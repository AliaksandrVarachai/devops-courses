#!/usr/bin/env bash

# example 1
# ./quality-check.sh

npm run lint

npm run test

npm audit

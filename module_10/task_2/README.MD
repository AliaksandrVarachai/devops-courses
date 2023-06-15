# Task 2: Dockerize a back-end app

## 1. Dockerize a backend app

Link to [back-end-app](https://github.com/EPAM-JS-Competency-center/nestjs-rest-api/tree/feat/devops-cicd-lab)

Dockerization steps:
- Added `.dockerignore` file
- Added `Dockerfile`. Container is created with command `docker build -t nestjs-rest-api .`

## 2. Published image into free 

Publishing steps:
- `docker login`
- `docker tag nestjs-rest-api epamaliaksandrvarachai/nestjs-rest-api:1.0.1`
- `docker push epamaliaksandrvarachai/nestjs-rest-api:1.0.1`

Link to the pushed image: [epamaliaksandrvarachai/nestjs-rest-api:1.0.1](https://hub.docker.com/layers/epamaliaksandrvarachai/nestjs-rest-api/1.0.1/images/sha256-6b659d261934dbae09880a04768cc59b3e201ef2a73ca26f7d3c8cdf572c1a7e?context=repo)

## 3. Creation automation script

Building and publishing of a docker image is automated with `build_docker_image.sh` script.

Result: uploaded docker image [epamaliaksandrvarachai/nestjs-rest-api:1.0.3](https://hub.docker.com/layers/epamaliaksandrvarachai/nestjs-rest-api/1.0.3/images/sha256-dd94b4dbded675ea2d5a129375d11b3a9d47cd7dcd0f9a2b738f408567fe43e4?context=repo)

## 4. Pulling and running of the created image

Steps:
- `docker pull epamaliaksandrvarachai/nestjs-rest-api:1.0.3`
- `docker run -d -p 8080:8080 epamaliaksandrvarachai/nestjs-rest-api:1.0.3`

## 5. [optional] Running the docker on VM

Not implemented

## 6. [optional] Creating of docker-compose.yml file

Not implemented

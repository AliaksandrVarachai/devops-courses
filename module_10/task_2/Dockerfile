# docker build -t nestjs-rest-api .
# docker run -p 8080:8080 nestjs-rest-api

FROM node:20-alpine3.17

ENV WORK_DIR="/app"

WORKDIR $WORK_DIR

COPY . $WORK_DIR

RUN ["npm", "ci"]
RUN ["npm", "run", "build"]

EXPOSE 8080

CMD ["npm", "run", "start:prod"]

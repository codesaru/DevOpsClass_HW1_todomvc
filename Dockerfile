# We Use an official Node version 15 image as a parent image
FROM node:15

# Create app directory for example app
# NOTE: all the directives that follow in the Dockerfile will be executed in
# that directory.
WORKDIR /usr/src/app

# Copy the package.json file into our app directory
COPY . /usr/src/app/

# Install any needed packages specified in package.json
RUN npm install

RUN ls /usr/src/app
RUN ls /usr/src/app/public

EXPOSE 3000

CMD npm start

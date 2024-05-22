# Use the slim version of the node 14 image as our base
FROM node:18-alpine

# Create a directory for our application in the container 
RUN mkdir -p /usr/src/app

# Set this new directory as our working directory for subsequent instructions
WORKDIR /usr/src/app

# Copy all files in the current directory into the container
COPY package.json .
COPY package-lock.json .

COPY . .

RUN npm install
RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]
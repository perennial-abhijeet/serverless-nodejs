# Use the official Node.js runtime as a base image
# FROM node:14
FROM public.ecr.aws/lambda/nodejs:16

# Set the working directory in the container
WORKDIR /app

# Copy your Lambda function code into the container
COPY . /app

# Install the dependencies using npm (you may need package.json and package-lock.json)
RUN npm install

# Expose port 8080 (you can change this if your Lambda function listens on a different port)
EXPOSE 8080

# Define the command to run your Lambda function (replace "index.js" with your Lambda function file)
CMD ["node", "handler.js"]
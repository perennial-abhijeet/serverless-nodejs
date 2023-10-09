# Use the official AWS Lambda Node.js runtime as the base image
FROM public.ecr.aws/lambda/nodejs:16

# Set the working directory to /var/task (default for AWS Lambda)
WORKDIR /var/task

# Copy package.json and package-lock.json (if it exists) to the working directory
COPY package*.json ./

# Install Node.js dependencies and clean the npm cache
RUN npm install && npm cache clean --force

# Copy the rest of your application code to the working directory
COPY . .

# Define the command to run your Lambda function (replace index.js with the actual entry point)
CMD ["index.handler"]

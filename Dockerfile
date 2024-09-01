# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirments.txt .

# Install any dependencies
RUN pip3 install --no-cache-dir -r requirments.txt

# Copy the current directory contents into the container at /app
COPY . .

# Set environment variables
ENV FLASK_RUN_HOST=0.0.0.0

# Update with your actual Flask app filename
ENV FLASK_APP=app2.py  

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define the command to run your app using flask
CMD [ "flask", "run" ]
# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Make port 5001 available to the world outside this container
EXPOSE 5001

# Define the command to run the app using Gunicorn, a production-ready server
CMD ["gunicorn", "--bind", "0.0.0.0:5001", "app:app"]

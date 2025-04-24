# Use the official Python 3.7 image based on Alpine Linux (small and lightweight)
FROM python:3.7-alpine

# Set the working directory inside the container to /code
WORKDIR /code

# Set environment variable to tell Flask which app to run
ENV FLASK_APP=app.py

# Allow Flask to listen on all network interfaces
ENV FLASK_RUN_HOST=0.0.0.0

# Install required system dependencies (for compiling Python packages)
RUN apk add --no-cache gcc musl-dev linux-headers

# Copy the requirements file into the container
COPY requirements.txt requirements.txt

# Install Python dependencies listed in requirements.txt
RUN pip install -r requirements.txt

# Expose port 5000 so the app is accessible outside the container
EXPOSE 5000

# Copy the rest of the application code into the container
COPY . .

# Command to run the Flask app when the container starts
CMD ["flask", "run"]


# Use the official Python image from the Docker Hub
FROM python:3.11

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . /app/

# Make port 8502 available to the world outside this container
EXPOSE 8502

# Define environment variable
ENV NEW NEWSY_BOT

# Run app.py when the container launches
CMD ["streamlit", "run", "--server.port", "8502", "--server.address", "0.0.0.0", "main.py"]

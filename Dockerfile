# Use an official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.13.5-alpine3.22

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
# --no-cache-dir: Disables the cache, which reduces the image size
# -r requirements.txt: Installs packages from the given requirements file.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
# --host 0.0.0.0 is required to make the application accessible from outside the container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

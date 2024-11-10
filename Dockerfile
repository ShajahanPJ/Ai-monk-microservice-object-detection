# Dockerfile
# Use the official Python image
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Install required system packages
RUN apt-get update -qq && \
    apt-get install -y -qq \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the yolov5 folder (including the backend folder)
COPY yolov5 ./yolov5

# Expose the port FastAPI will run on
EXPOSE 8000

# Run the app with a non-root user for security
RUN adduser --disabled-password --gecos '' appuser && chown -R appuser /app
USER appuser

# Command to run the FastAPI app (adjust path if necessary)
CMD ["uvicorn", "yolov5.backend.app:app", "--host", "0.0.0.0", "--port", "8000"]

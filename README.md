# Ai-monk-object-detection-microservice

## Object Detection Microservice

### Overview
This microservice consists of a UI backend (Flask) for image upload and an AI backend (FastAPI) for object detection using YOLOv5.

### Prerequisites
- Docker
- Python 3.8+
- Clone [ultralytics/yolov5](https://github.com/ultralytics/yolov3) for AI backend.

### Running the Application
1. Clone this repository.
2. Build and run the services:
   ```bash
   docker-compose up --build

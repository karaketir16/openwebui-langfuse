# OLLAMA + OPEN-WEBUI + PIPELINES + LANGFUSE

## Introduction

This repository provides a setup for integrating OLLAMA, OPEN-WEBUI, PIPELINES, and LANGFUSE using Docker. Follow the steps below to get everything up and running.

## Prerequisites

- Docker and required GPU drivers installed on your system.

## Installation

1. **Clone this repository:**
   ```bash
   git clone https://github.com/karaketir16/openwebui-langfuse.git
   cd openwebui-langfuse
   ```

2. **Run the setup script:**
   ```bash
   ./run-compose.sh
   ```
   or
   ```bash
   docker compose up -d
   #default driver is nvidia
   ```

## Configuration

### Langfuse Setup

1. **Download the `langfuse_filter_pipeline.py` file:**
   - You can download it from [here](https://github.com/open-webui/pipelines/blob/main/examples/filters/langfuse_filter_pipeline.py), or use the provided file in `example/langfuse_filter_pipeline.py`.

2. **Access Langfuse:**
   - Open your browser and go to `http://localhost:4000`.

3. **Create an Admin Account and Project:**
   - Create an admin account and then create a project.
   - Go to Project Settings and create an API key.
   - Retrieve the secret key and public key.

4. **Update the Pipeline Script:**
   - Replace `your-secret-key-here` with your secret key, `your-public-key-here` with your public key, and `https://cloud.langfuse.com` with `http://langfuse:4000` in `langfuse_filter_pipeline.py`.
   - **Note:** If you are using the example in this repository, replace the secret key and public key with your own keys.

### Open-WebUI Setup

1. **Access Open-WebUI:**
   - Open your browser and go to `http://localhost:3000`.

2. **Create an Admin Account:**
   - Create an admin account.

3. **Upload the Pipeline Script:**
   - Navigate to `Settings -> Admin Settings -> Pipelines`.
   - In the `Upload Pipeline` section, select the `langfuse_filter_pipeline.py` file and click the upload button.

4. **Monitor Usage:**
   - You can now monitor Open-WebUI usage statistics from Langfuse.

### Model Downloading

1. **Access Open-WebUI:**
   - Open your browser and go to `http://localhost:3000`.

2. **Create an Admin Account:**
   - Create an admin account.

3. **Pull Models:**
   - Navigate to `Settings -> Admin Settings -> Models`.
   - Enter a model tag to pull from the Ollama library (e.g., `phi3:mini`).
   - Press the pull button.
# OLLAMA + OPEN-WEBUI + PIPELINES + LANGFUSE

## Introduction

This repository provides a setup for integrating [OLLAMA](https://github.com/ollama/ollama), [OPEN-WEBUI](https://github.com/open-webui/open-webui), [PIPELINES](https://github.com/open-webui/pipelines/), and [LANGFUSE](https://github.com/langfuse/langfuse) using Docker. Follow the steps below to get everything up and running.

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
   docker compose -f docker-compose.yaml -f langfuse-v3.yaml up -d
   # default driver is nvidia
   ```

## Configuration

### Langfuse Setup
0. **Documentation**
   - You can find up-to-date documentation [here](https://langfuse.com/docs/integrations/openwebui).

1. **Download the `langfuse_filter_pipeline.py` file (only if offline):**
   - If your setup does **not** have internet access:
     - You can manually download the script from:
       `https://github.com/open-webui/pipelines/blob/main/examples/filters/langfuse_filter_pipeline.py`
     - Or use the local copy provided at: `example/langfuse_filter_pipeline.py`

2. **Access Langfuse:**
   - Open your browser and go to `http://localhost:4000`.

3. **Create an Admin Account and Project:**
   - Create an admin account and then create an organization and a project.
   - Go to Project Settings and create an API key.
   - Retrieve the secret key and public key.

### Open-WebUI Setup

1. **Access Open-WebUI:**
   - Open your browser and go to `http://localhost:3000`.

2. **Create an Admin Account:**
   - Create an admin account.

3. **Upload the Pipeline Script:**
   - Go to `Settings -> Admin Settings -> Pipelines`.
   - If online, paste this URL:
     ```
     https://raw.githubusercontent.com/open-webui/pipelines/refs/heads/main/examples/filters/langfuse_filter_pipeline.py
     ```
     into the `Install from Github URL` field and click the download button.
   - If offline or using a custom script, upload `langfuse_filter_pipeline.py` from your local machine via the `Upload Pipeline` section.

4. **Configure the Script:**
   - After uploading the pipeline, edit its configuration in the UI.
   - Replace the placeholder values as follows:
     - `your-secret-key-here` → your **Langfuse secret key**
     - `your-public-key-here` → your **Langfuse public key**
     - `https://cloud.langfuse.com` → `http://langfuse-web:4000` (**local address**)


5. **Monitor Usage:**
   - You can now monitor Open-WebUI usage statistics from Langfuse.

### Model Downloading

1. **Access Open-WebUI:**
   - Open your browser and go to `http://localhost:3000`.

2. **Create an Admin Account:**
   - Create an admin account if you haven’t already.

3. **Pull Models:**
   - Navigate to `Settings -> Admin Settings -> Models`.
   - Enter a model tag to pull from the Ollama library (e.g., `phi3:mini`).
   - Press the pull button.
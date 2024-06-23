OLLAMA + OPEN-WEBUI + PIPELINES + LANGFUSE

download docker and required GPU drivers.
clone this repository and enter the coresponding folder
run the script `run-compose.sh` or `docker compose up -d`
download `https://github.com/open-webui/pipelines/blob/main/examples/filters/langfuse_filter_pipeline.py`, or use `example/langfuse_filter_pipeline.py`.
enter the `http://localhost:4000`(langfuse) from browser. 
create an admin account and create a project. Enter Project Settings, then create api key. get the secret key and private key.
replace `your-secret-key-here` with your secret key, replace `your-public-key-here` with your public key, and replace `https://cloud.langfuse.com` with `http://langfuse:4000` in `langfuse_filter_pipeline.py`

enter the `http://localhost:3000`(open-webui) from browser. 
create admin account, open `settings->admin settings->pipelines`. in `Upload Pipeline` select file `langfuse_filter_pipeline.py` and click upload button.

now you can watch open-webui usage statistics from langfuse.


model downloading
enter the `http://localhost:3000`(open-webui) from browser. 
create admin account, open `settings->admin settings->models`. Enter a model tag to pull from ollama library. as an exmaple you can use `phi3:mini`. then press pull button.
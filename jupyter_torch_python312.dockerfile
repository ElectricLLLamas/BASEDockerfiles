FROM python:3.12
LABEL author=23skdu@users.noreply.github.com
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN set +x && apt update && apt -y upgrade && apt install -y vim sudo festival speech-dispatcher espeak libsox-fmt-all sox git git-lfs netcat-traditional redis sqlite3 python3-pip && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && apt-get update -y && apt-get install google-cloud-cli -y && apt clean && rm -rf /var/lib/apt/lists 

RUN pip3 install -U newrelic opentelemetry-distro prometheus-client hmmlearn imblearn jupyter librosa keras gspread oauth2client google-cloud google-API-core google_speech simplejson pydub tqdm plotly protobuf grpcio PyYAML pyvista ipygany ollama langchain-google-community[texttospeech] langchain-milvus sqlite-vss SQLAlchemy agentops[langchain] langchain langchain_core langchain_community langchain-redis scipy redis beautifulsoup4 psutil argparse requests torch dask[complete] googlefinance yfinance seaborn numpy pandas scikit-learn && pip3 cache purge

RUN useradd -rm -d /home/elllama -s /bin/bash -g root -G sudo -u 1001 -p "$(openssl passwd -1 elllama)" elllama && echo "elllama ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EXPOSE 8888/tcp
WORKDIR /home/elllama
USER 1001
CMD ["jupyter-notebook","--ip=0.0.0.0" ]

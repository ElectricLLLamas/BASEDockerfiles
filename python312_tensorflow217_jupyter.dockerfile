FROM python:3.12
LABEL author=23skdu@users.noreply.github.com
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN set +x && apt update && apt -y upgrade && apt install -y vim sudo git git-lfs && apt-get clean

RUN pip3 install -U --no-cache-dir newrelic opentelemetry-distro jupyter gspread oauth2client google-cloud librosa pyvista ipygany hmmlearn imblearn keras tensorflow[and-cuda]==2.17.0 dask[complete] numpy pandas scikit-learn scipy pyarrow yfinance seaborn matplotlib plotly psutil argparse requests beautifulsoup4 redis PyYAML ollama langchain langchain_core langchain_community langchain-redis agentops[langchain] langchain_postgres psycopg[binary] && pip3 cache purge

RUN useradd -rm -d /home/elllama -s /bin/bash -g root -G sudo -u 1001 -p "$(openssl passwd -1 elllama)" elllama && echo "elllama ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
EXPOSE 8888/tcp
WORKDIR /home/elllama
USER 1001
CMD ["jupyter-notebook","--ip=0.0.0.0" ]

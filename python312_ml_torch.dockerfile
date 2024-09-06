FROM python:3.12
LABEL author=23skdu@users.noreply.github.com
RUN set +x && apt update && apt -y upgrade && apt -y install sqlite3 netcat-traditional && apt clean && rm -rf /var/lib/apt/lists
RUN pip3 install --no-cache-dir librosa pyvista ipygany hmmlearn imblearn keras torch dask[complete] numpy pandas scikit-learn scipy milvus pyarrow redis yfinance seaborn matplotlib plotly argparse requests sqlite-vss SQLAlchemy redis PyYAML langchain langchain_core langchain_community langchain-redis agentops[langchain] langchain-milvus && pip3 cache purge
CMD ["nc","-l", "8888"]

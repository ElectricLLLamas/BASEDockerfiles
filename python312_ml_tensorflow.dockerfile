FROM python:3.12
LABEL author=23skdu@users.noreply.github.com
RUN set +x && apt update && apt -y upgrade && apt install -y vim sqlite3 festival speech-dispatcher espeak libsox-fmt-all sox git git-lfs net-tools bind9-utils netcat-traditional && apt clean && rm -rf /var/lib/apt/lists
RUN pip3 install --no-cache-dir librosa pyvista ipygany hmmlearn imblearn keras tensorflow[and-cuda] dask[complete] numpy pandas scikit-learn scipy milvus pyarrow redis yfinance seaborn matplotlib plotly argparse requests sqlite-vss SQLAlchemy redis PyYAML langchain langchain_core langchain_community langchain-redis agentops[langchain] langchain-milvus 
CMD ["python","-c", "print('works')"] 

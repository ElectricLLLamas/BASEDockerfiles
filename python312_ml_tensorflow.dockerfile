FROM python:3.12-slim
LABEL author=23skdu@users.noreply.github.com
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN set +x && apt update && apt -y upgrade && apt-get clean

RUN pip3 install --no-cache-dir librosa pyvista ipygany hmmlearn imblearn keras tensorflow[and-cuda] dask[complete] numpy pandas scikit-learn scipy pyarrow redis yfinance seaborn matplotlib plotly argparse requests redis PyYAML ollama langchain langchain_core langchain_community langchain-redis agentops[langchain] langchain_postgres && pip cache purge

CMD ["python","-c", "print('works')"] 

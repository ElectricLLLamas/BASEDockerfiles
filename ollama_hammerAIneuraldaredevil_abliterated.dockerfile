FROM ollama/ollama:latest
LABEL author=23skdu@users.noreply.github.com
ENV OLLAMA_HOST 0.0.0.0:11434
ENV OLLAMA_MODELS /elllama/models
ENV OLLAMA_DEBUG false
ENV OLLAMA_KEEP_ALIVE -1 
ENV MODEL HammerAI/neuraldaredevil-abliterated 
RUN ollama serve & sleep 5 && ollama pull $MODEL 
EXPOSE 11434/tcp
ENTRYPOINT ["ollama", "serve"]

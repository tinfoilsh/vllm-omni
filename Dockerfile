FROM vllm/vllm-openai:v0.17.0@sha256:2296a2a7e1ce1dc59c6577ba5900f4e9910b76c4a0cb134833a8137f92404dfa

RUN apt-get update && apt-get install -y --no-install-recommends sox && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/vllm-omni
ENV VLLM_OMNI_VERSION_OVERRIDE=0.17.0rc1

COPY . /opt/vllm-omni
RUN uv pip install --system -e /opt/vllm-omni

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

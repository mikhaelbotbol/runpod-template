# Image de base avec CUDA pour RunPod
FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

WORKDIR /workspace

# Installer Node.js 20.x (requis pour Claude Code)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Installer Claude Code
RUN npm install -g @anthropic-ai/claude-code

# Port pour Jupyter
EXPOSE 8888

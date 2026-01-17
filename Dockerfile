# Image de base avec CUDA pour RunPod
FROM runpod/pytorch:2.4.0-py3.11-cuda12.4.1-devel-ubuntu22.04

WORKDIR /workspace

# Installer Node.js 20.x (requis pour Claude Code)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    git \
    mpich \
    libmpich-dev \
    libhdf5-dev \
    && rm -rf /var/lib/apt/lists/*

# Installer les packages Python principaux
RUN pip install --no-cache-dir \
    numpy \
    scipy \
    matplotlib \
    h5py \
    mpi4py \
    cython \
    pycuda \
    jupyter \
    jupyterlab \
    tqdm \
    pyyaml

# Installer gprMax
RUN git clone https://github.com/gprMax/gprMax.git && \
    cd gprMax && \
    pip install -e . --no-build-isolation

# Installer Claude Code
RUN npm install -g @anthropic-ai/claude-code

# Port pour Jupyter
EXPOSE 8888

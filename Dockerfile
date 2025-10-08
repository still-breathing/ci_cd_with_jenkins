# Dockerfile
FROM jenkins/jenkins:lts

USER root

# Install Python, venv, pip, git
RUN apt-get update && \
    apt-get install -y python3 python3-venv python3-pip git && \
    apt-get clean

# Make python3 default
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Create a virtual environment for Python tools
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install --upgrade pip setuptools wheel && \
    /opt/venv/bin/pip install pytest

# Add venv to PATH for Jenkins user
ENV PATH="/opt/venv/bin:$PATH"

# Pre-install essential Jenkins plugins
RUN jenkins-plugin-cli --plugins \
    cloudbees-folder \
    git \
    workflow-aggregator \
    pipeline-github-lib \
    credentials-binding \
    ssh-agent

# Switch back to Jenkins user
USER jenkins

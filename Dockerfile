FROM python:3.7-slim-buster AS base

# Lock Python package version to 3.7
RUN apt-get update && \
    apt-get install dselect && \
    dselect update && \
    echo "python3 hold" | dpkg --set-selections

# Install pytorch
COPY requirements.txt /
RUN pip3 install --default-timeout=100 -r requirements.txt


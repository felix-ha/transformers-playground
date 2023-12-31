FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata curl

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.11 python3.11-distutils && \
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

WORKDIR /app

RUN python3.11 -m pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "5000"]

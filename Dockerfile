FROM nvidia/cuda:13.1.2-cudnn-runtime-ubuntu24.04

RUN apt-get update && \
    apt-get install -y ffmpeg python3 python3-pip git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

# launch whisper_fastapi.py
ENTRYPOINT ["python3", "whisper_fastapi.py"]
FROM python:3.10.9-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . /rq

RUN pip install fastapi uvicorn
WORKDIR /rq

CMD ["uvicorn", "testimg:app", "--host", "0.0.0.0", "--port", "8000"]

# https://docs.docker.com/samples/django/#define-the-project-components

FROM python:3.10

RUN apt-get update && apt-get install
RUN pip install --upgrade pip
RUN apt-get install -y python3-psycopg2
RUN apt-get install gcc
RUN apt-get clean

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/

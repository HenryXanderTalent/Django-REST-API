#container image
FROM python:3.9-alpine3.13

LABEL maintainer="henry.o@hotmail.co.uk"

#Tells docker to output everything regarldess of errors
ENV PYTHONUNBUFFERED 1

#local environment and docker environment
COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app

WORKDIR /app

#port
EXPOSE 8000

#spin up virtual space and install packages/dependancies
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    adduser --disabled-password django-user

#location off you virtual env
ENV PATH='/py/bin:$PATH'

#better to create an alias user not like this
USER django-user

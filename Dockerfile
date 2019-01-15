FROM python:3.7.2rc1
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt

FROM python:3.8.0-slim

WORKDIR /src

COPY src/ /src/
COPY requirements.txt /
COPY run.sh /

RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

CMD ["/run.sh"]
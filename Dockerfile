FROM python:3.6.5

WORKDIR /app

COPY lappis/ /app/
COPY requirements.txt /
COPY entrypoint.sh /

RUN pip install -r /requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
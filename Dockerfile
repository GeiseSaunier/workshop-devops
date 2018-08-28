FROM python:3.6.5
WORKDIR /app

COPY lappis /app/
COPY requirements.txt /
COPY runserver.sh /

RUN pip install -r /requirements.txt
ENTRYPOINT [ "/runserver.sh" ]
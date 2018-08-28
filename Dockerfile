FROM python:3.6.5

WORKDIR /app

COPY lappis /app/
COPY requirements.txt /app/
COPY runserver.sh /app/

RUN pip install -r requirements.txt

RUN chmod +x /app/runserver.sh

ENTRYPOINT [ "/app/runserver.sh" ]
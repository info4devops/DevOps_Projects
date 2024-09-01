FROM python:3.9-slim-buster

WORKDIR /app

COPY requirments.txt .

RUN pip3 install --no-cache-dir -r requirments.txt

COPY . .

ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD [ "flask", "run" ]
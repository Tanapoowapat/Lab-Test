
# install Libray
```
pip install flask
pip install robotframework
pip install robotframework-requests
```
Dockerfile
```
FROM python:3.7-alpine
WORKDIR /app
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
```

Docker-compose
```
services:
  web:
    build:
      context: app
    ports:
      - "5000:5000"
```


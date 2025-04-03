# FROM python:3.11-slim-buster

# WORKDIR /django
# ENV PYTHONUNBUFFERED=1

# COPY requirements.txt requirements.txt
# RUN pip3 install --no-cache-dir -r requirements.txt  # Fix RUN command

# COPY . . 

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
FROM python:3.11-alpine
WORKDIR /django
ENV PYTHONUNBUFFERED=1

# Upgrade SQLite
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev 
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt  

COPY . .  

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

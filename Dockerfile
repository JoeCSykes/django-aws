FROM python:3.10-slim-buster

# Open http port
EXPOSE 8000

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV DEBIAN_FRONTEND noninteractive

# Install pip and gunicorn web server
RUN apt update -y && apt upgrade -y
RUN apt install python3-dev default-libmysqlclient-dev build-essential -y
RUN pip install mysqlclient
RUN pip install --no-cache-dir --upgrade pip
RUN pip install gunicorn==20.1.0

# Install requirements.txt
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

# Moving application files
WORKDIR /app
COPY . /app

CMD [ "python3", "create_admin.py"]

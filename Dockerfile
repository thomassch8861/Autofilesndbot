FROM python:3.13.3-slim-bullseye

RUN apt update && apt upgrade -y
RUN apt install git -y
RUN apt install build-essential -y


COPY requirements.txt /requirements.txt

RUN cd /
RUN pip install -U pip && pip install -U -r requirements.txt
WORKDIR /app

COPY . .
 
EXPOSE 8000

CMD ["python", "bot.py"]

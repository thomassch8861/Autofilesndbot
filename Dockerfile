FROM python:3.10

RUN apt update && apt upgrade -y
RUN apt install git -y
RUN apt install build-essential -y
RUN apt install python3.10-dev -y

COPY requirements.txt /requirements.txt

RUN cd /
RUN pip install -U pip && pip install -U -r requirements.txt
WORKDIR /app

COPY . .
 
EXPOSE 8000

CMD ["python", "bot.py"]

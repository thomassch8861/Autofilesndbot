FROM python:3.13.3-slim-bookworm

# Update the package list, upgrade packages, install necessary packages including locales
RUN apt update && apt upgrade -y && \
    apt install -y git build-essential locales && \
    sed -i 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen

# Set environment variables for the locale
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Copy requirements and install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip install -U pip && pip install -U -r requirements.txt

# Set working directory and copy your application code
WORKDIR /app
COPY . .

# Expose port 8000
EXPOSE 8000

# Start your application
CMD ["python", "bot.py"]

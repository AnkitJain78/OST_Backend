FROM python:latest
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libleptonica-dev \
        tesseract-ocr \
        libtesseract-dev \
        poppler-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
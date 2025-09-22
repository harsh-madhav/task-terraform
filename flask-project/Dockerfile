FROM python:3.10-slim-trixie

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

WORKDIR /app
COPY . /app
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r /app/requirement.txt
EXPOSE 5000

CMD ["gunicorn", "-w", "1", "-b", "0.0.0.0:5000", "app:app"]

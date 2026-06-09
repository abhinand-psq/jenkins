FROM python:3.12-slim-bookworm

# 2. Set environment variables to optimize Python performance
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY sample.py .

CMD ["python", "sample.py"]
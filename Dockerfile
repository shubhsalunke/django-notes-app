FROM python:3.9

WORKDIR /app/backend

# Copy requirements
COPY requirements.txt .

# Install system dependencies
RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Expose port
EXPOSE 8000

# Run Django
CMD ["python3", "backend/manage.py", "runserver", "0.0.0.0:8000"]

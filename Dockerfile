FROM python:3.10-slim

# Install system dependencies for Chrome + ChromeDriver
RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg \
    chromium chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Env vars for Selenium
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

WORKDIR /app
COPY . .

# Install Python deps directly (no requirements.txt needed)
RUN pip install --no-cache-dir flask selenium webdriver-manager

# Run your app
CMD ["python", "app.py"]

FROM python:3.11-slim-bookworm

# Thiết lập thư mục làm việc
WORKDIR /app

# Cài đặt các gói hệ thống cần thiết
RUN apt-get update && apt-get install -y \
    gnupg \
    curl \
    unrar-free \
    && rm -rf /var/lib/apt/lists/*

# Copy mã nguồn và file cấu hình vào container
COPY . .

# Cài đặt các thư viện Python từ requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Chạy bot
CMD ["python", "bot.py"]

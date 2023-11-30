# Resmi Python görüntüsünü kullanın
FROM python:3.9-slim

# Çalışma dizini oluşturun
WORKDIR /app

# Gerekli dosyaları kopyalayın
COPY app.py /app/
COPY templates /app/templates

# Flask uygulamasını yükleyin
RUN pip install Flask

# Nginx'i yükleyin
RUN apt-get update && apt-get install -y nginx

# Nginx konfigürasyon dosyasını kopyalayın
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Flask uygulamasını çalıştırın
CMD ["bash", "-c", "service nginx start && python app.py"]

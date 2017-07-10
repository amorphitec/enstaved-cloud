FROM python:3.5

RUN apt-get update && apt-get install -y \
    openscad \
  && rm -rf /var/lib/apt/lists/*

COPY app /app
COPY requirements.txt /app/
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Data directories
RUN mkdir -p /data/models

# Run on 80
EXPOSE 80

# OpenSCAD Profiles
RUN mkdir -p /root/.config/OpenSCAD/color-schemes/render
COPY white.json /root/.config/OpenSCAD/color-schemes/render/white.json

# Entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
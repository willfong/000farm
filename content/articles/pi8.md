---
title: Raspberry Pi Server
description: Using a Raspberry Pi as an monitoring server
---



Create internal network in Docker
```
docker network create main
```

Create application directories to store data
```
mkdir -p /data/prometheus/config
mkdir -p /data/prometheus/data
mkdir -p /data/grafana/data
```

Prometheus
```
docker run -d --name=prometheus -v /data/prometheus/config:/etc/prometheus -v /data/prometheus/data:/prometheus --network main -p 9090:9090 prom/prometheus
```

Grafana
```
docker run --user 1000 -d --name=grafana --network main -v /data/grafana/data:/var/lib/grafana -p 3000:3000 grafana/grafana
```


prometheus.yml
```
global:
  scrape_interval:     600s
  evaluation_interval: 30s

scrape_configs:
- job_name: sensorhub
  metrics_path: /
  static_configs:
    - targets:
      - 10.0.0.16:8080
```

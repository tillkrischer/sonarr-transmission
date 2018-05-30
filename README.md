```bash
docker build -t sonarr .
```

```bash
docker run \
  --restart=unless-stopped \
  -d \
  -u $UID:$UID \
  -p 8989:8989 \
  -p 9091:9091 \
  -p 8080:8080 \
  -p 52258:52258 \
  -v /home/till/Downloads:/data \
  -v /home/till/.sonarr/sonarr:/config \
  -v /home/till/.sonarr/transmission:/transmission \
  sonarr:latest  
```

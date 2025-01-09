# docker-caddy
A container to run caddy web server  
  
Usage: Create via image on Dockerhub:  
`` docker run -d -p 80:80 -p 443:443 -v /path/to/website:/opt/src xosadmin/docker-caddy:latest ``  
  
### Notes:  
- The docker image with ``php`` tag includes php 8.4 support  
- You can use ``-v /path/to/Caddyfile:/etc/caddy/Caddyfile`` to override custom Caddy config  

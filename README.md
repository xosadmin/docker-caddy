# docker-caddy
A container to run caddy web server  
  
Usage: Create via image on Dockerhub:  
`` docker run -d -p 80:80 -p 443:443 -v /path/to/website:/opt/src xosadmin/docker-caddy:latest ``  
  
### Notes:  
- ``xosadmin/docker-caddy:php`` is available for caddy with PHP support, while ``latest`` only support static webpages like HTML  
- You can use ``-v /path/to/Caddyfile:/etc/caddy/Caddyfile`` to override custom Caddy config  

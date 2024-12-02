# Traefik⁠ is a modern HTTP reverse proxy and load balancer that makes deploying microservices easy.

Traefik integrates with your existing infrastructure components (Docker⁠, Swarm mode⁠, Kubernetes⁠, Marathon⁠, Consul⁠, Etcd⁠, Rancher⁠, Amazon ECS⁠, ...) and configures itself automatically and dynamically.

Pointing Traefik at your orchestrator should be the only configuration step you need.

Traefik v2 - Example usage
Enable docker provider and web UI:

## traefik.yml

# Docker configuration backend
providers:
  docker:
    defaultRule: "Host(`{{ trimPrefix `/` .Name }}.docker.localhost`)"

# API and dashboard configuration
api:
  insecure: true
Start Traefik:

docker run -d -p 8080:8080 -p 80:80 \
-v $PWD/traefik.yml:/etc/traefik/traefik.yml \
-v /var/run/docker.sock:/var/run/docker.sock \
traefik:v2.5
Start a backend server, named test:

docker run -d --name test traefik/whoami
And finally, you can access to your whoami server throught Traefik, on the domain name test.docker.localhost:

# $ curl --header 'Host:test.docker.localhost' 'http://localhost:80/'
$ curl test.docker.localhost
Hostname: 390a880bdfab
IP: 127.0.0.1
IP: 172.17.0.3
GET / HTTP/1.1
Host: test.docker.localhost
User-Agent: curl/7.65.3
Accept: */*
Accept-Encoding: gzip
X-Forwarded-For: 172.17.0.1
X-Forwarded-Host: test.docker.localhost
X-Forwarded-Port: 80
X-Forwarded-Proto: http
X-Forwarded-Server: 7e073cb54211
X-Real-Ip: 172.17.0.1
The web UI http://localhost:8080⁠ will give you an overview of the routers, services, and middlewares.

Web UI

Traefik v1 - Example usage
Grab a sample configuration file⁠ and rename it to traefik.toml. Enable docker provider and web UI:

## traefik.toml

# API and dashboard configuration
[api]

# Docker configuration backend
[docker]
  domain = "docker.localhost"
Start Traefik:

docker run -d -p 8080:8080 -p 80:80 \
-v $PWD/traefik.toml:/etc/traefik/traefik.toml \
-v /var/run/docker.sock:/var/run/docker.sock \
traefik:v1.7
Start a backend server, named test:

docker run -d --name test traefik/whoami
And finally, you can access to your whoami server throught Traefik, on the domain name {containerName}.{configuredDomain} (test.docker.localhost):

# $ curl --header 'Host:test.docker.localhost' 'http://localhost:80/'
$ curl 'http://test.docker.localhost'
Hostname: 117c5530934d
IP: 127.0.0.1
IP: ::1
IP: 172.17.0.3
IP: fe80::42:acff:fe11:3
GET / HTTP/1.1
Host: test.docker.localhost
User-Agent: curl/7.35.0
Accept: */*
Accept-Encoding: gzip
X-Forwarded-For: 172.17.0.1
X-Forwarded-Host: 172.17.0.3:80
X-Forwarded-Proto: http
X-Forwarded-Server: f2e05c433120
The web UI http://localhost:8080⁠ will give you an overview of the frontends/backends and also a health dashboard.

Web UI Providers

Documentation
You can find the complete documentation:

for v2.x⁠
for v1.7⁠
A community support is available at https://community.traefik.io⁠

A collection of contributions around Traefik can be found at https://awesome.traefik.io⁠.

Image Variants
The traefik images come in many flavors, each designed for a specific use case.

traefik:<version>
This is the defacto image. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of.

traefik:<version>-windowsservercore
This image is based on Windows Server Core (microsoft/windowsservercore). As such, it only works in places which that image does, such as Windows 10 Professional/Enterprise (Anniversary Edition) or Windows Server 2016.

For information about how to get Docker running on Windows, please see the relevant "Quick Start" guide provided by Microsoft:

Windows Server Quick Start⁠
Windows 10 Quick Start⁠
License
View license information⁠ for the software contained in this image.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

Some additional license information which was able to be auto-detected might be found in the repo-info repository's traefik/ directory⁠.

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
# Nathan REUNGOAT
3
a. `docker pull nginx`  
```
Using default tag: latest
latest: Pulling from library/nginx
Digest: sha256:fb39280b7b9eba5727c884a3c7810002e69e8f961cc373b89c92f14961d903a0
Status: Image is up to date for nginx:latest
docker.io/library/nginx:latest
```

b. `docker images`
```
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
nginx        latest    fb39280b7b9e   6 weeks ago   279MB
```

d. `docker run --name Oui -v ${PWD}\html:/usr/share/nginx/html:ro -p 8080:80 -d nginx
`
```
d0bcdf802b1e08fc250da5763fa0ecc348ca6857fd744b92a4a3c234c4df9250
```

e. `docker rm Oui`
```
Oui
```

d. `docker run --name Oui -p 8080:80 -d nginx`  
   `docker cp html\\index.html Oui:/usr/share/nginx/html/index.html`
```
Successfully copied 2.05kB to Oui:/usr/share/nginx/html/index.html
```
# Nathan REUNGOAT

## 3. Exécuter un serveur web (apache: nginx, ...) dans un container docker

a.  *Récupérer l'image sur le docker hub (httpd or nginx) (=> quelle commande)*  
 `docker pull nginx`  
```
Using default tag: latest
latest: Pulling from library/nginx
Digest: sha256:fb39280b7b9eba5727c884a3c7810002e69e8f961cc373b89c92f14961d903a0
Status: Image is up to date for nginx:latest
docker.io/library/nginx:latest
```

b. *Utiliser une commande pour vérifier que vous disposez bien de l'image en local (=> quelle commande)*  
 `docker images`
```
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
nginx        latest    fb39280b7b9e   6 weeks ago   279MB
```

d. *Démarrer un nouveau container et servir la page html créée précédemment à l'aide d'une référence absolue
(votre container exposera un port 80, pensez à le publier pour que vous puissiez y accéder en localhost)
(option -v ABSOLUTE PATH:CONTAINER PATH créer un montage entre le chemin de gauche et le chemin de droite)*  
`docker run --name Oui -v ${PWD}\html:/usr/share/nginx/html:ro -p 8080:80 -d nginx
`
```
d0bcdf802b1e08fc250da5763fa0ecc348ca6857fd744b92a4a3c234c4df9250
```

e. *Supprimer le container quelle(s) commande(s)*   
`docker rm Oui`
```
Oui
```

d. *Relancez le même container sans l'option -v puis utilisez la commande cp pour servir votre fichier (docker cp ARGS) (=> quelle commande)*  
 `docker run --name Oui -p 8080:80 -d nginx`  
   `docker cp html\\index.html Oui:/usr/share/nginx/html/index.html`
```
Successfully copied 2.05kB to Oui:/usr/share/nginx/html/index.html
```

## 4. Builder une image
a. *A l'aide d'un Dockerfile, créer une image qui permet d'exécuter un serveur web (apache, nginx) (=> le Dockerfile)*  
Voir le fichier `Dockerfile`.

b. *Exécuter cette nouvelle image de manière à servir ./html/index.html (=> quelle commande)*
`docker build -t Oui .`
```
[+] Building 6.2s (8/8) FINISHED                                                                     docker:desktop-linux
 => [internal] load build definition from dockerfile                                                                 0.1s
 => => transferring dockerfile: 319B                                                                                 0.0s 
 => [internal] load metadata for docker.io/library/nginx:alpine                                                      2.8s
 => [auth] library/nginx:pull token for registry-1.docker.io                                                         0.0s
 => [internal] load .dockerignore                                                                                    0.0s
 => => transferring context: 2B                                                                                      0.0s 
 => [internal] load build context                                                                                    0.2s 
 => => transferring context: 192B                                                                                    0.1s 
 => [1/2] FROM docker.io/library/nginx:alpine@sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a  2.2s 
 => => resolve docker.io/library/nginx:alpine@sha256:65645c7bb6a0661892a8b03b89d0743208a18dd2f3f17a54ef4b76fb8e2f2a  0.1s 
 => => sha256:39c2ddfd6010082a4a646e7ca44e95aca9bf3eaebc00f17f7ccc2954004f2a7d 15.52MB / 15.52MB                     1.1s
 => => sha256:34a64644b756511a2e217f0508e11d1a572085d66cd6dc9a555a082ad49a3102 1.40kB / 1.40kB                       0.4s
 => => sha256:197eb75867ef4fcecd4724f17b0972ab0489436860a594a9445f8eaff8155053 1.21kB / 1.21kB                       0.5s
 => => sha256:81bd8ed7ec6789b0cb7f1b47ee731c522f6dba83201ec73cd6bca1350f582948 402B / 402B                           0.4s 
 => => sha256:d7e5070240863957ebb0b5a44a5729963c3462666baa2947d00628cb5f2d5773 955B / 955B                           0.2s 
 => => sha256:b464cfdf2a6319875aeb27359ec549790ce14d8214fcb16ef915e4530e5ed235 629B / 629B                           0.1s 
 => => sha256:61ca4f733c802afd9e05a32f0de0361b6d713b8b53292dc15fb093229f648674 1.79MB / 1.79MB                       0.4s 
 => => sha256:f18232174bc91741fdf3da96d85011092101a032a93a388b79e99e69c2d5c870 3.64MB / 3.64MB                       0.5s 
 => => extracting sha256:f18232174bc91741fdf3da96d85011092101a032a93a388b79e99e69c2d5c870                            0.2s 
 => => extracting sha256:61ca4f733c802afd9e05a32f0de0361b6d713b8b53292dc15fb093229f648674                            0.2s 
 => => extracting sha256:b464cfdf2a6319875aeb27359ec549790ce14d8214fcb16ef915e4530e5ed235                            0.0s 
 => => extracting sha256:d7e5070240863957ebb0b5a44a5729963c3462666baa2947d00628cb5f2d5773                            0.0s 
 => => extracting sha256:81bd8ed7ec6789b0cb7f1b47ee731c522f6dba83201ec73cd6bca1350f582948                            0.0s 
 => => extracting sha256:197eb75867ef4fcecd4724f17b0972ab0489436860a594a9445f8eaff8155053                            0.0s 
 => => extracting sha256:34a64644b756511a2e217f0508e11d1a572085d66cd6dc9a555a082ad49a3102                            0.0s 
 => => extracting sha256:39c2ddfd6010082a4a646e7ca44e95aca9bf3eaebc00f17f7ccc2954004f2a7d                            0.3s 
 => [2/2] COPY html /usr/share/nginx/html/                                                                           0.5s 
 => exporting to image                                                                                               0.3s 
 => => exporting layers                                                                                              0.1s 
 => => exporting manifest sha256:59a3529d4a21326e5e752988a33eb06baeb4355c2e44b7c5067cbb8df0fd60f9                    0.0s 
 => => exporting config sha256:546803830968fa30dbaba095ba42868ef01116f45754f3e099aa2ac2cbcd4bcf                      0.0s 
 => => exporting attestation manifest sha256:068623652a1979b134e46606a214ce2f6eb771c6fd226caf44c87ea9620b9d69        0.0s 
 => => exporting manifest list sha256:91685df0a70d3ae3a379b789fabb5aa5107500a5e2d0b22434ae86a3e14cea88               0.0s 
 => => naming to docker.io/library/oui:latest                                                                        0.0s 
 => => unpacking to docker.io/library/oui:latest                                                                     0.0s
```

c. *Quelles différences observez-vous entre les questions 3 et 4, trouvez les avantages & inconvénients de chaque procédure (mount volume VS copy)*

### Mount volume
L'avantage de la méthode `-v` est que le fichier est monté dans le container, ce qui permet de modifier le fichier sans avoir à le copier à chaque fois. Cela facilite le développement et les tests, car les modifications sont immédiatement visibles dans le container.

L'inconvénient est que si le fichier est modifié dans le container, les modifications ne seront pas reflétées dans le système hôte, ce qui peut poser des problèmes si vous avez besoin de conserver une version du fichier sur le système hôte.

### Copy
L'avantage de la méthode `docker cp` est qu'elle permet de copier un fichier ou un répertoire depuis le système hôte vers le container, ou vice versa. Cela peut être utile pour transférer des fichiers entre le système hôte et le container sans avoir à les monter.

L'inconvénient de la méthode `docker cp` est qu'il faut à chaque fois copier le fichier dans le container, ce qui n'est pas pratique si on modifie le fichier régulièrement.

L'avantage est que le fichier est copié dans le container, ce qui permet de le modifier dans le container sans affecter le système hôte.

## 5. Utiliser une base de données dans un container docker

a. Récupérer les images mysql (ou mariadb) et phpmyadmin depuis le Docker Hub
`docker pull mysql:latest`  
`docker pull phpmyadmin/phpmyadmin `

b. *Exécuter 2 containers à partir des images
Lancer le phpmyadmin (conteneurisé et publié sur un port) et ajoutez une table via l'interface*
` docker network create mynetwork`  
```
ed48a21f0cd7566980dda201122d72ca83263d3f42affa9852ed483237ba9819
```

`docker run --name my-mysql --network mynetwork -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=tpdb -d mysql`

```
1c57bf1e2c059c8a6b922326b420de248895911d50cfbd2d401123c49365d871
```

`docker run --name my-phpmyadmin --network mynetwork -e PMA_HOST=my-mysql -p 8081:80 -d phpmyadmin/phpmyadmin`

```
921c7886f6b8e7893f45f325ce3a99d025cc0f5bb66764309b26c1231321ee21
```

## 6 Utilisation de docker-compose.yml
a. Allez lire la documentation de docker-compose et essayer de décrire à quoi sert cette commande VS la commande docker run

` `docker-compose` est un outil qui permet de définir et de gérer des applications multi-conteneurs. Il utilise un fichier `docker-compose.yml` pour configurer les services, les réseaux et les volumes nécessaires à l'application. Contrairement à `docker run`, qui est utilisé pour exécuter un seul conteneur, `docker-compose` permet de lancer plusieurs conteneurs en une seule commande, facilitant ainsi la gestion des dépendances entre les services. `

b. Quelle commande permet de lancer tous les containers du fichier yaml ? Quelle commande permet de les stopper ?

` docker-compose up -d` pour lancer tous les conteneurs en arrière-plan.
` docker-compose down` pour arrêter et supprimer tous les conteneurs, réseaux et volumes définis dans le fichier `docker-compose.yml`.

c. Ecrivez un fichier docker-compose.yml pour servir votre base de données (mysql, mariadb, etc.) ET phpmyadmin


# Utilise une image de base avec Nginx préinstallé
FROM nginx:alpine

# Copie les fichiers HTML dans le dossier web de Nginx
COPY html /usr/share/nginx/html/

# Expose le port 80 (HTTP)
EXPOSE 80

# Lancement automatique du serveur Nginx (déjà prévu par l’image)

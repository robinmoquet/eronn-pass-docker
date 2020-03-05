# Eronn Pass Docker

Ce dépot permet de travailler sur le backend de Eronn Pass.

### Installation

1- Récupérer le dépôt eronn-pass-docker
```
git clone https://github.com/robinmoquet/eronn-pass-docker.git
```
2- Récupérer les différents dépôts de Eronn Pass
```
make clone
```
3- Installer les dépendances de tous les dépôts
```
make install
```
4- Faire un premier build du typescript
```
make build
```
5- Lancer docker pour le dev
```
make dev
```

Après ces étapes vous avez accès à : 
- L'api sur `localhost:5000`
- Mailer sur `localhost:3535`
- Adminer sur `localhost:8888` (adminer est une équivalence à phpmyadmin)

### Commandes utiles

Pull tous les projets
```
make pull
```


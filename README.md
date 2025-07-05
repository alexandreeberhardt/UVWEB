# UVWEB

Projet Node.js basé sur **Fastify**, **Prisma** et **PostgreSQL**.

## 🚀 Objectif

UVWEB est un catalogue des cours de l'UTC centralisant toutes les informations (Taux de réussite, avis etc)

## 🛠️ Stack technique

- Node.js
- Fastify
- Prisma ORM
- PostgreSQL

## ⚡ Installation & Lancement

1. **Cloner le repo**
```bash
   git clone https://github.com/alexandreeberhardt/UVWEB.git
   cd UVWEB
```

2. **Installer les dépendances**

```bash
    npm install
```

3. **Configurer la base de données**

* Crée un fichier `.env` à la racine :

```
    DATABASE_URL="postgresql://<utilisateur>:<motdepasse>@localhost:5432/<nom_de_la_db>"
```

4. **Créer la base et faire les migrations Prisma**

```bash
    npx prisma migrate dev --name init
```

5. **Lancer le serveur**

```bash
    npm run dev
```

ou

```bash
    node index.js
```

## 🧩 Endpoints


## 💡 Notes

* Prisma lit les variables d’environnement dans `.env`.
* Pour ajouter/modifier la base de données, modifie `prisma/schema.prisma` puis relance `npx prisma migrate dev`.

## 📦 Scripts utiles

* `npm run dev` : démarre le serveur en mode développement
* `npx prisma studio` : interface web pour explorer/modifier la BDD

## 📄 Licence

MIT

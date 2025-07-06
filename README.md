# UVWEB

UVWEB is a Node.js project powered by **Fastify**, **Prisma**, and **PostgreSQL**.

## 🚀 Purpose

UVWEB serves as a centralized course catalog for UTC, aggregating detailed information about each course—including success rates, student feedback, and more.

---

## 🛠️ Tech Stack

* **Node.js**
* **Fastify**
* **Prisma ORM**
* **PostgreSQL**

---

## ⚡ Installation & Setup

### 1. Clone the repository

```bash
git clone https://github.com/alexandreeberhardt/UVWEB.git
cd UVWEB
```

### 2. Install dependencies

For the backend:

```bash
cd backend
npm install
```

For the frontend:

```bash
cd ../frontend
npm install
```

### 3. Set up the PostgreSQL database

* Create a PostgreSQL database instance locally or on your server of choice.
* Obtain your database credentials (`user`, `password`, `database_name`).
* Copy the `.env.example` file to `.env` in the **backend** directory and update it with your credentials:

```
DATABASE_URL="postgresql://<user>:<password>@localhost:5432/<database_name>"
```

### 4. Initialize the database and Prisma

From the **backend** directory, run:

```bash
npx prisma generate
npx prisma migrate dev
npx prisma db seed
npx prisma studio
```

* `prisma studio` is optional; it provides a web interface for exploring and editing your database.

### 5. Start the servers

* **Backend:**

  ```bash
  cd backend
  npm run dev
  ```

* **Frontend:**

  ```bash
  cd frontend
  npm run dev
  ```

## 💡 Notes

* Prisma reads environment variables from the `.env` file (located at the root of the **backend** directory).

* To modify the database schema, edit `prisma/schema.prisma` and re-run:

  ```bash
  npx prisma migrate dev
  ```
  
* Useful scripts:

  * `npm run dev`: Start the server in development mode
  * `npx prisma studio`: Launch the Prisma web studio

---

## 📄 License

GPLv3


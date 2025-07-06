/*
  Warnings:

  - You are about to drop the `Assurer` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Avis` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Document` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Evaluation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Responsable` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Semestre` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Statistiques` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `UV` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Assurer" DROP CONSTRAINT "Assurer_Code_UV_fkey";

-- DropForeignKey
ALTER TABLE "Assurer" DROP CONSTRAINT "Assurer_Id_Responsable_fkey";

-- DropForeignKey
ALTER TABLE "Assurer" DROP CONSTRAINT "Assurer_Id_Semestre_fkey";

-- DropForeignKey
ALTER TABLE "Avis" DROP CONSTRAINT "Avis_Code_UV_fkey";

-- DropForeignKey
ALTER TABLE "Avis" DROP CONSTRAINT "Avis_Id_Semestre_fkey";

-- DropForeignKey
ALTER TABLE "Document" DROP CONSTRAINT "Document_Code_UV_fkey";

-- DropForeignKey
ALTER TABLE "Document" DROP CONSTRAINT "Document_Id_Semestre_fkey";

-- DropForeignKey
ALTER TABLE "Evaluation" DROP CONSTRAINT "Evaluation_Code_UV_fkey";

-- DropForeignKey
ALTER TABLE "Evaluation" DROP CONSTRAINT "Evaluation_Id_Semestre_fkey";

-- DropForeignKey
ALTER TABLE "Statistiques" DROP CONSTRAINT "Statistiques_Code_UV_fkey";

-- DropForeignKey
ALTER TABLE "Statistiques" DROP CONSTRAINT "Statistiques_Id_Semestre_fkey";

-- DropTable
DROP TABLE "Assurer";

-- DropTable
DROP TABLE "Avis";

-- DropTable
DROP TABLE "Document";

-- DropTable
DROP TABLE "Evaluation";

-- DropTable
DROP TABLE "Responsable";

-- DropTable
DROP TABLE "Semestre";

-- DropTable
DROP TABLE "Statistiques";

-- DropTable
DROP TABLE "UV";

-- CreateTable
CREATE TABLE "uv" (
    "code_uv" TEXT NOT NULL,
    "titre" TEXT NOT NULL,
    "categorie" TEXT NOT NULL,
    "ects" INTEGER NOT NULL,
    "actif" BOOLEAN NOT NULL,

    CONSTRAINT "uv_pkey" PRIMARY KEY ("code_uv")
);

-- CreateTable
CREATE TABLE "semestre" (
    "id_semestre" TEXT NOT NULL,
    "periode" TEXT NOT NULL,

    CONSTRAINT "semestre_pkey" PRIMARY KEY ("id_semestre")
);

-- CreateTable
CREATE TABLE "responsable" (
    "id_responsable" TEXT NOT NULL,
    "nom" TEXT NOT NULL,
    "prenom" TEXT NOT NULL,

    CONSTRAINT "responsable_pkey" PRIMARY KEY ("id_responsable")
);

-- CreateTable
CREATE TABLE "assurer" (
    "code_uv" TEXT NOT NULL,
    "id_semestre" TEXT NOT NULL,
    "id_responsable" TEXT NOT NULL,

    CONSTRAINT "assurer_pkey" PRIMARY KEY ("code_uv","id_semestre","id_responsable")
);

-- CreateTable
CREATE TABLE "statistiques" (
    "id_stat" SERIAL NOT NULL,
    "taux_reussite" INTEGER NOT NULL,
    "code_uv" TEXT NOT NULL,
    "id_semestre" TEXT NOT NULL,

    CONSTRAINT "statistiques_pkey" PRIMARY KEY ("id_stat")
);

-- CreateTable
CREATE TABLE "evaluation" (
    "id_evaluation" SERIAL NOT NULL,
    "critere" INTEGER NOT NULL,
    "libelle_critere" TEXT NOT NULL,
    "note" INTEGER NOT NULL,
    "code_uv" TEXT NOT NULL,
    "id_semestre" TEXT NOT NULL,

    CONSTRAINT "evaluation_pkey" PRIMARY KEY ("id_evaluation")
);

-- CreateTable
CREATE TABLE "avis" (
    "id_avis" SERIAL NOT NULL,
    "contenu" TEXT NOT NULL,
    "auteur" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "code_uv" TEXT NOT NULL,
    "id_semestre" TEXT NOT NULL,

    CONSTRAINT "avis_pkey" PRIMARY KEY ("id_avis")
);

-- CreateTable
CREATE TABLE "document" (
    "id_doc" SERIAL NOT NULL,
    "nom" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "date_ajout" TIMESTAMP(3) NOT NULL,
    "code_uv" TEXT NOT NULL,
    "id_semestre" TEXT NOT NULL,

    CONSTRAINT "document_pkey" PRIMARY KEY ("id_doc")
);

-- AddForeignKey
ALTER TABLE "assurer" ADD CONSTRAINT "assurer_code_uv_fkey" FOREIGN KEY ("code_uv") REFERENCES "uv"("code_uv") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assurer" ADD CONSTRAINT "assurer_id_semestre_fkey" FOREIGN KEY ("id_semestre") REFERENCES "semestre"("id_semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "assurer" ADD CONSTRAINT "assurer_id_responsable_fkey" FOREIGN KEY ("id_responsable") REFERENCES "responsable"("id_responsable") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "statistiques" ADD CONSTRAINT "statistiques_code_uv_fkey" FOREIGN KEY ("code_uv") REFERENCES "uv"("code_uv") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "statistiques" ADD CONSTRAINT "statistiques_id_semestre_fkey" FOREIGN KEY ("id_semestre") REFERENCES "semestre"("id_semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evaluation" ADD CONSTRAINT "evaluation_code_uv_fkey" FOREIGN KEY ("code_uv") REFERENCES "uv"("code_uv") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "evaluation" ADD CONSTRAINT "evaluation_id_semestre_fkey" FOREIGN KEY ("id_semestre") REFERENCES "semestre"("id_semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "avis" ADD CONSTRAINT "avis_code_uv_fkey" FOREIGN KEY ("code_uv") REFERENCES "uv"("code_uv") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "avis" ADD CONSTRAINT "avis_id_semestre_fkey" FOREIGN KEY ("id_semestre") REFERENCES "semestre"("id_semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "document" ADD CONSTRAINT "document_code_uv_fkey" FOREIGN KEY ("code_uv") REFERENCES "uv"("code_uv") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "document" ADD CONSTRAINT "document_id_semestre_fkey" FOREIGN KEY ("id_semestre") REFERENCES "semestre"("id_semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

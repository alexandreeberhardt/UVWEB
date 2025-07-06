/*
  Warnings:

  - You are about to drop the `test` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "test";

-- CreateTable
CREATE TABLE "UV" (
    "Code_UV" TEXT NOT NULL,
    "Titre" TEXT NOT NULL,
    "Categorie" TEXT NOT NULL,
    "ECTS" INTEGER NOT NULL,
    "Actif" BOOLEAN NOT NULL,

    CONSTRAINT "UV_pkey" PRIMARY KEY ("Code_UV")
);

-- CreateTable
CREATE TABLE "Semestre" (
    "Id_Semestre" TEXT NOT NULL,
    "Periode" TEXT NOT NULL,

    CONSTRAINT "Semestre_pkey" PRIMARY KEY ("Id_Semestre")
);

-- CreateTable
CREATE TABLE "Responsable" (
    "Id_Responsable" TEXT NOT NULL,
    "Nom" TEXT NOT NULL,
    "Prenom" TEXT NOT NULL,

    CONSTRAINT "Responsable_pkey" PRIMARY KEY ("Id_Responsable")
);

-- CreateTable
CREATE TABLE "Assurer" (
    "Code_UV" TEXT NOT NULL,
    "Id_Semestre" TEXT NOT NULL,
    "Id_Responsable" TEXT NOT NULL,

    CONSTRAINT "Assurer_pkey" PRIMARY KEY ("Code_UV","Id_Semestre","Id_Responsable")
);

-- CreateTable
CREATE TABLE "Statistiques" (
    "Id_Stat" SERIAL NOT NULL,
    "Taux_Reussite" INTEGER NOT NULL,
    "Code_UV" TEXT NOT NULL,
    "Id_Semestre" TEXT NOT NULL,

    CONSTRAINT "Statistiques_pkey" PRIMARY KEY ("Id_Stat")
);

-- CreateTable
CREATE TABLE "Evaluation" (
    "Id_Evaluation" SERIAL NOT NULL,
    "Critere" INTEGER NOT NULL,
    "Libelle_Critere" TEXT NOT NULL,
    "Note" INTEGER NOT NULL,
    "Code_UV" TEXT NOT NULL,
    "Id_Semestre" TEXT NOT NULL,

    CONSTRAINT "Evaluation_pkey" PRIMARY KEY ("Id_Evaluation")
);

-- CreateTable
CREATE TABLE "Avis" (
    "Id_Avis" SERIAL NOT NULL,
    "Contenu" TEXT NOT NULL,
    "Auteur" TEXT NOT NULL,
    "Date" TIMESTAMP(3) NOT NULL,
    "Code_UV" TEXT NOT NULL,
    "Id_Semestre" TEXT NOT NULL,

    CONSTRAINT "Avis_pkey" PRIMARY KEY ("Id_Avis")
);

-- CreateTable
CREATE TABLE "Document" (
    "Id_Doc" SERIAL NOT NULL,
    "Nom" TEXT NOT NULL,
    "Type" TEXT NOT NULL,
    "URL" TEXT NOT NULL,
    "Date_Ajout" TIMESTAMP(3) NOT NULL,
    "Code_UV" TEXT NOT NULL,
    "Id_Semestre" TEXT NOT NULL,

    CONSTRAINT "Document_pkey" PRIMARY KEY ("Id_Doc")
);

-- AddForeignKey
ALTER TABLE "Assurer" ADD CONSTRAINT "Assurer_Code_UV_fkey" FOREIGN KEY ("Code_UV") REFERENCES "UV"("Code_UV") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Assurer" ADD CONSTRAINT "Assurer_Id_Semestre_fkey" FOREIGN KEY ("Id_Semestre") REFERENCES "Semestre"("Id_Semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Assurer" ADD CONSTRAINT "Assurer_Id_Responsable_fkey" FOREIGN KEY ("Id_Responsable") REFERENCES "Responsable"("Id_Responsable") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistiques" ADD CONSTRAINT "Statistiques_Code_UV_fkey" FOREIGN KEY ("Code_UV") REFERENCES "UV"("Code_UV") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Statistiques" ADD CONSTRAINT "Statistiques_Id_Semestre_fkey" FOREIGN KEY ("Id_Semestre") REFERENCES "Semestre"("Id_Semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Evaluation" ADD CONSTRAINT "Evaluation_Code_UV_fkey" FOREIGN KEY ("Code_UV") REFERENCES "UV"("Code_UV") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Evaluation" ADD CONSTRAINT "Evaluation_Id_Semestre_fkey" FOREIGN KEY ("Id_Semestre") REFERENCES "Semestre"("Id_Semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avis" ADD CONSTRAINT "Avis_Code_UV_fkey" FOREIGN KEY ("Code_UV") REFERENCES "UV"("Code_UV") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Avis" ADD CONSTRAINT "Avis_Id_Semestre_fkey" FOREIGN KEY ("Id_Semestre") REFERENCES "Semestre"("Id_Semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_Code_UV_fkey" FOREIGN KEY ("Code_UV") REFERENCES "UV"("Code_UV") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Document" ADD CONSTRAINT "Document_Id_Semestre_fkey" FOREIGN KEY ("Id_Semestre") REFERENCES "Semestre"("Id_Semestre") ON DELETE RESTRICT ON UPDATE CASCADE;

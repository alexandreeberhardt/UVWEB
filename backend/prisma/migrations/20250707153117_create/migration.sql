-- CreateTable
CREATE TABLE "uv" (
    "code_uv" TEXT NOT NULL,
    "titre" TEXT NOT NULL,
    "categorie" TEXT NOT NULL,
    "ects" INTEGER NOT NULL,
    "actif" BOOLEAN NOT NULL,
    "fise" BOOLEAN NOT NULL,

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

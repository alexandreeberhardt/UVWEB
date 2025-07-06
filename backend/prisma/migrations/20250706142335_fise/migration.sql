/*
  Warnings:

  - Added the required column `fise` to the `uv` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "uv" ADD COLUMN     "fise" BOOLEAN NOT NULL;

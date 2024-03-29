/*
  Warnings:

  - The primary key for the `Crytocurrency` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `cryptocurrencyId` column on the `Crytocurrency` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - A unique constraint covering the columns `[geckocoinId]` on the table `Crytocurrency` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `geckocoinId` to the `Crytocurrency` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Crytocurrency" DROP CONSTRAINT "Crytocurrency_pkey",
ADD COLUMN     "geckocoinId" TEXT NOT NULL,
DROP COLUMN "cryptocurrencyId",
ADD COLUMN     "cryptocurrencyId" SERIAL NOT NULL,
ADD CONSTRAINT "Crytocurrency_pkey" PRIMARY KEY ("cryptocurrencyId");

-- CreateIndex
CREATE UNIQUE INDEX "Crytocurrency_geckocoinId_key" ON "Crytocurrency"("geckocoinId");

-- CreateIndex
CREATE INDEX "Crytocurrency_geckocoinId_idx" ON "Crytocurrency" USING HASH ("geckocoinId");

-- CreateTable
CREATE TABLE "User" (
    "userId" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" VARCHAR(20) NOT NULL,
    "lastname" VARCHAR(50) NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "favoriteCurrencyId" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "Currency" (
    "currencyId" SERIAL NOT NULL,
    "name" VARCHAR(4) NOT NULL,

    CONSTRAINT "Currency_pkey" PRIMARY KEY ("currencyId")
);

-- CreateTable
CREATE TABLE "Crytocurrency" (
    "cryptocurrencyId" TEXT NOT NULL,
    "symbol" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "image" TEXT,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Crytocurrency_pkey" PRIMARY KEY ("cryptocurrencyId")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_favoriteCurrencyId_key" ON "User"("favoriteCurrencyId");

-- CreateIndex
CREATE UNIQUE INDEX "Crytocurrency_symbol_key" ON "Crytocurrency"("symbol");

-- CreateIndex
CREATE UNIQUE INDEX "Crytocurrency_userId_key" ON "Crytocurrency"("userId");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_favoriteCurrencyId_fkey" FOREIGN KEY ("favoriteCurrencyId") REFERENCES "Currency"("currencyId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Crytocurrency" ADD CONSTRAINT "Crytocurrency_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("userId") ON DELETE RESTRICT ON UPDATE CASCADE;

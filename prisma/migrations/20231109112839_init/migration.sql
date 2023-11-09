-- CreateTable
CREATE TABLE "Question" (
    "number" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "file" BOOLEAN NOT NULL DEFAULT false
);

-- CreateTable
CREATE TABLE "Option" (
    "id" SERIAL NOT NULL,
    "number" INTEGER NOT NULL,
    "questionNumber" INTEGER NOT NULL,
    "content" TEXT NOT NULL,
    "correct" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Option_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Result" (
    "id" SERIAL NOT NULL,
    "user" TEXT NOT NULL,
    "calification" DECIMAL(65,30) NOT NULL,
    "corrected" INTEGER NOT NULL,
    "totalQuestions" INTEGER NOT NULL,

    CONSTRAINT "Result_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Question_number_key" ON "Question"("number");

-- CreateIndex
CREATE UNIQUE INDEX "Result_user_key" ON "Result"("user");

-- AddForeignKey
ALTER TABLE "Option" ADD CONSTRAINT "Option_questionNumber_fkey" FOREIGN KEY ("questionNumber") REFERENCES "Question"("number") ON DELETE RESTRICT ON UPDATE CASCADE;

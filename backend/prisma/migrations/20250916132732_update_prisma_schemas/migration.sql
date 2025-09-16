-- CreateTable
CREATE TABLE "public"."department" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "hod" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."hostel" (
    "id" SERIAL NOT NULL,
    "number" INTEGER NOT NULL,
    "capacity" INTEGER NOT NULL,
    "warden" TEXT NOT NULL,
    "allottedRooms" INTEGER NOT NULL,
    "vacantRooms" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "hostel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."section" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "officerId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "section_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."admin" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "fullName" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."faculty" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "fullName" TEXT NOT NULL,
    "staffId" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "departmentName" TEXT NOT NULL,
    "designation" TEXT NOT NULL,
    "sub_taught" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "faculty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."student" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "fullName" TEXT NOT NULL,
    "studentId" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "semester" INTEGER NOT NULL,
    "departmentName" TEXT NOT NULL,
    "allotmentNo" INTEGER NOT NULL,
    "gender" TEXT NOT NULL,
    "date_of_birth" INTEGER NOT NULL,
    "address" TEXT NOT NULL,
    "curr_semester" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."officer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "officerId" TEXT NOT NULL,
    "designation" TEXT NOT NULL,
    "email" TEXT,
    "sectionName" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "officer_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "department_name_key" ON "public"."department"("name");

-- CreateIndex
CREATE UNIQUE INDEX "hostel_number_key" ON "public"."hostel"("number");

-- CreateIndex
CREATE UNIQUE INDEX "section_name_key" ON "public"."section"("name");

-- CreateIndex
CREATE UNIQUE INDEX "section_officerId_key" ON "public"."section"("officerId");

-- CreateIndex
CREATE UNIQUE INDEX "admin_email_key" ON "public"."admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "admin_staffId_key" ON "public"."admin"("staffId");

-- CreateIndex
CREATE UNIQUE INDEX "faculty_email_key" ON "public"."faculty"("email");

-- CreateIndex
CREATE UNIQUE INDEX "faculty_staffId_key" ON "public"."faculty"("staffId");

-- CreateIndex
CREATE UNIQUE INDEX "student_email_key" ON "public"."student"("email");

-- CreateIndex
CREATE UNIQUE INDEX "student_studentId_key" ON "public"."student"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "student_allotmentNo_key" ON "public"."student"("allotmentNo");

-- CreateIndex
CREATE UNIQUE INDEX "officer_name_key" ON "public"."officer"("name");

-- CreateIndex
CREATE UNIQUE INDEX "officer_officerId_key" ON "public"."officer"("officerId");

-- CreateIndex
CREATE UNIQUE INDEX "officer_email_key" ON "public"."officer"("email");

-- AddForeignKey
ALTER TABLE "public"."faculty" ADD CONSTRAINT "faculty_departmentName_fkey" FOREIGN KEY ("departmentName") REFERENCES "public"."department"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."student" ADD CONSTRAINT "student_departmentName_fkey" FOREIGN KEY ("departmentName") REFERENCES "public"."department"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."officer" ADD CONSTRAINT "officer_sectionName_fkey" FOREIGN KEY ("sectionName") REFERENCES "public"."section"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

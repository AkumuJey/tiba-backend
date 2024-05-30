/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `healthcare_provider` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE `patient` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `firstName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `dateOfBirth` DATE NOT NULL,
    `sex` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NULL,
    `email` VARCHAR(191) NOT NULL,
    `phoneNumber` VARCHAR(191) NOT NULL,
    `emergencyContactName` VARCHAR(191) NULL,
    `emergencyContactPhone` VARCHAR(191) NULL,

    UNIQUE INDEX `patient_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `drug_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `categoryName` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `drug_category_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `drug` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `categoryID` BIGINT NOT NULL,
    `brandName` VARCHAR(191) NOT NULL,
    `pharmcoName` VARCHAR(191) NOT NULL,
    `manufactureDate` DATE NOT NULL,
    `expiryDate` DATE NOT NULL,
    `batchNo` BIGINT NOT NULL,
    `unitsAvailable` VARCHAR(191) NOT NULL,
    `pricePerUnit` DOUBLE NOT NULL,

    UNIQUE INDEX `drug_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `appointments` (
    `id` BIGINT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `patientID` BIGINT NOT NULL,
    `healthProviderID` BIGINT NOT NULL,
    `venue` VARCHAR(191) NOT NULL,
    `appointmentTime` DATETIME(3) NOT NULL,
    `amount` DOUBLE NOT NULL,

    UNIQUE INDEX `appointments_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `prescription` (
    `id` BIGINT NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `patientID` BIGINT NOT NULL,
    `healthcareProviderID` BIGINT NOT NULL,
    `dosage` VARCHAR(191) NOT NULL,
    `date` DATE NOT NULL,
    `instruction` VARCHAR(191) NULL,

    UNIQUE INDEX `prescription_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `medical_history` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `patientID` BIGINT NOT NULL,
    `presentation` VARCHAR(191) NOT NULL,
    `medicalHistory` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `medical_history_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `prescription_detail` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `prescriptionID` BIGINT NOT NULL,
    `drugID` BIGINT NOT NULL,
    `quantity` BIGINT NOT NULL,
    `durationInDays` BIGINT NOT NULL,

    UNIQUE INDEX `prescription_detail_id_key`(`id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `healthcare_provider_id_key` ON `healthcare_provider`(`id`);

-- AddForeignKey
ALTER TABLE `drug` ADD CONSTRAINT `drug_categoryID_fkey` FOREIGN KEY (`categoryID`) REFERENCES `drug_category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `appointments_patientID_fkey` FOREIGN KEY (`patientID`) REFERENCES `patient`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `appointments` ADD CONSTRAINT `appointments_healthProviderID_fkey` FOREIGN KEY (`healthProviderID`) REFERENCES `healthcare_provider`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescription` ADD CONSTRAINT `prescription_patientID_fkey` FOREIGN KEY (`patientID`) REFERENCES `patient`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescription` ADD CONSTRAINT `prescription_healthcareProviderID_fkey` FOREIGN KEY (`healthcareProviderID`) REFERENCES `healthcare_provider`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `medical_history` ADD CONSTRAINT `medical_history_patientID_fkey` FOREIGN KEY (`patientID`) REFERENCES `patient`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescription_detail` ADD CONSTRAINT `prescription_detail_prescriptionID_fkey` FOREIGN KEY (`prescriptionID`) REFERENCES `prescription`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prescription_detail` ADD CONSTRAINT `prescription_detail_drugID_fkey` FOREIGN KEY (`drugID`) REFERENCES `drug`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

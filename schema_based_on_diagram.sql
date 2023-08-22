CREATE TABLE "invoices"(
    "id" INTEGER NOT NULL,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL
);

ALTER TABLE
    "invoices"
ADD
    PRIMARY KEY("id");

CREATE INDEX "invoices_medical_history_id_index" ON "invoices"("medical_history_id");

CREATE TABLE "medical_histories"(
    "id" INTEGER NOT NULL,
    "admittes_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL
);

ALTER TABLE
    "medical_histories"
ADD
    PRIMARY KEY("id");

CREATE INDEX "medical_histories_patient_id_index" ON "medical_histories"("patient_id");

CREATE TABLE "patients"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL
);

ALTER TABLE
    "patients"
ADD
    PRIMARY KEY("id");

CREATE TABLE "invoice_items"(
    "id" INTEGER NOT NULL,
    "unit_price" DECIMAL(8, 2) NOT NULL,
    "quanitity" INTEGER NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL
);

ALTER TABLE
    "invoice_items"
ADD
    PRIMARY KEY("id");

CREATE INDEX "invoice_items_invoice_id_index" ON "invoice_items"("invoice_id");

CREATE INDEX "invoice_items_treatment_id_index" ON "invoice_items"("treatment_id");

CREATE TABLE "treatments"(
    "id" INTEGER NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "blg1a2";

-- CreateTable
CREATE TABLE "blg1a2"."shoplists" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "user_id" UUID NOT NULL,
    "list_detail" INTEGER[],
    "note" VARCHAR(225),
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "longid" TEXT,

    CONSTRAINT "shoplists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blg1a2"."users" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "email" VARCHAR(255) NOT NULL,
    "phone" TEXT,
    "auth_provider" TEXT,
    "pwd" TEXT,
    "pin" INTEGER,
    "role" VARCHAR(255),
    "is_verified" BOOLEAN DEFAULT false,
    "is_active" BOOLEAN DEFAULT true,
    "verify_token" TEXT,
    "verify_token_expire" TIMESTAMP(6),
    "reset_token" TEXT,
    "reset_token_expire" TIMESTAMP(6),
    "username" VARCHAR(255),
    "noti_pref" VARCHAR(255) DEFAULT 'all',
    "favorites" SMALLINT[],
    "score" INTEGER DEFAULT 0,
    "last_login" TIMESTAMP(6),
    "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "longid" VARCHAR(255),

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "idx_shoplist_list_detail" ON "blg1a2"."shoplists"("list_detail");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "blg1a2"."users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_phone_key" ON "blg1a2"."users"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "blg1a2"."users"("username");

-- CreateIndex
CREATE INDEX "idx_user_is_active" ON "blg1a2"."users"("is_active");

-- CreateIndex
CREATE INDEX "idx_user_is_verified" ON "blg1a2"."users"("is_verified");

-- CreateIndex
CREATE INDEX "idx_user_noti_pref" ON "blg1a2"."users"("noti_pref");

-- CreateIndex
CREATE INDEX "idx_user_score" ON "blg1a2"."users"("score");

-- AddForeignKey
ALTER TABLE "blg1a2"."shoplists" ADD CONSTRAINT "fk_shoplist_user" FOREIGN KEY ("user_id") REFERENCES "blg1a2"."users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;


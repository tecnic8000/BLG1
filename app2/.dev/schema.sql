CREATE SCHEMA IF NOT EXISTS blg1a2_staging;

CREATE TABLE blg1a2_staging.users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    email TEXT UNIQUE, -- REQUIRED
    phone TEXT UNIQUE DEFAULT NULL,
    auth_provider TEXT DEFAULT NULL,
    pwd TEXT, -- auth -- REQUIRED
    pin INTEGER DEFAULT NULL,
    role VARCHAR(255), -- CHECK (role IN ('customer', 'merchant', 'partner', 'runner', 'driver', 'moderator', 'admin', 'employee')), -- role: user/customer, merchant/partner, runner/driver, moderator/employee. admin
    is_verified BOOLEAN DEFAULT FALSE, -- security
    is_active BOOLEAN DEFAULT TRUE, -- to monitor inactive/deactivated account
    verify_token TEXT,
    verify_token_expire TIMESTAMP,
    reset_token TEXT DEFAULT NULL,
    reset_token_expire TIMESTAMP,
    last_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- metadata
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE blg1a2_staging.profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    user_id UUID NOT NULL UNIQUE,
    username VARCHAR(255) UNIQUE,
    score INTEGER DEFAULT 0,
    noti_pref VARCHAR(255) DEFAULT 'all', -- securityOnly, eventOnly, announcementOnly
    longid VARCHAR(255), -- unix time in ms for debugging
    CONSTRAINT fk_profile_user FOREIGN KEY (user_id) REFERENCES blg1a2_staging.users (id)
);

CREATE TABLE blg1a2_staging.shoplists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    user_id UUID NOT NULL,
    list_detail INT[],
    note VARCHAR(225),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- metadata
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    longid TEXT, -- unix time in ms for debugging
    CONSTRAINT fk_shoplist_user FOREIGN KEY (user_id) REFERENCES blg1a2_staging.users (id)
);


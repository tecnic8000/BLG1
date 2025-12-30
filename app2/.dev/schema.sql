BEGIN;

CREATE SCHEMA IF NOT EXISTS blg1a2;

CREATE TABLE blg1a2.users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    email VARCHAR(255) UNIQUE NOT NULL,
    phone TEXT UNIQUE,
    auth_provider TEXT,
    pwd TEXT, -- OAuth
    pin INTEGER DEFAULT NULL,
    role VARCHAR(255), -- CHECK (role IN ('customer', 'merchant', 'partner', 'runner', 'driver', 'moderator', 'admin', 'employee')), -- role: user/customer, merchant/partner, runner/driver, moderator/employee. admin
    is_verified BOOLEAN DEFAULT FALSE, -- security
    is_active BOOLEAN DEFAULT TRUE, -- to monitor inactive/deactivated account
    verify_token TEXT,
    verify_token_expire TIMESTAMP,
    reset_token TEXT,
    reset_token_expire TIMESTAMP,
    username VARCHAR(255) UNIQUE,
    noti_pref VARCHAR(255) DEFAULT 'all', -- securityOnly, eventOnly, announcementOnly
    favorites SMALLINT[],
    score INTEGER DEFAULT 0,
    last_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- metadata
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    longid VARCHAR(255) -- unix time in ms for debugging
);

CREATE INDEX idx_user_is_verified ON blg1a2.users (is_verified);

CREATE INDEX idx_user_is_active ON blg1a2.users (is_active);

CREATE INDEX idx_user_score ON blg1a2.users (score);

CREATE INDEX idx_user_noti_pref ON blg1a2.users (noti_pref);

CREATE TABLE blg1a2.shoplists (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid (),
    user_id UUID NOT NULL,
    list_detail INT[] NOT NULL,
    note VARCHAR(225),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- metadata
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    longid TEXT, -- unix time in ms for debugging
    CONSTRAINT fk_shoplist_user FOREIGN KEY (user_id) REFERENCES blg1a2.users (id)
);

CREATE INDEX idx_shoplist_list_detail ON blg1a2.shoplists (list_detail);

COMMIT;



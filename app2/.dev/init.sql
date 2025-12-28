-- Insert 3 users (1 admin, 2 customers)
INSERT INTO blg1a2_staging.users (id, email, phone, pwd, role, is_verified, is_active, created_at, updated_at)
VALUES 
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'admin@example.com', '+84901234567', '$2b$10$hashedpassword123', 'admin', TRUE, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'customer1@example.com', '+84901234568', '$2b$10$hashedpassword456', 'user2', TRUE, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'customer2@example.com', '+84901234569', '$2b$10$hashedpassword789', 'user2', FALSE, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert 3 profiles (one for each user)
INSERT INTO blg1a2_staging.profiles (id, user_id, username, score, noti_pref, longid)
VALUES 
    ('d3eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', 'a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'admin_user', 100, 'all', '1703001234567'),
    ('e4eebc99-9c0b-4ef8-bb6d-6bb9bd380a55', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'shopper_one', 50, 'all', '1703001234568'),
    ('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a66', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'shopper_two', 25, 'eventOnly', '1703001234569');

-- Insert 5 shoplists (distributed among users)
INSERT INTO blg1a2_staging.shoplists (id, user_id, list_detail, note, created_at, updated_at, longid)
VALUES 
    ('10eebc99-9c0b-4ef8-bb6d-6bb9bd380a77', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', ARRAY[1, 2, 3], 'Weekly groceries', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1703002234567'),
    ('11eebc99-9c0b-4ef8-bb6d-6bb9bd380a88', 'b1eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', ARRAY[2, 5], 'Party supplies', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1703002234568'),
    ('12eebc99-9c0b-4ef8-bb6d-6bb9bd380a99', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', ARRAY[3, 2, 4], 'Home essentials', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1703002234569'),
    ('13eebc99-9c0b-4ef8-bb6d-6bb9bd380aaa', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', ARRAY[4], 'Quick snack run', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1703002234570'),
    ('14eebc99-9c0b-4ef8-bb6d-6bb9bd380abb', 'c2eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', ARRAY[5, 2, 3, 4], 'Office supplies audit', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, '1703002234571');


BEGIN;
INSERT INTO blg1a2.users (id, email, role, is_verified, username, score) VALUES 
('a1b2c3d4-e5f6-4a5b-8c9d-0e1f2a3b4c5d', 'admin@example.com', 'admin', TRUE, 'admin_user', 1000),
('b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', 'customer1@example.com', 'customer1', TRUE, 'shopper_jane', 450),
('c3d4e5f6-a7b8-4c5d-0e1f-2a3b4c5d6e7f', 'customer2@example.com', 'customer1', TRUE, 'shopper_mike', 320);

INSERT INTO blg1a2.shoplists (id, user_id, list_detail, note) VALUES 
('d4e5f6a7-b8c9-4d5e-1f2a-3b4c5d6e7f8a', 'b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', ARRAY[1,2,3,5], 'Weekly groceries'),
('e5f6a7b8-c9d0-4e5f-2a3b-4c5d6e7f8a9b', 'b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', ARRAY[4,2,3], 'Electronics'),
('f6a7b8c9-d0e1-4f5a-3b4c-5d6e7f8a9b0c', 'b2c3d4e5-f6a7-4b5c-9d0e-1f2a3b4c5d6e', ARRAY[3,2], 'Holiday gifts'),
('a7b8c9d0-e1f2-4a5b-4c5d-6e7f8a9b0c1d', 'c3d4e5f6-a7b8-4c5d-0e1f-2a3b4c5d6e7f', ARRAY[1,6], 'Hardware store'),
('b8c9d0e1-f2a3-4b5c-5d6e-7f8a9b0c1d2e', 'c3d4e5f6-a7b8-4c5d-0e1f-2a3b4c5d6e7f', ARRAY[5,2], 'Books');
COMMIT;


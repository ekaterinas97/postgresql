ALTER TABLE video
    ADD CONSTRAINT video_owner_id_fk
    FOREIGN KEY (owner_id)
    REFERENCES users(id)
        ON DELETE CASCADE;
ALTER TABLE users
    ADD CONSTRAINT users_main_photo_id_fk
    FOREIGN KEY (main_photo_id)
    REFERENCES photo(id);

ALTER TABLE friendship
    ADD CONSTRAINT friendship_status_id_fk
    FOREIGN KEY (status_id)
    REFERENCES friendship_statuses(id);

ALTER TABLE friendship
    ADD CONSTRAINT friendship_requested_by_user_id_fk
    FOREIGN KEY (requested_by_user_id)
    REFERENCES users(id);

ALTER TABLE friendship
    ADD CONSTRAINT friendship_requested_to_user_id_fk
    FOREIGN KEY (requested_to_user_id)
    REFERENCES users(id);

ALTER TABLE subscriptions
    ADD CONSTRAINT subscriptions_subscriber_id_fk
    FOREIGN KEY (subscriber_id)
    REFERENCES users(id);

ALTER TABLE communities_users
    ADD CONSTRAINT communities_users_user_id_fk
    FOREIGN KEY (user_id)
    REFERENCES users(id);

ALTER TABLE communities_users
    ADD CONSTRAINT communities_users_community_id_fk
    FOREIGN KEY (community_id)
    REFERENCES communities(id);
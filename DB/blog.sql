
CREATE TABLE page_category (
                id SMALLINT AUTO_INCREMENT NOT NULL,
                category_title VARCHAR(255) NOT NULL,
                link VARCHAR(255) NOT NULL,
                PRIMARY KEY (id)
);


CREATE TABLE posts_category (
                category_id SMALLINT AUTO_INCREMENT NOT NULL,
                name VARCHAR(255) NOT NULL,
                PRIMARY KEY (category_id)
);


CREATE TABLE users (
                person_id SMALLINT AUTO_INCREMENT NOT NULL,
                person_name VARCHAR(100) NOT NULL,
                person_surname VARCHAR(100) NOT NULL,
                age VARCHAR(20),
                person_login VARCHAR(100) NOT NULL,
                person_password VARCHAR(30) NOT NULL,
                more_info VARCHAR(400),
                role VARCHAR(30) NOT NULL,
                avatar VARCHAR(255),
                person_email VARCHAR(30) NOT NULL,
                person_phone_number VARCHAR(30),
                person_date_subscription DATE NOT NULL,
                person_date_unsuscription DATE,
                PRIMARY KEY (person_id)
);


CREATE TABLE j_email (
                email_id SMALLINT AUTO_INCREMENT NOT NULL,
                person_id SMALLINT NOT NULL,
                email_name VARCHAR(100) NOT NULL,
                email_surname VARCHAR(100) NOT NULL,
                email_content VARCHAR(400) NOT NULL,
                email_date DATE NOT NULL,
                email_status VARCHAR(100) NOT NULL,
                PRIMARY KEY (email_id, person_id)
);


CREATE TABLE pages (
                page_id SMALLINT AUTO_INCREMENT NOT NULL,
                FK_category_id SMALLINT NOT NULL,
                FK_user_id SMALLINT NOT NULL,
                page_title VARCHAR(20) NOT NULL,
                page_content TEXT(1000) NOT NULL,
                date_page_creation DATE NOT NULL,
                data_page_modification DATE,
                PRIMARY KEY (page_id, FK_category_id, FK_user_id)
);


CREATE TABLE posts (
                post_id INT AUTO_INCREMENT NOT NULL,
                FK_person_id SMALLINT NOT NULL,
                FK_post_category_id SMALLINT NOT NULL,
                post_title VARCHAR(100) NOT NULL,
                sentence VARCHAR(255),
                post_content TEXT(1000) NOT NULL,
                date_post_creation DATE NOT NULL,
                date_post_last_modification DATE,
                PRIMARY KEY (post_id, FK_person_id, FK_post_category_id)
);


CREATE TABLE comments (
                comment_id SMALLINT AUTO_INCREMENT NOT NULL,
                FK_person_id SMALLINT NOT NULL,
                FK_post_id INT NOT NULL,
                comment VARCHAR(200) NOT NULL,
                date_comment DATE NOT NULL,
                comment_status VARCHAR(100) NOT NULL,
                comment_date_modification DATE,
                PRIMARY KEY (comment_id, FK_person_id, FK_post_id)
);


ALTER TABLE pages ADD CONSTRAINT page_category_pages_fk
FOREIGN KEY (FK_category_id)
REFERENCES page_category (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE posts ADD CONSTRAINT category_posts_fk
FOREIGN KEY (FK_post_category_id)
REFERENCES posts_category (category_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comments ADD CONSTRAINT persons_comments_fk
FOREIGN KEY (FK_person_id)
REFERENCES users (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE posts ADD CONSTRAINT persons_posts_fk
FOREIGN KEY (FK_person_id)
REFERENCES users (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE pages ADD CONSTRAINT users_pages_fk
FOREIGN KEY (FK_user_id)
REFERENCES users (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE j_email ADD CONSTRAINT users_j_email_fk
FOREIGN KEY (person_id)
REFERENCES users (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE comments ADD CONSTRAINT posts_comments_fk
FOREIGN KEY (FK_post_id)
REFERENCES posts (post_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

CREATE TABLE board(  board_id bigserial NOT NULL,  board_title varchar(255) NOT NULL,  board_public boolean DEFAULT TRUE NOT NULL,  board_registration timestamp DEFAULT NOW() NOT NULL);ALTER TABLE board ADD CONSTRAINT pk_board_id  PRIMARY KEY (board_id);CREATE TABLE card(  card_id bigserial NOT NULL,  card_board_id bigint NOT NULL,  card_col_id bigint NOT NULL,  card_order integer NOT NULL,  card_title varchar(255) NOT NULL,  card_archive boolean DEFAULT FALSE NOT NULL,  card_registration timestamp DEFAULT NOW() NOT NULL);ALTER TABLE card ADD CONSTRAINT pk_card  PRIMARY KEY (card_id);CREATE TABLE col(  col_id bigserial NOT NULL,  col_board_id bigint NOT NULL,  col_title varchar(255) NOT NULL,  col_registration timestamp DEFAULT NOW() NOT NULL);ALTER TABLE col ADD CONSTRAINT pk_col_id  PRIMARY KEY (col_id);CREATE TABLE coworker(  coworker_id bigserial NOT NULL,  coworker_users_id bigint NOT NULL,  coworker_board_id bigint NOT NULL);ALTER TABLE coworker ADD CONSTRAINT pk_coworker  PRIMARY KEY (coworker_id);CREATE TABLE users(  users_id bigserial NOT NULL,  users_login varchar(180) NOT NULL,  users_pass varchar(100),  users_registration timestamp DEFAULT NOW() NOT NULL);ALTER TABLE users ADD CONSTRAINT pk_users  PRIMARY KEY (users_id);ALTER TABLE card ADD CONSTRAINT fk_card_board_id  FOREIGN KEY (card_board_id) REFERENCES board (board_id) ON DELETE CASCADE;ALTER TABLE card ADD CONSTRAINT fk_card_col_id  FOREIGN KEY (card_col_id) REFERENCES col (col_id) ON DELETE CASCADE;ALTER TABLE col ADD CONSTRAINT fk_col_board_id  FOREIGN KEY (col_board_id) REFERENCES board (board_id) ON DELETE CASCADE;ALTER TABLE coworker ADD CONSTRAINT fk_coworker_board_id  FOREIGN KEY (coworker_board_id) REFERENCES board (board_id) ON DELETE CASCADE;ALTER TABLE coworker ADD CONSTRAINT fk_coworker_users_id  FOREIGN KEY (coworker_users_id) REFERENCES users (users_id) ON DELETE CASCADE;
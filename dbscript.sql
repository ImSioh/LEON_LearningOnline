/* USE mysql; */
DROP DATABASE IF EXISTS online_learning;
CREATE DATABASE IF NOT EXISTS online_learning CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE online_learning;

CREATE TABLE IF NOT EXISTS account(
  account_id binary(16),
  name varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  birth_date date,
  gender bit,
  school varchar(100) CHARACTER SET utf8mb4, 
  address varchar(100) CHARACTER SET utf8mb4,
  phone_number varchar(24) CHARACTER SET utf8mb4 UNIQUE,
  email varchar(100) CHARACTER SET utf8mb4 UNIQUE NOT NULL,
  password char(64) CHARACTER SET utf8mb4 NOT NULL,
  role tinyint NOT NULL,
  profile_picture varchar(100) CHARACTER SET utf8mb4,
  verification_code char(6) CHARACTER SET utf8mb4,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  locked bit DEFAULT FALSE,
  PRIMARY KEY (account_id)
);

CREATE TABLE IF NOT EXISTS class(
  class_id binary(16),
  account_id binary(16) NOT NULL,
  name varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  code char(5) CHARACTER SET utf8mb4 NOT NULL,
  enroll_approve bit DEFAULT TRUE,
  class_picture varchar(100) CHARACTER SET utf8mb4,
  hidden bit DEFAULT FALSE,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (class_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE IF NOT EXISTS enrollment(
  account_id binary(16),
  class_id binary(16),
  accepted bit,
  enroll_time datetime,
  PRIMARY KEY (account_id, class_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS feedback(
  feedback_id binary(16),
  account_id binary(16) NOT NULL,
  title varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  content text CHARACTER SET utf8mb4 NOT NULL,
  response text CHARACTER SET utf8mb4,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (feedback_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE IF NOT EXISTS notification(
  notification_id binary(16),
  account_id binary(16) NOT NULL,
  class_id binary(16),
  title varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  redirect_url varchar(100) CHARACTER SET utf8mb4,
  content varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (notification_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS send_notification(
  notification_id binary(16),
  account_id binary(16),
  PRIMARY KEY (notification_id, account_id),
  FOREIGN KEY (notification_id) REFERENCES notification(notification_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE IF NOT EXISTS resource(
  resource_id binary(16),
  url varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  thumbnail varchar(100) CHARACTER set utf8mb4,
  mime_type varchar(50) CHARACTER set utf8mb4 NOT NULL,
  PRIMARY KEY (resource_id)
);

CREATE TABLE IF NOT EXISTS post(
  post_id binary(16),
  account_id binary(16) NOT NULL,
  class_id binary(16) NOT NULL,
  pin bit DEFAULT FALSE,
  content text CHARACTER SET utf8mb4 NOT NULL,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (post_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS post_resource(
  post_id binary(16),
  resource_id binary(16),
  PRIMARY KEY (post_id, resource_id),
  FOREIGN KEY (post_id) REFERENCES post(post_id),
  FOREIGN KEY (resource_id) REFERENCES resource(resource_id)
);

CREATE TABLE IF NOT EXISTS comment(
  comment_id binary(16),
  account_id binary(16) NOT NULL,
  post_id binary(16) NOT NULL,
  resource_id binary(16),
  content text NOT NULL,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (comment_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id),
  FOREIGN KEY (post_id) REFERENCES post(post_id),
  FOREIGN KEY (resource_id) REFERENCES resource(resource_id)
);

CREATE TABLE IF NOT EXISTS test(
  test_id binary(16),
  title varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  description text CHARACTER set utf8mb4,
  PRIMARY KEY (test_id)
);

CREATE TABLE IF NOT EXISTS assign_test(
  assign_test_id binary(16),
  test_id binary(16) NOT NULL,
  account_id binary(16) NOT NULL,
  class_id binary(16) NOT NULL,
  duration time,
  start_at datetime NOT NULL,
  end_at datetime,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (assign_test_id),
  FOREIGN KEY (test_id) REFERENCES test(test_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS do_test(
  assign_test_id binary(16),
  account_id binary(16),
  start_time datetime DEFAULT CURRENT_TIMESTAMP,
  finish_time datetime,
  score float,
  PRIMARY KEY (assign_test_id, account_id),
  FOREIGN KEY (assign_test_id) REFERENCES assign_test(assign_test_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE IF NOT EXISTS question(
  question_id binary(16),
  title varchar(100) CHARACTER SET utf8mb4,
  content text,
  PRIMARY KEY (question_id)
);

CREATE TABLE IF NOT EXISTS question_in_test(
  question_id binary(16),
  test_id binary(16),
  PRIMARY KEY (question_id, test_id),
  FOREIGN KEY (question_id) REFERENCES question(question_id),
  FOREIGN KEY (test_id) REFERENCES test(test_id)
);

CREATE TABLE IF NOT EXISTS question_resource(
  question_id binary(16),
  resource_id binary(16),
  PRIMARY KEY (question_id, resource_id),
  FOREIGN KEY (question_id) REFERENCES question(question_id),
  FOREIGN KEY (resource_id) REFERENCES resource(resource_id)
);

CREATE TABLE IF NOT EXISTS answer(
  answer_id binary(16),
  question_id binary(16) NOT NULL,
  resource_id binary(16),
  content text,
  correct bit DEFAULT FALSE,
  PRIMARY KEY (answer_id),
  FOREIGN KEY (question_id) REFERENCES question(question_id),
  FOREIGN KEY (resource_id) REFERENCES resource(resource_id)
);

CREATE TABLE IF NOT EXISTS student_answer(
  account_id binary(16),
  assign_test_id binary(16),
  answer_id binary(16),
  PRIMARY KEY (account_id, assign_test_id, answer_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id),
  FOREIGN KEY (assign_test_id) REFERENCES assign_test(assign_test_id),
  FOREIGN KEY (answer_id) REFERENCES answer(answer_id)
);

INSERT INTO account (account_id, name, email, password, role, create_time, locked)
  VALUES (UUID_TO_BIN(UUID()), 'admin', 'admin@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 3, NOW(), 0);
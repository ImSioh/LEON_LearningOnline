USE mysql;
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
  target binary(16),
  type tinyint,
  title varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  redirect_url varchar(100) CHARACTER SET utf8mb4,
  content varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (notification_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id),
  FOREIGN KEY (target) REFERENCES account(account_id)
);

CREATE TABLE IF NOT EXISTS resource(
  resource_id binary(16),
  account_id binary(16) NOT NULL,
  url varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  thumbnail varchar(300) CHARACTER set utf8mb4,
  mime_type varchar(100) CHARACTER set utf8mb4 NOT NULL,
  deleted bit DEFAULT FALSE,
  PRIMARY KEY (resource_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id)
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
  class_id binary(16) NOT NULL,
  resource_id binary(16),
  title varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  description text CHARACTER set utf8mb4,
  start_at datetime NOT NULL,
  end_at datetime,
  duration int,
  allow_review bit DEFAULT TRUE,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (test_id),
  FOREIGN KEY (resource_id) REFERENCES resource(resource_id),
  FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE IF NOT EXISTS do_test(
  test_id binary(16),
  account_id binary(16),
  start_time datetime DEFAULT CURRENT_TIMESTAMP,
  finish_time datetime,
  score float,
  PRIMARY KEY (test_id, account_id),
  FOREIGN KEY (test_id) REFERENCES test(test_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE IF NOT EXISTS question(
  question_id binary(16),
  test_id binary(16) NOT NULL,
  resource_id binary(16),
  question_order int,
  content text,
  PRIMARY KEY (question_id),
  FOREIGN KEY (test_id) REFERENCES test(test_id),
  FOREIGN KEY (resource_id) REFERENCES resource(resource_id)
);

CREATE TABLE IF NOT EXISTS answer(
  answer_id binary(16),
  question_id binary(16) NOT NULL,
  resource_id binary(16),
  answer_order int,
  content text,
  correct bit DEFAULT FALSE,
  PRIMARY KEY (answer_id),
  FOREIGN KEY (question_id) REFERENCES question(question_id),
  FOREIGN KEY (resource_id) REFERENCES resource(resource_id)
);

CREATE TABLE IF NOT EXISTS student_answer(
  account_id binary(16),
  question_id binary(16),
  answer_id binary(16),
  PRIMARY KEY (account_id, question_id, answer_id),
  FOREIGN KEY (account_id) REFERENCES account(account_id),
  FOREIGN KEY (question_id) REFERENCES question(question_id),
  FOREIGN KEY (answer_id) REFERENCES answer(answer_id)
);

INSERT INTO account (account_id, name, birth_date, gender, school, address, phone_number, email, password, role, create_time) VALUES
(0x044b56a0dbbb4a8e8fd890560af35134, 'ADMIN', NULL, TRUE, NULL, NULL, NULL, 'admin@gmail.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 3, '2022-01-01 00:00:00'),
(0xeeb085adce7144558a5d48c74d9f6620, 'Teacher', NULL, FALSE, NULL, NULL, NULL, 'teacher@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 1, '2022-08-30 09:58:55'),
(0x4aff1beb54ce46aea015e4614b1fdea2, 'Student', NULL, FALSE, NULL, NULL, NULL, 'student@gmail.com', '6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', 2, '2022-08-30 09:58:55'),
(0x8340734fab2b40f4a5b7644273f61032, 'Harlene Ashlin', NULL, FALSE, 'Skynoodle', NULL, NULL, 'hashlin0@angelfire.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-03-11 14:36:47'),
(0x94162beeab4f47baa24039a26a0bb417, 'Magdalena Riccio', NULL, FALSE, NULL, NULL, '8048589705', 'mriccio1@github.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-08-30 09:58:55'),
(0xe5bcaaf28a1c4a72b84d819b02b48629, 'Jackquelin Hasnney', '2010-03-24', FALSE, 'Avaveo', NULL, NULL, 'jhasnney2@toplist.cz', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-11-23 10:02:34'),
(0x25e65fdc51e24bf8b3d97c12fcc44e68, 'Maggi Buckberry', NULL, FALSE, 'Chatterbridge', 'Apt 299', NULL, 'mbuckberry3@va.gov', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-03-05 17:56:15'),
(0xb5d73ca4472d4ca2a88651124c6259c1, 'Theresita MacHostie', NULL, TRUE, NULL, NULL, '9204042310', 'tmachostie4@seesaa.net', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2023-01-17 04:46:40'),
(0x524b33f6a8c747448196c01320bc0bea, 'Darwin Elliston', '1995-09-10', TRUE, 'Avavee', 'Suite 5', NULL, 'delliston5@japanpost.jp', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-08-04 08:13:37'),
(0xd99a09c05d244225a011cbda466ba211, 'Jolene Yates', NULL, FALSE, 'Eare', NULL, NULL, 'jyates6@abc.net.au', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-02-27 09:19:23'),
(0x1a7d54df9bdd4bf495d5dc6ac5be4035, 'Monique Zecchetti', NULL, FALSE, NULL, NULL, NULL, 'mzecchetti7@weather.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-07-11 14:20:25'),
(0x505604407b074b9da0904f270246a692, 'Corrinne Soper', '2009-06-30', FALSE, NULL, 'Suite 96', NULL, 'csoper8@icio.us', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-07-27 02:24:04'),
(0xd0fc2cc98e1141fb9d156028539eef90, 'Caty Davidwitz', NULL, TRUE, 'Photolist', NULL, NULL, 'cdavidwitz9@kickstarter.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2023-01-02 09:49:12'),
(0x50c2564471304a38adbfab12ecc7264c, 'Georgette Cathrae', '2003-10-09', FALSE, 'Topicshots', 'PO Box 8136', '6815511268', 'gcathraea@jimdo.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-07-04 17:38:09'),
(0x2579bf03c2274a6fa00c536dacd10f3f, 'Alaric Luke', '2003-05-21', TRUE, 'Eimbee', NULL, NULL, 'alukeb@sourceforge.net', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-07-21 06:31:26'),
(0x8225b60b4eb24d189fb6245c8edff52e, 'Bronnie Ashlin', '1997-01-29', TRUE, NULL, 'PO Box 23630', NULL, 'bashlinc@ucoz.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-02-09 13:11:03'),
(0x4a4a0639d02c452bbdd5e3541a90f71b, 'Baily Gullen', '2001-12-05', FALSE, 'Meemm', '1st Floor', NULL, 'bgullend@hc360.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-04-05 05:14:45'),
(0xde99e6438b6f45bb83956c960d2491f9, 'Selle MacAllen', '1995-08-12', TRUE, 'Shuffledrive', NULL, NULL, 'smacallene@theatlantic.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-05-08 11:55:16'),
(0xbfa1e24273d641ef9feb77cc8c5b5eba, 'Freddie Heinreich', '1999-12-29', FALSE, 'Riffpedia', 'PO Box 97527', NULL, 'fheinreichf@cnet.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-01-26 05:42:21'),
(0x3e381b212ab048e8908cc967ec16150f, 'Sargent Hallt', NULL, FALSE, 'Oyoba', NULL, NULL, 'shalltg@wufoo.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-07-16 01:42:23'),
(0x02bf07617bb84970ac0e0939a4e6260c, 'Renado Wilber', '2006-05-22', FALSE, 'Trunyx', '12th Floor', NULL, 'rwilberh@google.de', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2023-01-06 01:45:15'),
(0xe5db4fa03d9e4da1a292055aa71caa1c, 'Louis Malafe', NULL, FALSE, NULL, NULL, NULL, 'lmalafei@shutterfly.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-07-27 07:56:21'),
(0x6eda8f44bdf2455191d7217295316b32, 'Heinrick Sondland', '2009-03-26', TRUE, 'Flashset', NULL, NULL, 'hsondlandj@hexun.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-08-18 05:59:05'),
(0xa179e38718fa44289a292b5955b98571, 'Clari Titley', NULL, FALSE, 'Meemm', NULL, NULL, 'ctitleyk@naver.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-03-19 18:08:38'),
(0x7fa3425c9a6d4dd382452fdccf1320b2, 'Carla Inchan', NULL, FALSE, 'Fatz', NULL, NULL, 'cinchanl@theguardian.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-09-04 16:48:40'),
(0x6ec4c565d50d4b848b927bb5d44f04a9, 'Sansone Petrolli', NULL, FALSE, NULL, NULL, NULL, 'spetrollim@nih.gov', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-11-07 13:37:37'),
(0xfd87145374104dad8b5eef3bcd7fe6ba, 'Andreas Suller', '1996-04-05', TRUE, 'Jayo', NULL, NULL, 'asullern@miibeian.gov.cn', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-02-13 16:41:28'),
(0x29b30eeafb3e43c8aab441b62171d44b, 'Rolando Folker', NULL, TRUE, 'Skipfire', 'Suite 38', NULL, 'rfolkero@devhub.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-12-10 23:22:03'),
(0x1ae33aeb021e409bb4b0bea399a3bc07, 'Davin O Hagan', NULL, TRUE, 'Chatterpoint', NULL, NULL, 'dohaganp@godaddy.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-12-03 13:27:55'),
(0x3edf4a1f43fa493abb04da6cc2b67d37, 'Anatola Causey', NULL, TRUE, 'Eamia', NULL, NULL, 'acauseyq@netlog.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-12-22 16:18:28'),
(0xcc6d52347444476da067c9a0fa657a20, 'Ilyse McLarty', NULL, TRUE, 'Twitternation', NULL, NULL, 'imclartyr@sciencedaily.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-01-12 05:47:56'),
(0xb03c096ab4454bcfb085c07351024d48, 'Deidre Bispham', NULL, TRUE, 'Eare', 'Apt 609', NULL, 'dbisphams@gnu.org', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-11-08 04:00:43'),
(0xa3e5e975241742e69b3e00788943ae04, 'Waverley Edgin', NULL, FALSE, 'Gabspot', 'Suite 54', NULL, 'wedgint@mediafire.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-03-28 01:25:35'),
(0x6bbeadf013084c55a82506de3d2973c5, 'Darcie Cromer', NULL, TRUE, 'Skyba', 'Room 679', NULL, 'dcromeru@house.gov', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-02-07 20:24:59'),
(0x8ea042666d76476abcbb91436f3b0ca0, 'Mel Gudde', '2009-07-09', TRUE, 'Twiyo', NULL, NULL, 'mguddev@craigslist.org', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-08-14 01:14:32'),
(0xc88d2a8f116243a38c8b17c2d0b6d6ae, 'Adriana Shurlock', '2007-04-05', TRUE, NULL, NULL, NULL, 'ashurlockw@sakura.ne.jp', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-09-26 07:01:10'),
(0xfd7980537baa4329b6779063706fe4e3, 'Asia Eadon', NULL, FALSE, 'Jabbersphere', NULL, NULL, 'aeadonx@yolasite.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-07-22 10:23:41'),
(0xdfa604cdd39c49e8a95f738824168cd4, 'Karalee Rabbitt', NULL, TRUE, 'Quinu', NULL, '9629637540', 'krabbitty@yelp.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-09-13 00:21:24'),
(0xf2926d8e70b84085ad57c9acfb22ed04, 'Hobart Scimonelli', NULL, TRUE, 'Livetube', NULL, NULL, 'hscimonelliz@blinklist.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-09-14 19:06:15'),
(0x98fd670e131145d7b5d2825a038b6d2e, 'Wainwright Awcock', '1999-08-11', FALSE, 'Livefish', NULL, NULL, 'wawcock10@webeden.co.uk', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-02-08 01:45:15'),
(0xa9a6171644314fc08261bcecada3335f, 'Sharity Imos', '2010-04-07', FALSE, 'Tanoodle', NULL, NULL, 'simos11@cbsnews.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-02-26 19:27:52'),
(0x7813667f6aab4a4d8a6f11c0aba1a7f6, 'Laraine Petrushka', '2004-02-27', FALSE, NULL, NULL, NULL, 'lpetrushka12@un.org', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-05-26 19:56:35'),
(0x446e5fe7fee94d04ab050c19621d0b82, 'Salomo Pipes', '2003-04-03', FALSE, 'Kimia', NULL, NULL, 'spipes13@cornell.edu', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-06-08 00:40:10'),
(0xfc92d9b461044d80b2bd8455730eef53, 'Emmye Whittam', '2000-02-13', TRUE, 'Eidel', NULL, NULL, 'ewhittam14@360.cn', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-12-10 18:50:22'),
(0x6e01dba25a65421c84c5d96aa55a2f63, 'Bailey Blowes', NULL, FALSE, 'Jabbercube', NULL, NULL, 'bblowes15@sakura.ne.jp', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-07-11 17:28:55'),
(0x1547423ab0a3459f830045489a206a1c, 'Rosetta Caps', '2001-10-07', FALSE, 'Lazzy', NULL, NULL, 'rcaps16@w3.org', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-10-16 12:57:50'),
(0xefe67e2eeb43483eabea6516e9400dcf, 'Aleece Thebeaud', NULL, FALSE, NULL, NULL, '2251162355', 'athebeaud17@geocities.jp', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-12-24 23:35:43'),
(0xdb8ed709e1784e28a797316121adda59, 'Jacquelynn Gorusso', NULL, FALSE, 'Tanoodle', 'Suite 34', NULL, 'jgorusso18@gmpg.org', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-12-25 08:41:28'),
(0x5108438a657142f9b6ebf88deed509c2, 'Stafani Gehrels', NULL, TRUE, 'Quinu', NULL, NULL, 'sgehrels19@businessinsider.com', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-08-20 12:36:56'),
(0x8a8bb113e7e641608eaebb2d8284e840, 'Sibby Terrell', '2007-03-05', FALSE, 'Divape', NULL, NULL, 'sterrell1a@state.tx.us', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 1, '2022-08-25 11:09:44'),
(0x469163b48a7f41d786fe2ba8f22b45aa, 'Garrett Leisman', '2004-09-12', TRUE, NULL, NULL, '3572433905', 'gleisman1b@europa.eu', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-09-10 02:18:59'),
(0x32dfa328e7cd460e8b3f0fa89f025707, 'Jonah Muskett', NULL, FALSE, 'Thoughtsphere', NULL, NULL, 'jmuskett1c@psu.edu', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-07-25 11:55:55'),
(0x896e1d0d4b6f4b1299c596082dbf3d04, 'Aldo Lakey', '2010-10-30', TRUE, 'Skidoo', NULL, NULL, 'alakey1d@github.io', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-09-21 11:37:14'),
(0x896e1d0d4b6f4b1299c596082dbf3d05, 'Le Duc Phi', '2010-10-30', TRUE, 'Skidoo', NULL, NULL, 'phildhe163212@fpt.edu.vn', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-09-21 11:37:14'),
(0x896e1d0d4b6f4b1299c596082dbf3d06, 'Nguyen Duc Anh', '2010-10-30', TRUE, 'Skidoo', NULL, NULL, 'anhndhe160088@fpt.edu.vn', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-09-21 11:37:14');


insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0xe4f4297018b4daef7e9366762f583eae,0xfc92d9b461044d80b2bd8455730eef53,"convallis, ante lectus","interdum. sed auctor odio a purus. duis elementum,","amet risus. donec egestas.","2021-10-18 20:40:22"),
  (0x5e4a676679a234513e814deec64134e7,0xc88d2a8f116243a38c8b17c2d0b6d6ae,"magna. nam ligula","sed dictum. proin eget odio.","sed eget lacus. mauris non dui","2021-12-11 13:31:30"),
  (0x2ae7b87c2873d5e2591aaac960d8d3bb,0xc88d2a8f116243a38c8b17c2d0b6d6ae,"tristique aliquet. phasellus","commodo tincidunt nibh. phasellus nulla. integer vulputate, risus a ultricies","eget tincidunt dui augue eu tellus. phasellus elit pede, malesuada","2020-08-14 22:56:22"),
  (0x43d0deb80a6bacb98da85891150b688d,0x5108438a657142f9b6ebf88deed509c2,"consequat auctor, nunc","nascetur ridiculus mus. aenean eget magna. suspendisse","ad litora torquent per conubia","2022-01-31 18:08:12"),
  (0xe6177ccf2391eb1d63e92f2f75ed34d9,0x5108438a657142f9b6ebf88deed509c2,"pede et risus.","tincidunt, nunc ac mattis ornare, lectus ante dictum","ut lacus. nulla tincidunt,","2021-07-20 14:40:36"),
  (0x1ce09713f1af39746d93499589bd9774,0xa9a6171644314fc08261bcecada3335f,"ultrices, mauris ipsum","ipsum leo elementum sem, vitae aliquam","enim nisl elementum purus, accumsan","2020-05-19 19:06:12"),
  (0x9c6bbef41638ebeeee4c28e21d1d3862,0xf2926d8e70b84085ad57c9acfb22ed04,"lacinia. sed congue,","commodo tincidunt nibh. phasellus nulla.","et libero. proin","2020-02-27 16:09:14"),
  (0xac6b6037c15addd821ea48f55d287e6a,0xa3e5e975241742e69b3e00788943ae04,"pede, ultrices a,","tristique senectus et netus et malesuada fames ac","volutpat nunc sit amet metus.","2020-11-16 22:36:03"),
  (0x1b5146c021f6c503c11d3854e6c31f19,0x5108438a657142f9b6ebf88deed509c2,"augue ut lacus.","adipiscing elit. curabitur sed tortor. integer","at","2020-11-06 11:10:24"),
  (0xb8ab091b28566750438886ef542484b0,0xcc6d52347444476da067c9a0fa657a20,"sit amet, consectetuer","aliquet odio. etiam ligula tortor,","turpis egestas.","2020-03-04 10:33:05");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0x1cace4438d2cb62e0ca41abeab3db55e,0x469163b48a7f41d786fe2ba8f22b45aa,"elementum, dui quis","auctor odio a purus. duis","feugiat metus","2021-07-07 20:09:03"),
  (0x144ac986a37a459b5a13b9a2320e6c5c,0xefe67e2eeb43483eabea6516e9400dcf,"lectus ante dictum","lectus convallis est, vitae sodales","in felis. nulla tempor augue ac ipsum.","2020-08-12 02:51:41"),
  (0x944b346f3065d84ee5c9f6ad55823c73,0x8a8bb113e7e641608eaebb2d8284e840,"vehicula aliquet libero.","duis at lacus. quisque purus sapien, gravida","eros non enim commodo hendrerit. donec porttitor","2021-07-11 19:49:10"),
  (0xa20675ccb56eabb0dde4adfc09b51bb3,0xb03c096ab4454bcfb085c07351024d48,"eleifend, nunc risus","nec ligula consectetuer rhoncus. nullam velit dui, semper","risus, at fringilla purus mauris a nunc. in at","2020-12-10 12:22:37"),
  (0x435cbd9c4eaaeec96d82c640036ec334,0x8ea042666d76476abcbb91436f3b0ca0,"et magnis dis","risus. nunc ac sem ut dolor dapibus gravida. aliquam","donec dignissim magna a tortor. nunc commodo auctor velit.","2021-05-17 09:18:40"),
  (0x0f3964b92b978c771cd7d762a049116e,0xdb8ed709e1784e28a797316121adda59,"nam ligula elit,","cras lorem lorem, luctus ut, pellentesque eget, dictum","nulla eu neque pellentesque massa","2021-10-02 00:18:19"),
  (0x3b3a5354c4b19fb22ee856a5546b7d9b,0x896e1d0d4b6f4b1299c596082dbf3d04,"malesuada augue ut","nisl arcu iaculis enim, sit amet ornare lectus","posuere cubilia curae phasellus ornare. fusce mollis. duis","2021-09-09 16:19:45"),
  (0x58929fcdc1dc82dc1926944d7466a5be,0x32dfa328e7cd460e8b3f0fa89f025707,"sagittis augue, eu","ultrices sit amet, risus. donec","et, commodo","2021-10-29 17:37:40"),
  (0xcef23871439e1791c17abc3725df51e8,0x469163b48a7f41d786fe2ba8f22b45aa,"faucibus. morbi vehicula.","nec orci. donec nibh. quisque nonummy ipsum","pharetra. nam ac nulla.","2021-11-29 14:33:02"),
  (0x5d9ef063c2914bb147973235e76c14e9,0xdfa604cdd39c49e8a95f738824168cd4,"dolor vitae dolor.","in faucibus orci luctus et ultrices posuere cubilia","ante bibendum ullamcorper. duis cursus, diam at pretium aliquet,","2020-05-25 07:32:59");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0xfc3e7169ea729971465364f25387d5ce,0xfd7980537baa4329b6779063706fe4e3,"per conubia nostra,","ligula. aenean gravida nunc sed pede. cum sociis natoque","elementum, dui quis accumsan","2020-04-10 02:23:03"),
  (0x2b14dc500eddc32b13c06bba2eced26e,0xdfa604cdd39c49e8a95f738824168cd4,"enim nisl elementum","mauris sapien, cursus in, hendrerit","sit","2021-08-09 22:02:47"),
  (0x13971039a0e42789734370c84231c817,0x3edf4a1f43fa493abb04da6cc2b67d37,"libero. proin mi.","facilisis vitae, orci. phasellus dapibus quam quis diam.","accumsan convallis, ante lectus convallis est, vitae sodales nisi","2021-05-23 09:45:15"),
  (0x49671965c2251d4b54a303d953617324,0x469163b48a7f41d786fe2ba8f22b45aa,"aliquet. proin velit.","proin mi. aliquam gravida mauris","justo eu arcu.","2020-02-21 14:49:10"),
  (0x3705312a1ed812e19967c96621dcb7ce,0x7813667f6aab4a4d8a6f11c0aba1a7f6,"turpis. nulla aliquet.","gravida molestie arcu. sed eu nibh","nascetur ridiculus mus. proin vel","2021-06-18 18:10:21"),
  (0xdb37de507311f4cb897d8e6df93eade2,0x469163b48a7f41d786fe2ba8f22b45aa,"enim non nisi.","elit, a feugiat tellus lorem eu metus. in","per inceptos hymenaeos. mauris ut quam vel","2020-04-21 13:33:15"),
  (0x96c3de7d9d84d1825364eebb088ed348,0xfc92d9b461044d80b2bd8455730eef53,"nibh lacinia orci,","tellus faucibus leo, in lobortis tellus","a nunc. in at pede. cras vulputate velit eu","2020-03-22 16:36:45"),
  (0x5ef95a1555e137941f8a1c5f7416668d,0x469163b48a7f41d786fe2ba8f22b45aa,"erat. sed nunc","nibh. quisque nonummy ipsum non arcu. vivamus sit","pellentesque tincidunt tempus risus. donec egestas. duis ac arcu.","2020-04-20 16:28:31"),
  (0xe3a2f62be1ea29b466be9c378d0182c6,0xfc92d9b461044d80b2bd8455730eef53,"hendrerit. donec porttitor","cursus, diam at pretium aliquet, metus urna","ut, pellentesque eget, dictum placerat, augue.","2021-09-13 12:29:26"),
  (0x710d5a35746ac5ec852d3294b7295b28,0x32dfa328e7cd460e8b3f0fa89f025707,"proin ultrices. duis","mollis vitae, posuere at, velit. cras lorem lorem, luctus ut,","cras interdum. nunc sollicitudin commodo ipsum. suspendisse non","2020-10-18 01:11:46");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0xfa034269be2aee0dc53a1ecb9421eb18,0x5108438a657142f9b6ebf88deed509c2,"lobortis tellus justo","magna. duis dignissim tempor arcu. vestibulum ut","lobortis. class aptent taciti sociosqu ad","2020-12-12 02:45:45"),
  (0x242cec8536b29397739b9bda28db10e8,0xc88d2a8f116243a38c8b17c2d0b6d6ae,"sem ut cursus","montes, nascetur ridiculus mus. donec dignissim magna","erat vitae risus. duis a mi fringilla mi lacinia","2020-05-14 05:14:06"),
  (0x8a2694e41463b1afce5961a5ee54fc09,0xa3e5e975241742e69b3e00788943ae04,"sit amet, consectetuer","nibh vulputate mauris sagittis placerat. cras dictum","sed, est.","2021-08-03 15:15:43"),
  (0x48e6587ab4a0c99daaa9ecdbc29798eb,0x98fd670e131145d7b5d2825a038b6d2e,"mauris. suspendisse aliquet","cursus non, egestas a, dui.","neque. in ornare sagittis felis. donec tempor,","2021-01-22 01:21:54"),
  (0x2c50e458ab4e0dc58433dc7d3b794641,0x5108438a657142f9b6ebf88deed509c2,"mauris, rhoncus id,","quam a felis ullamcorper viverra. maecenas iaculis","molestie tellus.","2020-02-17 07:08:06"),
  (0x6e36c0a27fdd68587566085b901c8e11,0x896e1d0d4b6f4b1299c596082dbf3d04,"ut dolor dapibus","dui augue eu tellus. phasellus elit pede, malesuada","aliquam auctor,","2021-02-16 02:28:42"),
  (0x7b56acc73dc96ef7d538b1a24f0ce517,0xfc92d9b461044d80b2bd8455730eef53,"turpis vitae purus","enim consequat purus. maecenas libero est,","consectetuer mauris id sapien. cras dolor dolor, tempus","2021-04-18 17:54:25"),
  (0xf7ba99efd54f362f351cc03c3b16e215,0x32dfa328e7cd460e8b3f0fa89f025707,"mi lorem, vehicula","magna. lorem ipsum dolor sit amet, consectetuer adipiscing","suspendisse aliquet molestie tellus. aenean egestas hendrerit","2021-02-18 13:08:41"),
  (0xd10dc422488c2697c8403bdab578594d,0xcc6d52347444476da067c9a0fa657a20,"in scelerisque scelerisque","volutpat nunc sit amet metus. aliquam","aliquet diam. sed diam lorem, auctor quis, tristique ac,","2021-01-05 20:41:08"),
  (0x291e72655f8dab155c1792b6bdca55e8,0xdfa604cdd39c49e8a95f738824168cd4,"vel turpis. aliquam","adipiscing elit. curabitur sed tortor. integer aliquam adipiscing lacus. ut","ornare placerat, orci lacus vestibulum lorem, sit amet","2020-09-11 10:34:19");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0xae1f45e9e9973314d85b1a70b8b3ab88,0xb03c096ab4454bcfb085c07351024d48,"velit. pellentesque ultricies","semper tellus id nunc interdum feugiat.","etiam vestibulum massa rutrum magna. cras convallis convallis dolor. quisque","2022-01-30 23:24:04"),
  (0xa299f0c522fd3f7b8a4da1856de7e85f,0xc88d2a8f116243a38c8b17c2d0b6d6ae,"amet, dapibus id,","magna. ut tincidunt orci quis lectus.","enim diam vel arcu. curabitur","2021-05-30 18:17:19"),
  (0x2a54e6253eea573d297cd761316f5cc9,0x32dfa328e7cd460e8b3f0fa89f025707,"tempus non, lacinia","in, tempus eu, ligula. aenean euismod mauris","mi, ac mattis velit justo","2020-07-12 02:35:27"),
  (0x55fabc41ee769338ce6340aabd81a819,0xc88d2a8f116243a38c8b17c2d0b6d6ae,"nec mauris blandit","nec tellus. nunc lectus pede, ultrices a,","felis. donec tempor, est ac mattis semper, dui","2021-05-28 19:40:44"),
  (0xb09ee84ceaab72ba121a013a2b9331ce,0xa3e5e975241742e69b3e00788943ae04,"donec felis orci,","et, rutrum eu, ultrices sit amet, risus. donec nibh","vestibulum","2021-08-02 16:50:10"),
  (0x8e2de16768f857e8cc237c8a8511e861,0x32dfa328e7cd460e8b3f0fa89f025707,"mauris. morbi non","libero est, congue a, aliquet vel, vulputate","vulputate, posuere","2022-01-31 21:26:01"),
  (0xbc9ade51a0919bb6c3beaf4e6e2fd173,0x8a8bb113e7e641608eaebb2d8284e840,"lacinia at, iaculis","massa non ante bibendum ullamcorper. duis cursus, diam","accumsan neque","2021-06-30 23:24:37"),
  (0x5fb6e42c18a6a37996dde6e9726348b6,0x8a8bb113e7e641608eaebb2d8284e840,"morbi tristique senectus","quam a felis ullamcorper viverra. maecenas iaculis","at","2021-07-18 14:59:57"),
  (0x3a9265075d5bdfec95b5e6e67475456c,0x6e01dba25a65421c84c5d96aa55a2f63,"fringilla purus mauris","luctus aliquet odio. etiam ligula tortor, dictum eu, placerat","ac turpis egestas. fusce","2021-08-17 20:06:24"),
  (0x618a576e33cadb72655641123b2b687e,0xb03c096ab4454bcfb085c07351024d48,"pellentesque ut ipsum","velit eu sem. pellentesque ut ipsum ac mi","nec, cursus a, enim. suspendisse aliquet,","2021-02-09 04:00:09");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0xa153524c62f5ba9db6a3a52cc286c719,0x8a8bb113e7e641608eaebb2d8284e840,"mus. proin vel","pretium et, rutrum non, hendrerit id, ante.","sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam","2020-04-11 16:55:26"),
  (0x74e47589f6da2a5e02903de60481cbd7,0xdfa604cdd39c49e8a95f738824168cd4,"ut, molestie in,","sed dolor. fusce mi lorem, vehicula et, rutrum","tempor","2020-11-30 22:43:30"),
  (0xcc9199b4cf9d86b09151125771d380a2,0x5108438a657142f9b6ebf88deed509c2,"ligula. aenean gravida","praesent luctus. curabitur egestas nunc sed libero. proin sed","montes, nascetur ridiculus mus. proin vel nisl. quisque fringilla euismod","2021-07-23 13:47:20"),
  (0x99ab5740876d7599b79cc934638942dd,0xfc92d9b461044d80b2bd8455730eef53,"pede. praesent eu","nulla dignissim. maecenas ornare egestas ligula. nullam feugiat placerat velit.","diam luctus lobortis. class aptent taciti sociosqu ad","2021-11-02 11:58:36"),
  (0x955340da85f739be2e13d2c2d7ca7d6b,0xcc6d52347444476da067c9a0fa657a20,"eu erat semper","in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est","sodales at, velit. pellentesque ultricies dignissim lacus. aliquam rutrum","2020-09-17 02:35:45"),
  (0x5078d343ade7c103f754792e5beed466,0xa3e5e975241742e69b3e00788943ae04,"convallis in, cursus","cum sociis natoque penatibus et","in consectetuer ipsum","2021-07-21 10:52:08"),
  (0x75ee720d64b823f90d50dcadf6848b9e,0xc88d2a8f116243a38c8b17c2d0b6d6ae,"dignissim tempor arcu.","donec tempus, lorem fringilla ornare placerat,","vitae semper egestas, urna justo","2021-11-22 16:02:45"),
  (0x6c20a160ea9755ed46b9ab3572bc5252,0xb03c096ab4454bcfb085c07351024d48,"sollicitudin commodo ipsum.","mollis nec, cursus a, enim.","tempor diam dictum","2021-02-27 16:51:15"),
  (0xc6e2a771e67a8fd7fa54d66369552e60,0x1ae33aeb021e409bb4b0bea399a3bc07,"fringilla mi lacinia","neque pellentesque massa lobortis ultrices. vivamus rhoncus.","nam tempor diam dictum","2020-08-17 03:25:34"),
  (0x96a09c875bdddd55eb16aa156c41d28e,0x896e1d0d4b6f4b1299c596082dbf3d04,"ultricies ornare, elit","lectus justo eu arcu. morbi sit","pede ac urna. ut tincidunt vehicula risus. nulla eget","2020-02-23 05:24:54");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0x135c5aef84ea1110dc353171576414cf,0x896e1d0d4b6f4b1299c596082dbf3d04,"ut tincidunt vehicula","iaculis quis, pede. praesent eu dui.","ipsum. donec","2021-06-30 19:16:15"),
  (0xca346b5f5164c58e13dd2868963604bc,0x1ae33aeb021e409bb4b0bea399a3bc07,"molestie sodales. mauris","phasellus libero mauris, aliquam eu, accumsan","eu sem. pellentesque","2020-04-17 19:07:12"),
  (0xe0d570d5a9cac13552673ecb5b9101cc,0x6e01dba25a65421c84c5d96aa55a2f63,"aliquam eu, accumsan","ligula elit, pretium et, rutrum non,","fringilla ornare placerat,","2021-04-30 13:28:09"),
  (0x6d18968096947ea6b2b8b577a96d097e,0xa3e5e975241742e69b3e00788943ae04,"velit. pellentesque ultricies","morbi vehicula. pellentesque tincidunt tempus risus. donec egestas. duis","sed tortor. integer aliquam","2021-05-23 09:09:18"),
  (0x44d4b789d9fe5e2d59c263982e9ccbb6,0x8ea042666d76476abcbb91436f3b0ca0,"diam luctus lobortis.","imperdiet non, vestibulum nec, euismod","dolor","2021-02-14 15:46:45"),
  (0x8ac335cbb2ff94bb21cab58c1d779947,0x469163b48a7f41d786fe2ba8f22b45aa,"amet, dapibus id,","ut, nulla. cras eu tellus eu augue porttitor","vivamus nisi. mauris nulla.","2020-02-25 05:22:46"),
  (0x7481e429821bfdb10f1db5a1886b222e,0x98fd670e131145d7b5d2825a038b6d2e,"lobortis tellus justo","eu arcu. morbi sit amet","cum sociis natoque penatibus et magnis","2020-07-21 20:02:04"),
  (0x1d99974aa3016bce2f5273a535e1eb1e,0x8ea042666d76476abcbb91436f3b0ca0,"accumsan convallis, ante","nisl elementum purus, accumsan interdum libero dui nec","augue id ante dictum cursus. nunc mauris elit, dictum","2020-12-30 08:09:10"),
  (0x3c113a67b47749813465572c5ae13c99,0x6e01dba25a65421c84c5d96aa55a2f63,"cras eget nisi","egestas. duis ac arcu. nunc mauris. morbi non","consequat enim","2021-08-08 23:18:25"),
  (0xea49ce08110474804aa618ca9594921a,0xa9a6171644314fc08261bcecada3335f,"mauris. integer sem","id risus quis diam luctus lobortis. class","purus ac tellus. suspendisse sed dolor. fusce mi lorem,","2021-09-10 10:54:57");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0x5a84a6a361c9b21de0cb023a1e31819c,0x446e5fe7fee94d04ab050c19621d0b82,"ligula. aliquam erat","ultrices, mauris ipsum porta elit, a","in, hendrerit consectetuer,","2021-01-26 09:34:40"),
  (0xd68e8532a89880e8251d4e8557a89f7d,0x3edf4a1f43fa493abb04da6cc2b67d37,"ac risus. morbi","inceptos hymenaeos. mauris ut quam vel sapien","risus. morbi metus. vivamus euismod urna. nullam lobortis","2020-05-13 12:09:07"),
  (0x843287ce7631f8c95be4e42779615084,0xefe67e2eeb43483eabea6516e9400dcf,"tortor, dictum eu,","maecenas malesuada fringilla est. mauris eu turpis. nulla","elit. curabitur sed tortor. integer aliquam adipiscing lacus.","2021-11-14 17:12:20"),
  (0x5e4b9eeda0bbe511b922d59ad9d83566,0x896e1d0d4b6f4b1299c596082dbf3d04,"laoreet, libero et","enim. curabitur massa. vestibulum accumsan neque et nunc.","dictum eu, placerat eget, venenatis a, magna.","2021-02-25 13:06:35"),
  (0xa742e8ac58cb416fddcea2e3668a3aad,0xdb8ed709e1784e28a797316121adda59,"tortor at risus.","enim. curabitur massa. vestibulum accumsan neque et","feugiat non, lobortis quis, pede. suspendisse dui.","2021-04-13 06:03:01"),
  (0xb5386dd71eb29c0788eab19eed3cbbdb,0xcc6d52347444476da067c9a0fa657a20,"egestas. sed pharetra,","aliquet vel, vulputate eu, odio. phasellus at augue id","vivamus molestie dapibus ligula. aliquam erat volutpat. nulla dignissim.","2021-06-22 12:25:19"),
  (0xde1f5b3521c5d12fe952b201c7124724,0xdb8ed709e1784e28a797316121adda59,"sed eu nibh","ipsum. phasellus vitae mauris sit amet","tempus non, lacinia at, iaculis quis, pede. praesent eu dui.","2021-02-26 17:54:11"),
  (0xb91097ed0af518bcb9fd41f31ac24696,0xfd7980537baa4329b6779063706fe4e3,"odio. etiam ligula","quis turpis vitae purus gravida sagittis. duis gravida. praesent","curae phasellus ornare. fusce","2021-08-25 17:05:05"),
  (0xd1786ce41420fe6a1d1386d6976e4abd,0x3edf4a1f43fa493abb04da6cc2b67d37,"risus a ultricies","phasellus dolor elit, pellentesque a, facilisis non, bibendum sed,","ullamcorper. duis at lacus. quisque purus sapien, gravida non,","2021-09-26 13:32:40"),
  (0xb329bc377e49c3c8c1cd4982b489704d,0x6bbeadf013084c55a82506de3d2973c5,"purus. maecenas libero","in condimentum. donec at arcu. vestibulum ante","libero. morbi accumsan laoreet ipsum.","2021-05-07 05:22:31");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0xb6dd68534392c51726a874c7b64f84e7,0xc88d2a8f116243a38c8b17c2d0b6d6ae,"lectus. cum sociis","fusce dolor quam, elementum at, egestas a, scelerisque sed,","integer eu lacus. quisque imperdiet,","2021-05-20 20:10:01"),
  (0x2041d2b317aa79d43ce1d44fa2b1b81d,0xc88d2a8f116243a38c8b17c2d0b6d6ae,"felis. donec tempor,","suspendisse tristique neque venenatis lacus. etiam bibendum","semper auctor. mauris vel turpis. aliquam adipiscing","2020-05-16 16:12:11"),
  (0xf1590ce36136f6e84188a2213e1272fb,0xf2926d8e70b84085ad57c9acfb22ed04,"mauris molestie pharetra","est, mollis non, cursus non, egestas a, dui. cras","vel, mauris. integer sem elit, pharetra","2021-11-01 21:25:06"),
  (0xd2951b3e9a8b68d338e46598917278ea,0xa9a6171644314fc08261bcecada3335f,"lacus, varius et,","erat volutpat. nulla facilisis. suspendisse","eget varius ultrices, mauris ipsum porta elit, a","2021-09-04 13:18:00"),
  (0x418ed4471b43d5acccc12dba63c324ee,0x32dfa328e7cd460e8b3f0fa89f025707,"sem. pellentesque ut","lobortis quam a felis ullamcorper viverra. maecenas","pellentesque massa lobortis","2021-05-24 20:20:08"),
  (0x24b45dce77e769619ef7bed0938a4e6b,0xf2926d8e70b84085ad57c9acfb22ed04,"urna et arcu","libero at auctor ullamcorper, nisl arcu iaculis enim, sit","orci sem eget massa. suspendisse eleifend. cras sed leo.","2020-10-07 00:33:35"),
  (0x4a88eeca5484a6969b59d1d9ee2941e8,0xdfa604cdd39c49e8a95f738824168cd4,"sit amet risus.","sit amet luctus vulputate, nisi","nec","2021-02-06 14:43:02"),
  (0x396d24d57207fcbaa492c896fc1325f4,0xfc92d9b461044d80b2bd8455730eef53,"dictum ultricies ligula.","lectus pede et risus. quisque libero","pellentesque a, facilisis non, bibendum sed, est.","2021-08-30 23:58:13"),
  (0x2c87a5fb1cf5e172e592d55ecca41776,0x1ae33aeb021e409bb4b0bea399a3bc07,"nunc id enim.","pharetra. quisque ac libero nec","cursus et, magna. praesent","2020-09-09 10:05:35"),
  (0xd5c4f93b8199c3ead2eb68796c908c7d,0xa3e5e975241742e69b3e00788943ae04,"orci luctus et","nunc sollicitudin commodo ipsum. suspendisse non leo. vivamus nibh","libero. proin mi. aliquam gravida mauris","2021-08-02 13:05:36");
insert into `feedback` (`feedback_id`,`account_id`,`title`,`content`,`response`,`create_time`)
values
  (0xa94841f7746aba4119ab989b3bc85cc9,0x469163b48a7f41d786fe2ba8f22b45aa,"augue porttitor interdum.","vitae aliquam eros turpis non enim. mauris quis turpis vitae","non arcu.","2020-04-30 11:08:01"),
  (0xc41ab85bb7a6db94617988609e56fd6e,0x5108438a657142f9b6ebf88deed509c2,"adipiscing fringilla, porttitor","consectetuer mauris id sapien. cras dolor","pellentesque ut ipsum ac mi eleifend egestas. sed","2021-09-14 11:22:49"),
  (0x2b80ad88328674e25437843e68cd77b8,0x98fd670e131145d7b5d2825a038b6d2e,"rutrum eu, ultrices","fermentum fermentum arcu. vestibulum ante ipsum primis in","sed leo. cras vehicula aliquet libero.","2022-02-11 20:35:21"),
  (0x9bbf5ec8f4edec98b62bf436e91dc6f8,0x896e1d0d4b6f4b1299c596082dbf3d04,"ultrices posuere cubilia","sed, est. nunc laoreet lectus","nulla eu neque pellentesque massa lobortis ultrices. vivamus rhoncus.","2020-11-16 06:38:03"),
  (0x18907475686d6444f9e8a49195eb55d4,0xdb8ed709e1784e28a797316121adda59,"turpis vitae purus","suspendisse sagittis. nullam vitae diam. proin dolor. nulla","dolor. quisque tincidunt pede ac","2021-03-24 02:22:51"),
  (0xf305f8c6f7927cde44e4ff494a1681d5,0xfc92d9b461044d80b2bd8455730eef53,"vel est tempor","vivamus non lorem vitae odio sagittis semper. nam tempor","elit, pharetra ut, pharetra sed,","2020-02-19 13:04:34"),
  (0x93a2bdbc3df6945977ce476becc21f2e,0x1ae33aeb021e409bb4b0bea399a3bc07,"fringilla ornare placerat,","gravida nunc sed pede. cum sociis natoque penatibus et magnis","ac, feugiat non,","2020-06-15 22:12:22"),
  (0x79cddcc9783d16326efd0730373d42b2,0xdb8ed709e1784e28a797316121adda59,"quisque libero lacus,","non, lobortis quis, pede. suspendisse dui. fusce diam","enim. suspendisse aliquet, sem ut cursus luctus, ipsum","2020-12-22 23:30:51"),
  (0xe9fb76413716a1dbc6a58c157a848ef7,0xb03c096ab4454bcfb085c07351024d48,"lectus convallis est,","cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis","nunc pulvinar","2020-12-30 14:05:03"),
  (0xa5260f9dcd3223498c82f4e4a433b2da,0xdfa604cdd39c49e8a95f738824168cd4,"integer eu lacus.","sapien imperdiet ornare. in faucibus.","habitant morbi tristique senectus et netus","2020-03-17 06:30:34");
  
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
  title varchar(300) CHARACTER SET utf8mb4 NOT NULL,
  description text CHARACTER set utf8mb4,
  start_at datetime NOT NULL,
  end_at datetime,
  duration int,
  allow_review bit DEFAULT TRUE,
  create_time datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (test_id),
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
(0x896e1d0d4b6f4b1299c596082dbf3d04, 'Aldo Lakey', '2010-10-30', TRUE, 'Skidoo', NULL, NULL, 'alakey1d@github.io', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225', 2, '2022-09-21 11:37:14');
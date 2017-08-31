-- 1
CREATE INDEX vendors_zip_code_ix ON vendors (vendor_zip_code);

--2
USE ex;

DROP TABLE IF EXISTS members_groups;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS groups;

CREATE TABLE members 
(
  member_id     INT           PRIMARY KEY   AUTO_INCREMENT, 
  first_name    VARCHAR(50)   NOT NULL, 
  last_name     VARCHAR(50)   NOT NULL, 
  address       VARCHAR(50)   NOT NULL, 
  city          VARCHAR(25)   NOT NULL, 
  state         CHAR(2), 
  phone         VARCHAR(20)
);

CREATE TABLE groups 
(
  group_id      INT            PRIMARY KEY   AUTO_INCREMENT, 
  group_name    VARCHAR(50)    NOT NULL
);

CREATE TABLE members_groups
(
  member_id     INT              NOT NULL, 
  group_id      INT              NOT NULL,
  CONSTRAINT members_groups_fk_members FOREIGN KEY (member_id)
    REFERENCES members (member_id), 
  CONSTRAINT members_groups_fk_groups FOREIGN KEY (group_id)
	  REFERENCES groups (group_id)
);

-- 3
USE ex;

INSERT INTO members
VALUES (DEFAULT, 'John', 'Smith', '334 Valencia St.', 'San Francisco', 'CA', '415-942-1901');
INSERT INTO members
VALUES (DEFAULT, 'Jane', 'Doe', '872 Chetwood St.', 'Oakland', 'CA', '510-123-4567');

INSERT INTO groups
VALUES (DEFAULT, 'Book Club');
INSERT INTO groups
VALUES (DEFAULT, 'Bicycle Coalition');

INSERT INTO members_groups
VALUES (1, 2);
INSERT INTO members_groups
VALUES (2, 1);
INSERT INTO members_groups
VALUES (2, 2);

SELECT g.group_name, m.last_name, m.first_name
FROM groups g
  JOIN members_groups mg
    ON g.group_id = mg.group_id
  JOIN members m
    ON mg.member_id = m.member_id
ORDER BY g.group_name, m.last_name, m.first_name;

-- 4
ALTER TABLE members
  ADD annual_dues   DECIMAL(5,2)    DEFAULT 52.50;
ALTER TABLE members
  ADD payment_date  DATE;
  
 -- 5
 ALTER TABLE groups
MODIFY group_name VARCHAR(50) NOT NULL UNIQUE;

INSERT INTO groups (group_name)
VALUES ('Book Club'); 

CREATE DATABASE IF NOT EXISTS NutitiaDB;
USE NutitiaDB;

CREATE TABLE Feat(
	feat_id VARCHAR(10) NOT NULL,
	manager VARCHAR(40) NOT NULL,
	title VARCHAR(100) NOT NULL,
	status VARCHAR(50) NOT NULL,
	jira_link VARCHAR(100) NOT NULL,
	PRIMARY KEY(feat_id)
);

CREATE TABLE Customer(
	customer_id INT(5) NOT NULL,
	name VARCHAR(100) NOT NULL,
	region VARCHAR(40) NOT NULL,
	total_nodes INT(5) NOT NULL,
	sales_contact VARCHAR(40) NOT NULL,
	PRIMARY KEY(customer_id)
);

CREATE TABLE Releases(
	release_id VARCHAR(10) NOT NULL,
	release_date DATE NOT NULL,
	PRIMARY KEY(release_id)
);

CREATE TABLE OnCall(
	oncall_id VARCHAR(10) NOT NULL,
	title VARCHAR(100) NOT NULL,
	creation_data DATE NOT NULL,
	status VARCHAR(100) NOT NULL,
	asssignee VARCHAR(100) NOT NULL,
	feat_affected VARCHAR(10) NOT NULL,
	release_affected VARCHAR(10) NOT NULL,
	PRIMARY KEY(oncall_id),
	CONSTRAINT fk2_1 FOREIGN KEY(feat_affected) REFERENCES  Feat(feat_id),
	CONSTRAINT fk2_2 FOREIGN KEY(release_affected) REFERENCES Releases(release_id)
);

CREATE TABLE FeatRelease(
	feat_id VARCHAR(10) NOT NULL,
	release_id VARCHAR(10) NOT NULL,
	PRIMARY KEY(feat_id, release_id),
	CONSTRAINT fk3_1 FOREIGN KEY(feat_id) REFERENCES Feat(feat_id),
	CONSTRAINT fk3_2 FOREIGN KEY(release_id) REFERENCES Releases(release_id)
);

CREATE TABLE CustomerOncall(
	customer_id INT(5) NOT NULL,
	oncall_id VARCHAR(10) NOT NULL,
	PRIMARY KEY(customer_id, oncall_id),
	CONSTRAINT fk4_1 FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
	CONSTRAINT fk4_2 FOREIGN KEY(oncall_id) REFERENCES OnCall(oncall_id)
);

CREATE TABLE CustomerFeat(
	customer_id INT(5) NOT NULL,
	feat_id VARCHAR(10) NOT NULL,
	adoption_date DATE NOT NULL,
	PRIMARY KEY(customer_id, feat_id),
	CONSTRAINT fk5_1 FOREIGN KEY(customer_id) REFERENCES Customer(customer_id),
	CONSTRAINT fk5_2 FOREIGN KEY(feat_id) REFERENCES Feat(feat_id)
);

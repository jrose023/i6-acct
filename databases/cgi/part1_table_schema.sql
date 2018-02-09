BEGIN TRANSACTION;
DROP TABLE IF EXISTS `emp`;
CREATE TABLE IF NOT EXISTS `emp` (
	`emp_countyID`	INTEGER,
	`emp_county`	TEXT,
	`emp_industryID`	INTEGER,
	`emp_industry`	TEXT,
	`emp_year`	INTEGER,
	`emp_avg_employ`	INTEGER,
	`emp_total_wage`	INTEGER,
	`emp_avg_weekly`	REAL,
	`emp_avg_annual`	INTEGER
);
COMMIT;

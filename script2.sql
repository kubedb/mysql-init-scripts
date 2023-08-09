USE `mysql`;

DROP TABLE IF EXISTS
    `demo_table`;

CREATE TABLE `demo_table`(
    `id` BIGINT(20) NOT NULL,
    `name` VARCHAR(255) DEFAULT NULL
);

--
-- Dumping data for table `demo_table`
--

INSERT INTO `demo_table`(`id`, `name`)
VALUES(1, 'name1'),(2, 'name2'),(3, 'name3');

--
-- Indexes for table `demo_table`
--

ALTER TABLE
    `demo_table` ADD PRIMARY KEY(`id`);

--
-- AUTO_INCREMENT for table `demo_table`
--

ALTER TABLE
    `demo_table` MODIFY `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

USE `mysql`;

DROP TABLE IF EXISTS
    `kubedb_table_m_d`;

CREATE TABLE `kubedb_table_m_d`(
    `id` BIGINT(20) NOT NULL,
    `name` VARCHAR(255) DEFAULT NULL
);

--
-- Dumping data for table `kubedb_table_m_d`
--

INSERT INTO `kubedb_table_m_d`(`id`, `name`)
VALUES(1, 'name1'),(2, 'name2'),(3, 'name3');

--
-- Indexes for table `kubedb_table_m_d`
--

ALTER TABLE
    `kubedb_table_m_d` ADD PRIMARY KEY(`id`);

--
-- AUTO_INCREMENT for table `kubedb_table_m_d`
--

ALTER TABLE
    `kubedb_table_m_d` MODIFY `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

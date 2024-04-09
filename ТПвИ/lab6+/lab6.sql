SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE SCHEMA IF NOT EXISTS `lab6` DEFAULT CHARACTER SET utf8 ;
USE `lab6`;
-- -----------------------------------------------------
-- Table `lab6`.`people`
-- -----------------------------------------------------
drop table people;
CREATE TABLE IF NOT EXISTS `lab6`.`people` (
  `snp` VARCHAR(45) NOT NULL,
  `dateBirth` DATETIME NOT NULL,
  PRIMARY KEY (`snp`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `lab6`.`letter`
-- -----------------------------------------------------
drop table letter;
CREATE TABLE IF NOT EXISTS `lab6`.`letter` (
	`idletter` INT default 0 NOT NULL,
	`sender` VARCHAR(45) NOT NULL,
	`receiver` VARCHAR(45) NOT NULL,
	`topic` VARCHAR(20) NOT NULL,
	`text` VARCHAR(300) NOT NULL,
	`dateOfSend` DATETIME NOT NULL,
	PRIMARY KEY (`idletter`),
	INDEX `pepll_idx` (`sender` ASC) VISIBLE,
	CONSTRAINT `pepll`
		FOREIGN KEY (`sender`)
		REFERENCES `lab6`.`people` (`snp`)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
ENGINE = InnoDB;
DELETE FROM `people` where `dateBirth` between '1985-01-01' and '1997-07-07';
INSERT INTO `people` (`snp`, `dateBirth`)
VALUES
    ('Иванов Иван Иванович', '1990-01-01'),
    ('Петров Петр Петрович', '1985-05-10'),
    ('Сидорова Елена Викторовна', '1992-11-25'),
    ('Смирнов Алексей Сергеевич', '1988-08-15'),
    ('Козлова Ольга Васильевна', '1995-03-20'),
    ('Васильев Дмитрий Андреевич', '1997-07-07'),
    ('Николаева Анна Игоревна', '1994-12-12'),
    ('Морозов Сергей Владимирович', '1987-09-05'),
    ('Кузнецова Мария Александровна', '1993-06-18'),
    ('Лебедев Артем Николаевич', '1991-04-30'),
    ('Зимина Елена Витальевна', '1996-07-08');
DELETE FROM `letter` where idletter between 0 and 25;
INSERT INTO `letter` (`idletter`, `sender`, `receiver`, `topic`, `text`, `dateOfSend`)
VALUES
    (11, 'Иванов Иван Иванович', 'Петров Петр Петрович', 'Тема письма 1', 'Текст письма 1', '2022-01-01 09:00:00'),
    (12, 'Петров Петр Петрович', 'Иванов Иван Иванович', 'Тема письма 2', 'Текст письма 2', '2022-01-02 14:30:00'),
    (3, 'Сидорова Елена Викторовна', 'Козлова Ольга Васильевна', 'Тема письма 3', 'Текст письма 3', '2022-01-03 11:15:00'),
    (4, 'Смирнов Алексей Сергеевич', 'Васильев Дмитрий Андреевич', 'Тема письма 4', 'Текст письма 4', '2022-01-04 16:45:00'),
    (5, 'Козлова Ольга Васильевна', 'Сидорова Елена Викторовна', 'Тема письма 5', 'Текст письма 5', '2022-01-05 10:30:00'),
    (6, 'Васильев Дмитрий Андреевич', 'Смирнов Алексей Сергеевич', 'Тема письма 4', 'Текст письма 6', '2022-01-06 15:20:00'),
    (7, 'Николаева Анна Игоревна', 'Морозов Сергей Владимирович', 'Тема письма 7', 'Текст письма 7', '2022-01-07 12:10:00'),
    (8, 'Морозов Сергей Владимирович', 'Николаева Анна Игоревна', 'Тема письма 8', 'Текст письма 8', '2022-01-08 17:00:00'),
    (9, 'Кузнецова Мария Александровна', 'Лебедев Артем Николаевич', 'Тема письма 9', 'Текст письма 9', '2022-01-09 13:45:00'),
    (10, 'Лебедев Артем Николаевич', 'Кузнецова Мария Александровна', 'Тема письма 4', 'Текст письма 10', '2022-01-10 08:30:00');
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE letter MODIFY COLUMN idletter INT auto_increment;
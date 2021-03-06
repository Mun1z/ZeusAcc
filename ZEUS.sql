CREATE TABLE `ACCOUNTS`
(
	`ID` INT NOT NULL AUTO_INCREMENT,
	`NAME` VARCHAR(32) NOT NULL DEFAULT '',
	`PASSWORD` VARCHAR(255) NOT NULL,
	`PREMDAYS` INT NOT NULL DEFAULT 0,
	`LASTDAY` INT UNSIGNED NOT NULL DEFAULT 0,
	`EMAIL` VARCHAR(255) NOT NULL DEFAULT '',
	`KEY` VARCHAR(20) NOT NULL DEFAULT '0',
	`BLOKED` TINYINT(1) NOT NULL DEFAULT FALSE COMMENT 'USO INTERNO',
	`WARNINGS` INT NOT NULL DEFAULT 0,
	`GROUPID` INT NOT NULL DEFAULT 1,
	PRIMARY KEY (`ID`), UNIQUE (`NAME`)
)ENGINE = InnoDB;

INSERT INTO `ACCOUNTS` VALUES (1, '1', '1', 65535, 0, '', '0', 0, 0, 1);

CREATE TABLE `PLAYERS`
(
	`ID` INT NOT NULL AUTO_INCREMENT,
	`NAME` VARCHAR(255) NOT NULL,
	`WORDL_ID` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0,
	`GROUP_ID` INT NOT NULL DEFAULT 1,
	`ACCOUNT_ID` INT NOT NULL DEFAULT 0,
	`LEVEL` INT NOT NULL DEFAULT 1,
	`VOCATION` INT NOT NULL DEFAULT 0,
	`HEALTH` INT NOT NULL DEFAULT 150,
	`HEALTHMAX` INT NOT NULL DEFAULT 150,
	`EXPERIENCE` BIGINT NOT NULL DEFAULT 0,
	`LOOKBODY` INT NOT NULL DEFAULT 0,
	`LOOKFEET` INT NOT NULL DEFAULT 0,
	`LOOKHEAD` INT NOT NULL DEFAULT 0,
	`LOOKLEGS` INT NOT NULL DEFAULT 0,
	`LOOKTYPE` INT NOT NULL DEFAULT 136,
	`LOOKADDONS` INT NOT NULL DEFAULT 0,
	`MAGLEVEL` INT NOT NULL DEFAULT 0,
	`MANA` INT NOT NULL DEFAULT 0,
	`MANAMAX` INT NOT NULL DEFAULT 0,
	`MANASPENT` INT NOT NULL DEFAULT 0,
	`SOUL` INT UNSIGNED NOT NULL DEFAULT 0,
	`TOWN_ID` INT NOT NULL DEFAULT 0,
	`POSX` INT NOT NULL DEFAULT 0,
	`POSY` INT NOT NULL DEFAULT 0,
	`POZ` INT NOT NULL DEFAULT 0,
	`CONDITIONS` BLOB NOT NULL,
	`CAP` INT NOT NULL DEFAULT 0,
	`SEX` INT NOT NULL DEFAULT 0,
	`LASTLOGIN` BIGINT UNSIGNED NOT NULL DEFAULT 0,
	`LASTIP` INT UNSIGNED NOT NULL DEFAULT 0,
	`SAVE` TINYINT(1) NOT NULL DEFAULT 1,
	`SKULL` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`SKULLTIME` INT NOT NULL DEFAULT 0,
	`RANK_ID` INT NOT NULL DEFAULT 0,
	`GUILDNICK` VARCHAR(255) NOT NULL DEFAULT '',
	`LASTLOGOUT` BIGINT UNSIGNED NOT NULL DEFAULT 0,
	`BLESSINGS` TINYINT(2) NOT NULL DEFAULT 0,
	`BALANCE` BIGINT NOT NULL DEFAULT 0,
	`STAMINA` BIGINT NOT NULL DEFAULT 151200000 COMMENT 'SALVO EM MILISEGUNDOS',
	`DIRECTION` INT NOT NULL DEFAULT 2,
	`LOSS_EXPERIENCE` INT NOT NULL DEFAULT 100,
	`LOSS_MANA` INT NOT NULL DEFAULT 100,
	`LOSS_SKILLS` INT NOT NULL DEFAULT 100,
	`LOSS_CONTAINERS` INT NOT NULL DEFAULT 100,
	`LOSS_ITEMS` INT NOT NULL DEFAULT 100,
	`PREMEND` INT NOT NULL DEFAULT 0 COMMENT 'NÃO ESTA SENDO USADO PELO SERVIDOR',
	`ONLINE` TINYINT(1) NOT NULL DEFAULT 0,
	`MARRIAGE` INT UNSIGNED NOT NULL DEFAULT 0,
	`PROMOTION` INT NOT NULL DEFAULT 0,
	`DELETED` TINYINT(1) NOT NULL DEFAULT FALSE,
	`DESCRIPTION` VARCHAR(255) NOT NULL DEFAULT '',
	PRIMARY KEY (`ID`), UNIQUE (`NAME`, `DELETED`),
	KEY (`ACCOUNT_ID`), KEY (`GROUP_ID`),
	KEY (`ONLINE`), KEY (`DELETED`),
	FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS`(`ID`) ON DELETE CASCADE
) ENGINE = InnoDB;

INSERT INTO `PLAYERS` VALUES (1, 'Account Manager', 0, 1, 1, 1, 0, 150, 150, 0, 0, 0, 0, 0, 110, 0, 0, 0, 0, 0, 0, 0, 50, 50, 7, '', 400, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 201660000, 0, 100, 100, 100, 100, 100, 0, 0, 0, 0, 0, '');

CREATE TABLE `ACCOUNT_VIPLIST`
(
	`ACCOUNT_ID` INT NOT NULL,
	`WORLD_ID` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0,
	`PLAYER_ID` INT NOT NULL,
	KEY (`ACCOUNT_ID`), KEY (`PLAYER_ID`), KEY (`WORLD_ID`), UNIQUE (`ACCOUNT_ID`, `PLAYER_ID`),
	FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `ACCOUNTS`(`ID`) ON DELETE CASCADE,
	FOREIGN KEY (`PLAYER_ID`) REFERENCES `PLAYERS`(`ID`) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE `PLAYER_DEATHS`
(
	`ID` INT NOT NULL AUTO_INCREMENT,
	`PLAYER_ID` INT NOT NULL,
	`DATE` BIGINT UNSIGNED NOT NULL,
	`LEVEL` INT UNSIGNED NOT NULL,
	PRIMARY KEY (`ID`), INDEX (`DATE`),
	FOREIGN KEY (`PLAYER_ID`) REFERENCES `PLAYERS`(`ID`) ON DELETE CASCADE
) ENGINE = InnoDB;
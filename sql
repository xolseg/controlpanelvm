CREATE TABLE `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(30) NOT NULL ,
  `lastname`  VARCHAR(30) NOT NULL ,
  `login` VARCHAR(30) NOT NULL ,
  `password` VARCHAR(30) NOT NULL ,
  `usertype`  VARCHAR(30) DEFAULT NULL ,
  `email` VARCHAR(40) NOT NULL ,
  `regdate` TIMESTAMP ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
CREATE TABLE `nodes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(40) NOT NULL,
  `url` VARCHAR(40) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `commands`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `command` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `virtualmachines`(
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `nodes` (`name`, `url`) VALUES  ('node1', 'node1.lotsman-pro.com'),  ('node2', 'node2.lotsman-pro.com'),  ('node3', 'node3.lotsman-pro.com'),  ('node4', 'node4.lotsman-pro.com'),  ('node5', 'node5.lotsman-pro.com');
INSERT INTO `commands` (`command`) VALUES  ('start'),  ('reboot'),  ('shutdown'),  ('reset'),  ('destroy');
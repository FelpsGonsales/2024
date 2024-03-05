-- MySQL Workbench Synchronization
-- Generated: 2022-06-23 08:14
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: FELIPE ANTONIO LUDERS GONSALES

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `LP3_Felpos` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `LP3_Felpos`.`Cliente` (
  `Pessoa_idPessoa` INT(11) NOT NULL,
  `cidade_cliente` VARCHAR(45) NOT NULL,
  INDEX `fk_Cliente_Pessoa1_idx` (`Pessoa_idPessoa` ASC) VISIBLE,
  PRIMARY KEY (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Cliente_Pessoa1`
    FOREIGN KEY (`Pessoa_idPessoa`)
    REFERENCES `LP3_Felpos`.`Pessoa` (`idPessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `LP3_Felpos`.`Criptomoeda` (
  `idCriptomoeda` INT(11) NOT NULL,
  `nome_criptomoeda` VARCHAR(45) NOT NULL,
  `nome_criador` VARCHAR(45) NOT NULL,
  `sigla_criptomoeda` VARCHAR(3) NOT NULL,
  `quantidade_estoque` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCriptomoeda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `LP3_Felpos`.`Funcionario` (
  `Pessoa_idPessoa` INT(11) NOT NULL,
  `data_contrato` DATE NOT NULL,
  `Departamento_idDepartamento` INT(11) NOT NULL,
  INDEX `FK_Funcionario_Pessoa_idPessoa` (`Pessoa_idPessoa` ASC) VISIBLE,
  PRIMARY KEY (`Pessoa_idPessoa`),
  INDEX `fk_Funcionario_Departamento1_idx` (`Departamento_idDepartamento` ASC) VISIBLE,
  CONSTRAINT `FK_Funcionario_Pessoa_idPessoa`
    FOREIGN KEY (`Pessoa_idPessoa`)
    REFERENCES `LP3_Felpos`.`Pessoa` (`idPessoa`),
  CONSTRAINT `fk_Funcionario_Departamento1`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `LP3_Felpos`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `LP3_Felpos`.`Pedido` (
  `idPedido` INT(11) NOT NULL,
  `Cliente_Pessoa_idPessoa` INT(11) NOT NULL,
  `cliente_idCliente` INT(11) NOT NULL,
  `data_contrato` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_Pessoa_idPessoa`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_Pessoa_idPessoa` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_Pessoa_idPessoa`)
    REFERENCES `LP3_Felpos`.`Cliente` (`Pessoa_idPessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `LP3_Felpos`.`Pessoa` (
  `idPessoa` INT(11) NOT NULL,
  `nome_pessoa` VARCHAR(45) NOT NULL,
  `idade_pessoa` INT(11) NOT NULL,
  PRIMARY KEY (`idPessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `LP3_Felpos`.`Pedido_has_Criptomoeda` (
  `Pedido_idPedido` INT(11) NOT NULL,
  `Criptomoeda_idCriptomoeda` INT(11) NOT NULL,
  `quantidade_pedido` DOUBLE NOT NULL,
  `valor_pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Pedido_idPedido`, `Criptomoeda_idCriptomoeda`),
  INDEX `fk_Pedido_has_Criptomoeda_Criptomoeda1_idx` (`Criptomoeda_idCriptomoeda` ASC) VISIBLE,
  INDEX `fk_Pedido_has_Criptomoeda_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_has_Criptomoeda_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `LP3_Felpos`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_has_Criptomoeda_Criptomoeda1`
    FOREIGN KEY (`Criptomoeda_idCriptomoeda`)
    REFERENCES `LP3_Felpos`.`Criptomoeda` (`idCriptomoeda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `LP3_Felpos`.`Departamento` (
  `idDepartamento` INT(11) NOT NULL,
  `nome_dep` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

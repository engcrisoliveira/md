-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema md03_dw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema md03_dw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `md03_dw` DEFAULT CHARACTER SET utf8 ;
USE `md03_dw` ;

-- -----------------------------------------------------
-- Table `md03_dw`.`dimAluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `md03_dw`.`dimAluno` (
  `key` INT NOT NULL,
  `id_aluno` INT NOT NULL,
  `raca` VARCHAR(45) NULL,
  `origem` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  PRIMARY KEY (`key`, `id_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `md03_dw`.`dimDeficiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `md03_dw`.`dimDeficiencia` (
  `key` INT NOT NULL,
  `id_aluno` INT NOT NULL,
  `deficiencia_auditiva` TINYINT NULL,
  `deficiencia_fisica` TINYINT NULL,
  `deficiencia_intelectual` TINYINT NULL,
  `deficiencia_multipla` TINYINT NULL,
  `deficiencia_surdez` TINYINT NULL,
  `deficiencia_surdocegueira` TINYINT NULL,
  `deficiencia_baixa_visao` TINYINT NULL,
  `deficiencia_cegueira` TINYINT NULL,
  `deficiencia_superdotacao` TINYINT NULL,
  `deficiencia_tgd_autismo` TINYINT NULL,
  `deficiencia_tgd_sindrome_asperger` TINYINT NULL,
  `deficiencia_tgd_sindrome_rett` TINYINT NULL,
  `deficiencia_tgd_transtor_desintegrativo` TINYINT NULL,
  PRIMARY KEY (`key`, `id_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `md03_dw`.`dimCurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `md03_dw`.`dimCurso` (
  `key` INT NOT NULL,
  `cod_curso` INT NOT NULL,
  `nome` VARCHAR(256) NULL,
  `modalidade_de_ensino` VARCHAR(45) NULL,
  `disciplina_inclusiva` VARCHAR(45) NULL,
  `id_ies` INT NULL,
  `cod_ies` INT NULL,
  PRIMARY KEY (`key`, `cod_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `md03_dw`.`dimIes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `md03_dw`.`dimIes` (
  `id_ies` INT NOT NULL,
  `cod_ies` INT NOT NULL,
  `nome` VARCHAR(255) NULL,
  `categoria` VARCHAR(45) NULL,
  `sigla` VARCHAR(45) NULL,
  `tipo_organizacao` VARCHAR(45) NULL,
  PRIMARY KEY (`id_ies`, `cod_ies`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `md03_dw`.`dimAno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `md03_dw`.`dimAno` (
  `key` INT NOT NULL,
  `id_ano` INT NOT NULL,
  PRIMARY KEY (`id_ano`, `key`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `md03_dw`.`dimRegiao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `md03_dw`.`dimRegiao` (
  `key` INT NOT NULL,
  `cod_municipio` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NULL,
  `regiao` VARCHAR(45) NULL,
  PRIMARY KEY (`key`, `cod_municipio`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

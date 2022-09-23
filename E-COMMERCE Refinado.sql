-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NULL,
  `Identificação` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cartão de Credito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cartão de Credito` (
  `idCartão de Credito` INT NOT NULL,
  `Numero do Cartão` VARCHAR(45) NULL,
  PRIMARY KEY (`idCartão de Credito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cartão de Debito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cartão de Debito` (
  `idCartão de Debito` INT NOT NULL,
  `Numero do cartão` VARCHAR(45) NULL,
  PRIMARY KEY (`idCartão de Debito`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cartão`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cartão` (
  `idCartão` INT NOT NULL,
  `Cartão de Credito_idCartão de Credito` INT NOT NULL,
  `Cartão de Debito_idCartão de Debito` INT NOT NULL,
  PRIMARY KEY (`idCartão`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Formas de Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Formas de Pagamento` (
  `idFormas de Pagamento` INT NOT NULL,
  `Boleto` VARCHAR(45) NULL,
  `Cartão_idCartão` INT NOT NULL,
  PRIMARY KEY (`idFormas de Pagamento`, `Cartão_idCartão`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Politica de Frete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Politica de Frete` (
  `idPolitica de Frete` INT NOT NULL,
  `Gratis` VARCHAR(45) NULL,
  `Valor por Estado` VARCHAR(45) NULL,
  `Valor por CIdade` VARCHAR(45) NULL,
  PRIMARY KEY (`idPolitica de Frete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `Status do Pedido` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Frete` FLOAT NULL,
  `Formas de Pagamento_idFormas de Pagamento` INT NOT NULL,
  `Politica de Frete_idPolitica de Frete` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`, `Formas de Pagamento_idFormas de Pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Valor` VARCHAR(45) NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor Pessoa Fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor Pessoa Fisica` (
  `idVendedor Pessoa Fisica` INT NOT NULL,
  `CPF` VARCHAR(45) NULL,
  PRIMARY KEY (`idVendedor Pessoa Fisica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor Pessoa Juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor Pessoa Juridica` (
  `idVendedor Pessoa Juridica` INT NOT NULL,
  `CNPJ` VARCHAR(45) NULL,
  PRIMARY KEY (`idVendedor Pessoa Juridica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Vendedor Pessoa Fisica_idVendedor Pessoa Fisica` INT NOT NULL,
  `Vendedor Pessoa Juridica_idVendedor Pessoa Juridica` INT NOT NULL,
  PRIMARY KEY (`idFornecedor`, `Vendedor Pessoa Fisica_idVendedor Pessoa Fisica`, `Vendedor Pessoa Juridica_idVendedor Pessoa Juridica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disponibilizando um Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disponibilizando um Produto` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto_has_Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto_has_Estoque` (
  `Produto_idProduto` INT NOT NULL,
  `Estoque_idEstoque` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Estoque_idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relação Produto/Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Relação Produto/Pedido` (
  `Pedido_idPedido` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` VARCHAR(45) NULL,
  PRIMARY KEY (`Pedido_idPedido`, `Produto_idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Terceiro-Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Terceiro-Vendedor` (
  `idTerceiro-Vendedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NULL,
  `Local` VARCHAR(45) NULL,
  PRIMARY KEY (`idTerceiro-Vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produtos por Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos por Vendedor` (
  `Terceiro-Vendedor_idTerceiro-Vendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Terceiro-Vendedor_idTerceiro-Vendedor`, `Produto_idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dados Cartão/Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dados Cartão/Cliente` (
  `Cliente_idCliente` INT NOT NULL,
  `Cartão_idCartão` INT NOT NULL,
  PRIMARY KEY (`Cliente_idCliente`, `Cartão_idCartão`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

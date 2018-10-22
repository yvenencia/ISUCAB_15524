/*
 Navicat Premium Data Transfer

 Source Server         : sql server barney
 Source Server Type    : SQL Server
 Source Server Version : 13004001
 Source Host           : 192.168.2.14\mssqlserver_2016:1433
 Source Catalog        : Loto
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 13004001
 File Encoding         : 65001

 Date: 06/07/2018 07:08:10
*/


-- ----------------------------
-- Table structure for TB_APERTURA
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_APERTURA]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_APERTURA]
GO

CREATE TABLE [dbo].[TB_APERTURA] (
  [ID_APERTURA] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [FECHA_APERTURA] datetime DEFAULT (getdate()) NULL,
  [FECHA_CIERRE] datetime NULL,
  [MONTO_APERTURA] money DEFAULT ((0)) NOT NULL,
  [MONTO_CIERRE] money DEFAULT ((0)) NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_APERTURA] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_AUDITORIA
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_AUDITORIA]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_AUDITORIA]
GO

CREATE TABLE [dbo].[TB_AUDITORIA] (
  [ID_AUDITORIA] int IDENTITY(1,1) NOT NULL,
  [ID_EVENTO] int NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [FECHA_HORA] datetime DEFAULT (getdate()) NOT NULL,
  [PARAMETROS] varchar(5000) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [EXITO] bit NOT NULL
)
GO

ALTER TABLE [dbo].[TB_AUDITORIA] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_COMISION
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_COMISION]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_COMISION]
GO

CREATE TABLE [dbo].[TB_COMISION] (
  [ID_COMISION] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [COMISIONVENTA] decimal(18,2) NULL,
  [COMISIONPARTICIPACION] decimal(18,2) NULL,
  [FECHAINICIO] datetime NOT NULL,
  [FECHAFIN] datetime NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_COMISION] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_CONJUNTO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_CONJUNTO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_CONJUNTO]
GO

CREATE TABLE [dbo].[TB_CONJUNTO] (
  [ID_CONJUNTO] int IDENTITY(1,1) NOT NULL,
  [ID_JUEGO] int NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [MONTO] money NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_CONJUNTO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_CONJUNTO_ITEM
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_CONJUNTO_ITEM]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_CONJUNTO_ITEM]
GO

CREATE TABLE [dbo].[TB_CONJUNTO_ITEM] (
  [ID_CONJUNTOITEM] int IDENTITY(1,1) NOT NULL,
  [ID_ITEM] int NOT NULL,
  [ID_CONJUNTO] int NOT NULL,
  [CUPO_MAX] int NULL,
  [MONTO_MAX] money NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_CONJUNTO_ITEM] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_DIA
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_DIA]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_DIA]
GO

CREATE TABLE [dbo].[TB_DIA] (
  [ID_DIA] int IDENTITY(1,1) NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_DIA] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_DIA_SORTEO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_DIA_SORTEO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_DIA_SORTEO]
GO

CREATE TABLE [dbo].[TB_DIA_SORTEO] (
  [ID_DIASORTEO] int IDENTITY(1,1) NOT NULL,
  [ID_DIA] int NOT NULL,
  [ID_SORTEO] int NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_DIA_SORTEO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_DISPONIBLE_USUARIO_SORTEO_ITEM
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM]
GO

CREATE TABLE [dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM] (
  [ID_DISPONIBLEUSUARIOSORTEOITEM] int IDENTITY(1,1) NOT NULL,
  [ID_SORTEO] int NOT NULL,
  [ID_ITEM] int NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [CUPO_DISPONIBLE] int NOT NULL,
  [MONTO_DISPONIBLE] money NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_DOMINIO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_DOMINIO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_DOMINIO]
GO

CREATE TABLE [dbo].[TB_DOMINIO] (
  [ID_DOMINIO] int IDENTITY(1,1) NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [NUMEROIDENTIFICACION] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [ESTATUS] int NOT NULL,
  [DIRECCION] varchar(500) COLLATE Modern_Spanish_CI_AS NULL,
  [TELEFONO] varchar(10) COLLATE Modern_Spanish_CI_AS NULL,
  [BANQUEO] bit NULL,
  [PORCENTAJE] decimal(18,2) NULL
)
GO

ALTER TABLE [dbo].[TB_DOMINIO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_DOMINIO_IMPUESTO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_DOMINIO_IMPUESTO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_DOMINIO_IMPUESTO]
GO

CREATE TABLE [dbo].[TB_DOMINIO_IMPUESTO] (
  [ID_DOMINIOIMPUESTOS] int IDENTITY(1,1) NOT NULL,
  [ID_IMPUESTO] int NOT NULL,
  [ID_DOMINIO] int NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_DOMINIO_IMPUESTO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_EVENTO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_EVENTO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_EVENTO]
GO

CREATE TABLE [dbo].[TB_EVENTO] (
  [ID_EVENTO] int IDENTITY(1,1) NOT NULL,
  [DESCRIPCION] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
  [ESTATUS] int NULL,
  [COD_EVENTO] int NULL
)
GO

ALTER TABLE [dbo].[TB_EVENTO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_IMPUESTO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_IMPUESTO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_IMPUESTO]
GO

CREATE TABLE [dbo].[TB_IMPUESTO] (
  [ID_IMPUESTO] int IDENTITY(1,1) NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [APLICASOBRE] char(1) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [PORCENTAJE] decimal(4,2) NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_IMPUESTO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_ITEM
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_ITEM]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_ITEM]
GO

CREATE TABLE [dbo].[TB_ITEM] (
  [ID_ITEM] int IDENTITY(1,1) NOT NULL,
  [ID_JUEGO] int NOT NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
  [VALOR] varchar(4) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [CUPO] int NULL,
  [MONTO] money NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_ITEM] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_JUEGO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_JUEGO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_JUEGO]
GO

CREATE TABLE [dbo].[TB_JUEGO] (
  [ID_JUEGO] int IDENTITY(1,1) NOT NULL,
  [ID_TIPOJUEGO] int NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [ESTATUS] int NOT NULL,
  [FACTORPAGO] int NULL,
  [TIEMPOCIERRE] int NULL
)
GO

ALTER TABLE [dbo].[TB_JUEGO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_JUGADA
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_JUGADA]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_JUGADA]
GO

CREATE TABLE [dbo].[TB_JUGADA] (
  [ID_JUGADA] int IDENTITY(1,1) NOT NULL,
  [ID_TICKET] int NOT NULL,
  [ID_SORTEO] int NOT NULL,
  [ID_JUEGO] int NOT NULL,
  [ID_ITEM] int NULL,
  [ID_CONJUNTO] int NULL,
  [MONTO_APUESTA] money NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_JUGADA] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_MONEDERO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_MONEDERO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_MONEDERO]
GO

CREATE TABLE [dbo].[TB_MONEDERO] (
  [ID_OPERACION] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [MONTO] money NULL,
  [ID_TIPOOPERACION] int NOT NULL,
  [ESTATUS] int NOT NULL,
  [FECHA_HORA] datetime NULL,
  [DESCRIPCION] varchar(150) COLLATE Modern_Spanish_CI_AS NULL
)
GO

ALTER TABLE [dbo].[TB_MONEDERO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_OPCIONMENU
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_OPCIONMENU]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_OPCIONMENU]
GO

CREATE TABLE [dbo].[TB_OPCIONMENU] (
  [ID_OPCIONMENU] int IDENTITY(1,1) NOT NULL,
  [ID_OPCIONMENUPADRE] int NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [DESCRIPCION] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [URL] varchar(200) COLLATE Modern_Spanish_CI_AS NULL,
  [POSICION] int NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_OPCIONMENU] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_RESULTADO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_RESULTADO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_RESULTADO]
GO

CREATE TABLE [dbo].[TB_RESULTADO] (
  [ID_RESULTADO] int IDENTITY(1,1) NOT NULL,
  [ID_SORTEO] int NOT NULL,
  [ID_JUEGO] int NOT NULL,
  [ID_ITEM] int NOT NULL,
  [FECHA_HORA] datetime DEFAULT (getdate()) NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_RESULTADO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_SOLICITUD
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_SOLICITUD]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_SOLICITUD]
GO

CREATE TABLE [dbo].[TB_SOLICITUD] (
  [ID_SOLICITUD] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [MONTO] money NULL,
  [ID_TIPOOPERACION] int NOT NULL,
  [CODIGOQR] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [CODIGOSOLICITUD] varchar(10) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [FECHA_HORA] datetime NULL,
  [ESTATUS] int NULL
)
GO

ALTER TABLE [dbo].[TB_SOLICITUD] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_SORTEO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_SORTEO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_SORTEO]
GO

CREATE TABLE [dbo].[TB_SORTEO] (
  [ID_SORTEO] int IDENTITY(1,1) NOT NULL,
  [ID_JUEGO] int NOT NULL,
  [HORA] time(7) NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_SORTEO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_SORTEO_ITEM
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_SORTEO_ITEM]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_SORTEO_ITEM]
GO

CREATE TABLE [dbo].[TB_SORTEO_ITEM] (
  [ID_SORTEOITEM] int IDENTITY(1,1) NOT NULL,
  [ID_ITEM] int NOT NULL,
  [ID_SORTEO] int NOT NULL,
  [CUPO] int NULL,
  [MONTO] money NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_SORTEO_ITEM] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_TICKET
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_TICKET]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_TICKET]
GO

CREATE TABLE [dbo].[TB_TICKET] (
  [ID_TICKET] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [SERIAL] varchar(150) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [FECHA_HORA] datetime NOT NULL,
  [ESTATUS] int NOT NULL,
  [MONTO_PAGADO] money DEFAULT ((0)) NULL,
  [FECHA_HORA_PAGO] datetime NULL,
  [MONTO_APUESTA] money NULL
)
GO

ALTER TABLE [dbo].[TB_TICKET] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_TIPOJUEGO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_TIPOJUEGO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_TIPOJUEGO]
GO

CREATE TABLE [dbo].[TB_TIPOJUEGO] (
  [ID_TIPOJUEGO] int IDENTITY(1,1) NOT NULL,
  [DESCRIPCION] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
  [PAGINA] varchar(150) COLLATE Modern_Spanish_CI_AS NULL,
  [ESTATUS] int NULL
)
GO

ALTER TABLE [dbo].[TB_TIPOJUEGO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_TIPOOPERACION
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_TIPOOPERACION]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_TIPOOPERACION]
GO

CREATE TABLE [dbo].[TB_TIPOOPERACION] (
  [ID_TIPOOPERACION] int IDENTITY(1,1) NOT NULL,
  [DESCRIPCION] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [OPERACION] char(1) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_TIPOOPERACION] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_TIPOUSUARIO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_TIPOUSUARIO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_TIPOUSUARIO]
GO

CREATE TABLE [dbo].[TB_TIPOUSUARIO] (
  [ID_TIPOUSUARIO] int IDENTITY(1,1) NOT NULL,
  [DESCRIPCION] varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
  [ESTATUS] int NULL
)
GO

ALTER TABLE [dbo].[TB_TIPOUSUARIO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_TIPOUSUARIO_OPCIONMENU
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_TIPOUSUARIO_OPCIONMENU]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_TIPOUSUARIO_OPCIONMENU]
GO

CREATE TABLE [dbo].[TB_TIPOUSUARIO_OPCIONMENU] (
  [ID_TIPOUSUARIOOPCIONMENU] int IDENTITY(1,1) NOT NULL,
  [ID_OPCIONMENU] int NOT NULL,
  [ID_TIPOUSUARIO] int NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_TIPOUSUARIO_OPCIONMENU] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_USUARIO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_USUARIO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_USUARIO]
GO

CREATE TABLE [dbo].[TB_USUARIO] (
  [ID_USUARIO] int IDENTITY(1,1) NOT NULL,
  [ID_DOMINIO] int NULL,
  [ID_TIPOUSUARIO] int NOT NULL,
  [ID_USUARIOPADRE] int NULL,
  [NOMBRE] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [APELLIDO] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [NUMEROIDENTIFICACION] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [USUARIO] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
  [CORREOELECTRONICO] varchar(250) COLLATE Modern_Spanish_CI_AS NULL,
  [ESTATUS] int NOT NULL,
  [CADUCIDAD] int NULL,
  [CLAVE] nchar(1000) COLLATE Modern_Spanish_CI_AS NULL
)
GO

ALTER TABLE [dbo].[TB_USUARIO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_USUARIO_JUEGO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_USUARIO_JUEGO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_USUARIO_JUEGO]
GO

CREATE TABLE [dbo].[TB_USUARIO_JUEGO] (
  [ID_USUARIOJUEGO] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [ID_JUEGO] int NOT NULL,
  [MAX_VENTA] money NULL,
  [MAX_POSIBLE_PERDIDA] money NULL,
  [MAX_TICKET_ITEM] int NULL,
  [MAX_TICKET] int NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_USUARIO_JUEGO_CONJUNTO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_USUARIO_JUEGO_CONJUNTO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO]
GO

CREATE TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO] (
  [ID_USUARIOJUEGOCONJUNTO] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [ID_CONJUNTO] int NOT NULL,
  [ID_JUEGO] int NOT NULL,
  [MONTO_MAX] money NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_USUARIO_JUEGO_CONJUNTO_ITEM
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM]
GO

CREATE TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM] (
  [ID_USUARIOJUEGOCONJUNTOITEM] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [ID_CONJUNTO] int NOT NULL,
  [ID_JUEGO] int NOT NULL,
  [ID_ITEM] int NOT NULL,
  [CUPO_MAX] int NULL,
  [MONTO_MAX] money NULL,
  [ESTATUS] int NOT NULL,
  [CUPO_DISPONIBLE] int NULL,
  [MONTO_DISPONIBLE] money NULL
)
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_USUARIO_OPCIONMENU
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_USUARIO_OPCIONMENU]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_USUARIO_OPCIONMENU]
GO

CREATE TABLE [dbo].[TB_USUARIO_OPCIONMENU] (
  [ID_USUARIOOPCIONMENU] int IDENTITY(1,1) NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [ID_OPCIONMENU] int NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_USUARIO_OPCIONMENU] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_USUARIO_SORTEO
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_USUARIO_SORTEO]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_USUARIO_SORTEO]
GO

CREATE TABLE [dbo].[TB_USUARIO_SORTEO] (
  [ID_USUARIOSORTEO] int IDENTITY(1,1) NOT NULL,
  [ID_SORTEO] int NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [ESTATUS] int NOT NULL
)
GO

ALTER TABLE [dbo].[TB_USUARIO_SORTEO] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for TB_USUARIO_SORTEO_ITEM
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[TB_USUARIO_SORTEO_ITEM]') AND type IN ('U'))
	DROP TABLE [dbo].[TB_USUARIO_SORTEO_ITEM]
GO

CREATE TABLE [dbo].[TB_USUARIO_SORTEO_ITEM] (
  [ID_USUARIOSORTEOITEM] int IDENTITY(1,1) NOT NULL,
  [ID_SORTEO] int NOT NULL,
  [ID_ITEM] int NOT NULL,
  [ID_USUARIO] int NOT NULL,
  [CUPO_MAX] int NULL,
  [MONTO_MAX] money NULL,
  [ESTATUS] int NOT NULL,
  [CUPO_DISPONIBLE] int NULL,
  [MONTO_DISPONIBLE] money NULL
)
GO

ALTER TABLE [dbo].[TB_USUARIO_SORTEO_ITEM] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarTotalesCierre
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarTotalesCierre]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarTotalesCierre]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarTotalesCierre](
	  @id_usuario int)
AS
BEGIN
	DECLARE @MONTO_APERTURA money 
	DECLARE @TICKETSVENDIDOS int 
	DECLARE @TICKETSPAGADOS int 
	DECLARE @MONTO_VENDIDO money 
	DECLARE @MONTO_PAGADO money 
	DECLARE @FECHAAPERTURA datetime
	DECLARE @AUX int
	DECLARE @AUX2 int
	
	SET @FECHAAPERTURA = (SELECT FECHA_APERTURA FROM TB_APERTURA WHERE ID_USUARIO = @id_usuario
	AND ESTATUS = 1);
	
	SET @MONTO_APERTURA = (SELECT MONTO_APERTURA FROM TB_APERTURA  WHERE ID_USUARIO = @id_usuario 
	AND ESTATUS = 1);
	
	SET @TICKETSVENDIDOS = (SELECT COUNT(ID_TICKET) from TB_TICKET where ID_USUARIO = @id_usuario
	AND FECHA_HORA BETWEEN @FECHAAPERTURA 
	AND GETDATE() + 1);

	SET @TICKETSPAGADOS = (SELECT COUNT(ID_TICKET) from TB_TICKET where ID_USUARIO = @id_usuario
    AND ESTATUS = 4
	AND FECHA_HORA_PAGO BETWEEN @FECHAAPERTURA
	AND GETDATE() + 1);
	
	SET @AUX= (SELECT COUNT(*) AS MONTO_APUESTA  FROM
	TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE A.FECHA_HORA BETWEEN @FECHAAPERTURA
	AND GETDATE() + 1 AND A.ID_USUARIO = @id_usuario )
	
	IF @AUX = 0
		SET @MONTO_VENDIDO = 0
	ELSE
		SET @MONTO_VENDIDO = (SELECT SUM(B.MONTO_APUESTA) AS MONTO_APUESTA  FROM
	TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE A.FECHA_HORA BETWEEN @FECHAAPERTURA
	AND GETDATE() + 1 AND A.ID_USUARIO = @id_usuario 
	GROUP BY A.ID_USUARIO);

	SET @AUX2 = (SELECT COUNT(*) FROM
	TB_TICKET A
	WHERE A.FECHA_HORA_PAGO BETWEEN @FECHAAPERTURA
	AND GETDATE() + 1 AND A.ID_USUARIO = @id_usuario AND A.ESTATUS = 4);
	
	IF @AUX2 = 0 
		SET @MONTO_PAGADO = 0
	ELSE
		SET @MONTO_PAGADO = (SELECT SUM(MONTO_PAGADO) FROM
								TB_TICKET A
								WHERE A.FECHA_HORA_PAGO BETWEEN @FECHAAPERTURA
								AND GETDATE() + 1 AND A.ID_USUARIO = @id_usuario AND A.ESTATUS = 4
								GROUP BY A.ID_USUARIO);

	/*SELECT  @TICKETSPAGADOS as cantidad_tickets_pagados,
			@MONTO_PAGADO as monto_total_pagados, 
			@TICKETSVENDIDOS as cantidad_tickets_vendidos,
			@MONTO_VENDIDO as monto_total_vendidos,
		    ((@MONTO_APERTURA + @MONTO_VENDIDO) - @MONTO_PAGADO) as monto_cierre;*/
		    
	(SELECT  
		'Total Tickets Vendidos' as descripcion,
	     @TICKETSVENDIDOS as cantidad_tickets,
	     @MONTO_VENDIDO as monto_total)
	UNION 
		(SELECT  
		'Total Tickets Pagados' as descripcion,
	     @TICKETSPAGADOS as cantidad_tickets,
	     @MONTO_PAGADO as monto_total)
	  UNION    
	     (SELECT  
		'Total Cierre' as descripcion,
	     '' as cantidad_tickets,
	    ((@MONTO_APERTURA + @MONTO_VENDIDO) - @MONTO_PAGADO) as monto_total);
END
GO


-- ----------------------------
-- Procedure structure for sp_RegistrarCierre
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RegistrarCierre]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RegistrarCierre]
GO

CREATE PROCEDURE [dbo].[sp_RegistrarCierre](
	  @id_usuario int,
	  @id_apertura int,
	  @monto_cierre money)
AS
BEGIN
		 UPDATE TB_APERTURA SET 
            MONTO_CIERRE = @monto_cierre,
            FECHA_CIERRE = GETDATE(),
            ESTATUS = 2
		 WHERE ID_USUARIO = @id_usuario 
		 AND ID_APERTURA = @id_apertura 
		 AND ESTATUS = 1;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarHijosUsuarioPadre
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarHijosUsuarioPadre]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarHijosUsuarioPadre]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarHijosUsuarioPadre](
	  @id_usuariopadre int,
	  @id_tipousarioconsulta int)
AS
BEGIN
	;WITH arbol_hijos AS 
	(
	   SELECT A.ID_USUARIO, A.ID_USUARIOPADRE, A.ID_DOMINIO, A.USUARIO, A.NOMBRE, A.APELLIDO, C.ID_TIPOUSUARIO, C.DESCRIPCION, A.ESTATUS
	   FROM TB_USUARIO A
	   JOIN TB_TIPOUSUARIO C
	   ON A.ID_TIPOUSUARIO = C.ID_TIPOUSUARIO
	   WHERE A.ID_USUARIO = @id_usuariopadre AND A.ESTATUS <> 3
	   UNION ALL
	   SELECT D.ID_USUARIO, D.ID_USUARIOPADRE, D.ID_DOMINIO, D.USUARIO, D.NOMBRE, D.APELLIDO, F.ID_TIPOUSUARIO, F.DESCRIPCION, D.ESTATUS
	   FROM TB_USUARIO D
	   JOIN TB_DOMINIO E
	   ON D.ID_DOMINIO = E.ID_DOMINIO
	   JOIN TB_TIPOUSUARIO F
	   ON D.ID_TIPOUSUARIO = F.ID_TIPOUSUARIO
	   JOIN arbol_hijos G 
	   ON D.ID_USUARIOPADRE = G.ID_USUARIO  
	   AND D.ID_USUARIO <> D.ID_USUARIOPADRE AND D.ESTATUS <> 3
	)	

	SELECT * INTO #TEMP FROM arbol_hijos WHERE ID_USUARIO <> @id_usuariopadre AND
	ID_TIPOUSUARIO = @id_tipousarioconsulta
	OPTION (MAXRECURSION 0)
	
	SELECT * FROM #TEMP

	DROP table #TEMP
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuarioxIdentificacion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuarioxIdentificacion]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuarioxIdentificacion]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuarioxIdentificacion](
	  @numeroidentificacion varchar(50))
AS
BEGIN
	SELECT 
		*
	FROM dbo.[TB_USUARIO] A
	WHERE A.NUMEROIDENTIFICACION = @numeroidentificacion;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarBalance
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarBalance]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarBalance]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarBalance](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime)
AS
BEGIN
	DECLARE @MONTO_APERTURA money 
	DECLARE @TICKETSVENDIDOS int 
	DECLARE @TICKETSPAGADOS int 
	DECLARE @MONTO_VENDIDO money 
	DECLARE @MONTO_PAGADO money 
	DECLARE @FECHAAPERTURA datetime
	DECLARE @AUX int
	DECLARE @AUX2 int
	
	SET @FECHAAPERTURA = (SELECT FECHA_APERTURA FROM TB_APERTURA WHERE ID_USUARIO = @id_usuario
	AND ESTATUS = 1);
	
	SET @MONTO_APERTURA = (SELECT MONTO_APERTURA FROM TB_APERTURA  WHERE ID_USUARIO = @id_usuario 
	AND ESTATUS = 1);
	
	SET @TICKETSVENDIDOS = (SELECT COUNT(ID_TICKET) from TB_TICKET where ID_USUARIO = @id_usuario
	AND FECHA_HORA BETWEEN @fecha_desde 
	AND @fecha_hasta + 1);

	SET @TICKETSPAGADOS = (SELECT COUNT(ID_TICKET) from TB_TICKET where ID_USUARIO = @id_usuario
    AND ESTATUS = 4
	AND FECHA_HORA_PAGO BETWEEN @fecha_desde
	AND @fecha_hasta + 1);
	
	SET @AUX= (SELECT COUNT(*) AS MONTO_APUESTA  FROM
	TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE A.FECHA_HORA BETWEEN @fecha_desde
	AND @fecha_hasta + 1 AND A.ID_USUARIO = @id_usuario )
	
	IF @AUX = 0
		BEGIN
			SET @MONTO_VENDIDO = 0;
		END
	ELSE
		BEGIN
			SET @MONTO_VENDIDO = (SELECT SUM(B.MONTO_APUESTA) AS MONTO_APUESTA  FROM
			TB_TICKET A
			JOIN TB_JUGADA B
			ON A.ID_TICKET = B.ID_TICKET
			WHERE A.FECHA_HORA BETWEEN @fecha_desde
			AND @fecha_hasta + 1 AND A.ID_USUARIO = @id_usuario 
			GROUP BY A.ID_USUARIO);
		END

	SET @AUX2 = (SELECT COUNT(*) FROM
	TB_TICKET A
	WHERE A.FECHA_HORA_PAGO BETWEEN @fecha_desde
	AND @fecha_hasta + 1 AND A.ID_USUARIO = @id_usuario AND A.ESTATUS = 4);
	
	IF @AUX2 = 0 
		BEGIN
			SET @MONTO_PAGADO = 0;
		END
	ELSE
		BEGIN
			SET @MONTO_PAGADO = (SELECT SUM(A.MONTO_PAGADO) FROM
									TB_TICKET A
									WHERE A.FECHA_HORA_PAGO BETWEEN @fecha_desde
									AND @fecha_hasta + 1 AND A.ID_USUARIO = @id_usuario AND A.ESTATUS = 4
									GROUP BY A.ID_USUARIO);
		END

	(SELECT  
		'Total Tickets Vendidos' as descripcion,
	     @TICKETSVENDIDOS as cantidad_tickets,
	     @MONTO_VENDIDO as monto_total)
	UNION 
		(SELECT  
		'Total Tickets Pagados' as descripcion,
	     @TICKETSPAGADOS as cantidad_tickets,
	     @MONTO_PAGADO as monto_total);
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarTipoJuegos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarTipoJuegos]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarTipoJuegos]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarTipoJuegos]
AS
BEGIN
	SELECT * FROM
	TB_TIPOJUEGO
	WHERE ESTATUS = 1;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarPremio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarPremio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarPremio]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarPremio](
	  @serial varchar(150))
AS
BEGIN
	SELECT 
	A.SERIAL,
	D.NOMBRE AS ITEM,
	B.MONTO_APUESTA,
	B.MONTO_APUESTA * E.FACTORPAGO AS MONTO_PAGAR,
	E.NOMBRE AS JUEGO,
	F.HORA AS SORTEO
	FROM TB_TICKET A
	join TB_JUGADA B
	on A.ID_TICKET = B.ID_TICKET
	join TB_RESULTADO C
	on B.ID_SORTEO = C.ID_SORTEO 
	join TB_SORTEO F
	on C.ID_SORTEO = F.ID_SORTEO
	join TB_ITEM D
	on C.ID_ITEM = D.ID_ITEM
	join TB_JUEGO E
	on B.ID_JUEGO = E.ID_JUEGO
	WHERE A.SERIAL = @serial
	AND B.ID_ITEM = C.ID_ITEM AND A.ESTATUS = 5
	UNION
	SELECT E.SERIAL,
	A.NOMBRE AS ITEM,
	F.MONTO_APUESTA,
	F.MONTO_APUESTA * H.FACTORPAGO AS MONTO_PAGAR,
	H.NOMBRE AS JUEGO,
	I.HORA AS SORTEO
	from TB_ITEM A
	JOIN TB_CONJUNTO_ITEM B
	ON A.ID_ITEM = B.ID_ITEM
	JOIN TB_CONJUNTO C
	ON B.ID_CONJUNTO = C.ID_CONJUNTO
	JOIN TB_JUGADA D
	ON C.ID_CONJUNTO = D.ID_CONJUNTO
	JOIN TB_TICKET E
	ON D.ID_TICKET = E.ID_TICKET
	JOIN TB_JUGADA F
	on E.ID_TICKET = F.ID_TICKET
	JOIN TB_RESULTADO G
	on F.ID_SORTEO = G.ID_SORTEO 
	JOIN TB_JUEGO H
	on D.ID_JUEGO = H.ID_JUEGO 
	JOIN TB_SORTEO I
	on G.ID_SORTEO = I.ID_SORTEO
	WHERE E.SERIAL = @serial
	AND A.ID_ITEM = G.ID_ITEM AND E.ESTATUS = 5
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarJuegosActivos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarJuegosActivos]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarJuegosActivos]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarJuegosActivos]
AS
BEGIN
	SELECT * FROM
	TB_JUEGO
	WHERE ESTATUS = 1;  
END
GO


-- ----------------------------
-- Procedure structure for sp_PagarPremioTicket
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PagarPremioTicket]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_PagarPremioTicket]
GO

CREATE PROCEDURE [dbo].[sp_PagarPremioTicket](
	  @serial varchar(150),
	  @monto_pagado money)
AS
BEGIN
		UPDATE TB_TICKET SET
			FECHA_HORA_PAGO = GETDATE(),
			MONTO_PAGADO = @monto_pagado,
			ESTATUS = 4 --Ticket Pagado
		WHERE SERIAL = @serial;
		
		UPDATE TB_JUGADA SET
			ESTATUS = 4 --Ticket Pagado
		WHERE ID_JUGADA IN (SELECT ID_JUGADA FROM TB_JUGADA A
		JOIN TB_TICKET B
		ON A.ID_TICKET = B.ID_TICKET
		WHERE B.SERIAL = @serial AND A.ESTATUS = 5);
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarDisponibilidadPadreSorteoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarDisponibilidadPadreSorteoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarDisponibilidadPadreSorteoItem]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarDisponibilidadPadreSorteoItem](
      @id_sorteo int,
      @id_item int,
      @id_usuariopadre int,
      @monto_disponible money,
	  @cupo_disponible money)
AS
BEGIN
	
	UPDATE [dbo].[TB_USUARIO_SORTEO_ITEM]
	SET
	   [MONTO_DISPONIBLE] = IsNull(MONTO_DISPONIBLE - @monto_disponible, MONTO_DISPONIBLE),
	   [CUPO_DISPONIBLE] = IsNull(CUPO_DISPONIBLE - @cupo_disponible, CUPO_DISPONIBLE)
	WHERE 
	   [ID_USUARIO] = @id_usuariopadre
	   AND [ID_SORTEO] = @id_sorteo
	   AND [ID_ITEM] = @id_item;
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarUsuarioOpcionMenu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarUsuarioOpcionMenu]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarUsuarioOpcionMenu]
GO

CREATE PROCEDURE [dbo].[sp_InsertarUsuarioOpcionMenu](
       @id_usuario int,
       @id_opcionmenu int)
AS
BEGIN
	INSERT INTO [dbo].[TB_USUARIO_OPCIONMENU]
           ([ID_USUARIO]
           ,[ID_OPCIONMENU]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @id_opcionmenu,
           1)
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarUsuarioOpcionMenu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarUsuarioOpcionMenu]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarUsuarioOpcionMenu]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarUsuarioOpcionMenu](
       @id_usuario int,
       @id_opcionmenu int,
       @estatus int)
AS
BEGIN

	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_USUARIO_OPCIONMENU] WHERE
        [ID_USUARIO] = @id_usuario
        AND  [ID_OPCIONMENU] = @id_opcionmenu
        AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
		BEGIN     
			UPDATE [dbo].[TB_USUARIO_OPCIONMENU]
			SET
				[ESTATUS] = IsNull(@estatus, ESTATUS)
			WHERE
				[ID_USUARIO] = @id_usuario
				AND  [ID_OPCIONMENU] = @id_opcionmenu;
		END
	ELSE
		BEGIN 
			INSERT INTO [dbo].[TB_USUARIO_OPCIONMENU]
			   ([ID_USUARIO]
			   ,[ID_OPCIONMENU]
			   ,[ESTATUS])
			 VALUES
				   (@id_usuario,
				   @id_opcionmenu,
				   1);
		END   
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarResultados
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarResultados]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarResultados]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarResultados]
AS
BEGIN 
	SELECT A.ID_RESULTADO, B.ID_JUEGO, B.NOMBRE AS NOMBRE_JUEGO, C.ID_SORTEO, C.HORA, D.ID_ITEM, D.VALOR, D.NOMBRE AS NOMBRE_ITEM FROM
	TB_RESULTADO A
	JOIN TB_JUEGO B
	ON A.ID_JUEGO = B.ID_JUEGO
	JOIN TB_SORTEO C
	ON A.ID_SORTEO = C.ID_SORTEO
	JOIN TB_ITEM D
	ON A.ID_ITEM = D.ID_ITEM
	WHERE CAST(FECHA_HORA AS DATE) BETWEEN CAST(GETDATE() AS DATE)
	AND CAST(GETDATE()+ 1 AS DATE) ;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosUsuariosInternos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosUsuariosInternos]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosUsuariosInternos]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosUsuariosInternos]
AS
BEGIN
	SELECT * 
	FROM dbo.[TB_USUARIO]
	WHERE [ID_TIPOUSUARIO] = 7 AND ESTATUS <> 3;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarVendidoxSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarVendidoxSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarVendidoxSorteo]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarVendidoxSorteo](
	  @id_dominio int)
AS
BEGIN 
	SELECT COUNT(E.ID_ITEM) as CANTIDAD_VENDIDA, SUM(E.MONTO_APUESTA) AS MONTO_VENDIDO, A.NOMBRE AS NOMBRE_JUEGO, 
	C.HORA AS NOMBRE_SORTEO, D.NOMBRE AS NOMBRE_ITEM
	FROM
	TB_JUEGO A
	JOIN TB_SORTEO C
	ON A.ID_JUEGO = C.ID_JUEGO
	JOIN TB_ITEM D
	ON A.ID_JUEGO = D.ID_JUEGO
	JOIN TB_JUGADA E
	ON D.ID_ITEM = E.ID_ITEM AND A.ID_JUEGO = E.ID_JUEGO AND C.ID_SORTEO = E.ID_SORTEO
	JOIN TB_TICKET F
	ON E.ID_TICKET = F.ID_TICKET
	JOIN TB_USUARIO G
	ON F.ID_USUARIO = G.ID_USUARIO
	WHERE CAST(F.FECHA_HORA AS DATE) BETWEEN CAST(GETDATE() AS DATE)
	AND CAST(GETDATE()+ 1 AS DATE) AND G.ID_DOMINIO = 1
	GROUP BY  A.NOMBRE, C.HORA, D.NOMBRE
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuarioInternoOpcionMenu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuarioInternoOpcionMenu]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuarioInternoOpcionMenu]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuarioInternoOpcionMenu](
	  @usuario varchar(50))
AS
BEGIN
	SELECT 
		C.ID_OPCIONMENU,
		C.NOMBRE,
		C.DESCRIPCION,
		C.POSICION,
		C.URL,
		C.ID_OPCIONMENUPADRE,
		C.ESTATUS
	FROM
	dbo.TB_USUARIO A
	JOIN TB_USUARIO_OPCIONMENU AS B
	ON A.ID_USUARIO = B.ID_USUARIO
	JOIN TB_OPCIONMENU C
	ON B.ID_OPCIONMENU = C.ID_OPCIONMENU
	WHERE A.USUARIO = @usuario AND B.ESTATUS = 1;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarDiaSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarDiaSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarDiaSorteo]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarDiaSorteo](
	  @id_sorteo int,
	  @id_dia int,
	  @estatus int)
AS
BEGIN
    DECLARE @ID_DIA_T int;
    DECLARE @ID_SORTEO_T int;
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_DIA_SORTEO] WHERE
       [ID_SORTEO] = 80 AND [ID_DIA] = 4
       AND (ESTATUS = 1 or ESTATUS = 2) );
    
    IF (@ASIGNADO <> 0)
		BEGIN
			UPDATE [dbo].[TB_DIA_SORTEO]
			SET
				 [ESTATUS] = IsNull(@estatus, ESTATUS)
			 WHERE 
				[ID_SORTEO] = @id_sorteo AND [ID_DIA] = @id_dia;
		END
	ELSE
		BEGIN
					
			INSERT INTO [dbo].[TB_DIA_SORTEO]
			   (ID_SORTEO
			   ,ID_DIA
			   ,ESTATUS)
			VALUES
				(@id_sorteo
				,@id_dia
				,@estatus);
		END	
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarBalancexDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarBalancexDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarBalancexDominio]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarBalancexDominio](
	  @id_dominio int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime)
AS
BEGIN

	DECLARE @MONTO_APERTURA money 
	DECLARE @TICKETSVENDIDOS int 
	DECLARE @TICKETSPAGADOS int 
	DECLARE @MONTO_VENDIDO money 
	DECLARE @MONTO_PAGADO money 
	DECLARE @FECHAAPERTURA datetime
	DECLARE @AUX int
	DECLARE @AUX2 int
	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATETIME,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATETIME,@fecha_hasta,103))
	

	SET @TICKETSVENDIDOS = (
	SELECT COUNT(ID_TICKET) FROM
	TB_TICKET A 
	JOIN TB_USUARIO B
	ON A.ID_USUARIO = B.ID_USUARIO
	WHERE CONVERT(DATETIME,FECHA_HORA,103) BETWEEN @fechaD AND @fechaH
	AND B.ID_DOMINIO = @id_dominio);
	

	SET @TICKETSPAGADOS = (
	SELECT COUNT(ID_TICKET) FROM
	TB_TICKET A 
	JOIN TB_USUARIO B
	ON A.ID_USUARIO = B.ID_USUARIO
	AND A.ESTATUS = 4
	AND CONVERT(DATETIME,FECHA_HORA_PAGO,103) BETWEEN @fechaD
	AND @fechaH)
	
	
	SET @AUX= (SELECT COUNT(*) AS MONTO_APUESTA  FROM
	TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	JOIN TB_USUARIO C
	ON A.ID_USUARIO = C.ID_USUARIO
	WHERE CONVERT(DATETIME,A.FECHA_HORA,103) BETWEEN @fechaD
	AND @fechaH AND C.ID_DOMINIO=@id_dominio )


	IF @AUX = 0
		BEGIN
			SET @MONTO_VENDIDO = 0;
		END
	ELSE
		BEGIN
			SET @MONTO_VENDIDO = (SELECT SUM(B.MONTO_APUESTA) AS MONTO_APUESTA  FROM
			TB_TICKET A
			JOIN TB_JUGADA B
			ON A.ID_TICKET = B.ID_TICKET
			JOIN TB_USUARIO C
			ON A.ID_USUARIO = C.ID_USUARIO
			WHERE CONVERT(DATETIME,A.FECHA_HORA,103) BETWEEN @fechaD
			AND @fechaH AND C.ID_DOMINIO = @id_dominio 
			GROUP BY C.ID_DOMINIO);
		END

	SET @AUX2 = (SELECT COUNT(*) FROM
	TB_TICKET A
	JOIN TB_USUARIO B
	ON A.ID_USUARIO = B.ID_USUARIO
	WHERE CONVERT(DATETIME,A.FECHA_HORA_PAGO,103) BETWEEN @fechaD
	AND @fechaH + 1 AND B.ID_DOMINIO = @id_dominio AND A.ESTATUS = 4);
			
	
	IF @AUX2 = 0 
		BEGIN
			SET @MONTO_PAGADO = 0;
		END
	ELSE
		BEGIN
			SET @MONTO_PAGADO = (SELECT SUM(A.MONTO_PAGADO) FROM
									TB_TICKET A
									JOIN TB_USUARIO B
									ON A.ID_USUARIO = B.ID_USUARIO
									WHERE CONVERT(DATETIME,A.FECHA_HORA_PAGO,103) BETWEEN @fechaD
									AND @fechaH + 1 AND B.ID_DOMINIO = @id_dominio AND A.ESTATUS = 4
									GROUP BY B.ID_DOMINIO);
		END

	(SELECT  
		'Total Tickets Vendidos' as descripcion,
	     @TICKETSVENDIDOS as cantidad_tickets,
	     @MONTO_VENDIDO as monto_total)
	UNION 
		(SELECT  
		'Total Tickets Pagados' as descripcion,
	     @TICKETSPAGADOS as cantidad_tickets,
	     @MONTO_PAGADO as monto_total);
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDiasSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDiasSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDiasSorteo]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDiasSorteo](
	  @id_sorteo int)
AS
BEGIN
	SELECT 
		A.ID_SORTEO,
		C.ID_DIA,
		C.NOMBRE,
		B.ESTATUS
	FROM
	dbo.TB_SORTEO A
	JOIN [TB_DIA_SORTEO] B
	ON A.ID_SORTEO = B.ID_SORTEO
	JOIN dbo.TB_DIA C
	ON B.ID_DIA = C.ID_DIA
	WHERE A.ID_SORTEO = @id_sorteo
	AND B.ESTATUS <> 3;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarBalanceCierreDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarBalanceCierreDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarBalanceCierreDominio]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarBalanceCierreDominio](
	  @id_dominio int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATETIME,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATETIME,@fecha_hasta,103))


	SELECT 
		A.ID_USUARIO,
		A.USUARIO,
		A.TOTAL_VENDIDO,
		A.TOTAL_PAGADO,
		B.PENDIENTE_PAGAR
	FROM
	(SELECT SUM(B.MONTO_APUESTA) TOTAL_VENDIDO, 
		   SUM(A.MONTO_PAGADO) TOTAL_PAGADO, 
		   A.ID_USUARIO ,
		   C.ID_DOMINIO, 
		   C.USUARIO 
		FROM TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_USUARIO C
		ON A.ID_USUARIO = C.ID_USUARIO
		WHERE C.ID_DOMINIO = @id_dominio
		AND CONVERT(DATETIME,A.FECHA_HORA,103) BETWEEN @fechaD AND @fechaH
		GROUP BY A.ID_USUARIO ,C.ID_DOMINIO, C.USUARIO ) A
	JOIN 
	 (SELECT SUM(W.MONTO_PAGAR) as PENDIENTE_PAGAR,
			W.ID_USUARIO 
		 FROM 
				(SELECT 
					(B.MONTO_APUESTA * E.FACTORPAGO) AS MONTO_PAGAR,
					G.ID_USUARIO 
				FROM TB_TICKET A
				join TB_JUGADA B
				on A.ID_TICKET = B.ID_TICKET
				join TB_RESULTADO C
				on B.ID_SORTEO = C.ID_SORTEO AND convert(varchar, A.FECHA_HORA, 103) = convert(varchar, C.FECHA_HORA, 103)
				join TB_SORTEO F
				on C.ID_SORTEO = F.ID_SORTEO
				join TB_ITEM D
				on C.ID_ITEM = D.ID_ITEM
				join TB_JUEGO E
				on B.ID_JUEGO = E.ID_JUEGO
				join TB_USUARIO G
				on A.ID_USUARIO = G.ID_USUARIO
				WHERE CONVERT(DATETIME,A.FECHA_HORA,103) BETWEEN @fechaD AND @fechaH
				AND B.ID_ITEM = C.ID_ITEM AND G.ID_DOMINIO = @id_dominio AND A.ESTATUS = 1
				UNION
				SELECT
					(F.MONTO_APUESTA * H.FACTORPAGO) AS MONTO_PAGAR,
					J.ID_USUARIO
				FROM TB_ITEM A
				JOIN TB_CONJUNTO_ITEM B
				ON A.ID_ITEM = B.ID_ITEM
				JOIN TB_CONJUNTO C
				ON B.ID_CONJUNTO = C.ID_CONJUNTO
				JOIN TB_JUGADA D
				ON C.ID_CONJUNTO = D.ID_CONJUNTO
				JOIN TB_TICKET E
				ON D.ID_TICKET = E.ID_TICKET
				JOIN TB_JUGADA F
				on E.ID_TICKET = F.ID_TICKET
				JOIN TB_RESULTADO G
				on F.ID_SORTEO = G.ID_SORTEO and convert(varchar, E.FECHA_HORA, 103) = convert(varchar, G.FECHA_HORA, 103)
				JOIN TB_JUEGO H
				on D.ID_JUEGO = H.ID_JUEGO 
				JOIN TB_SORTEO I
				on G.ID_SORTEO = I.ID_SORTEO
				join TB_USUARIO J
				on E.ID_USUARIO = J.ID_USUARIO
				WHERE  CONVERT(DATETIME,E.FECHA_HORA,103) BETWEEN @fechaD AND @fechaH
				AND A.ID_ITEM = G.ID_ITEM AND J.ID_DOMINIO = @id_dominio AND E.ESTATUS = 1) W
			GROUP BY W.ID_USUARIO ) b
		on a.ID_USUARIO = b.ID_USUARIO
				
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDias
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDias]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDias]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDias]
AS
BEGIN
	SELECT * FROM
	TB_DIA
	WHERE ESTATUS = 1;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarCuadreBanca
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarCuadreBanca]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarCuadreBanca]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarCuadreBanca](
	  @id_dominio int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime
	DECLARE @PORCENTAJE decimal(10,2)

	SET @fechaD = CONVERT(DATETIME,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATETIME,@fecha_hasta,103))
	
	SET @PORCENTAJE = (SELECT PORCENTAJE FROM TB_DOMINIO WHERE ID_DOMINIO = @id_dominio)


	SELECT 
		A.ID_USUARIO,
		A.USUARIO,
		A.TOTAL_VENDIDO,
		A.TOTAL_PAGADO,
		B.PENDIENTE_PAGAR,
		@PORCENTAJE AS PORCENTAJE,
		(A.TOTAL_VENDIDO * @PORCENTAJE/100) AS COMISION,
		A.TOTAL_VENDIDO - (A.TOTAL_PAGADO + B.PENDIENTE_PAGAR) - (A.TOTAL_VENDIDO * @PORCENTAJE/100) as SALDO	
	FROM
	(SELECT SUM(B.MONTO_APUESTA) TOTAL_VENDIDO, 
		   SUM(A.MONTO_PAGADO) TOTAL_PAGADO, 
		   A.ID_USUARIO ,
		   C.ID_DOMINIO, 
		   C.USUARIO 
		FROM TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_USUARIO C
		ON A.ID_USUARIO = C.ID_USUARIO
		WHERE C.ID_DOMINIO = @id_dominio
		AND CONVERT(DATETIME,A.FECHA_HORA,103) BETWEEN @fechaD AND @fechaH
		GROUP BY A.ID_USUARIO ,C.ID_DOMINIO, C.USUARIO ) A
	JOIN 
	 (SELECT SUM(W.MONTO_PAGAR) as PENDIENTE_PAGAR,
			W.ID_USUARIO 
		 FROM 
				(SELECT 
					(B.MONTO_APUESTA * E.FACTORPAGO) AS MONTO_PAGAR,
					G.ID_USUARIO 
				FROM TB_TICKET A
				join TB_JUGADA B
				on A.ID_TICKET = B.ID_TICKET
				join TB_RESULTADO C
				on B.ID_SORTEO = C.ID_SORTEO AND convert(varchar, A.FECHA_HORA, 103) = convert(varchar, C.FECHA_HORA, 103)
				join TB_SORTEO F
				on C.ID_SORTEO = F.ID_SORTEO
				join TB_ITEM D
				on C.ID_ITEM = D.ID_ITEM
				join TB_JUEGO E
				on B.ID_JUEGO = E.ID_JUEGO
				join TB_USUARIO G
				on A.ID_USUARIO = G.ID_USUARIO
				WHERE CONVERT(DATETIME,A.FECHA_HORA,103) BETWEEN @fechaD AND @fechaH
				AND B.ID_ITEM = C.ID_ITEM AND G.ID_DOMINIO = @id_dominio AND A.ESTATUS = 1
				UNION
				SELECT
					(F.MONTO_APUESTA * H.FACTORPAGO) AS MONTO_PAGAR,
					J.ID_USUARIO
				FROM TB_ITEM A
				JOIN TB_CONJUNTO_ITEM B
				ON A.ID_ITEM = B.ID_ITEM
				JOIN TB_CONJUNTO C
				ON B.ID_CONJUNTO = C.ID_CONJUNTO
				JOIN TB_JUGADA D
				ON C.ID_CONJUNTO = D.ID_CONJUNTO
				JOIN TB_TICKET E
				ON D.ID_TICKET = E.ID_TICKET
				JOIN TB_JUGADA F
				on E.ID_TICKET = F.ID_TICKET
				JOIN TB_RESULTADO G
				on F.ID_SORTEO = G.ID_SORTEO and convert(varchar, E.FECHA_HORA, 103) = convert(varchar, G.FECHA_HORA, 103)
				JOIN TB_JUEGO H
				on D.ID_JUEGO = H.ID_JUEGO 
				JOIN TB_SORTEO I
				on G.ID_SORTEO = I.ID_SORTEO
				join TB_USUARIO J
				on E.ID_USUARIO = J.ID_USUARIO
				WHERE  CONVERT(DATETIME,E.FECHA_HORA,103) BETWEEN @fechaD AND @fechaH
				AND A.ID_ITEM = G.ID_ITEM AND J.ID_DOMINIO = @id_dominio AND E.ESTATUS = 1) W
			GROUP BY W.ID_USUARIO ) b
		on a.ID_USUARIO = b.ID_USUARIO
				
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDominiosDisponibles
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDominiosDisponibles]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDominiosDisponibles]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDominiosDisponibles]
AS
BEGIN
SELECT * 
	FROM dbo.[TB_DOMINIO] A
	WHERE A.ID_DOMINIO NOT IN (SELECT ID_DOMINIO FROM TB_USUARIO WHERE ID_TIPOUSUARIO = 2
	AND ESTATUS = 1)
	AND A.ESTATUS <> 3;
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarSolicitud
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarSolicitud]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarSolicitud]
GO

CREATE PROCEDURE [dbo].[sp_InsertarSolicitud](
	  @id_solicitud int OUTPUT,
	  @id_usuario int,
	  @monto varchar(50),
	  @id_tipooperacion int,
	  @codigoqr varchar(50),
	  @codigosolicitud varchar(10))
AS
BEGIN
	INSERT INTO [dbo].[TB_SOLICITUD]
           (ID_USUARIO
           ,MONTO
           ,ID_TIPOOPERACION
		   ,CODIGOQR
		   ,CODIGOSOLICITUD
		   ,FECHA_HORA
           ,ESTATUS)
     VALUES
           (@id_usuario,
           @monto,
           @id_tipooperacion,
		   @codigoqr,
		   @codigosolicitud,
		   GETDATE(),
           1);
        
     SELECT @id_solicitud = @@IDENTITY;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ValidarSolicitud
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ValidarSolicitud]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ValidarSolicitud]
GO

CREATE PROCEDURE [dbo].[sp_ValidarSolicitud](
	  @codigosolicitud varchar(50))
AS
BEGIN
	SELECT A.ID_SOLICITUD, B.ID_USUARIO, B.USUARIO, B.NOMBRE, B.APELLIDO, A.MONTO, A.CODIGOQR, A.CODIGOSOLICITUD FROM TB_SOLICITUD A
	JOIN TB_USUARIO B
	ON A.ID_USUARIO = B.ID_USUARIO
	WHERE A.CODIGOSOLICITUD = @codigosolicitud
	AND A.ESTATUS = 1;
END
GO


-- ----------------------------
-- Procedure structure for sp_RecargarSaldo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RecargarSaldo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RecargarSaldo]
GO

CREATE PROCEDURE [dbo].[sp_RecargarSaldo](
	  @id_operacion int OUTPUT,
	  @id_solicitud int)
AS
BEGIN
	
	UPDATE TB_SOLICITUD SET ESTATUS = 2 WHERE ID_SOLICITUD = @id_solicitud;

	INSERT INTO [dbo].[TB_MONEDERO]
           (ID_USUARIO
           ,MONTO
           ,ID_TIPOOPERACION
		   ,FECHA_HORA
           ,ESTATUS)
           SELECT 
				ID_USUARIO,
				MONTO,
				ID_TIPOOPERACION,
				FECHA_HORA,
				1
		   FROM TB_SOLICITUD
		   WHERE ID_SOLICITUD = @id_solicitud;
        
     SELECT @id_operacion = @@IDENTITY; 
	
END
GO


-- ----------------------------
-- Procedure structure for sp_ValidarRetiroDinero
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ValidarRetiroDinero]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ValidarRetiroDinero]
GO

CREATE PROCEDURE [dbo].[sp_ValidarRetiroDinero](
	  @id_solicitud varchar(50))
AS
BEGIN
	--El estatus 4 indica que la solicitud fue confirmada por el usuario.
	SELECT * FROM TB_SOLICITUD
	WHERE ID_SOLICITUD = @id_solicitud
	AND ESTATUS = 4;
END
GO


-- ----------------------------
-- Procedure structure for sp_RetirarSaldo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RetirarSaldo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RetirarSaldo]
GO

CREATE PROCEDURE [dbo].[sp_RetirarSaldo](
	  @id_operacion int OUTPUT,
	  @id_solicitud int)
AS
BEGIN
	
	UPDATE TB_SOLICITUD SET ESTATUS = 2 WHERE ID_SOLICITUD = @id_solicitud;

	INSERT INTO [dbo].[TB_MONEDERO]
           (ID_USUARIO
           ,MONTO
           ,ID_TIPOOPERACION
		   ,FECHA_HORA
           ,ESTATUS)
           SELECT 
				ID_USUARIO,
				MONTO,
				ID_TIPOOPERACION,
				FECHA_HORA,
				1
		   FROM TB_SOLICITUD
		   WHERE ID_SOLICITUD = @id_solicitud;
        
     SELECT @id_operacion = @@IDENTITY; 
	
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarSaldoDisponible
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarSaldoDisponible]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarSaldoDisponible]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarSaldoDisponible](
	  @id_usuario varchar(50))
AS
BEGIN
	DECLARE @montocreditos money
	DECLARE @montodebitos money
	
	SET @montocreditos = (SELECT SUM(MONTO)FROM TB_MONEDERO A
	JOIN TB_TIPOOPERACION B
	ON A.ID_TIPOOPERACION = B.ID_TIPOOPERACION
	WHERE ID_USUARIO = @id_usuario AND B.OPERACION = 'C'
	GROUP BY A.ID_USUARIO);
	
	SET @montodebitos = (SELECT SUM(MONTO)FROM TB_MONEDERO A
	JOIN TB_TIPOOPERACION B
	ON A.ID_TIPOOPERACION = B.ID_TIPOOPERACION
	WHERE ID_USUARIO = @id_usuario AND B.OPERACION = 'D'
	GROUP BY A.ID_USUARIO);
	
	IF @montodebitos IS NULL
	BEGIN 
		SET @montodebitos = 0
	END
	
	IF @montocreditos IS NULL
	BEGIN 
		SET @montocreditos = 0
	END
		
	SELECT @montocreditos - @montodebitos as SALDO_DISPONIBLE;
		
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDetalleSaldo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDetalleSaldo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDetalleSaldo]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDetalleSaldo](
	  @id_usuario varchar(50))
AS
BEGIN
	SELECT A.ID_OPERACION, A.ID_USUARIO, A.MONTO, B.ID_TIPOOPERACION, B.DESCRIPCION, B.OPERACION, A.MONTO, A.FECHA_HORA
	FROM TB_MONEDERO A
	JOIN TB_TIPOOPERACION B
	ON A.ID_TIPOOPERACION = B.ID_TIPOOPERACION
	WHERE A.ID_USUARIO = @id_usuario	
END
GO


-- ----------------------------
-- Procedure structure for sp_ValidarPremiosUsuarioMovil
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ValidarPremiosUsuarioMovil]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ValidarPremiosUsuarioMovil]
GO

CREATE PROCEDURE [dbo].[sp_ValidarPremiosUsuarioMovil](
	  @id_usuario int,
	  @cantidad_procesados int OUTPUT)
AS
BEGIN
	;WITH premios AS 
	(
			SELECT
			A.ID_TICKET, 
			A.SERIAL,
			A.ID_USUARIO,
			D.NOMBRE AS ITEM,
			B.MONTO_APUESTA,
			B.MONTO_APUESTA * E.FACTORPAGO AS MONTO_PAGAR,
			E.NOMBRE AS JUEGO,
			F.HORA AS SORTEO
			FROM TB_TICKET A
			join TB_JUGADA B
			on A.ID_TICKET = B.ID_TICKET
			join TB_RESULTADO C
			on B.ID_SORTEO = C.ID_SORTEO 
			join TB_SORTEO F
			on C.ID_SORTEO = F.ID_SORTEO
			join TB_ITEM D
			on C.ID_ITEM = D.ID_ITEM
			join TB_JUEGO E
			on B.ID_JUEGO = E.ID_JUEGO
			WHERE A.ID_USUARIO = @id_usuario
			AND convert(varchar, A.FECHA_HORA, 103) = convert(varchar, C.FECHA_HORA, 103)
			AND B.ID_ITEM = C.ID_ITEM AND A.ESTATUS = 1
			UNION
			SELECT E.ID_TICKET,
			E.SERIAL,
			E.ID_USUARIO,
			A.NOMBRE AS ITEM,
			F.MONTO_APUESTA,
			F.MONTO_APUESTA * H.FACTORPAGO AS MONTO_PAGAR,
			H.NOMBRE AS JUEGO,
			I.HORA AS SORTEO
			from TB_ITEM A
			JOIN TB_CONJUNTO_ITEM B
			ON A.ID_ITEM = B.ID_ITEM
			JOIN TB_CONJUNTO C
			ON B.ID_CONJUNTO = C.ID_CONJUNTO
			JOIN TB_JUGADA D
			ON C.ID_CONJUNTO = D.ID_CONJUNTO
			JOIN TB_TICKET E
			ON D.ID_TICKET = E.ID_TICKET
			JOIN TB_JUGADA F
			on E.ID_TICKET = F.ID_TICKET
			JOIN TB_RESULTADO G
			on F.ID_SORTEO = G.ID_SORTEO 
			JOIN TB_JUEGO H
			on D.ID_JUEGO = H.ID_JUEGO 
			JOIN TB_SORTEO I
			on G.ID_SORTEO = I.ID_SORTEO
			WHERE E.ID_USUARIO = @id_usuario
			AND convert(varchar, E.FECHA_HORA, 103) = convert(varchar, G.FECHA_HORA, 103)
			AND A.ID_ITEM = G.ID_ITEM AND E.ESTATUS = 1
	)	
	
	 SELECT * INTO #TEMP FROM premios 
	
	 -- Actualiza a procesados los tickets sin premio
	 UPDATE TB_TICKET SET ESTATUS = 5 WHERE ID_USUARIO = @id_usuario AND SERIAL NOT IN 
	 (SELECT SERIAL FROM #TEMP);
	 
	 UPDATE TB_TICKET
	 SET
		ESTATUS = 4,
		MONTO_PAGADO = A.MONTO_PAGAR,
		FECHA_HORA_PAGO = GETDATE()
	FROM
		#TEMP A
	WHERE
		TB_TICKET.ID_TICKET = A.ID_TICKET;
	
	INSERT INTO TB_MONEDERO (ID_USUARIO, MONTO, ID_TIPOOPERACION, FECHA_HORA, ESTATUS, DESCRIPCION)
	SELECT ID_USUARIO, MONTO_PAGAR, 2, GETDATE(), 1, SERIAL FROM #TEMP;
	 
	SELECT  @cantidad_procesados = (SELECT COUNT(*) FROM #TEMP);
	
	DROP table #TEMP
	
END
GO


-- ----------------------------
-- Procedure structure for sp_RegistrarApuestaMonedero
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RegistrarApuestaMonedero]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RegistrarApuestaMonedero]
GO

CREATE PROCEDURE [dbo].[sp_RegistrarApuestaMonedero](
      @id_usuario int,
      @monto money,
      @serial varchar(150))
AS
BEGIN
	INSERT INTO [dbo].[TB_MONEDERO]
           ([ID_USUARIO]
           ,[MONTO]
           ,[ID_TIPOOPERACION]
           ,[ESTATUS]
           ,[FECHA_HORA]
           ,[DESCRIPCION])
     VALUES
           (@id_usuario,
           @monto,
           3,
           1,
           GETDATE(),
           @serial);
           
END
GO


-- ----------------------------
-- Procedure structure for sp_AutorizarRetiroUsuarioMovil
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AutorizarRetiroUsuarioMovil]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_AutorizarRetiroUsuarioMovil]
GO

CREATE PROCEDURE [dbo].[sp_AutorizarRetiroUsuarioMovil](
	  @id_usuario int,
	  @codigoqr varchar(50))
AS
BEGIN
	--El estatus 4 indica que la solicitud fue confirmada por el usuario.
	UPDATE TB_SOLICITUD SET ESTATUS  = 4 WHERE ID_USUARIO = @id_usuario AND CODIGOQR = @codigoqr;
	
	SELECT ID_SOLICITUD FROM TB_SOLICITUD
	WHERE ESTATUS  = 4 AND ID_USUARIO = @id_usuario AND CODIGOQR = @codigoqr;
END
GO


-- ----------------------------
-- Procedure structure for sp_RegistrarAuditoria
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RegistrarAuditoria]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RegistrarAuditoria]
GO

CREATE PROCEDURE [dbo].[sp_RegistrarAuditoria](
	  @cod_evento int,
	  @usuario varchar(50),
	  @parametros varchar(5000),
	  @exito char(1))
AS
BEGIN
	INSERT INTO [dbo].[TB_AUDITORIA]
           ([ID_EVENTO]
           ,[ID_USUARIO]
           ,[PARAMETROS]
           ,[EXITO])
     VALUES
           ((SELECT ID_EVENTO FROM TB_EVENTO WHERE COD_EVENTO = @cod_evento),
           (SELECT ID_USUARIO FROM TB_USUARIO WHERE USUARIO = @usuario),
           @parametros,
           @exito);
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarUsuarioSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarUsuarioSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarUsuarioSorteo]
GO

CREATE PROCEDURE [dbo].[sp_InsertarUsuarioSorteo](
       @id_usuario int,
       @id_sorteo int)
AS
BEGIN
	INSERT INTO [dbo].[TB_USUARIO_SORTEO]
           ([ID_USUARIO]
           ,[ID_SORTEO]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @id_sorteo,
           1)
END
GO


-- ----------------------------
-- Procedure structure for sp_BloquearUsuarioSorteoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_BloquearUsuarioSorteoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_BloquearUsuarioSorteoItem]
GO

CREATE PROCEDURE [dbo].[sp_BloquearUsuarioSorteoItem](
       @id_usuario int,
       @id_sorteo int,
       @id_item int,
       @estatus int)
AS
BEGIN

	;WITH arbol_hijos AS 
	(
	   SELECT A.ID_USUARIO, A.ID_USUARIOPADRE, A.USUARIO, A.NOMBRE, A.APELLIDO, B.ID_DOMINIO, B.NOMBRE AS NOMBRE_DOMINIO, C.ID_TIPOUSUARIO, C.DESCRIPCION, A.ESTATUS
	   FROM TB_USUARIO A
	   JOIN TB_DOMINIO B
	   ON A.ID_DOMINIO = B.ID_DOMINIO OR A.ID_DOMINIO IS NULL
	   JOIN TB_TIPOUSUARIO C
	   ON A.ID_TIPOUSUARIO = C.ID_TIPOUSUARIO
	   WHERE A.ID_USUARIO = @id_usuario AND A.ESTATUS <> 3
	   UNION ALL
	   SELECT D.ID_USUARIO, D.ID_USUARIOPADRE,D.USUARIO, D.NOMBRE, D.APELLIDO, E.ID_DOMINIO, E.NOMBRE AS NOMBRE_DOMINIO, F.ID_TIPOUSUARIO, F.DESCRIPCION, D.ESTATUS
	   FROM TB_USUARIO D
	   JOIN TB_DOMINIO E
	   ON D.ID_DOMINIO = E.ID_DOMINIO
	   JOIN TB_TIPOUSUARIO F
	   ON D.ID_TIPOUSUARIO = F.ID_TIPOUSUARIO
	   JOIN arbol_hijos G 
	   ON D.ID_USUARIOPADRE = G.ID_USUARIO  
	   AND D.ID_USUARIO <> D.ID_USUARIOPADRE AND D.ESTATUS <> 3
	)	

	SELECT * INTO #TEMP FROM arbol_hijos 
	OPTION (MAXRECURSION 0)
	
	--Item bloqueado
	UPDATE dbo.TB_USUARIO_SORTEO_ITEM SET
		ESTATUS = @estatus
	WHERE
		ID_USUARIO IN (SELECT ID_USUARIO FROM #TEMP)
		AND ID_SORTEO = @id_sorteo
		AND ID_ITEM = @id_item;
				

	DROP table #TEMP
	
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarUsuarioSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarUsuarioSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarUsuarioSorteo]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarUsuarioSorteo](
       @id_usuario int,
       @id_sorteo int,
       @estatus int)
AS
BEGIN

	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM TB_USUARIO_SORTEO WHERE
        ID_USUARIO = @id_usuario
		AND ID_SORTEO = @id_sorteo
		AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
		BEGIN     

			UPDATE dbo.TB_USUARIO_SORTEO SET
				ESTATUS = IsNull(@estatus, ESTATUS)
			WHERE
				ID_USUARIO = @id_usuario
				AND ID_SORTEO = @id_sorteo;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[TB_USUARIO_SORTEO]
			   ([ID_USUARIO]
			   ,[ID_SORTEO]
			   ,[ESTATUS])
			 VALUES
				   (@id_usuario,
				   @id_sorteo,
				   1);
		END
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarTicketsEliminarTaquilla
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarTicketsEliminarTaquilla]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarTicketsEliminarTaquilla]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarTicketsEliminarTaquilla](
	@id_usuario int,
	@tiempo int)
AS
BEGIN
	SELECT A.SERIAL, B.ID_TICKET, A.FECHA_HORA, COUNT(B.ID_TICKET) AS cantidad_items, SUM(B.MONTO_APUESTA) as montototal_apuesta FROM
	TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE ID_USUARIO = @id_usuario
	AND A.ESTATUS <> 3 AND DATEDIFF(MINUTE, A.FECHA_HORA, GETDATE()) < @tiempo
	GROUP BY A.SERIAL, B.ID_TICKET, A.FECHA_HORA
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarDisponibleUsuarioSorteoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarDisponibleUsuarioSorteoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarDisponibleUsuarioSorteoItem]
GO

CREATE PROCEDURE [dbo].[sp_InsertarDisponibleUsuarioSorteoItem](
       @id_usuario int,
       @id_sorteo int,
       @id_item int,
       @cupo_disponible int,
       @monto_disponible money)
AS
BEGIN
	INSERT INTO [dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM]
           ([ID_USUARIO]
           ,[ID_SORTEO]
           ,[ID_ITEM]
           ,[CUPO_DISPONIBLE]
           ,[MONTO_DISPONIBLE]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @id_sorteo,
           @id_item,
           @cupo_disponible,
           @monto_disponible,
           1);	 
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarUsuarioJuegoConjuntoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarUsuarioJuegoConjuntoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarUsuarioJuegoConjuntoItem]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarUsuarioJuegoConjuntoItem](
       @id_usuario int,
       @id_conjunto int,
       @id_juego int,
       @id_item int,
       @cupo_max int,
       @monto_max money,
       @cupo_disponible int,
       @monto_disponible money,
       @estatus int)
AS
BEGIN
	
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_USUARIO_JUEGO_CONJUNTO_ITEM] WHERE
        [ID_USUARIO] = @id_usuario
		AND [ID_JUEGO] = @id_juego
        AND [ID_CONJUNTO] = @id_conjunto
        AND [ID_ITEM] = @id_item);
        
    IF (@ASIGNADO <> 0)
		BEGIN       
			UPDATE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM]
			SET
				   [CUPO_MAX]  = IsNull(@cupo_max, CUPO_MAX),
				   [MONTO_MAX] = IsNull(@monto_max, MONTO_MAX),
				   [CUPO_DISPONIBLE]  = IsNull(@cupo_disponible, CUPO_DISPONIBLE),
				   [MONTO_DISPONIBLE]  = IsNull(@monto_disponible, MONTO_DISPONIBLE),
				   [ESTATUS] = IsNull(@estatus, ESTATUS)
			WHERE 
				[ID_USUARIO] = @id_usuario
				AND [ID_JUEGO] = @id_juego
				AND [ID_CONJUNTO] = @id_conjunto
				AND [ID_ITEM] = @id_item;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM]
			   ([ID_USUARIO]
			   ,[ID_JUEGO]
			   ,[ID_CONJUNTO]
			   ,[ID_ITEM]
			   ,[CUPO_MAX]
			   ,[MONTO_MAX]
			   ,[CUPO_DISPONIBLE]
			   ,[MONTO_DISPONIBLE]
			   ,[ESTATUS])
		    VALUES
			   (@id_usuario,
			   @id_juego,
			   @id_conjunto,
			   @id_item,
			   @cupo_max,
			   @monto_max,
			   @cupo_disponible,
               @monto_disponible,
			   1);
		END     
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarUsuarioJuegoConjuntoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarUsuarioJuegoConjuntoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarUsuarioJuegoConjuntoItem]
GO

CREATE PROCEDURE [dbo].[sp_InsertarUsuarioJuegoConjuntoItem](
       @id_usuario int,
       @id_conjunto int,
       @id_juego int,
       @id_item int,
       @cupo_max int,
       @monto_max money,
       @cupo_disponible int,
       @monto_disponible money)
AS
BEGIN
	INSERT INTO [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM]
           ([ID_USUARIO]
           ,[ID_JUEGO]
           ,[ID_CONJUNTO]
           ,[ID_ITEM]
           ,[CUPO_MAX]
           ,[MONTO_MAX]
           ,[CUPO_DISPONIBLE]
           ,[MONTO_DISPONIBLE]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @id_juego,
           @id_conjunto,
           @id_item,
           @cupo_max,
           @monto_max,
           @cupo_disponible,
           @monto_disponible,
           1)
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarResultadoSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarResultadoSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarResultadoSorteo]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarResultadoSorteo](
	   @id_resultado int,
       @id_juego int,
       @id_sorteo int,
       @id_item int)
AS
BEGIN
	UPDATE [Loto].[dbo].[TB_RESULTADO]
	   SET [ID_ITEM] = @id_item,
	   [ID_JUEGO] = @id_juego,
	   [ID_SORTEO] = @id_sorteo
	 WHERE ID_RESULTADO = @id_resultado;
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarDisponibleUsuarioSorteoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarDisponibleUsuarioSorteoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarDisponibleUsuarioSorteoItem]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarDisponibleUsuarioSorteoItem](
       @id_usuario int,
       @id_sorteo int,
       @id_item int,
       @cupo_disponible int,
       @monto_disponible money,
       @estatus int)
AS
BEGIN

	DECLARE @idusuario int
	DECLARE	@iditem int
	DECLARE	@idsorteo int
	DECLARE	@cupo int
	DECLARE	@monto money
		
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM TB_DISPONIBLE_USUARIO_SORTEO_ITEM WHERE
        ID_USUARIO = @id_usuario
		AND ID_SORTEO = @id_sorteo
		AND ID_ITEM = @id_item
		AND ESTATUS = 1);

	IF (@ASIGNADO <> 0)
		BEGIN					
			;WITH arbol_hijos AS 
			(
			   SELECT A.ID_USUARIO, C.ID_ITEM, C.ID_SORTEO, C.MONTO_DISPONIBLE, C.CUPO_DISPONIBLE
			   FROM TB_USUARIO A
			   JOIN TB_DOMINIO B
			   ON A.ID_DOMINIO = B.ID_DOMINIO OR A.ID_DOMINIO IS NULL
			   JOIN TB_DISPONIBLE_USUARIO_SORTEO_ITEM C
			   ON A.ID_USUARIO = C.ID_USUARIO
			   WHERE A.ID_USUARIO = @id_usuario AND C.ID_ITEM = @id_item AND C.ID_SORTEO = @id_sorteo AND A.ESTATUS <> 3
			   UNION ALL
			   SELECT D.ID_USUARIO, F.ID_ITEM, F.ID_SORTEO, F.MONTO_DISPONIBLE, F.CUPO_DISPONIBLE
			   FROM TB_USUARIO D
			   JOIN TB_DOMINIO E
			   ON D.ID_DOMINIO = E.ID_DOMINIO
			   JOIN TB_DISPONIBLE_USUARIO_SORTEO_ITEM F
			   ON D.ID_USUARIO = F.ID_USUARIO
			   JOIN arbol_hijos G 
			   ON D.ID_USUARIOPADRE = G.ID_USUARIO  
			   AND D.ID_USUARIO <> D.ID_USUARIOPADRE AND D.ESTATUS <> 3
			   WHERE F.ID_ITEM = @id_item AND F.ID_SORTEO = @id_sorteo
			   )
			   
			   SELECT * INTO #TEMP FROM arbol_hijos
			   
				
			   DECLARE v_cursor cursor GLOBAL
			   FOR 
					SELECT * FROM #TEMP
			   FOR UPDATE
			   OPEN v_cursor
			   FETCH v_cursor INTO @idusuario,@iditem,@idsorteo,@monto,@cupo
			   WHILE(@@fetch_status=0)
					BEGIN
						IF @id_usuario = @idusuario
							BEGIN
								UPDATE TB_DISPONIBLE_USUARIO_SORTEO_ITEM
								SET MONTO_DISPONIBLE = @monto_disponible, CUPO_DISPONIBLE = @cupo_disponible
								WHERE ID_USUARIO = @id_usuario AND ID_ITEM =@id_item AND ID_SORTEO = @id_sorteo
							END
						ELSE
							BEGIN
								IF @monto_disponible < (SELECT MONTO_DISPONIBLE FROM TB_DISPONIBLE_USUARIO_SORTEO_ITEM
											WHERE ID_USUARIO = @idusuario AND ID_ITEM =@iditem AND ID_SORTEO = @idsorteo)
									BEGIN
										UPDATE TB_DISPONIBLE_USUARIO_SORTEO_ITEM
										SET MONTO_DISPONIBLE = @monto_disponible
										WHERE ID_USUARIO = @idusuario AND ID_ITEM =@iditem AND ID_SORTEO = @idsorteo;
									END
								IF @cupo_disponible < (SELECT CUPO_DISPONIBLE FROM TB_DISPONIBLE_USUARIO_SORTEO_ITEM
											WHERE ID_USUARIO = @idusuario AND ID_ITEM =@iditem AND ID_SORTEO = @idsorteo)
									BEGIN
										UPDATE TB_DISPONIBLE_USUARIO_SORTEO_ITEM
										SET CUPO_DISPONIBLE = @cupo_disponible
										WHERE ID_USUARIO = @idusuario AND ID_ITEM =@iditem AND ID_SORTEO = @idsorteo;
									END
							END
							FETCH v_cursor INTO @idusuario,@iditem,@idsorteo,@monto,@cupo
					END
				CLOSE v_cursor
				DEALLOCATE v_cursor
				
				DROP table #TEMP;
		END
	ELSE
		BEGIN 
			INSERT INTO TB_DISPONIBLE_USUARIO_SORTEO_ITEM
			([ID_USUARIO],[ID_SORTEO],[ID_ITEM],[CUPO_DISPONIBLE],[MONTO_DISPONIBLE],[ESTATUS])
			VALUES (@id_usuario,@id_sorteo,@id_item,@cupo_disponible,@monto_disponible,1);
		END
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarJuegosBuscador
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarJuegosBuscador]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarJuegosBuscador]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarJuegosBuscador](
	  @id_tipojuego int,
	  @nombre varchar(50),
	  @estatus int)
AS
BEGIN
	SELECT * FROM
	TB_JUEGO
	WHERE
    (@id_tipojuego IS NULL OR ID_TIPOJUEGO = @id_tipojuego) AND
    (@nombre IS NULL OR NOMBRE = @nombre) AND
    (@estatus IS NULL OR ESTATUS = @estatus)
	 AND ESTATUS <> 3;  
END
GO


-- ----------------------------
-- Procedure structure for sp_RegistrarResultadoSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RegistrarResultadoSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RegistrarResultadoSorteo]
GO

CREATE PROCEDURE [dbo].[sp_RegistrarResultadoSorteo](
	  @id_sorteo int,
	  @id_juego int,
	  @id_item int)
AS
BEGIN
	INSERT INTO [dbo].[TB_RESULTADO]
           ([ID_SORTEO]
           ,[ID_JUEGO]
           ,[ID_ITEM]
           ,[FECHA_HORA]
           ,[ESTATUS])
     VALUES
           (@id_sorteo,
           @id_juego,
           @id_item,
           GETDATE(),
           1);
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuariosBuscador
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuariosBuscador]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuariosBuscador]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuariosBuscador](
	@nombre varchar(50),
	@apellido  varchar(50),
	@usuario  varchar(50),
	@estatus int,
	@externo int,
	@id_usuariopadre int,
	@id_tipousuarioconsulta int)
AS
BEGIN
	/*DECLARE @nombre varchar(50)
	DECLARE @apellido  varchar(50)
	DECLARE @usuario  varchar(50)
	DECLARE @estatus int
	DECLARE @externo int
	DECLARE @id_usuariopadre int
	DECLARE @id_tipousuarioconsulta int
	
	SET @nombre = NULL
	SET @apellido = NULL
	SET @usuario = NULL 
	SET @estatus = NULL
	SET @externo = 1
	SET @id_usuariopadre = 2
	SET @id_tipousuarioconsulta = 2*/

	DECLARE @usuario_interno int 
	SET @usuario_interno = (SELECT COUNT(*) FROM TB_USUARIO A
	JOIN TB_TIPOUSUARIO B
	ON A.ID_TIPOUSUARIO = B.ID_TIPOUSUARIO
	WHERE A.ID_USUARIO = @id_usuariopadre
	AND (B.DESCRIPCION = 'Interno' OR B.DESCRIPCION = 'Administrador'));
	 
	IF(@usuario_interno <> 1)
		BEGIN
		 PRINT N'usuario externo'; 
			SELECT * FROM
				TB_USUARIO
				WHERE
				ID_USUARIOPADRE = @id_usuariopadre AND
				(@nombre IS NULL OR NOMBRE = @nombre) AND
				(@apellido IS NULL OR APELLIDO = @apellido) AND
				(@usuario IS NULL OR USUARIO = @usuario) AND
				(@estatus IS NULL OR ESTATUS = @estatus) AND
				ESTATUS <> 3 AND
				ID_TIPOUSUARIO = @id_tipousuarioconsulta;
		END
	ELSE
		BEGIN
		PRINT N'usuario Interno'; 
		IF (@externo = 1)
			BEGIN
				PRINT N'consultando externos'; 
				SELECT * FROM
				TB_USUARIO
				WHERE
				(@nombre IS NULL OR NOMBRE = @nombre) AND
				(@apellido IS NULL OR APELLIDO = @apellido) AND
				(@usuario IS NULL OR USUARIO = @usuario) AND
				(@estatus IS NULL OR ESTATUS = @estatus) AND
				 ESTATUS <> 3 AND ID_TIPOUSUARIO = @id_tipousuarioconsulta;
			 END 
		 ELSE
			 BEGIN
			 PRINT N'consultando internos'; 
				SELECT * FROM
					TB_USUARIO
				WHERE
				(@nombre IS NULL OR NOMBRE = @nombre) AND
				(@apellido IS NULL OR APELLIDO = @apellido) AND
				(@usuario IS NULL OR USUARIO = @usuario) AND
				(@estatus IS NULL OR ESTATUS = @estatus) AND
				 ESTATUS <> 3 AND ID_TIPOUSUARIO IN(SELECT ID_TIPOUSUARIO 
				 FROM TB_TIPOUSUARIO WHERE DESCRIPCION = 'Interno');
			 END
		END
END
GO


-- ----------------------------
-- Procedure structure for sp_ValidarBloqueo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ValidarBloqueo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ValidarBloqueo]
GO

CREATE PROCEDURE [dbo].[sp_ValidarBloqueo](
	  @id_usuario int,
	  @id_item int,
	  @id_sorteo int)
AS
BEGIN
	SELECT ID_USUARIOSORTEOITEM FROM TB_USUARIO_SORTEO_ITEM 
	WHERE ID_USUARIO = @id_usuario AND ID_ITEM = @id_item AND ID_SORTEO = @id_sorteo
	AND ESTATUS = 3;
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarUsuarioComision
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarUsuarioComision]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarUsuarioComision]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarUsuarioComision](
	  @id_usuario int,
	  @comisionventa decimal(18,2),
	  @comisionparticipacion decimal(18,2))
AS
BEGIN
	
	UPDATE [dbo].[TB_COMISION] SET
				[FECHAFIN] = GETDATE(),
				[ESTATUS] = 2
		 WHERE  ID_USUARIO = @id_usuario AND FECHAFIN IS NULL AND ESTATUS = 1;

	
	 INSERT INTO [dbo].[TB_COMISION]
           ([ID_USUARIO]
           ,[COMISIONVENTA]
		   ,[COMISIONPARTICIPACION]
           ,[FECHAINICIO]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @comisionventa,
           @comisionparticipacion,
           GETDATE(),
           1);
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuarioJuegoSorteoItems
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuarioJuegoSorteoItems]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuarioJuegoSorteoItems]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuarioJuegoSorteoItems](
	  @id_usuario int,
	  @id_juego int,
	  @id_sorteo int)
AS
BEGIN
	SELECT 
		D.ID_JUEGO,
		C.ID_SORTEO,
		E.ID_ITEM,
		C.HORA,
		E.VALOR,
		E.NOMBRE,
		E.CUPO,
		B.CUPO_MAX,
		B.CUPO_DISPONIBLE,
		B.MONTO_DISPONIBLE,
		E.MONTO,
		B.MONTO_MAX,
		B.ESTATUS
	FROM dbo.[TB_USUARIO] A
	JOIN dbo.[TB_USUARIO_SORTEO_ITEM] B
	ON A.ID_USUARIO = B.ID_USUARIO
	JOIN dbo.[TB_SORTEO] C
	ON B.ID_SORTEO = C.ID_SORTEO
	JOIN dbo.[TB_JUEGO] D
	ON C.ID_JUEGO = D.ID_JUEGO
	JOIN dbo.[TB_ITEM] E
	ON B.ID_ITEM = E.ID_ITEM
	WHERE A.ID_USUARIO = @id_usuario AND D.ID_JUEGO = @id_juego
	AND C.ID_SORTEO = @id_sorteo
	ORDER BY CONVERT(INT, E.VALOR);
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarUsuarioComision
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarUsuarioComision]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarUsuarioComision]
GO

CREATE PROCEDURE [dbo].[sp_InsertarUsuarioComision](
      @id_usuario int OUTPUT,
	  @comisionventa decimal,
	  @comisionparticipacion decimal)
AS
BEGIN
	
	INSERT INTO [dbo].[TB_COMISION]
           ([ID_USUARIO]
           ,[COMISIONVENTA]
		   ,[COMISIONPARTICIPACION]
           ,[FECHAINICIO]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @comisionventa,
           @comisionparticipacion,
           GETDATE(),
           1);
           
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuarioJuegoConjuntoItems
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuarioJuegoConjuntoItems]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuarioJuegoConjuntoItems]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuarioJuegoConjuntoItems](
	  @id_usuario int,
	  @id_juego int,
	  @id_conjunto int)
AS
BEGIN
	SELECT 
		B.ID_USUARIOJUEGOCONJUNTOITEM,
		B.ID_USUARIO,
		B.ID_JUEGO,
		B.ID_CONJUNTO,
		B.ID_ITEM,
		E.NOMBRE,
		E.VALOR,
		E.CUPO,
		B.CUPO_MAX,
		E.MONTO,
		B.MONTO_MAX,
		B.CUPO_DISPONIBLE,
		B.MONTO_DISPONIBLE,
		B.ESTATUS 
	FROM dbo.[TB_USUARIO] A
	JOIN dbo.[TB_USUARIO_JUEGO_CONJUNTO_ITEM] B
	ON A.ID_USUARIO = B.ID_USUARIO
	JOIN dbo.[TB_JUEGO] C
	ON B.ID_JUEGO = C.ID_JUEGO
	JOIN dbo.[TB_CONJUNTO] D
	ON B.ID_CONJUNTO = D.ID_CONJUNTO
	JOIN dbo.[TB_ITEM] E
	ON B.ID_ITEM = E.ID_ITEM
	WHERE A.ID_USUARIO = @id_usuario AND C.ID_JUEGO = @id_juego
	AND D.ID_CONJUNTO = @id_conjunto
	ORDER BY CONVERT(INT, E.VALOR);
END
GO


-- ----------------------------
-- Procedure structure for sp_ValidarDisponibleMonto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ValidarDisponibleMonto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ValidarDisponibleMonto]
GO

CREATE PROCEDURE [dbo].[sp_ValidarDisponibleMonto](
	  @id_usuario int,
	  @id_item int,
	  @id_sorteo int,
	  @monto money,
	  @resultado int OUTPUT)
AS
BEGIN
	DECLARE @monto_dispo money
	SET @resultado = 0;

	
	SET @monto_dispo = (SELECT MONTO_DISPONIBLE FROM TB_DISPONIBLE_USUARIO_SORTEO_ITEM 
	WHERE ID_USUARIO = @id_usuario AND ID_ITEM = @id_item AND ID_SORTEO = @id_sorteo);
	
	IF @monto_dispo = 0
		BEGIN 
			SET @resultado = 1; 
		END
	ELSE
		BEGIN
			IF @monto_dispo > 0
				BEGIN 
					IF @monto_dispo > @monto
						BEGIN
							print(@monto_dispo - @monto);
							UPDATE TB_DISPONIBLE_USUARIO_SORTEO_ITEM SET MONTO_DISPONIBLE  = (@monto_dispo - @monto)
							WHERE ID_USUARIO = @id_usuario AND ID_ITEM = @id_item AND ID_SORTEO = @id_sorteo;
							
							SET @resultado = 1; 
						END
				END
			ELSE
				BEGIN
					SET @resultado = 0;
				END
		END
	SELECT @resultado AS resultado;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarImpuesto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarImpuesto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarImpuesto]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarImpuesto](
	  @id_impuesto int)
AS
BEGIN
	SELECT 
		*
	FROM
	dbo.TB_IMPUESTO
	where ID_IMPUESTO = @id_impuesto;
END
GO


-- ----------------------------
-- Procedure structure for sp_ValidarDisponibleCupo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ValidarDisponibleCupo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ValidarDisponibleCupo]
GO

CREATE PROCEDURE [dbo].[sp_ValidarDisponibleCupo](
	  @id_usuario int,
	  @id_item int,
	  @id_sorteo int,
	  @resultado int OUTPUT)
AS
BEGIN
	DECLARE @cupo_dispo int
	SET @resultado = 0;
	
	SET @cupo_dispo = (SELECT CUPO_DISPONIBLE FROM TB_DISPONIBLE_USUARIO_SORTEO_ITEM 
	WHERE ID_USUARIO = @id_usuario AND ID_ITEM = @id_item AND ID_SORTEO = @id_sorteo);
	
	IF @cupo_dispo = 0
		BEGIN 
			SET @resultado = 1; 
		END
	ELSE
		BEGIN
			IF @cupo_dispo > 0
				BEGIN 
					IF @cupo_dispo = 1
						BEGIN
							UPDATE TB_DISPONIBLE_USUARIO_SORTEO_ITEM SET CUPO_DISPONIBLE  = -1
							WHERE ID_USUARIO = @id_usuario AND ID_ITEM = @id_item AND ID_SORTEO = @id_sorteo;
							
							SET @resultado = 1; 
						END
					ELSE
						BEGIN
							UPDATE TB_DISPONIBLE_USUARIO_SORTEO_ITEM SET CUPO_DISPONIBLE  = (@cupo_dispo - 1)
							WHERE ID_USUARIO = @id_usuario AND ID_ITEM = @id_item AND ID_SORTEO = @id_sorteo;
							
							SET @resultado = 1; 
						END
				END
			ELSE
				BEGIN
					SET @resultado = 0;
				END
		END
	SELECT @resultado AS resultado;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarImpuestosBuscador
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarImpuestosBuscador]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarImpuestosBuscador]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarImpuestosBuscador](
	  @nombre varchar(50),
	  @aplicasobre char(1), 
	  @estatus int)
	  
	  
AS
BEGIN
	SELECT * FROM
	TB_IMPUESTO
	WHERE
    (@nombre IS NULL OR NOMBRE = @nombre) AND
    (@aplicasobre IS NULL OR APLICASOBRE = @aplicasobre) AND
    (@estatus IS NULL OR ESTATUS = @estatus)
	 AND ESTATUS <> 3;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosTicket
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosTicket]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosTicket]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosTicket](
	@serial varchar(150))
AS
BEGIN
	SELECT A.ID_TICKET, A.SERIAL, A.FECHA_HORA, A.FECHA_HORA_PAGO, A.MONTO_PAGADO, SUM(B.MONTO_APUESTA) AS MONTO_APUESTA FROM
	TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE A.SERIAL = @serial
	GROUP BY A.ID_TICKET, A.SERIAL, A.FECHA_HORA, A.FECHA_HORA_PAGO, A.MONTO_PAGADO;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVentasTaquilla
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVentasTaquilla]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVentasTaquilla]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVentasTaquilla](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime
	
	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))

	SELECT 
		VENDIDOS.ID_USUARIO, 
		VENDIDOS.USUARIO,
		VENDIDOS.CANTIDAD_VENDIDOS, 
		VENDIDOS.TOTAL_VENDIDO, 
		VENDIDOS.TOTAL_COMISION,
		PAGADOS.CANTIDAD_PAGADOS, 
		PAGADOS.TOTAL_PAGADO, 
		GANADORES.CANTIDAD_GANADORES, 
		GANADORES.TOTAL_GANADORES,
		VENDIDOS.PORCENTAJE_COMISION,
		ELIMINADOS.CANTIDAD_ELIMINADOS, 
		ELIMINADOS.TOTAL_ELIMINADOS,
		VENDIDOS.PORCENTAJE_COMISION, 
		(VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) SALDO
	FROM
	(--VENDIDOS
	SELECT A.ID_USUARIO, 
		B.NOMBRE + ' ' + B.APELLIDO  AS USUARIO,
		COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, 
		SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
		SUM(MONTO_APUESTA * C.COMISIONVENTA/100) AS TOTAL_COMISION,
		C.COMISIONVENTA AS PORCENTAJE_COMISION
	FROM
	TB_TICKET A
	JOIN TB_USUARIO B
	ON A.ID_USUARIO = B.ID_USUARIO 
	JOIN TB_COMISION C
	ON A.ID_USUARIO = C.ID_USUARIO 
	AND ((A.FECHA_HORA >= C.FECHAINICIO) 
        AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
	WHERE A.ID_USUARIO = @id_usuario 
	AND FECHA_HORA BETWEEN @fechaD AND @fechaH 
	GROUP BY A.ID_USUARIO, B.NOMBRE, B.APELLIDO, C.COMISIONVENTA) VENDIDOS
	LEFT JOIN
	(--PAGADOS
	SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_PAGADO FROM
	TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	JOIN TB_JUEGO C
	ON B.ID_JUEGO = C.ID_JUEGO
	WHERE ID_USUARIO = @id_usuario 
	AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND B.ESTATUS = 4
	GROUP BY ID_USUARIO) PAGADOS
	ON VENDIDOS.ID_USUARIO = PAGADOS.ID_USUARIO
	LEFT JOIN 
	(--GANADORES
	SELECT A.ID_USUARIO, COUNT(B.ID_TICKET) AS CANTIDAD_GANADORES, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_GANADORES FROM
	TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	JOIN TB_JUEGO C
	ON B.ID_JUEGO = C.ID_JUEGO
	WHERE A.ID_USUARIO = @id_usuario 
	AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
	AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
	AND (B.ESTATUS = 5 OR B.ESTATUS = 4)
	GROUP BY A.ID_USUARIO) GANADORES
	ON VENDIDOS.ID_USUARIO = GANADORES.ID_USUARIO
	LEFT JOIN
	(--ELIMINADOS
	SELECT ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
	TB_TICKET
	WHERE ID_USUARIO = @id_usuario 
	AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND ESTATUS = 3
	GROUP BY ID_USUARIO) ELIMINADOS
	ON VENDIDOS.ID_USUARIO = ELIMINADOS.ID_USUARIO
				
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteTicketsTaquilla
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteTicketsTaquilla]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteTicketsTaquilla]
GO

CREATE PROCEDURE [dbo].[sp_ReporteTicketsTaquilla](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @estatus int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))

	SELECT
		A.ID_TICKET,
		A.FECHA_HORA,
		A.MONTO_APUESTA,
		CASE 
			 WHEN A.ESTATUS =  1 THEN 'Registrado'
			 WHEN A.ESTATUS =  3 THEN 'Eliminado'
			 WHEN A.ESTATUS =  4 THEN 'Pagado'
			 WHEN A.ESTATUS =  5 THEN 'Ganador'
			 ELSE '' 
		 END AS DESCRIPCION_ESTATUS,
		A.ESTATUS,
		B.ID_USUARIO AS TAQUILLA,
		B.NOMBRE AS NOMBRETAQUILLA,
		C.ID_USUARIO AS AGENCIA,		
		C.NOMBRE AS NOMBREAGENCIA 	 
	FROM
	TB_TICKET A
	JOIN TB_USUARIO B
	ON A.ID_USUARIO = B.ID_USUARIO
	JOIN TB_USUARIO C
	ON B.ID_USUARIOPADRE = C.ID_USUARIO
	WHERE A.ID_USUARIO = @id_usuario 
	AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
	AND (@estatus IS NULL OR A.ESTATUS = @estatus)		
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarJuegoxNombre
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarJuegoxNombre]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarJuegoxNombre]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarJuegoxNombre](
	  @nombre varchar(50))
AS
BEGIN
	SELECT * FROM
	TB_JUEGO 
	WHERE NOMBRE = @nombre AND ESTATUS = 1;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVentasAgencia
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVentasAgencia]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVentasAgencia]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVentasAgencia](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime
	
	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))
	
	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT 
			VENDIDOS.ID_USUARIO, 
			VENDIDOS.NOMBRE + ' ' + VENDIDOS.APELLIDO AS USUARIO, 
			VENDIDOS.CANTIDAD_VENDIDOS, 
			VENDIDOS.TOTAL_VENDIDO, 
			VENDIDOS.TOTAL_COMISION,
			PAGADOS.CANTIDAD_PAGADOS, 
			PAGADOS.TOTAL_PAGADO, 
			GANADORES.CANTIDAD_GANADORES, 
			GANADORES.TOTAL_GANADORES,
			ELIMINADOS.CANTIDAD_ELIMINADOS, 
			ELIMINADOS.TOTAL_ELIMINADOS,
			VENDIDOS.PORCENTAJE_COMISION, 
			(VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) AS SALDO
		FROM
		(--VENDIDOS
		SELECT A.ID_USUARIO,
			 B.USUARIO, 
			 B.NOMBRE,
			 B.APELLIDO,
			 COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, 
			 SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
			 SUM(MONTO_APUESTA * C.COMISIONVENTA)/100 AS TOTAL_COMISION,
			 C.COMISIONVENTA AS PORCENTAJE_COMISION
		 FROM
		TB_TICKET A
		JOIN TB_USUARIO B -- taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D -- agencia
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E
		ON D.ID_USUARIO = E.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO 
							   WHERE ID_USUARIOPADRE = D.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND D.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO, B.USUARIO, B.NOMBRE, B.APELLIDO, E.COMISIONVENTA, C.COMISIONVENTA) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(D.MONTO_APUESTA * E.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_USUARIO B -- taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C -- agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_JUGADA D
		ON A.ID_TICKET = D.ID_TICKET
		JOIN TB_JUEGO E
		ON D.ID_JUEGO = E.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND D.ESTATUS = 4 AND C.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_USUARIO = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(D.ID_TICKET) AS CANTIDAD_GANADORES, SUM(D.MONTO_APUESTA * E.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_USUARIO B -- taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C -- agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_JUGADA D
		ON A.ID_TICKET = D.ID_TICKET
		JOIN TB_JUEGO E
		ON D.ID_JUEGO = E.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO)
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (D.ESTATUS = 5 OR D.ESTATUS = 4) AND C.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_USUARIO = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT A.ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET A
		JOIN TB_USUARIO B -- taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C -- agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND A.ESTATUS = 3 AND C.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_USUARIO = ELIMINADOS.ID_USUARIO
	END
	ELSE
	BEGIN
		SELECT VENDIDOS.ID_USUARIO, VENDIDOS.USUARIO, VENDIDOS.CANTIDAD_VENDIDOS, VENDIDOS.TOTAL_VENDIDO, VENDIDOS.TOTAL_COMISION,
		PAGADOS.CANTIDAD_PAGADOS, PAGADOS.TOTAL_PAGADO, GANADORES.CANTIDAD_GANADORES, GANADORES.TOTAL_GANADORES,
		ELIMINADOS.CANTIDAD_ELIMINADOS, ELIMINADOS.TOTAL_ELIMINADOS, (VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) SALDO
		FROM
		(--VENDIDOS
		SELECT A.ID_USUARIO, B.USUARIO, COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
		SUM(MONTO_APUESTA * (E.COMISIONVENTA - C.COMISIONVENTA)/100) AS TOTAL_COMISION FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E
		ON D.ID_USUARIO = E.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		WHERE A.ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH 
		GROUP BY A.ID_USUARIO, B.USUARIO) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND B.ESTATUS = 4
		GROUP BY ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_USUARIO = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(B.ID_TICKET) AS CANTIDAD_GANADORES, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE A.ID_USUARIO = @id_usuarioconsulta
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (B.ESTATUS = 5 OR B.ESTATUS = 4)
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_USUARIO = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND ESTATUS = 3
		GROUP BY ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_USUARIO = ELIMINADOS.ID_USUARIO
	END			
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteTicketsAgencia
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteTicketsAgencia]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteTicketsAgencia]
GO

CREATE PROCEDURE [dbo].[sp_ReporteTicketsAgencia](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int,
	  @estatus int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))

	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT
			A.ID_TICKET,
			A.FECHA_HORA,
			A.MONTO_APUESTA,
			CASE 
				 WHEN A.ESTATUS =  1 THEN 'Registrado'
				 WHEN A.ESTATUS =  3 THEN 'Eliminado'
				 WHEN A.ESTATUS =  4 THEN 'Pagado'
				 WHEN A.ESTATUS =  5 THEN 'Ganador'
				 ELSE '' 
			 END AS DESCRIPCION_ESTATUS,
	    A.ESTATUS,
		B.ID_USUARIO AS TAQUILLA,
		B.NOMBRE AS NOMBRETAQUILLA,
		C.ID_USUARIO AS AGENCIA,		
		C.NOMBRE AS NOMBREAGENCIA 	 
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_USUARIO C
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = @id_usuario) 
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (@estatus IS NULL OR A.ESTATUS = @estatus)	
	END	
	ELSE
	BEGIN
		SELECT
			A.ID_TICKET,
			A.FECHA_HORA,
			A.MONTO_APUESTA,
			CASE 
				 WHEN A.ESTATUS =  1 THEN 'Registrado'
				 WHEN A.ESTATUS =  3 THEN 'Eliminado'
				 WHEN A.ESTATUS =  4 THEN 'Pagado'
				 WHEN A.ESTATUS =  5 THEN 'Ganador'
				 ELSE '' 
			 END AS DESCRIPCION_ESTATUS,
			A.ESTATUS,
			B.ID_USUARIO AS TAQUILLA,
			B.NOMBRE AS NOMBRETAQUILLA,
			C.ID_USUARIO AS AGENCIA,		
			C.NOMBRE AS NOMBREAGENCIA 	  
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_USUARIO C
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		WHERE A.ID_USUARIO = @id_usuarioconsulta
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (@estatus IS NULL OR A.ESTATUS = @estatus)	
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarComisionesHijosUsuarioPadre
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarComisionesHijosUsuarioPadre]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarComisionesHijosUsuarioPadre]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarComisionesHijosUsuarioPadre](
	  @id_usuariopadre int,
	  @id_tipousarioconsulta int)
AS
BEGIN
	;WITH arbol_hijos AS 
	(
	   SELECT A.ID_USUARIO, A.ID_USUARIOPADRE, C.ID_TIPOUSUARIO, D.COMISIONVENTA, D.COMISIONPARTICIPACION, D.FECHAINICIO, D.FECHAFIN
	   FROM TB_USUARIO A
	   JOIN TB_TIPOUSUARIO C
	   ON A.ID_TIPOUSUARIO = C.ID_TIPOUSUARIO
	   JOIN TB_COMISION D
	   ON A.ID_USUARIO = D.ID_USUARIO
	   WHERE A.ID_USUARIO = @id_usuariopadre AND A.ESTATUS <> 3
	   UNION ALL
	   SELECT E.ID_USUARIO, E.ID_USUARIOPADRE, G.ID_TIPOUSUARIO, H.COMISIONVENTA, H.COMISIONPARTICIPACION, H.FECHAINICIO, H.FECHAFIN
	   FROM TB_USUARIO E
	   JOIN TB_DOMINIO F
	   ON E.ID_DOMINIO = F.ID_DOMINIO
	   JOIN TB_TIPOUSUARIO G
	   ON E.ID_TIPOUSUARIO = G.ID_TIPOUSUARIO
	   JOIN TB_COMISION H
	   ON E.ID_USUARIO = H.ID_USUARIO
	   JOIN arbol_hijos ar 
	   ON E.ID_USUARIOPADRE = ar.ID_USUARIO  
	   AND E.ID_USUARIO <> E.ID_USUARIOPADRE AND E.ESTATUS <> 3
	)	

	SELECT * INTO #TEMP FROM arbol_hijos WHERE ID_USUARIO <> @id_usuariopadre AND
	ID_TIPOUSUARIO = @id_tipousarioconsulta
	OPTION (MAXRECURSION 0)
	
	SELECT * FROM #TEMP

	DROP table #TEMP
END
GO


-- ----------------------------
-- Procedure structure for GetEntityClass
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[GetEntityClass]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[GetEntityClass]
GO

CREATE PROCEDURE [dbo].[GetEntityClass]( 
@TableName SYSNAME 
)
AS
BEGIN

    DECLARE @Result VARCHAR(MAX) = 'public class ' + @TableName + '
    {'

    SELECT @Result = @Result + '
        public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; }
    '
    FROM
    (
        SELECT 
            REPLACE(col.name, ' ', '_') ColumnName,
            column_id ColumnId,
            CASE typ.name 
                WHEN 'bigint' THEN 'long'
                WHEN 'binary' THEN 'byte[]'
                WHEN 'bit' THEN 'bool'
                WHEN 'char' THEN 'string'
                WHEN 'date' THEN 'DateTime'
                WHEN 'datetime' THEN 'DateTime'
                WHEN 'datetime2' THEN 'DateTime'
                WHEN 'datetimeoffset' THEN 'DateTimeOffset'
                WHEN 'decimal' THEN 'decimal'
                WHEN 'float' THEN 'float'
                WHEN 'image' THEN 'byte[]'
                WHEN 'int' THEN 'int'
                WHEN 'money' THEN 'decimal'
                WHEN 'nchar' THEN 'char'
                WHEN 'ntext' THEN 'string'
                WHEN 'numeric' THEN 'decimal'
                WHEN 'nvarchar' THEN 'string'
                WHEN 'real' THEN 'double'
                WHEN 'smalldatetime' THEN 'DateTime'
                WHEN 'smallint' THEN 'short'
                WHEN 'smallmoney' THEN 'decimal'
                WHEN 'text' THEN 'string'
                WHEN 'time' THEN 'TimeSpan'
                WHEN 'timestamp' THEN 'DateTime'
                WHEN 'tinyint' THEN 'byte'
                WHEN 'uniqueidentifier' THEN 'Guid'
                WHEN 'varbinary' THEN 'byte[]'
                WHEN 'varchar' THEN 'string'
                ELSE 'UNKNOWN_' + typ.name
            END ColumnType,
            CASE 
                WHEN col.is_nullable = 1 and typ.name in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier') 
                THEN '?' 
                ELSE '' 
            END NullableSign
        FROM sys.columns col
            join sys.types typ ON
                col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id
        WHERE OBJECT_ID = OBJECT_ID(@TableName)
    ) t
    ORDER BY ColumnId

    SET @Result = @Result  + '
    }'

PRINT @Result
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVentasComercializadora
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVentasComercializadora]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVentasComercializadora]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVentasComercializadora](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime
	
	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))
	
	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT 
			VENDIDOS.ID_AGENCIA AS ID_USUARIO, 
			VENDIDOS.NOMBRE + ' ' + VENDIDOS.APELLIDO AS USUARIO, 
			SUM(VENDIDOS.CANTIDAD_VENDIDOS) AS CANTIDAD_VENDIDOS, 
			SUM(VENDIDOS.TOTAL_VENDIDO) AS TOTAL_VENDIDO, 
			SUM(VENDIDOS.TOTAL_COMISION) AS TOTAL_COMISION,
			SUM(PAGADOS.CANTIDAD_PAGADOS) AS CANTIDAD_PAGADOS, 
			SUM(PAGADOS.TOTAL_PAGADO) AS TOTAL_PAGADO, 
			SUM(GANADORES.CANTIDAD_GANADORES) AS CANTIDAD_GANADORES, 
			SUM(GANADORES.TOTAL_GANADORES) AS TOTAL_GANADORES,
			SUM(ELIMINADOS.CANTIDAD_ELIMINADOS) AS CANTIDAD_ELIMINADOS, 
			SUM(ELIMINADOS.TOTAL_ELIMINADOS) AS TOTAL_ELIMINADOS, 
			VENDIDOS.PORCENTAJE_COMISION AS PORCENTAJE_COMISION,
			SUM(VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) AS SALDO
		FROM
		(--VENDIDOS
		SELECT A.ID_USUARIO ID_TAQUILLA, 
			B.USUARIO AS TAQUILLA, 
			D.USUARIO AS AGENCIA,
			D.NOMBRE, D.APELLIDO,
			D.ID_USUARIO AS ID_AGENCIA,
			COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, 
			SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
			SUM(MONTO_APUESTA * E.COMISIONVENTA)/100 AS TOTAL_COMISION,
		    E.COMISIONVENTA AS PORCENTAJE_COMISION
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C 
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D --agencia
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E 
		ON D.ID_USUARIO = E.ID_USUARIO 
		JOIN TB_USUARIO F  -- comercializadora
		ON D.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_COMISION G 
		ON F.ID_USUARIO = G.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= G.FECHAINICIO) 
			AND (A.FECHA_HORA < G.FECHAFIN OR G.FECHAFIN IS NULL))
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = D.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND F.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO, B.USUARIO, D.USUARIO, D.ID_USUARIO, D.NOMBRE, D.APELLIDO, G.COMISIONVENTA, E.COMISIONVENTA) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(E.MONTO_APUESTA * F.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_JUGADA E
		ON A.ID_TICKET = E.ID_TICKET
		JOIN TB_JUEGO F
		ON E.ID_JUEGO = F.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND E.ESTATUS = 4 AND D.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_TAQUILLA = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(E.ID_TICKET) AS CANTIDAD_GANADORES, SUM(E.MONTO_APUESTA * F.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_JUGADA E
		ON A.ID_TICKET = E.ID_TICKET
		JOIN TB_JUEGO F
		ON E.ID_JUEGO = F.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO)
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (E.ESTATUS = 5 OR E.ESTATUS = 4) AND D.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_TAQUILLA = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT A.ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND A.ESTATUS = 3 AND D.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_TAQUILLA = ELIMINADOS.ID_USUARIO
		GROUP BY VENDIDOS.ID_AGENCIA, VENDIDOS.AGENCIA, VENDIDOS.NOMBRE, VENDIDOS.APELLIDO, VENDIDOS.PORCENTAJE_COMISION
	END
	ELSE
	BEGIN
		SELECT VENDIDOS.ID_USUARIO, VENDIDOS.USUARIO, VENDIDOS.CANTIDAD_VENDIDOS, VENDIDOS.TOTAL_VENDIDO, VENDIDOS.TOTAL_COMISION,
		PAGADOS.CANTIDAD_PAGADOS, PAGADOS.TOTAL_PAGADO, GANADORES.CANTIDAD_GANADORES, GANADORES.TOTAL_GANADORES,
		ELIMINADOS.CANTIDAD_ELIMINADOS, ELIMINADOS.TOTAL_ELIMINADOS, (VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) SALDO
		FROM
		(--VENDIDOS
		SELECT A.ID_USUARIO, B.USUARIO, COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
		SUM(MONTO_APUESTA * ((E.COMISIONVENTA - C.COMISIONVENTA)/100)*((G.COMISIONVENTA - E.COMISIONVENTA)/100)) AS TOTAL_COMISION FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C --taquilla
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E --agencia
		ON D.ID_USUARIO = E.ID_USUARIO 
		JOIN TB_USUARIO F
		ON D.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_COMISION G  -- comercializadora
		ON F.ID_USUARIO = G.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= G.FECHAINICIO) 
			AND (A.FECHA_HORA < G.FECHAFIN OR G.FECHAFIN IS NULL))
		WHERE D.ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH 
		GROUP BY A.ID_USUARIO, B.USUARIO) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND B.ESTATUS = 4
		GROUP BY ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_USUARIO = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(B.ID_TICKET) AS CANTIDAD_GANADORES, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE A.ID_USUARIO = @id_usuarioconsulta
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (B.ESTATUS = 5 OR B.ESTATUS = 4)
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_USUARIO = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND ESTATUS = 3
		GROUP BY ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_USUARIO = ELIMINADOS.ID_USUARIO
	END			
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarUsuarioSorteoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarUsuarioSorteoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarUsuarioSorteoItem]
GO

CREATE PROCEDURE [dbo].[sp_InsertarUsuarioSorteoItem](
       @id_usuario int,
       @id_sorteo int,
       @id_item int,
       @cupo_max int,
       @monto_max money,
       @cupo_disponible int,
       @monto_disponible money/*,
       @id_usuariopadre int*/)
AS
BEGIN
	INSERT INTO [dbo].[TB_USUARIO_SORTEO_ITEM]
           ([ID_USUARIO]
           ,[ID_SORTEO]
           ,[ID_ITEM]
           ,[CUPO_MAX]
           ,[MONTO_MAX]
           ,[CUPO_DISPONIBLE]
           ,[MONTO_DISPONIBLE]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @id_sorteo,
           @id_item,
           @cupo_max,
           @monto_max,
           @cupo_disponible,
           @monto_disponible,
           1);
        
	/*EXEC [dbo].[sp_ActualizarDisponibilidadPadreSorteoItem]
	 @id_sorteo = @id_sorteo
	,@id_item = @id_item
	,@id_usuariopadre = @id_usuariopadre
	,@monto_disponible = @monto_disponible
	,@cupo_disponible = @cupo_disponible; */
	 
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVentasGrupo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVentasGrupo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVentasGrupo]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVentasGrupo](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime
	
	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))

	
	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT
		VENDIDOS.ID_COMERCIALIZADORA AS ID_USUARIO,
		VENDIDOS.NOMBRE + ' ' + VENDIDOS.APELLIDO AS USUARIO,
		SUM(VENDIDOS.CANTIDAD_VENDIDOS) AS CANTIDAD_VENDIDOS, 
		SUM(VENDIDOS.TOTAL_VENDIDO) AS TOTAL_VENDIDO,	 
		SUM(VENDIDOS.TOTAL_COMISION) AS TOTAL_COMISION, 
		--SUM(VENDIDOS.TOTAL_PARTICIPACION) AS TOTAL_PARTICIPACION,
		(VENDIDOS.TOTAL_VENDIDO - VENDIDOS.TOTAL_COMISION - GANADORES.TOTAL_GANADORES)* (VENDIDOS.PORCENTAJE_PARTICIPACION/100) AS TOTAL_PARTICIPACION,
		SUM(PAGADOS.CANTIDAD_PAGADOS) AS CANTIDAD_PAGADOS, 
		SUM(PAGADOS.TOTAL_PAGADO) AS TOTAL_PAGADO, 
		SUM(GANADORES.CANTIDAD_GANADORES)AS CANTIDAD_GANADORES, 
		SUM(GANADORES.TOTAL_GANADORES) AS TOTAL_GANADORES,
		SUM(ELIMINADOS.CANTIDAD_ELIMINADOS) AS CANTIDAD_ELIMINADOS, 
		SUM(ELIMINADOS.TOTAL_ELIMINADOS) AS TOTAL_ELIMINADOS, 
		SUM(VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) AS SALDO,
		VENDIDOS.PORCENTAJE_PARTICIPACION AS PORCENTAJE_PARTICIPACION,
		VENDIDOS.PORCENTAJE_COMISION AS PORCENTAJE_COMISION
		FROM
		(--VENDIDOS
		SELECT 
			A.ID_USUARIO ID_TAQUILLA, 
			B.USUARIO AS TAQUILLA, 
			D.USUARIO AS AGENCIA, 
			D.ID_USUARIO AS ID_AGENCIA, 
			F.USUARIO AS COMERCIALIZADORA, 
			F.ID_USUARIO AS ID_COMERCIALIZADORA,  
			F.NOMBRE,
			F.APELLIDO,
			COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, 
			SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
			/*SUM(MONTO_APUESTA * (((I.COMISIONVENTA - G.COMISIONVENTA)/100)*(E.COMISIONVENTA - C.COMISIONVENTA)/100)*((G.COMISIONVENTA - E.COMISIONVENTA)/100)) AS TOTAL_COMISION,
			SUM(MONTO_APUESTA * (((I.COMISIONVENTA - G.COMISIONVENTA)/100)*(E.COMISIONVENTA - C.COMISIONVENTA)/100)*((G.COMISIONVENTA - E.COMISIONVENTA)/100)) * (SUM(I.COMISIONPARTICIPACION)/100) AS TOTAL_PARTICIPACION,*/
			SUM(MONTO_APUESTA * G.COMISIONVENTA)/100 AS TOTAL_COMISION,
			G.COMISIONPARTICIPACION AS PORCENTAJE_PARTICIPACION,
			G.COMISIONVENTA PORCENTAJE_COMISION
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C 
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D --agencia
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E 
		ON D.ID_USUARIO = E.ID_USUARIO 
		JOIN TB_USUARIO F  -- comercializadora
		ON D.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_COMISION G 
		ON F.ID_USUARIO = G.ID_USUARIO 	
		JOIN TB_USUARIO H  -- grupo
		ON F.ID_USUARIOPADRE = H.ID_USUARIO
		JOIN TB_COMISION I 
		ON H.ID_USUARIO = I.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= G.FECHAINICIO) 
			AND (A.FECHA_HORA < G.FECHAFIN OR G.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= I.FECHAINICIO) 
			AND (A.FECHA_HORA < I.FECHAFIN OR I.FECHAFIN IS NULL))
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = D.ID_USUARIO) 
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH AND H.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO, B.USUARIO, D.USUARIO, D.ID_USUARIO, F.USUARIO, F.ID_USUARIO, F.NOMBRE, F.APELLIDO,
		I.COMISIONPARTICIPACION, G.COMISIONVENTA,I.COMISIONVENTA, G.COMISIONPARTICIPACION) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(F.MONTO_APUESTA * G.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_JUGADA F
		ON A.ID_TICKET = F.ID_TICKET
		JOIN TB_JUEGO G
		ON F.ID_JUEGO = G.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH AND F.ESTATUS = 4 AND E.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_TAQUILLA = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_GANADORES, SUM(F.MONTO_APUESTA * G.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_JUGADA F
		ON A.ID_TICKET = F.ID_TICKET
		JOIN TB_JUEGO G
		ON F.ID_JUEGO = G.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO)
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH
		AND (F.ESTATUS = 5 OR F.ESTATUS = 4) AND E.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_TAQUILLA = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT A.ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH AND A.ESTATUS = 3 AND E.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_TAQUILLA = ELIMINADOS.ID_USUARIO
		GROUP BY VENDIDOS.ID_COMERCIALIZADORA, VENDIDOS.COMERCIALIZADORA, VENDIDOS.APELLIDO, VENDIDOS.NOMBRE,
		VENDIDOS.PORCENTAJE_PARTICIPACION, VENDIDOS.PORCENTAJE_COMISION, VENDIDOS.TOTAL_VENDIDO, VENDIDOS.TOTAL_COMISION,
		GANADORES.TOTAL_GANADORES
	END
	ELSE
	BEGIN
		SELECT 
			VENDIDOS.ID_USUARIO, 
			VENDIDOS.USUARIO, 
			VENDIDOS.CANTIDAD_VENDIDOS, 
			VENDIDOS.TOTAL_VENDIDO, 
			VENDIDOS.TOTAL_COMISION, 
			VENDIDOS.TOTAL_PARTICIPACION,
			PAGADOS.CANTIDAD_PAGADOS, 
			PAGADOS.TOTAL_PAGADO, 
			GANADORES.CANTIDAD_GANADORES, 
			GANADORES.TOTAL_GANADORES,
			ELIMINADOS.CANTIDAD_ELIMINADOS, 
			ELIMINADOS.TOTAL_ELIMINADOS, 
			(VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) SALDO
		FROM
		(--VENDIDOS
		SELECT A.ID_USUARIO, B.USUARIO, COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
		SUM(MONTO_APUESTA * (((I.COMISIONVENTA - G.COMISIONVENTA)/100)*(E.COMISIONVENTA - C.COMISIONVENTA)/100)*((G.COMISIONVENTA - E.COMISIONVENTA)/100)) AS TOTAL_COMISION, 
		SUM(MONTO_APUESTA * (((I.COMISIONVENTA - G.COMISIONVENTA)/100)*(E.COMISIONVENTA - C.COMISIONVENTA)/100)*((G.COMISIONVENTA - E.COMISIONVENTA)/100)) * (SUM(I.COMISIONPARTICIPACION)/100) AS TOTAL_PARTICIPACION FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C --taquilla
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E --agencia
		ON D.ID_USUARIO = E.ID_USUARIO 
		JOIN TB_USUARIO F
		ON D.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_COMISION G  -- comercializadora
		ON F.ID_USUARIO = G.ID_USUARIO 	
		JOIN TB_USUARIO H
		ON F.ID_USUARIOPADRE = H.ID_USUARIO
		JOIN TB_COMISION I  -- grupo
		ON H.ID_USUARIO = I.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= G.FECHAINICIO) 
			AND (A.FECHA_HORA < G.FECHAFIN OR G.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= I.FECHAINICIO) 
			AND (A.FECHA_HORA < I.FECHAFIN OR I.FECHAFIN IS NULL))
		WHERE D.ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH 
		GROUP BY A.ID_USUARIO, B.USUARIO) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND B.ESTATUS = 4
		GROUP BY ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_USUARIO = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(B.ID_TICKET) AS CANTIDAD_GANADORES, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE A.ID_USUARIO = @id_usuarioconsulta
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (B.ESTATUS = 5 OR B.ESTATUS = 4)
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_USUARIO = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND ESTATUS = 3
		GROUP BY ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_USUARIO = ELIMINADOS.ID_USUARIO
	END			
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarUsuario]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarUsuario]
GO

CREATE PROCEDURE [dbo].[sp_InsertarUsuario](
      @id_usuario int OUTPUT,
      @id_dominio int,
      @id_tipousuario int,
      @id_usuariopadre int,
      @nombre varchar(50),
      @apellido varchar(50),
      @numeroidentificacion varchar(50),
      @correoelectronico varchar(250),
	  @caducidad int,
      @usuario varchar(50),
	  @clave varchar(1000))
AS
BEGIN
	if @id_tipousuario <> 2
		SET @id_dominio = (select id_dominio from TB_USUARIO where ID_USUARIO = @id_usuariopadre);
	
	
	INSERT INTO [dbo].[TB_USUARIO]
           ([ID_DOMINIO]
           ,[ID_TIPOUSUARIO]
           ,[ID_USUARIOPADRE]
           ,[NOMBRE]
           ,[APELLIDO]
           ,[NUMEROIDENTIFICACION]
           ,[USUARIO]
           ,[CORREOELECTRONICO]
		   ,[CADUCIDAD]
           ,[ESTATUS]
		   ,[CLAVE])
     VALUES
           (@ID_DOMINIO,
           @id_tipousuario,
           @id_usuariopadre,
           @nombre,
           @apellido,
           @numeroidentificacion,
           @usuario,
           @correoelectronico,
		   @caducidad,
           1,
		   @clave);
           
     SELECT  @id_usuario = @@IDENTITY ;
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVentasDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVentasDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVentasDominio]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVentasDominio](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime
	
	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))
	
	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT VENDIDOS.ID_GRUPO AS ID_USUARIO, 
		VENDIDOS.NOMBRE + ' ' + VENDIDOS.APELLIDO AS USUARIO,
		SUM(VENDIDOS.CANTIDAD_VENDIDOS) AS CANTIDAD_VENDIDOS, 
		SUM(VENDIDOS.TOTAL_VENDIDO) AS TOTAL_VENDIDO, 
		SUM(VENDIDOS.TOTAL_COMISION) AS TOTAL_COMISION, 
		--SUM(VENDIDOS.TOTAL_PARTICIPACION) AS TOTAL_PARTICIPACION,
		(VENDIDOS.TOTAL_VENDIDO - VENDIDOS.TOTAL_COMISION - GANADORES.TOTAL_GANADORES)* (VENDIDOS.PORCENTAJE_PARTICIPACION/100) AS TOTAL_PARTICIPACION,
		SUM(PAGADOS.CANTIDAD_PAGADOS) AS CANTIDAD_PAGADOS, 
		SUM(PAGADOS.TOTAL_PAGADO) AS TOTAL_PAGADO, 
		SUM(GANADORES.CANTIDAD_GANADORES) AS CANTIDAD_GANADORES, 
		SUM(GANADORES.TOTAL_GANADORES) AS TOTAL_GANADORES,
		SUM(ELIMINADOS.CANTIDAD_ELIMINADOS) AS CANTIDAD_ELIMINADOS, 
		SUM(ELIMINADOS.TOTAL_ELIMINADOS) AS TOTAL_ELIMINADOS, 
		SUM(VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION - 
		((VENDIDOS.TOTAL_VENDIDO - VENDIDOS.TOTAL_COMISION - GANADORES.TOTAL_GANADORES)* (VENDIDOS.PORCENTAJE_PARTICIPACION/100))) AS SALDO,
	    VENDIDOS.PORCENTAJE_PARTICIPACION AS PORCENTAJE_PARTICIPACION,
		VENDIDOS.PORCENTAJE_COMISION PORCENTAJE_COMISION
		FROM
		(--VENDIDOS
		SELECT 
		A.ID_USUARIO ID_TAQUILLA, 
		B.USUARIO AS TAQUILLA, 
		D.USUARIO AS AGENCIA, 
		D.ID_USUARIO AS ID_AGENCIA, 
		F.USUARIO AS COMERCIALIZADORA, 
		F.ID_USUARIO AS ID_COMERCIALIZADORA,
		H.USUARIO AS GRUPO, 
		H.ID_USUARIO AS ID_GRUPO,
		H.NOMBRE,
		H.APELLIDO,
		COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
		/*SUM(MONTO_APUESTA * (
		((K.COMISIONVENTA - I.COMISIONVENTA)/100)*
		((I.COMISIONVENTA - G.COMISIONVENTA)/100)*
		((G.COMISIONVENTA - E.COMISIONVENTA)/100)*
		((E.COMISIONVENTA - C.COMISIONVENTA)/100))) AS TOTAL_COMISION,*/
		SUM(MONTO_APUESTA * I.COMISIONVENTA)/100 AS TOTAL_COMISION,
		/*SUM(MONTO_APUESTA * (
		((K.COMISIONVENTA - I.COMISIONVENTA)/100)*
		((I.COMISIONVENTA - G.COMISIONVENTA)/100)*
		((G.COMISIONVENTA - E.COMISIONVENTA)/100)*
		((E.COMISIONVENTA - C.COMISIONVENTA)/100))) * (SUM((K.COMISIONPARTICIPACION - I.COMISIONPARTICIPACION)/100)) AS TOTAL_PARTICIPACION,*/
		I.COMISIONPARTICIPACION AS PORCENTAJE_PARTICIPACION,
		I.COMISIONVENTA PORCENTAJE_COMISION
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C --taquilla
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E --agencia
		ON D.ID_USUARIO = E.ID_USUARIO 
		JOIN TB_USUARIO F
		ON D.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_COMISION G  -- comercializadora
		ON F.ID_USUARIO = G.ID_USUARIO 	
		JOIN TB_USUARIO H
		ON F.ID_USUARIOPADRE = H.ID_USUARIO
		JOIN TB_COMISION I  -- grupo
		ON H.ID_USUARIO = I.ID_USUARIO 
		JOIN TB_USUARIO J
		ON H.ID_USUARIOPADRE = J.ID_USUARIO
		JOIN TB_COMISION K  -- dominio
		ON J.ID_USUARIO = K.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= G.FECHAINICIO) 
			AND (A.FECHA_HORA < G.FECHAFIN OR G.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= I.FECHAINICIO) 
			AND (A.FECHA_HORA < I.FECHAFIN OR I.FECHAFIN IS NULL))
        AND ((A.FECHA_HORA >= K.FECHAINICIO) 
			AND (A.FECHA_HORA < K.FECHAFIN OR K.FECHAFIN IS NULL))
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = D.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND J.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO, B.USUARIO, D.USUARIO, D.ID_USUARIO, F.USUARIO, F.ID_USUARIO,
		H.USUARIO, H.ID_USUARIO, H.NOMBRE, H.APELLIDO, K.COMISIONPARTICIPACION ,I.COMISIONPARTICIPACION,
		I.COMISIONVENTA, K.COMISIONVENTA) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(G.MONTO_APUESTA * H.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_USUARIO F  -- dominio
		ON E.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_JUGADA G
		ON A.ID_TICKET = G.ID_TICKET
		JOIN TB_JUEGO H
		ON G.ID_JUEGO = H.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND G.ESTATUS = 4 AND F.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_TAQUILLA = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(G.ID_TICKET) AS CANTIDAD_GANADORES, SUM(G.MONTO_APUESTA * H.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_USUARIO F  -- dominio
		ON E.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_JUGADA G
		ON A.ID_TICKET = G.ID_TICKET
		JOIN TB_JUEGO H
		ON G.ID_JUEGO = H.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO)
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (G.ESTATUS = 5 OR G.ESTATUS = 4) AND F.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_TAQUILLA = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(G.MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_USUARIO F  -- dominio
		ON E.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_JUGADA G
		ON A.ID_TICKET = G.ID_TICKET
		JOIN TB_JUEGO H
		ON G.ID_JUEGO = H.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND A.ESTATUS = 3 AND F.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_TAQUILLA = ELIMINADOS.ID_USUARIO
		GROUP BY VENDIDOS.ID_GRUPO, VENDIDOS.GRUPO, VENDIDOS.NOMBRE, VENDIDOS.APELLIDO,
		VENDIDOS.PORCENTAJE_PARTICIPACION, VENDIDOS.PORCENTAJE_COMISION,VENDIDOS.TOTAL_COMISION, VENDIDOS.TOTAL_VENDIDO, GANADORES.TOTAL_GANADORES
	END
	ELSE
	BEGIN
		SELECT VENDIDOS.ID_USUARIO, VENDIDOS.USUARIO, VENDIDOS.CANTIDAD_VENDIDOS, VENDIDOS.TOTAL_VENDIDO, VENDIDOS.TOTAL_COMISION, VENDIDOS.TOTAL_PARTICIPACION,
		PAGADOS.CANTIDAD_PAGADOS, PAGADOS.TOTAL_PAGADO, GANADORES.CANTIDAD_GANADORES, GANADORES.TOTAL_GANADORES,
		ELIMINADOS.CANTIDAD_ELIMINADOS, ELIMINADOS.TOTAL_ELIMINADOS, (VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) SALDO
		FROM
		(--VENDIDOS
		SELECT A.ID_USUARIO, B.USUARIO, COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
		SUM(MONTO_APUESTA * (
		((K.COMISIONVENTA - I.COMISIONVENTA)/100)*
		((I.COMISIONVENTA - G.COMISIONVENTA)/100)*
		((G.COMISIONVENTA - E.COMISIONVENTA)/100)*
		((E.COMISIONVENTA - C.COMISIONVENTA)/100))) AS TOTAL_COMISION,
			SUM(MONTO_APUESTA * (
		((K.COMISIONVENTA - I.COMISIONVENTA)/100)*
		((I.COMISIONVENTA - G.COMISIONVENTA)/100)*
		((G.COMISIONVENTA - E.COMISIONVENTA)/100)*
		((E.COMISIONVENTA - C.COMISIONVENTA)/100))) * (SUM(K.COMISIONPARTICIPACION)/100) AS TOTAL_PARTICIPACION
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C --taquilla
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E --agencia
		ON D.ID_USUARIO = E.ID_USUARIO 
		JOIN TB_USUARIO F
		ON D.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_COMISION G  -- comercializadora
		ON F.ID_USUARIO = G.ID_USUARIO 	
		JOIN TB_USUARIO H
		ON F.ID_USUARIOPADRE = H.ID_USUARIO
		JOIN TB_COMISION I  -- grupo
		ON H.ID_USUARIO = I.ID_USUARIO 
		JOIN TB_USUARIO J
		ON H.ID_USUARIOPADRE = J.ID_USUARIO
		JOIN TB_COMISION K  -- dominio
		ON J.ID_USUARIO = K.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= G.FECHAINICIO) 
			AND (A.FECHA_HORA < G.FECHAFIN OR G.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= I.FECHAINICIO) 
			AND (A.FECHA_HORA < I.FECHAFIN OR I.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= K.FECHAINICIO) 
			AND (A.FECHA_HORA < K.FECHAFIN OR K.FECHAFIN IS NULL))
		WHERE D.ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH 
		GROUP BY A.ID_USUARIO, B.USUARIO) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND B.ESTATUS = 4
		GROUP BY ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_USUARIO = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(B.ID_TICKET) AS CANTIDAD_GANADORES, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE A.ID_USUARIO = @id_usuarioconsulta
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (B.ESTATUS = 5 OR B.ESTATUS = 4)
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_USUARIO = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND ESTATUS = 3
		GROUP BY ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_USUARIO = ELIMINADOS.ID_USUARIO
	END			
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarDominio]
GO

CREATE PROCEDURE [dbo].[sp_InsertarDominio](
      @id_dominio int OUTPUT,
      @nombre varchar(50),
      @numeroidentificacion varchar(50),
      @direccion varchar(500),
      @telefono varchar(10),
      @banqueo bit,
      @porcentaje decimal(18,2))
AS
BEGIN
	INSERT INTO [dbo].[TB_DOMINIO]
           ([NOMBRE]
           ,[NUMEROIDENTIFICACION]
           ,[DIRECCION]
           ,[TELEFONO]
           ,[BANQUEO]
           ,[PORCENTAJE]
           ,[ESTATUS])
     VALUES
           (@nombre,
           @numeroidentificacion,
           @direccion,
           @telefono,
           @banqueo,
           @porcentaje,
           1);
           
     SELECT  @id_dominio = @@IDENTITY ;
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteTicketsComercializadora
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteTicketsComercializadora]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteTicketsComercializadora]
GO

CREATE PROCEDURE [dbo].[sp_ReporteTicketsComercializadora](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int,
	  @estatus int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))

	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT
			A.ID_TICKET,
			A.FECHA_HORA,
			A.MONTO_APUESTA,
			CASE 
				 WHEN A.ESTATUS =  1 THEN 'Registrado'
				 WHEN A.ESTATUS =  3 THEN 'Eliminado'
				 WHEN A.ESTATUS =  4 THEN 'Pagado'
				 WHEN A.ESTATUS =  5 THEN 'Ganador'
				 ELSE '' 
			 END AS DESCRIPCION_ESTATUS,
		A.ESTATUS,
		B.ID_USUARIO AS TAQUILLA,
		B.NOMBRE AS NOMBRETAQUILLA,
		C.ID_USUARIO AS AGENCIA,		
		C.NOMBRE AS NOMBREAGENCIA 	 	 
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_USUARIO C
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH AND D.ID_USUARIO = @id_usuario
		AND (@estatus IS NULL OR A.ESTATUS = @estatus)	
	END	
	ELSE
	BEGIN
		SELECT
			A.ID_TICKET,
			A.FECHA_HORA,
			A.MONTO_APUESTA,
			CASE 
				 WHEN A.ESTATUS =  1 THEN 'Registrado'
				 WHEN A.ESTATUS =  3 THEN 'Eliminado'
				 WHEN A.ESTATUS =  4 THEN 'Pagado'
				 WHEN A.ESTATUS =  5 THEN 'Ganador'
				 ELSE '' 
			 END AS DESCRIPCION_ESTATUS,
			A.ESTATUS,
			B.ID_USUARIO AS TAQUILLA,
			B.NOMBRE AS NOMBRETAQUILLA,
			C.ID_USUARIO AS AGENCIA,		
			C.NOMBRE AS NOMBREAGENCIA 	 
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_USUARIO C
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D
		ON D.ID_USUARIOPADRE = D.ID_USUARIO
		WHERE C.ID_USUARIO = @id_usuarioconsulta
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (@estatus IS NULL OR A.ESTATUS = @estatus)	
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarImpuesto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarImpuesto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarImpuesto]
GO

CREATE PROCEDURE [dbo].[sp_InsertarImpuesto](
	  @nombre varchar(50),
	  @porcentaje decimal(4,2),
	  @aplicasobre char(1))
AS
BEGIN
	INSERT INTO [dbo].[TB_IMPUESTO]
           ([NOMBRE]
           ,[PORCENTAJE]
           ,[APLICASOBRE]
           ,[ESTATUS])
     VALUES
           (@nombre,
           @porcentaje,
           @aplicasobre,
           1);
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarJuego]
GO

CREATE PROCEDURE [dbo].[sp_InsertarJuego](
	  @id_juego int OUTPUT,
	  @nombre varchar(50),
	  @factor int,
	  @tiempo_cierre int,
	  @id_tipojuego int)
AS
BEGIN
	INSERT INTO [dbo].[TB_JUEGO]
           (NOMBRE
           ,ID_TIPOJUEGO
           ,FACTORPAGO
		   ,TIEMPOCIERRE
           ,ESTATUS)
     VALUES
           (@nombre,
           @id_tipojuego,
           @factor,
		   @tiempo_cierre,
           2);
        
     SELECT @id_juego = @@IDENTITY;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteTicketsGrupo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteTicketsGrupo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteTicketsGrupo]
GO

CREATE PROCEDURE [dbo].[sp_ReporteTicketsGrupo](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int,
	  @estatus int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))

	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT
			A.ID_TICKET,
			A.FECHA_HORA,
			A.MONTO_APUESTA,
			CASE 
				 WHEN A.ESTATUS =  1 THEN 'Vendido'
				 WHEN A.ESTATUS =  3 THEN 'Eliminado'
				 WHEN A.ESTATUS =  4 THEN 'Pagado'
				 WHEN A.ESTATUS =  5 THEN 'Ganador'
				 ELSE '' 
			 END AS DESCRIPCION_ESTATUS,
			A.ESTATUS,
			B.ID_USUARIO AS TAQUILLA,
			B.NOMBRE AS NOMBRETAQUILLA,
			C.ID_USUARIO AS AGENCIA,		
			C.NOMBRE AS NOMBREAGENCIA 	 	 
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_USUARIO C
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH AND E.ID_USUARIO = @id_usuario
		AND (@estatus IS NULL OR A.ESTATUS = @estatus)	
	END	
	ELSE
	BEGIN
		SELECT
			A.ID_TICKET,
			A.FECHA_HORA,
			A.MONTO_APUESTA,
			CASE 
				 WHEN A.ESTATUS =  1 THEN 'Vendido'
				 WHEN A.ESTATUS =  3 THEN 'Eliminado'
				 WHEN A.ESTATUS =  4 THEN 'Pagado'
				 WHEN A.ESTATUS =  5 THEN 'Ganador'
				 ELSE '' 
			 END AS DESCRIPCION_ESTATUS,
			A.ESTATUS,
			B.ID_USUARIO AS TAQUILLA,
			B.NOMBRE AS NOMBRETAQUILLA,
			C.ID_USUARIO AS AGENCIA,		
			C.NOMBRE AS NOMBREAGENCIA 	  
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_USUARIO C
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D
		ON D.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		WHERE C.ID_USUARIO = @id_usuarioconsulta
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (@estatus IS NULL OR A.ESTATUS = @estatus)	
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_EliminarImpuesto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_EliminarImpuesto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_EliminarImpuesto]
GO

CREATE PROCEDURE [dbo].[sp_EliminarImpuesto](
	  @id_impuesto int)
AS
BEGIN
	UPDATE [dbo].[TB_IMPUESTO]
    SET 
		[ESTATUS] = 3
    WHERE [ID_IMPUESTO] = @id_impuesto
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteTicketsDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteTicketsDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteTicketsDominio]
GO

CREATE PROCEDURE [dbo].[sp_ReporteTicketsDominio](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int,
	  @estatus int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))

	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT
			A.ID_TICKET,
			A.FECHA_HORA,
			A.MONTO_APUESTA,
			CASE 
				 WHEN A.ESTATUS =  1 THEN 'Vendido'
				 WHEN A.ESTATUS =  3 THEN 'Eliminado'
				 WHEN A.ESTATUS =  4 THEN 'Pagado'
				 WHEN A.ESTATUS =  5 THEN 'Ganador'
				 ELSE '' 
			 END AS DESCRIPCION_ESTATUS,
			A.ESTATUS,
			B.ID_USUARIO AS TAQUILLA,
			B.NOMBRE AS NOMBRETAQUILLA,
			C.ID_USUARIO AS AGENCIA,		
			C.NOMBRE AS NOMBREAGENCIA 	  
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_USUARIO C
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_USUARIO F
		ON E.ID_USUARIOPADRE = F.ID_USUARIO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH AND F.ID_USUARIO = @id_usuario
		AND (@estatus IS NULL OR A.ESTATUS = @estatus)	
	END	
	ELSE
	BEGIN
		SELECT
			A.ID_TICKET,
			A.FECHA_HORA,
			A.MONTO_APUESTA,
			CASE 
				 WHEN A.ESTATUS =  1 THEN 'Vendido'
				 WHEN A.ESTATUS =  3 THEN 'Eliminado'
				 WHEN A.ESTATUS =  4 THEN 'Pagado'
				 WHEN A.ESTATUS =  5 THEN 'Ganador'
				 ELSE '' 
			 END AS DESCRIPCION_ESTATUS,
			A.ESTATUS,
			B.ID_USUARIO AS TAQUILLA,
			B.NOMBRE AS NOMBRETAQUILLA,
			C.ID_USUARIO AS AGENCIA,		
			C.NOMBRE AS NOMBREAGENCIA 	  
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_USUARIO C
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D
		ON D.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_USUARIO F
		ON E.ID_USUARIOPADRE = F.ID_USUARIO
		WHERE C.ID_USUARIO = @id_usuarioconsulta
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (@estatus IS NULL OR A.ESTATUS = @estatus)	
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_EliminarDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_EliminarDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_EliminarDominio]
GO

CREATE PROCEDURE [dbo].[sp_EliminarDominio](
	  @id_dominio int)
AS
BEGIN
	UPDATE [dbo].[TB_DOMINIO] SET [ESTATUS] = 3
    WHERE  ID_DOMINIO = @id_dominio;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDetalleTicket
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDetalleTicket]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDetalleTicket]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDetalleTicket](
	  @id_ticket int)
AS
BEGIN
	SELECT 
		A.ID_TICKET, 
		A.FECHA_HORA, 
		B.MONTO_APUESTA,
		C.NOMBRE AS NOMBRE_JUEGO, 
		D.HORA, 
		E.NOMBRE AS NOMBRE_ITEM, 
		E.VALOR, 
		F.NOMBRE AS NOMBRE_CONJUNTO,
		G.ID_USUARIO AS TAQUILLA,
		G.NOMBRE AS NOMBRE_TAQUILLA,
		H.ID_USUARIO AS AGENCIA,		
		H.NOMBRE AS NOMBRE_AGENCIA 	 
	FROM TB_TICKET A
	JOIN TB_USUARIO G
	ON A.ID_USUARIO = G.ID_USUARIO
	JOIN TB_USUARIO H
	ON G.ID_USUARIOPADRE = H.ID_USUARIO
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	JOIN TB_JUEGO C
	ON B.ID_JUEGO = C.ID_JUEGO
	JOIN TB_SORTEO D
	ON B.ID_SORTEO = D.ID_SORTEO
	LEFT JOIN TB_ITEM E
	ON B.ID_ITEM = E.ID_ITEM
	LEFT JOIN TB_CONJUNTO F
	ON B.ID_CONJUNTO = F.ID_CONJUNTO
	WHERE A.ID_TICKET = @id_ticket	
END
GO


-- ----------------------------
-- Procedure structure for sp_EliminarUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_EliminarUsuario]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_EliminarUsuario]
GO

CREATE PROCEDURE [dbo].[sp_EliminarUsuario](
	  @id_usuario int)
AS
BEGIN
   ;WITH arbol_hijos AS 
	(
	   SELECT A.ID_USUARIO, A.ID_USUARIOPADRE, A.ID_DOMINIO, A.USUARIO, A.NOMBRE, A.APELLIDO, C.ID_TIPOUSUARIO, C.DESCRIPCION, A.ESTATUS
	   FROM TB_USUARIO A
	   JOIN TB_TIPOUSUARIO C
	   ON A.ID_TIPOUSUARIO = C.ID_TIPOUSUARIO
	   WHERE A.ID_USUARIO = @id_usuario AND A.ESTATUS <> 3
	   UNION ALL
	   SELECT D.ID_USUARIO, D.ID_USUARIOPADRE, D.ID_DOMINIO, D.USUARIO, D.NOMBRE, D.APELLIDO, F.ID_TIPOUSUARIO, F.DESCRIPCION, D.ESTATUS
	   FROM TB_USUARIO D
	   JOIN TB_DOMINIO E
	   ON D.ID_DOMINIO = E.ID_DOMINIO
	   JOIN TB_TIPOUSUARIO F
	   ON D.ID_TIPOUSUARIO = F.ID_TIPOUSUARIO
	   JOIN arbol_hijos G 
	   ON D.ID_USUARIOPADRE = G.ID_USUARIO  
	   AND D.ID_USUARIO <> D.ID_USUARIOPADRE AND D.ESTATUS <> 3
	)	

	SELECT * INTO #TEMP FROM arbol_hijos WHERE ID_USUARIO <> @id_usuario 
	OPTION (MAXRECURSION 0)
	
	UPDATE [dbo].[TB_USUARIO] SET [ESTATUS] = 3
    WHERE  ID_USUARIO = @id_usuario;
	
	UPDATE [dbo].[TB_USUARIO] SET [ESTATUS] = 3
    WHERE  ID_USUARIO IN (SELECT ID_USUARIO FROM #TEMP)

	DROP table #TEMP
END
GO


-- ----------------------------
-- Procedure structure for sp_EliminarJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_EliminarJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_EliminarJuego]
GO

CREATE PROCEDURE [dbo].[sp_EliminarJuego](
	  @id_juego int)
AS
BEGIN
	UPDATE [dbo].[TB_JUEGO] 
	SET
		[ESTATUS] = 3
	WHERE [ID_JUEGO] = @id_juego
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarJuegos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarJuegos]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarJuegos]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarJuegos]
AS
BEGIN
	SELECT * FROM
	TB_JUEGO
	WHERE ESTATUS <> 3;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarHijosEliminar
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarHijosEliminar]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarHijosEliminar]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarHijosEliminar](
	  @id_usuariopadre int)
AS
BEGIN
	;WITH arbol_hijos AS 
	(
	   SELECT A.ID_USUARIO, A.ID_USUARIOPADRE, A.ID_DOMINIO, A.USUARIO, A.NOMBRE, A.APELLIDO, C.ID_TIPOUSUARIO, C.DESCRIPCION, A.ESTATUS
	   FROM TB_USUARIO A
	   JOIN TB_TIPOUSUARIO C
	   ON A.ID_TIPOUSUARIO = C.ID_TIPOUSUARIO
	   WHERE A.ID_USUARIO = @id_usuariopadre AND A.ESTATUS <> 3
	   UNION ALL
	   SELECT D.ID_USUARIO, D.ID_USUARIOPADRE, D.ID_DOMINIO, D.USUARIO, D.NOMBRE, D.APELLIDO, F.ID_TIPOUSUARIO, F.DESCRIPCION, D.ESTATUS
	   FROM TB_USUARIO D
	   JOIN TB_DOMINIO E
	   ON D.ID_DOMINIO = E.ID_DOMINIO
	   JOIN TB_TIPOUSUARIO F
	   ON D.ID_TIPOUSUARIO = F.ID_TIPOUSUARIO
	   JOIN arbol_hijos G 
	   ON D.ID_USUARIOPADRE = G.ID_USUARIO  
	   AND D.ID_USUARIO <> D.ID_USUARIOPADRE AND D.ESTATUS <> 3
	)	

	SELECT * INTO #TEMP FROM arbol_hijos WHERE ID_USUARIO <> @id_usuariopadre 
	OPTION (MAXRECURSION 0)
	
	SELECT ID_USUARIO FROM #TEMP

	DROP table #TEMP
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarJuego]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarJuego](
	  @id_juego int)
AS
BEGIN
	SELECT * FROM
	TB_JUEGO 
	WHERE ID_JUEGO = @id_juego;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVentasAdministrador
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVentasAdministrador]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVentasAdministrador]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVentasAdministrador](
	  @id_usuario int,
	  @fecha_desde datetime,
	  @fecha_hasta datetime,
	  @id_usuarioconsulta int)
AS
BEGIN

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime
	
	SET @fechaD = CONVERT(DATE,@fecha_desde,103)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,@fecha_hasta,103))
	
	IF (@id_usuarioconsulta IS NULL)
	BEGIN
		SELECT VENDIDOS.ID_DOMINIO AS ID_USUARIO, 
		VENDIDOS.NOMBRE + ' ' + VENDIDOS.APELLIDO AS USUARIO,
		SUM(VENDIDOS.CANTIDAD_VENDIDOS) AS CANTIDAD_VENDIDOS, 
		SUM(VENDIDOS.TOTAL_VENDIDO) AS TOTAL_VENDIDO, 
		SUM(VENDIDOS.TOTAL_COMISION) AS TOTAL_COMISION, 
		(VENDIDOS.TOTAL_VENDIDO - VENDIDOS.TOTAL_COMISION - GANADORES.TOTAL_GANADORES)* (VENDIDOS.PORCENTAJE_PARTICIPACION/100) AS TOTAL_PARTICIPACION,
		SUM(PAGADOS.CANTIDAD_PAGADOS) AS CANTIDAD_PAGADOS, 
		SUM(PAGADOS.TOTAL_PAGADO) AS TOTAL_PAGADO, 
		SUM(GANADORES.CANTIDAD_GANADORES) AS CANTIDAD_GANADORES, 
		SUM(GANADORES.TOTAL_GANADORES) AS TOTAL_GANADORES,
		SUM(ELIMINADOS.CANTIDAD_ELIMINADOS) AS CANTIDAD_ELIMINADOS, 
		SUM(ELIMINADOS.TOTAL_ELIMINADOS) AS TOTAL_ELIMINADOS, 
		SUM(VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION - 
		((VENDIDOS.TOTAL_VENDIDO - VENDIDOS.TOTAL_COMISION - GANADORES.TOTAL_GANADORES)* (VENDIDOS.PORCENTAJE_PARTICIPACION/100))) AS SALDO,
	    VENDIDOS.PORCENTAJE_PARTICIPACION AS PORCENTAJE_PARTICIPACION,
		VENDIDOS.PORCENTAJE_COMISION PORCENTAJE_COMISION
		FROM
		(--VENDIDOS
		SELECT 
			A.ID_USUARIO ID_TAQUILLA, 
			B.USUARIO AS TAQUILLA, 
			D.USUARIO AS AGENCIA, 
			D.ID_USUARIO AS ID_AGENCIA, 
			F.USUARIO AS COMERCIALIZADORA, 
			F.ID_USUARIO AS ID_COMERCIALIZADORA,
			H.USUARIO AS GRUPO, 
			H.ID_USUARIO AS ID_GRUPO,
			J.USUARIO AS DOMINIO, 
			J.ID_USUARIO AS ID_DOMINIO,
			J.NOMBRE,
			J.APELLIDO,
			COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, 
			SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
			/*SUM(MONTO_APUESTA * (
			((M.COMISIONVENTA - K.COMISIONVENTA)/100)*
			((K.COMISIONVENTA - I.COMISIONVENTA)/100)*
			((I.COMISIONVENTA - G.COMISIONVENTA)/100)*
			((G.COMISIONVENTA - E.COMISIONVENTA)/100)*
			((E.COMISIONVENTA - C.COMISIONVENTA)/100))) AS TOTAL_COMISION,*/
			SUM(MONTO_APUESTA * K.COMISIONVENTA)/100 AS TOTAL_COMISION,
			/*SUM(MONTO_APUESTA * (
			((M.COMISIONVENTA - K.COMISIONVENTA)/100)*
			((K.COMISIONVENTA - I.COMISIONVENTA)/100)*
			((I.COMISIONVENTA - G.COMISIONVENTA)/100)*
			((G.COMISIONVENTA - E.COMISIONVENTA)/100)*
			((E.COMISIONVENTA - C.COMISIONVENTA)/100))) * (SUM(M.COMISIONPARTICIPACION - K.COMISIONPARTICIPACION)/100) AS TOTAL_PARTICIPACION,*/
			K.COMISIONPARTICIPACION  AS PORCENTAJE_PARTICIPACION,
			K.COMISIONVENTA AS PORCENTAJE_COMISION
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C --taquilla
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E --agencia
		ON D.ID_USUARIO = E.ID_USUARIO 
		JOIN TB_USUARIO F
		ON D.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_COMISION G  -- comercializadora
		ON F.ID_USUARIO = G.ID_USUARIO 	
		JOIN TB_USUARIO H
		ON F.ID_USUARIOPADRE = H.ID_USUARIO
		JOIN TB_COMISION I  -- grupo
		ON H.ID_USUARIO = I.ID_USUARIO 
		JOIN TB_USUARIO J
		ON H.ID_USUARIOPADRE = J.ID_USUARIO
		JOIN TB_COMISION K  -- dominio
		ON J.ID_USUARIO = K.ID_USUARIO 	
		JOIN TB_USUARIO L
		ON J.ID_USUARIOPADRE = L.ID_USUARIO
		JOIN TB_COMISION M  -- administrador
		ON L.ID_USUARIO = M.ID_USUARIO 	
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= G.FECHAINICIO) 
			AND (A.FECHA_HORA < G.FECHAFIN OR G.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= I.FECHAINICIO) 
			AND (A.FECHA_HORA < I.FECHAFIN OR I.FECHAFIN IS NULL))
        AND ((A.FECHA_HORA >= K.FECHAINICIO) 
			AND (A.FECHA_HORA < K.FECHAFIN OR K.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= M.FECHAINICIO) 
			AND (A.FECHA_HORA < M.FECHAFIN OR M.FECHAFIN IS NULL))
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = D.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND L.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO, B.USUARIO, D.USUARIO, D.ID_USUARIO, F.USUARIO, F.ID_USUARIO,
		H.USUARIO, H.ID_USUARIO, J.ID_USUARIO, J.USUARIO, J.NOMBRE, J.APELLIDO, M.COMISIONVENTA, M.COMISIONPARTICIPACION,
		K.COMISIONPARTICIPACION, K.COMISIONVENTA) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(G.MONTO_APUESTA * H.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_USUARIO F  -- dominio
		ON E.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_USUARIO I  -- administrador
		ON F.ID_USUARIOPADRE = I.ID_USUARIO
		JOIN TB_JUGADA G
		ON A.ID_TICKET = G.ID_TICKET
		JOIN TB_JUEGO H
		ON G.ID_JUEGO = H.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND G.ESTATUS = 4 AND I.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_TAQUILLA = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(G.ID_TICKET) AS CANTIDAD_GANADORES, SUM(G.MONTO_APUESTA * H.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_USUARIO F  -- dominio
		ON E.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_USUARIO I  -- administrador
		ON F.ID_USUARIOPADRE = I.ID_USUARIO
		JOIN TB_JUGADA G
		ON A.ID_TICKET = G.ID_TICKET
		JOIN TB_JUEGO H
		ON G.ID_JUEGO = H.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO)
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (G.ESTATUS = 5 OR G.ESTATUS = 4) AND I.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_TAQUILLA = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(G.MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET A
		JOIN TB_USUARIO B --taquilla
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_USUARIO C --agencia
		ON B.ID_USUARIOPADRE = C.ID_USUARIO
		JOIN TB_USUARIO D  -- comercializadora
		ON C.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_USUARIO E  -- grupo
		ON D.ID_USUARIOPADRE = E.ID_USUARIO
		JOIN TB_USUARIO F  -- dominio
		ON E.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_USUARIO I  -- administrador
		ON F.ID_USUARIOPADRE = I.ID_USUARIO
		JOIN TB_JUGADA G
		ON A.ID_TICKET = G.ID_TICKET
		JOIN TB_JUEGO H
		ON G.ID_JUEGO = H.ID_JUEGO
		WHERE A.ID_USUARIO IN (SELECT ID_USUARIO FROM TB_USUARIO WHERE ID_USUARIOPADRE = C.ID_USUARIO) 
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND A.ESTATUS = 3 AND I.ID_USUARIO = @id_usuario
		GROUP BY A.ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_TAQUILLA = ELIMINADOS.ID_USUARIO
		GROUP BY VENDIDOS.ID_DOMINIO, VENDIDOS.DOMINIO, VENDIDOS.NOMBRE, VENDIDOS.APELLIDO, VENDIDOS.PORCENTAJE_PARTICIPACION,
		VENDIDOS.PORCENTAJE_COMISION, VENDIDOS.TOTAL_COMISION, VENDIDOS.TOTAL_VENDIDO, GANADORES.TOTAL_GANADORES
	END
	ELSE
	BEGIN
		SELECT VENDIDOS.ID_USUARIO, VENDIDOS.USUARIO, VENDIDOS.CANTIDAD_VENDIDOS, VENDIDOS.TOTAL_VENDIDO, VENDIDOS.TOTAL_COMISION, VENDIDOS.TOTAL_PARTICIPACION,
		PAGADOS.CANTIDAD_PAGADOS, PAGADOS.TOTAL_PAGADO, GANADORES.CANTIDAD_GANADORES, GANADORES.TOTAL_GANADORES,
		ELIMINADOS.CANTIDAD_ELIMINADOS, ELIMINADOS.TOTAL_ELIMINADOS, (VENDIDOS.TOTAL_VENDIDO - GANADORES.TOTAL_GANADORES - VENDIDOS.TOTAL_COMISION) SALDO
		FROM
		(--VENDIDOS
		SELECT A.ID_USUARIO, B.USUARIO, COUNT(ID_TICKET) AS CANTIDAD_VENDIDOS, SUM(MONTO_APUESTA) AS TOTAL_VENDIDO,
		SUM(MONTO_APUESTA * (
		((K.COMISIONVENTA - I.COMISIONVENTA)/100)*
		((I.COMISIONVENTA - G.COMISIONVENTA)/100)*
		((G.COMISIONVENTA - E.COMISIONVENTA)/100)*
		((E.COMISIONVENTA - C.COMISIONVENTA)/100))) AS TOTAL_COMISION,
			SUM(MONTO_APUESTA * (
		((K.COMISIONVENTA - I.COMISIONVENTA)/100)*
		((I.COMISIONVENTA - G.COMISIONVENTA)/100)*
		((G.COMISIONVENTA - E.COMISIONVENTA)/100)*
		((E.COMISIONVENTA - C.COMISIONVENTA)/100))) * (SUM(K.COMISIONPARTICIPACION)/100) AS TOTAL_PARTICIPACION
		FROM
		TB_TICKET A
		JOIN TB_USUARIO B
		ON A.ID_USUARIO = B.ID_USUARIO 
		JOIN TB_COMISION C --taquilla
		ON B.ID_USUARIO = C.ID_USUARIO 
		JOIN TB_USUARIO D
		ON B.ID_USUARIOPADRE = D.ID_USUARIO
		JOIN TB_COMISION E --agencia
		ON D.ID_USUARIO = E.ID_USUARIO 
		JOIN TB_USUARIO F
		ON D.ID_USUARIOPADRE = F.ID_USUARIO
		JOIN TB_COMISION G  -- comercializadora
		ON F.ID_USUARIO = G.ID_USUARIO 	
		JOIN TB_USUARIO H
		ON F.ID_USUARIOPADRE = H.ID_USUARIO
		JOIN TB_COMISION I  -- grupo
		ON H.ID_USUARIO = I.ID_USUARIO 
		JOIN TB_USUARIO J
		ON H.ID_USUARIOPADRE = J.ID_USUARIO
		JOIN TB_COMISION K  -- dominio
		ON J.ID_USUARIO = K.ID_USUARIO 
		AND ((A.FECHA_HORA >= C.FECHAINICIO) 
			AND (A.FECHA_HORA < C.FECHAFIN OR C.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= E.FECHAINICIO) 
			AND (A.FECHA_HORA < E.FECHAFIN OR E.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= G.FECHAINICIO) 
			AND (A.FECHA_HORA < G.FECHAFIN OR G.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= I.FECHAINICIO) 
			AND (A.FECHA_HORA < I.FECHAFIN OR I.FECHAFIN IS NULL))
		AND ((A.FECHA_HORA >= K.FECHAINICIO) 
			AND (A.FECHA_HORA < K.FECHAFIN OR K.FECHAFIN IS NULL))
		WHERE D.ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH 
		GROUP BY A.ID_USUARIO, B.USUARIO) VENDIDOS
		LEFT JOIN
		(--PAGADOS
		SELECT A.ID_USUARIO, COUNT(A.ID_TICKET) AS CANTIDAD_PAGADOS, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_PAGADO FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND B.ESTATUS = 4
		GROUP BY ID_USUARIO) PAGADOS
		ON VENDIDOS.ID_USUARIO = PAGADOS.ID_USUARIO
		LEFT JOIN 
		(--GANADORES
		SELECT A.ID_USUARIO, COUNT(B.ID_TICKET) AS CANTIDAD_GANADORES, SUM(B.MONTO_APUESTA * C.FACTORPAGO) AS TOTAL_GANADORES FROM
		TB_TICKET A
		JOIN TB_JUGADA B
		ON A.ID_TICKET = B.ID_TICKET
		JOIN TB_JUEGO C
		ON B.ID_JUEGO = C.ID_JUEGO
		WHERE A.ID_USUARIO = @id_usuarioconsulta
		AND (A.ESTATUS = 5 OR A.ESTATUS = 4)
		AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH 
		AND (B.ESTATUS = 5 OR B.ESTATUS = 4)
		GROUP BY A.ID_USUARIO) GANADORES
		ON VENDIDOS.ID_USUARIO = GANADORES.ID_USUARIO
		LEFT JOIN
		(--ELIMINADOS
		SELECT ID_USUARIO, COUNT(ID_TICKET) AS CANTIDAD_ELIMINADOS, SUM(MONTO_APUESTA) AS TOTAL_ELIMINADOS FROM
		TB_TICKET
		WHERE ID_USUARIO = @id_usuarioconsulta
		AND FECHA_HORA BETWEEN @fechaD AND @fechaH AND ESTATUS = 3
		GROUP BY ID_USUARIO) ELIMINADOS
		ON VENDIDOS.ID_USUARIO = ELIMINADOS.ID_USUARIO
	END			
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarUsuarioSorteoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarUsuarioSorteoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarUsuarioSorteoItem]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarUsuarioSorteoItem](
       @id_usuario int,
       @id_sorteo int,
       @id_item int,
       @cupo_max int,
       @monto_max money,
       @cupo_disponible int,
       @monto_disponible money,
       @estatus int)
AS
BEGIN

	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM TB_USUARIO_SORTEO_ITEM WHERE
        ID_USUARIO = @id_usuario
		AND ID_SORTEO = @id_sorteo
		AND ID_ITEM = @id_item
		AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
		BEGIN     

			UPDATE dbo.TB_USUARIO_SORTEO_ITEM SET
				CUPO_MAX = IsNull(@cupo_max, CUPO_MAX),
				MONTO_MAX = IsNull(@monto_max, MONTO_MAX),
				CUPO_DISPONIBLE  = IsNull(@cupo_disponible, CUPO_DISPONIBLE),
				MONTO_DISPONIBLE  = IsNull(@monto_disponible, MONTO_DISPONIBLE),
				ESTATUS = IsNull(@estatus, ESTATUS)
			WHERE
				ID_USUARIO = @id_usuario
				AND ID_SORTEO = @id_sorteo
				AND ID_ITEM = @id_item;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[TB_USUARIO_SORTEO_ITEM]
			   ([ID_USUARIO]
			   ,[ID_SORTEO]
			   ,[ID_ITEM]
			   ,[CUPO_MAX]
			   ,[MONTO_MAX]
			   ,[CUPO_DISPONIBLE]
			   ,[MONTO_DISPONIBLE]
			   ,[ESTATUS])
			 VALUES
				   (@id_usuario,
				   @id_sorteo,
				   @id_item,
				   @cupo_max,
				   @monto_max,
				   @cupo_disponible,
                   @monto_disponible,
				   1);
		END
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarImpuestos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarImpuestos]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarImpuestos]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarImpuestos]
AS
BEGIN
	SELECT 
		*
	FROM
	dbo.TB_IMPUESTO
	WHERE ESTATUS <> 3;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDominios
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDominios]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDominios]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDominios]
AS
BEGIN
	SELECT * 
	FROM dbo.[TB_DOMINIO]
	WHERE ESTATUS <> 3;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDominio]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDominio](
	  @id_dominio int)
AS
BEGIN
	SELECT * 
	FROM dbo.[TB_DOMINIO]
	WHERE ID_DOMINIO = @id_dominio;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosUsuarioxLogin
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosUsuarioxLogin]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosUsuarioxLogin]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosUsuarioxLogin](
	  @usuario varchar(50))
AS
BEGIN

	DECLARE @tipo INT 
	SET @tipo = (SELECT COUNT(ID_USUARIO) FROM TB_USUARIO WHERE USUARIO = @usuario AND (ID_TIPOUSUARIO = 1
	OR ID_TIPOUSUARIO = 7))
	
	IF @tipo = 0
	BEGIN
		SELECT A.ID_USUARIO,
		A.ID_DOMINIO,
		A.ID_USUARIOPADRE,
		A.ID_TIPOUSUARIO,
		B.DESCRIPCION,
		A.NOMBRE,
		A.APELLIDO,
		A.NUMEROIDENTIFICACION,
		A.CORREOELECTRONICO,
		A.USUARIO,
		A.CADUCIDAD,
		C.COMISIONPARTICIPACION,
		C.COMISIONVENTA,
		A.ESTATUS
		FROM dbo.[TB_USUARIO] A
		JOIN dbo.TB_TIPOUSUARIO B
		ON A.ID_TIPOUSUARIO = B.ID_TIPOUSUARIO
		JOIN dbo.[TB_COMISION] C
		ON A.ID_USUARIO = C.ID_USUARIO
		WHERE USUARIO = @usuario AND A.ESTATUS <> 3 AND C.ESTATUS = 1 AND C.FECHAFIN IS NULL;
	END
	ELSE
	BEGIN 
		SELECT A.ID_USUARIO,
		A.ID_DOMINIO,
		A.ID_USUARIOPADRE,
		A.ID_TIPOUSUARIO,
		B.DESCRIPCION,
		A.NOMBRE,
		A.APELLIDO,
		A.NUMEROIDENTIFICACION,
		A.CORREOELECTRONICO,
		A.USUARIO,
		A.CADUCIDAD,
		NULL AS COMISIONPARTICIPACION,
		NULL AS COMISIONVENTA,
		A.ESTATUS
		FROM dbo.[TB_USUARIO] A
		JOIN dbo.TB_TIPOUSUARIO B
		ON A.ID_TIPOUSUARIO = B.ID_TIPOUSUARIO
		WHERE USUARIO = @usuario AND A.ESTATUS <> 3;
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosUsuarioxCorreo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosUsuarioxCorreo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosUsuarioxCorreo]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosUsuarioxCorreo](
	  @correoelectronico varchar(50))
AS
BEGIN
	SELECT * 
	FROM dbo.[TB_USUARIO]
	WHERE CORREOELECTRONICO = @correoelectronico 
	AND ESTATUS <> 3;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosUsuariosxPadre
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosUsuariosxPadre]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosUsuariosxPadre]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosUsuariosxPadre](
	  @id_usuariopadre int)
AS
BEGIN

	/*DECLARE @usuario_interno int 
	SET @usuario_interno = (SELECT COUNT(*) FROM TB_USUARIO A
	JOIN TB_TIPOUSUARIO B
	ON A.ID_TIPOUSUARIO = B.ID_TIPOUSUARIO
	WHERE A.ID_USUARIO = @id_usuariopadre
	AND (B.DESCRIPCION = 'Interno' OR B.DESCRIPCION = 'Administrador'));
	
	IF(@usuario_interno <> 1)
		BEGIN*/
			SELECT * 
			FROM dbo.[TB_USUARIO] A
			JOIN dbo.[TB_COMISION] B
			ON A.ID_USUARIO = B.ID_USUARIO
			WHERE A.ID_USUARIOPADRE = @id_usuariopadre
			AND B.ESTATUS = 1 AND B.FECHAFIN IS NULL AND A.ESTATUS <> 3;
		/*END
	ELSE
		BEGIN
			SELECT * 
				FROM dbo.[TB_USUARIO]
				WHERE (ID_TIPOUSUARIO <> 1 AND ID_TIPOUSUARIO <> 7)
				AND ESTATUS <> 3;
		END*/
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVendidosxSorteoTaquilla
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVendidosxSorteoTaquilla]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVendidosxSorteoTaquilla]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVendidosxSorteoTaquilla](
	  @fecha datetime,
	  @id_sorteo int,
	  @id_usuario int,
	  @id_juego int)
AS
BEGIN 
	SELECT 
	COUNT(E.ID_ITEM) as CANTIDAD_VENDIDA, 
	SUM(E.MONTO_APUESTA) AS MONTO_VENDIDO, 
	A.NOMBRE AS NOMBRE_JUEGO, 
	C.HORA AS HORA, 
	D.NOMBRE AS NOMBRE_ITEM,
	D.VALOR AS NUMERO_ITEM,
	SUM(E.MONTO_APUESTA * A.FACTORPAGO) AS POSIBLE_PERDIDA
	FROM
	TB_JUEGO A
	JOIN TB_SORTEO C
	ON A.ID_JUEGO = C.ID_JUEGO
	JOIN TB_ITEM D
	ON A.ID_JUEGO = D.ID_JUEGO
	JOIN TB_JUGADA E
	ON D.ID_ITEM = E.ID_ITEM AND A.ID_JUEGO = E.ID_JUEGO AND C.ID_SORTEO = E.ID_SORTEO
	JOIN TB_TICKET F
	ON E.ID_TICKET = F.ID_TICKET
	JOIN TB_USUARIO G
	ON F.ID_USUARIO = G.ID_USUARIO
	WHERE CAST(F.FECHA_HORA AS DATE) BETWEEN CAST(@fecha AS DATE)AND CAST(@fecha + 1 AS DATE) 
	AND G.ID_USUARIO = @id_usuario
	AND E.ID_JUEGO = @id_juego
	AND E.ID_SORTEO = @id_sorteo
	GROUP BY  A.NOMBRE, C.HORA, D.NOMBRE, D.VALOR
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosUsuariosxDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosUsuariosxDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosUsuariosxDominio]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosUsuariosxDominio](
	  @id_dominio int)
AS
BEGIN
	SELECT * 
	FROM dbo.[TB_USUARIO]
	WHERE ID_DOMINIO = @id_dominio;
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVendidosxSorteoAgencia
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVendidosxSorteoAgencia]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVendidosxSorteoAgencia]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVendidosxSorteoAgencia](
	  @fecha datetime,
	  @id_juego int,
	  @id_sorteo int,
	  @id_usuario int)
AS
BEGIN 
	SELECT 
	COUNT(E.ID_ITEM) as CANTIDAD_VENDIDA, 
	SUM(E.MONTO_APUESTA) AS MONTO_VENDIDO, 
	A.NOMBRE AS NOMBRE_JUEGO, 
	C.HORA AS HORA, 
	D.NOMBRE AS NOMBRE_ITEM,
	D.VALOR AS NUMERO_ITEM,
	SUM(E.MONTO_APUESTA * A.FACTORPAGO)  AS POSIBLE_PERDIDA
	FROM
	TB_JUEGO A
	JOIN TB_SORTEO C
	ON A.ID_JUEGO = C.ID_JUEGO
	JOIN TB_ITEM D
	ON A.ID_JUEGO = D.ID_JUEGO
	JOIN TB_JUGADA E
	ON D.ID_ITEM = E.ID_ITEM AND A.ID_JUEGO = E.ID_JUEGO AND C.ID_SORTEO = E.ID_SORTEO
	JOIN TB_TICKET F
	ON E.ID_TICKET = F.ID_TICKET
	JOIN TB_USUARIO G
	ON F.ID_USUARIO = G.ID_USUARIO
	JOIN TB_USUARIO H
	ON G.ID_USUARIOPADRE = H.ID_USUARIO	
	WHERE CAST(F.FECHA_HORA AS DATE) BETWEEN CAST(@fecha AS DATE)
	AND CAST(@fecha + 1 AS DATE) 
	AND H.ID_USUARIO = @id_usuario
	AND E.ID_SORTEO = @id_sorteo
	AND E.ID_JUEGO = @id_juego
	GROUP BY  A.NOMBRE, C.HORA, D.NOMBRE, D.VALOR
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosUsuarios
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosUsuarios]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosUsuarios]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosUsuarios]
AS
BEGIN
	SELECT * 
	FROM dbo.[TB_USUARIO]
	WHERE [ID_TIPOUSUARIO] <> 7;
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVendidosxSorteoComercializadora
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVendidosxSorteoComercializadora]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVendidosxSorteoComercializadora]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVendidosxSorteoComercializadora](
	  @fecha datetime,
	  @id_sorteo int,
	  @id_usuario int,
	  @id_juego int)
AS
BEGIN 
	SELECT 
		COUNT(E.ID_ITEM) as CANTIDAD_VENDIDA, 
		SUM(E.MONTO_APUESTA) AS MONTO_VENDIDO, 
		A.NOMBRE AS NOMBRE_JUEGO, 
		C.HORA AS HORA, 
		D.NOMBRE AS NOMBRE_ITEM,
		D.VALOR AS NUMERO_ITEM,
		SUM(E.MONTO_APUESTA * A.FACTORPAGO) AS POSIBLE_PERDIDA
	FROM
	TB_JUEGO A
	JOIN TB_SORTEO C
	ON A.ID_JUEGO = C.ID_JUEGO
	JOIN TB_ITEM D
	ON A.ID_JUEGO = D.ID_JUEGO
	JOIN TB_JUGADA E
	ON D.ID_ITEM = E.ID_ITEM AND A.ID_JUEGO = E.ID_JUEGO AND C.ID_SORTEO = E.ID_SORTEO
	JOIN TB_TICKET F
	ON E.ID_TICKET = F.ID_TICKET
	JOIN TB_USUARIO G
	ON F.ID_USUARIO = G.ID_USUARIO
	JOIN TB_USUARIO H
	ON G.ID_USUARIOPADRE = H.ID_USUARIO	
	JOIN TB_USUARIO I
	ON H.ID_USUARIOPADRE = I.ID_USUARIO	
	WHERE CAST(F.FECHA_HORA AS DATE) BETWEEN CAST(@fecha AS DATE)
	AND CAST(@fecha + 1 AS DATE) AND I.ID_USUARIO = @id_usuario
	AND E.ID_JUEGO = @id_juego
	AND E.ID_SORTEO = @id_sorteo
	GROUP BY  A.NOMBRE, C.HORA, D.NOMBRE, D.VALOR
END
GO


-- ----------------------------
-- Procedure structure for sp_RegistrarTicket
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RegistrarTicket]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RegistrarTicket]
GO

CREATE PROCEDURE [dbo].[sp_RegistrarTicket](
	  @id_ticket int OUTPUT,
	  @id_usuario int,
	  @serial varchar(150),
	  @monto_apuesta money)
AS
BEGIN
		 INSERT INTO [dbo].[TB_TICKET]
           (ID_USUARIO
           ,SERIAL
           ,FECHA_HORA
           ,MONTO_APUESTA
           ,ESTATUS)
		 VALUES
			   (@id_usuario
			   ,@serial
			   ,GETDATE()
			   ,@monto_apuesta
			   ,1);
			   
	SELECT  @id_ticket = @@IDENTITY ;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosUsuario]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosUsuario]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosUsuario](
	  @id_usuario int)
AS
BEGIN
	
	DECLARE @Administrador int 
	SET @Administrador = (SELECT COUNT(*) FROM dbo.[TB_USUARIO]  WHERE ID_USUARIO = @id_usuario AND ID_USUARIOPADRE IS NULL);
	
	DECLARE @tipousuariopadre int 
	SET @tipousuariopadre = (SELECT B.ID_TIPOUSUARIO FROM dbo.[TB_USUARIO] A
	join TB_USUARIO B  
	ON A.ID_USUARIOPADRE = B.ID_USUARIO 
	WHERE A.ID_USUARIO = @id_usuario);


	IF(@Administrador = 1)
	BEGIN 
		SELECT A.*,
		'' AS USUARIOPADRE,
		NULL AS COMISIONVENTA,
		NULL AS COMISIONPARTICIPACION 
		FROM dbo.[TB_USUARIO] A
		WHERE A.ID_USUARIO = @id_usuario;
	END
	ELSE
	BEGIN 
		IF (@tipousuariopadre = 1 OR @tipousuariopadre = 7)
		BEGIN
			SELECT A.*,
			C.COMISIONPARTICIPACION,
			C.COMISIONVENTA,
			B.USUARIO AS USUARIOPADRE,
			B.NOMBRE AS NOMBREPADRE,
			B.APELLIDO AS APELLIDOPADRE,
			B.CORREOELECTRONICO AS CORREOELECTRONICOPADRE,
			100 AS COMISIONPARTICIPACIONPADRE,
			100 AS COMISIONVENTAPADRE
			FROM dbo.[TB_USUARIO] A
			JOIN TB_USUARIO B
			ON A.ID_USUARIOPADRE = B.ID_USUARIO
			JOIN dbo.[TB_COMISION] C
			ON A.ID_USUARIO = C.ID_USUARIO
			WHERE A.ID_USUARIO = @id_usuario AND C.ESTATUS = 1 AND C.FECHAFIN IS NULL;
		END
		ELSE
		BEGIN
			SELECT A.*,
			C.COMISIONPARTICIPACION,
			C.COMISIONVENTA,
			B.USUARIO AS USUARIOPADRE,
			B.NOMBRE AS NOMBREPADRE,
			B.APELLIDO AS APELLIDOPADRE,
			B.CORREOELECTRONICO AS CORREOELECTRONICOPADRE,
			D.COMISIONPARTICIPACION AS COMISIONPARTICIPACIONPADRE,
			D.COMISIONVENTA AS COMISIONVENTAPADRE
			FROM dbo.[TB_USUARIO] A
			JOIN TB_USUARIO B
			ON A.ID_USUARIOPADRE = B.ID_USUARIO
			JOIN dbo.[TB_COMISION] C
			ON A.ID_USUARIO = C.ID_USUARIO
			LEFT JOIN dbo.[TB_COMISION] D
			ON B.ID_USUARIO = D.ID_USUARIO
			WHERE A.ID_USUARIO = @id_usuario AND C.ESTATUS = 1 AND C.FECHAFIN IS NULL
			AND D.ESTATUS = 1 AND D.FECHAFIN IS NULL;
		END
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVendidosxSorteoGrupo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVendidosxSorteoGrupo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVendidosxSorteoGrupo]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVendidosxSorteoGrupo](
	  @fecha datetime,
	  @id_sorteo int,
	  @id_usuario int,
	  @id_juego int)
AS
BEGIN 
	SELECT 
		COUNT(E.ID_ITEM) as CANTIDAD_VENDIDA, 
		SUM(E.MONTO_APUESTA) AS MONTO_VENDIDO, 
		A.NOMBRE AS NOMBRE_JUEGO, 
		C.HORA AS HORA, 
		D.NOMBRE AS NOMBRE_ITEM,
		D.VALOR AS NUMERO_ITEM,
		SUM(E.MONTO_APUESTA * A.FACTORPAGO) AS POSIBLE_PERDIDA
	FROM
	TB_JUEGO A
	JOIN TB_SORTEO C
	ON A.ID_JUEGO = C.ID_JUEGO
	JOIN TB_ITEM D
	ON A.ID_JUEGO = D.ID_JUEGO
	JOIN TB_JUGADA E
	ON D.ID_ITEM = E.ID_ITEM AND A.ID_JUEGO = E.ID_JUEGO AND C.ID_SORTEO = E.ID_SORTEO
	JOIN TB_TICKET F
	ON E.ID_TICKET = F.ID_TICKET
	JOIN TB_USUARIO G
	ON F.ID_USUARIO = G.ID_USUARIO
	JOIN TB_USUARIO H
	ON G.ID_USUARIOPADRE = H.ID_USUARIO	
	JOIN TB_USUARIO I
	ON H.ID_USUARIOPADRE = I.ID_USUARIO	
	JOIN TB_USUARIO J
	ON I.ID_USUARIOPADRE = J.ID_USUARIO	
	WHERE CAST(F.FECHA_HORA AS DATE) BETWEEN CAST(@fecha AS DATE)
	AND CAST(@fecha + 1 AS DATE) AND J.ID_USUARIO = @id_usuario
	AND E.ID_JUEGO = @id_juego
	AND E.ID_SORTEO = @id_sorteo
	GROUP BY  A.NOMBRE, C.HORA, D.NOMBRE, D.VALOR
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarImpuesto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarImpuesto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarImpuesto]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarImpuesto](
	  @id_impuesto int,
	  @nombre varchar(50),
	  @porcentaje decimal(4,2),
	  @aplicasobre char(1),
	  @estatus bit)
AS
BEGIN
	UPDATE [dbo].[TB_IMPUESTO]
    SET 
       [NOMBRE] = IsNull(@nombre, NOMBRE)
      ,[PORCENTAJE] = IsNull(@porcentaje, PORCENTAJE)
      ,[ESTATUS] = IsNull(@estatus, ESTATUS)
    WHERE [ID_IMPUESTO] = @id_impuesto
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVendidosxSorteoDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVendidosxSorteoDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVendidosxSorteoDominio]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVendidosxSorteoDominio](
	  @fecha datetime,
	  @id_sorteo int,
	  @id_usuario int,
	  @id_juego int)
AS
BEGIN 
	SELECT 
		COUNT(E.ID_ITEM) as CANTIDAD_VENDIDA, 
		SUM(E.MONTO_APUESTA) AS MONTO_VENDIDO, 
		A.NOMBRE AS NOMBRE_JUEGO, 
		C.HORA AS HORA, 
		D.NOMBRE AS NOMBRE_ITEM,
		D.VALOR AS NUMERO_ITEM,
		SUM(E.MONTO_APUESTA * A.FACTORPAGO) AS POSIBLE_PERDIDA
	FROM
	TB_JUEGO A
	JOIN TB_SORTEO C
	ON A.ID_JUEGO = C.ID_JUEGO
	JOIN TB_ITEM D
	ON A.ID_JUEGO = D.ID_JUEGO
	JOIN TB_JUGADA E
	ON D.ID_ITEM = E.ID_ITEM AND A.ID_JUEGO = E.ID_JUEGO AND C.ID_SORTEO = E.ID_SORTEO
	JOIN TB_TICKET F
	ON E.ID_TICKET = F.ID_TICKET
	JOIN TB_USUARIO G
	ON F.ID_USUARIO = G.ID_USUARIO
	JOIN TB_USUARIO H
	ON G.ID_USUARIOPADRE = H.ID_USUARIO	
	JOIN TB_USUARIO I
	ON H.ID_USUARIOPADRE = I.ID_USUARIO	
	JOIN TB_USUARIO J
	ON I.ID_USUARIOPADRE = J.ID_USUARIO	
	JOIN TB_USUARIO K
	ON J.ID_USUARIOPADRE = K.ID_USUARIO	
	WHERE CAST(F.FECHA_HORA AS DATE) BETWEEN CAST(@fecha AS DATE)
	AND CAST(@fecha + 1 AS DATE) AND K.ID_USUARIO = @id_usuario
	AND E.ID_JUEGO = @id_juego
	AND E.ID_SORTEO = @id_sorteo
	GROUP BY  A.NOMBRE, C.HORA, D.NOMBRE, D.VALOR
END
GO


-- ----------------------------
-- Procedure structure for sp_RegistrarJugada
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RegistrarJugada]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RegistrarJugada]
GO

CREATE PROCEDURE [dbo].[sp_RegistrarJugada](
	  @id_ticket int,
	  @id_sorteo int,
	  @id_juego int,
	  @id_item int,
	  @id_conjunto int,
	  @montoapuesta money)
AS
BEGIN
		 INSERT INTO [dbo].[TB_JUGADA]
           (ID_TICKET
           ,ID_SORTEO
           ,ID_JUEGO
           ,ID_ITEM
           ,ID_CONJUNTO
           ,MONTO_APUESTA
           ,ESTATUS)
		 VALUES
			   (@id_ticket
			   ,@id_sorteo
			   ,@id_juego
			   ,@id_item
			   ,@id_conjunto
			   ,@montoapuesta
			   ,1);
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarEstatusUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarEstatusUsuario]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarEstatusUsuario]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarEstatusUsuario](
	  @id_usuario int,
	  @estatus int)
AS
BEGIN
	UPDATE [dbo].[TB_USUARIO] SET 
            [ESTATUS] = IsNull(@estatus, ESTATUS)
     WHERE  ID_USUARIO = @id_usuario;
END
GO


-- ----------------------------
-- Procedure structure for sp_ReporteVendidosxSorteoAdministrador
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ReporteVendidosxSorteoAdministrador]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ReporteVendidosxSorteoAdministrador]
GO

CREATE PROCEDURE [dbo].[sp_ReporteVendidosxSorteoAdministrador](
	  @fecha datetime,
	  @id_sorteo int,
	  @id_usuario int,
	  @id_juego int)
AS
BEGIN 
	SELECT 
		COUNT(E.ID_ITEM) as CANTIDAD_VENDIDA, 
		SUM(E.MONTO_APUESTA) AS MONTO_VENDIDO, 
		A.NOMBRE AS NOMBRE_JUEGO, 
		C.HORA AS HORA, 
		D.NOMBRE AS NOMBRE_ITEM,
		D.VALOR AS NUMERO_ITEM,
		SUM(E.MONTO_APUESTA * A.FACTORPAGO) AS POSIBLE_PERDIDA
	FROM
	TB_JUEGO A
	JOIN TB_SORTEO C
	ON A.ID_JUEGO = C.ID_JUEGO
	JOIN TB_ITEM D
	ON A.ID_JUEGO = D.ID_JUEGO
	JOIN TB_JUGADA E
	ON D.ID_ITEM = E.ID_ITEM AND A.ID_JUEGO = E.ID_JUEGO AND C.ID_SORTEO = E.ID_SORTEO
	JOIN TB_TICKET F
	ON E.ID_TICKET = F.ID_TICKET
	JOIN TB_USUARIO G
	ON F.ID_USUARIO = G.ID_USUARIO
	JOIN TB_USUARIO H
	ON G.ID_USUARIOPADRE = H.ID_USUARIO	
	JOIN TB_USUARIO I
	ON H.ID_USUARIOPADRE = I.ID_USUARIO	
	JOIN TB_USUARIO J
	ON I.ID_USUARIOPADRE = J.ID_USUARIO	
	JOIN TB_USUARIO K
	ON J.ID_USUARIOPADRE = K.ID_USUARIO	
	JOIN TB_USUARIO L
	ON K.ID_USUARIOPADRE = L.ID_USUARIO	
	WHERE CAST(F.FECHA_HORA AS DATE) BETWEEN CAST(@fecha AS DATE)
	AND CAST(@fecha + 1 AS DATE) AND L.ID_USUARIO = @id_usuario
	AND E.ID_JUEGO = @id_juego
	AND E.ID_SORTEO = @id_sorteo
	GROUP BY  A.NOMBRE, C.HORA, D.NOMBRE, D.VALOR
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarEstatusJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarEstatusJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarEstatusJuego]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarEstatusJuego](
	  @id_juego int,
	  @estatus int)
AS
BEGIN
	UPDATE [dbo].[TB_JUEGO] SET 
            [ESTATUS] = IsNull(@estatus, ESTATUS)
     WHERE  ID_JUEGO = @id_juego;
END
GO


-- ----------------------------
-- Procedure structure for sp_CancelarJugada
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_CancelarJugada]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_CancelarJugada]
GO

CREATE PROCEDURE [dbo].[sp_CancelarJugada](
	  @serial varchar(150))
AS
BEGIN
	UPDATE [dbo].[TB_TICKET] SET [ESTATUS] = 3
    WHERE  SERIAL = @serial;
    
    UPDATE TB_JUGADA SET
			ESTATUS = 3 --Item Eliminado
		WHERE ID_JUGADA IN (SELECT ID_JUGADA FROM TB_JUGADA A
		JOIN TB_TICKET B
		ON A.ID_TICKET = B.ID_TICKET
		WHERE B.SERIAL = @serial);
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarEstatusImpuesto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarEstatusImpuesto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarEstatusImpuesto]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarEstatusImpuesto](
	  @id_impuesto int,
	  @estatus int)
AS
BEGIN
	UPDATE [dbo].[TB_IMPUESTO] SET 
            [ESTATUS] = IsNull(@estatus, ESTATUS)
     WHERE  ID_IMPUESTO = @id_impuesto;
END
GO


-- ----------------------------
-- Procedure structure for sp_ValidarTicketCancelacion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ValidarTicketCancelacion]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ValidarTicketCancelacion]
GO

CREATE PROCEDURE [dbo].[sp_ValidarTicketCancelacion](
	  @serial varchar(150),
	  @tiempo int)
AS
BEGIN
	SELECT ID_TICKET FROM TB_TICKET 
	WHERE SERIAL = @serial AND datediff(minute, FECHA_HORA, GETDATE()) < @tiempo;
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarEstatusDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarEstatusDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarEstatusDominio]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarEstatusDominio](
	  @id_dominio int,
	  @estatus int)
AS
BEGIN
	UPDATE [dbo].[TB_DOMINIO] SET 
            [ESTATUS] = IsNull(@estatus, ESTATUS)
     WHERE  ID_DOMINIO = @id_dominio;
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarDominio]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarDominio](
	  @id_dominio int,
      @nombre varchar(50),
      @numeroidentificacion varchar(50),
      @direccion varchar(500),
      @telefono varchar(10),
      @banqueo bit,
      @porcentaje decimal(18,2),
      @estatus bit)
AS
BEGIN
	UPDATE [dbo].[TB_DOMINIO] SET 
            [NOMBRE] = IsNull(@nombre, NOMBRE)
           ,[NUMEROIDENTIFICACION] = IsNull(@numeroidentificacion, NUMEROIDENTIFICACION)
           ,[DIRECCION] = IsNull(@direccion, DIRECCION)
           ,[TELEFONO] = IsNull(@telefono, TELEFONO)
           ,[BANQUEO] = IsNull(@banqueo, BANQUEO)
           ,[PORCENTAJE] = IsNull(@porcentaje, PORCENTAJE)
           ,[ESTATUS] = IsNull(@estatus, ESTATUS)
     WHERE  ID_DOMINIO = @id_dominio;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarTicket
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarTicket]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarTicket]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarTicket](
	@serial varchar(150),
	@id_usuario int)
AS
BEGIN
	SELECT ID_TICKET FROM
	TB_TICKET
	WHERE SERIAL = @serial AND ID_USUARIO = @id_usuario
	AND ESTATUS <> 3;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarUsuario]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarUsuario]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarUsuario](
	  @id_usuario int,
	  @id_dominio int,
	  @id_tipousuario int,
	  @id_usuariopadre int,
      @nombre varchar(50),
      @apellido varchar(50),
      @numeroidentificacion varchar(50),
      @usuario varchar(50),
      @correoelectronico varchar(250),
	  @caducidad int,
      @estatus int,
	  @clave varchar(1000))
AS
BEGIN
	UPDATE [dbo].[TB_USUARIO] SET 
	     	[ID_DOMINIO] = IsNull(@id_dominio, ID_DOMINIO),
			[ID_TIPOUSUARIO] = IsNull(@id_tipousuario, ID_TIPOUSUARIO),
			[ID_USUARIOPADRE] = IsNull(@id_usuariopadre, ID_USUARIOPADRE),
            [NOMBRE] = IsNull(@nombre, NOMBRE),
            [APELLIDO] = IsNull(@apellido, APELLIDO),
            [NUMEROIDENTIFICACION] = IsNull(@numeroidentificacion, NUMEROIDENTIFICACION),
            [USUARIO] = IsNull(@usuario, USUARIO),
            [CORREOELECTRONICO] = IsNull(@correoelectronico, CORREOELECTRONICO),
            [CADUCIDAD] = IsNull(@caducidad, CADUCIDAD),
   			[ESTATUS] = IsNull(@estatus, ESTATUS),
			[CLAVE] = IsNull(@clave, CLAVE)
     WHERE  ID_USUARIO = @id_usuario;
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarJuego]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarJuego](
	  @id_juego int,
	  @nombre varchar(50),
	  @factor int,
	  @tiempo_cierre int,
	  @estatus int)
AS
BEGIN
	UPDATE [dbo].[TB_JUEGO] SET 
            [NOMBRE] = IsNull(@nombre, NOMBRE),
            [ESTATUS] = IsNull(@estatus, ESTATUS),
            [FACTORPAGO] = IsNull(@factor, FACTORPAGO),
			[TIEMPOCIERRE] = IsNull(@tiempo_cierre, TIEMPOCIERRE)
     WHERE  ID_JUEGO = @id_juego;
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarConjunto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarConjunto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarConjunto]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarConjunto](
	  @id_juego int,
	  @id_conjunto int,
      @nombre varchar(50),
      @monto money,
      @estatus bit)
AS
BEGIN
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_CONJUNTO]
        WHERE [ID_CONJUNTO] = @id_conjunto
		AND ID_JUEGO = @id_juego
		AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
		BEGIN
			UPDATE [dbo].[TB_CONJUNTO] 
			SET
				 [NOMBRE] = IsNull(@nombre, NOMBRE)
				,[MONTO] = IsNull(@monto, MONTO)
				,[ESTATUS] = IsNull(@estatus, ESTATUS)
			WHERE [ID_CONJUNTO] = @id_conjunto
			AND ID_JUEGO = @id_juego;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[TB_CONJUNTO]
			   ([ID_JUEGO]
			   ,[NOMBRE]
			   ,[MONTO]
			   ,[ESTATUS])
			 VALUES
				(@id_juego,
				@nombre,
				@monto,
				1);
		END
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarItem]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarItem](
	  @id_item int,
	  @id_juego int,
	  @nombre varchar(50),
	  @valor varchar(4),
	  @cupo int,
	  @monto money,
	  @estatus bit)
AS
BEGIN
	
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_ITEM] WHERE
        [ID_ITEM] = @id_item
		AND ID_JUEGO = @id_juego
		AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
		BEGIN
			UPDATE [dbo].[TB_ITEM]
			SET 
				  [NOMBRE] = IsNull(@nombre, NOMBRE)
				 ,[VALOR] = IsNull(@valor, VALOR)
				 ,[CUPO] = IsNull(@cupo, CUPO)
				 ,[MONTO] = IsNull(@monto, MONTO)
				 ,[ESTATUS] = IsNull(@estatus, ESTATUS)
			 WHERE 
				[ID_ITEM] = @id_item
				AND ID_JUEGO = @id_juego;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[TB_ITEM]
			   (ID_JUEGO
			   ,NOMBRE
			   ,VALOR
			   ,CUPO
			   ,MONTO
			   ,ESTATUS)
			VALUES
			   (@id_juego
			   ,@nombre
			   ,@valor
			   ,@cupo
			   ,@monto
			   ,1);
		END
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarImpuestosDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarImpuestosDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarImpuestosDominio]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarImpuestosDominio](
	  @id_dominio int,
	  @id_impuesto int,
	  @estatus int)
AS
BEGIN
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_DOMINIO_IMPUESTO] WHERE
        ID_DOMINIO = @id_dominio
        AND  ID_IMPUESTO = @id_impuesto);
    
    IF (@ASIGNADO <> 0)
		BEGIN
			UPDATE [TB_DOMINIO_IMPUESTO]
				SET ESTATUS = @estatus
			WHERE 
				ID_DOMINIO = @id_dominio
				AND  ID_IMPUESTO = @id_impuesto;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[TB_DOMINIO_IMPUESTO]
			   ([ID_DOMINIO]
			   ,[ID_IMPUESTO]
			   ,[ESTATUS])
			VALUES
				(@id_dominio,
				@id_impuesto,
				1);
		END   
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarConjuntoxJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarConjuntoxJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarConjuntoxJuego]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarConjuntoxJuego](
	  @id_juego int)
AS
BEGIN
	SELECT * FROM
	TB_CONJUNTO 
	WHERE ID_JUEGO = @id_juego;  
END
GO


-- ----------------------------
-- Procedure structure for sp_AsignarImpuestoDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AsignarImpuestoDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_AsignarImpuestoDominio]
GO

CREATE PROCEDURE [dbo].[sp_AsignarImpuestoDominio](
	  @id_dominio int,
	  @id_impuesto int)
AS
BEGIN

	INSERT INTO [dbo].[TB_DOMINIO_IMPUESTO]
           ([ID_DOMINIO]
           ,[ID_IMPUESTO]
           ,[ESTATUS])
     VALUES
           (@id_dominio,
           @id_impuesto,
           1);
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarUsuarioJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarUsuarioJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarUsuarioJuego]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarUsuarioJuego](
       @id_usuario int,
       @id_juego int,
       @max_venta money, 
       @max_posible_perdida money,
       @max_ticket_item int,
       @max_ticket int,
       @estatus int)
AS
BEGIN

	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_USUARIO_JUEGO] WHERE
        [ID_USUARIO] = @id_usuario
        AND  [ID_JUEGO] = @id_juego AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
		BEGIN     
			UPDATE [dbo].[TB_USUARIO_JUEGO]
			SET
				[MAX_VENTA] = IsNull(@max_venta, MAX_VENTA)
			   ,[MAX_POSIBLE_PERDIDA] = IsNull(@max_posible_perdida, MAX_POSIBLE_PERDIDA)
			   ,[MAX_TICKET_ITEM]= IsNull(@max_ticket_item, MAX_TICKET_ITEM)
			   ,[MAX_TICKET] = IsNull(@max_ticket, MAX_TICKET)
			   ,[ESTATUS] = IsNull(@estatus, ESTATUS)
			WHERE
				[ID_USUARIO] = @id_usuario
				AND  [ID_JUEGO] = @id_juego;
		END
	ELSE
		BEGIN 
			INSERT INTO [dbo].[TB_USUARIO_JUEGO]
			   ([ID_USUARIO]
			   ,[ID_JUEGO]
			   ,[MAX_VENTA]
			   ,[MAX_POSIBLE_PERDIDA]
			   ,[MAX_TICKET_ITEM]
			   ,[MAX_TICKET]
			   ,[ESTATUS])
			 VALUES
				   (@id_usuario,
				   @id_juego,
				   @max_venta,
				   @max_posible_perdida,
				   @max_ticket_item,
				   @max_ticket,
				   1);
		END   
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarSorteo]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarSorteo](
	  @id_sorteo int,
	  @id_juego int,
	  @hora time(7),
	  @estatus bit)
AS
BEGIN
	
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_SORTEO] WHERE
        [ID_SORTEO] = @id_sorteo
		AND ID_JUEGO = @id_juego
		AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
	BEGIN
		UPDATE [dbo].[TB_SORTEO]
		SET 
			  [HORA] = IsNull(@hora, HORA)
			 ,[ESTATUS] = IsNull(@estatus, ESTATUS)
		 WHERE 
			[ID_SORTEO] = @id_sorteo
			AND ID_JUEGO = @id_juego;
	END
	ELSE
	BEGIN
		 INSERT INTO [dbo].[TB_SORTEO]
           (ID_JUEGO
           ,HORA
           ,ESTATUS)
		 VALUES
			   (@id_juego
			   ,@hora
			   ,1);
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarItemsxJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarItemsxJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarItemsxJuego]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarItemsxJuego](
	  @id_juego int)
AS
BEGIN
	SELECT * FROM
	TB_ITEM 
	WHERE ID_JUEGO = @id_juego;  
END
GO


-- ----------------------------
-- Procedure structure for sp_EliminarImpuestosDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_EliminarImpuestosDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_EliminarImpuestosDominio]
GO

CREATE PROCEDURE [dbo].[sp_EliminarImpuestosDominio](
	  @id_dominio int)
AS
BEGIN

	DELETE[dbo].[TB_DOMINIO_IMPUESTO]
    WHERE
           [ID_DOMINIO] = @id_dominio;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarSorteosxJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarSorteosxJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarSorteosxJuego]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarSorteosxJuego](
	  @id_juego int)
AS
BEGIN
	SELECT * FROM
	TB_SORTEO 
	WHERE ID_JUEGO = @id_juego;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarJuegosUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarJuegosUsuario]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarJuegosUsuario]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarJuegosUsuario](
	  @id_usuario int)
AS
BEGIN
	SELECT 
		B.ID_USUARIOJUEGO,
		A.ID_USUARIO,
		C.ID_JUEGO,
		C.NOMBRE,
		C.FACTORPAGO,
		B.MAX_POSIBLE_PERDIDA,
		B.MAX_TICKET,
		B.MAX_TICKET_ITEM,
		B.MAX_VENTA,
		C.TIEMPOCIERRE,
		C.ESTATUS 
	FROM dbo.[TB_USUARIO] A
	JOIN dbo.[TB_USUARIO_JUEGO] B
	ON A.ID_USUARIO = B.ID_USUARIO
	JOIN dbo.[TB_JUEGO] C
	ON B.ID_JUEGO = C.ID_JUEGO
	WHERE A.ID_USUARIO = @id_usuario AND C.ESTATUS = 1;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuarioSorteoItems
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuarioSorteoItems]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuarioSorteoItems]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuarioSorteoItems](
	  @id_usuario int,
	  @id_sorteo int)
AS
BEGIN
	SELECT 
		A.ID_ITEM,
		A.MONTO_MAX,
		A.CUPO_MAX,
		B.NOMBRE,
		B.VALOR,
		B.CUPO,
		B.MONTO,
		B.ESTATUS
	FROM 
	dbo.[TB_USUARIO_SORTEO_ITEM] A
	JOIN dbo.[TB_ITEM] B
	ON A.ID_ITEM = B.ID_ITEM
	WHERE A.ID_USUARIO = @id_usuario
	AND A.ID_SORTEO = @id_sorteo;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuarioOpcionMenu
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuarioOpcionMenu]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuarioOpcionMenu]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuarioOpcionMenu](
	  @usuario varchar(50))
AS
BEGIN
	DECLARE @INTERNO INT;
	
	SET @INTERNO = (SELECT A.ID_TIPOUSUARIO FROM TB_USUARIO A
	JOIN TB_TIPOUSUARIO B
	ON A.ID_TIPOUSUARIO = B.ID_TIPOUSUARIO
    WHERE A.USUARIO = @usuario
    AND (/*B.DESCRIPCION = 'Administrador' OR*/ B.DESCRIPCION = 'Interno'))
		
	IF(@INTERNO IS NULL)
	BEGIN
		SELECT 
			D.ID_OPCIONMENU,
			D.NOMBRE,
			D.DESCRIPCION,
			D.POSICION,
			D.URL,
			D.ID_OPCIONMENUPADRE,
			D.ESTATUS
		FROM
		dbo.TB_USUARIO A
		JOIN TB_TIPOUSUARIO AS B
		ON A.ID_TIPOUSUARIO = B.ID_TIPOUSUARIO
		JOIN TB_TIPOUSUARIO_OPCIONMENU C
		ON B.ID_TIPOUSUARIO = C.ID_TIPOUSUARIO
		JOIN TB_OPCIONMENU D
		ON C.ID_OPCIONMENU = D.ID_OPCIONMENU
		WHERE A.USUARIO = @usuario and D.ESTATUS = 1
		ORDER BY D.POSICION;
	END
	ELSE
	BEGIN
		SELECT 
			C.ID_OPCIONMENU,
			C.NOMBRE,
			C.DESCRIPCION,
			C.POSICION,
			C.URL,
			C.ID_OPCIONMENUPADRE,
			C.ESTATUS
		FROM
		dbo.TB_USUARIO A
		JOIN TB_USUARIO_OPCIONMENU AS B
		ON A.ID_USUARIO = B.ID_USUARIO
		JOIN TB_OPCIONMENU C
		ON B.ID_OPCIONMENU = C.ID_OPCIONMENU
		WHERE A.USUARIO = @usuario and B.ESTATUS = 1
		ORDER BY C.POSICION;
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuarioJuegoSorteos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuarioJuegoSorteos]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuarioJuegoSorteos]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuarioJuegoSorteos](
	  @id_usuario int,
	  @id_juego int)
AS
BEGIN
	SELECT 
		D.ID_JUEGO,
		C.ID_SORTEO,
		C.HORA,
		B.ESTATUS
	FROM dbo.[TB_USUARIO] A
	JOIN dbo.[TB_USUARIO_SORTEO] B
	ON A.ID_USUARIO = B.ID_USUARIO
	JOIN dbo.[TB_SORTEO] C
	ON B.ID_SORTEO = C.ID_SORTEO
	JOIN dbo.[TB_JUEGO] D
	ON C.ID_JUEGO = D.ID_JUEGO
	WHERE A.ID_USUARIO = @id_usuario AND D.ID_JUEGO = @id_juego;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarDatosUsuarioxLoginPassword
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarDatosUsuarioxLoginPassword]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarDatosUsuarioxLoginPassword]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarDatosUsuarioxLoginPassword](
	  @usuario varchar(50),
	  @clave varchar(1000))
AS
BEGIN

	DECLARE @tipo INT 
	SET @tipo = (SELECT COUNT(ID_USUARIO) FROM TB_USUARIO WHERE USUARIO = @usuario AND (ID_TIPOUSUARIO = 1
	OR ID_TIPOUSUARIO = 7))
	
	IF @tipo = 0
	BEGIN
		SELECT A.ID_USUARIO,
		A.ID_DOMINIO,
		A.ID_USUARIOPADRE,
		A.ID_TIPOUSUARIO,
		B.DESCRIPCION,
		A.NOMBRE,
		A.APELLIDO,
		A.NUMEROIDENTIFICACION,
		A.CORREOELECTRONICO,
		A.USUARIO,
		A.CADUCIDAD,
		C.COMISIONPARTICIPACION,
		C.COMISIONVENTA,
		A.ESTATUS
		FROM dbo.[TB_USUARIO] A
		JOIN dbo.TB_TIPOUSUARIO B
		ON A.ID_TIPOUSUARIO = B.ID_TIPOUSUARIO
		JOIN dbo.[TB_COMISION] C
		ON A.ID_USUARIO = C.ID_USUARIO
		WHERE USUARIO = @usuario AND CLAVE = @clave AND A.ESTATUS <> 3 AND C.ESTATUS = 1 AND C.FECHAFIN IS NULL;
	END
	ELSE
	BEGIN 
		SELECT A.ID_USUARIO,
		A.ID_DOMINIO,
		A.ID_USUARIOPADRE,
		A.ID_TIPOUSUARIO,
		B.DESCRIPCION,
		A.NOMBRE,
		A.APELLIDO,
		A.NUMEROIDENTIFICACION,
		A.CORREOELECTRONICO,
		A.USUARIO,
		A.CADUCIDAD,
		NULL AS COMISIONPARTICIPACION,
		NULL AS COMISIONVENTA,
		A.ESTATUS
		FROM dbo.[TB_USUARIO] A
		JOIN dbo.TB_TIPOUSUARIO B
		ON A.ID_TIPOUSUARIO = B.ID_TIPOUSUARIO
		WHERE USUARIO = @usuario AND CLAVE = @clave AND A.ESTATUS <> 3;
	END
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarItem]
GO

CREATE PROCEDURE [dbo].[sp_InsertarItem](
	  @id_juego int,
	  @nombre varchar(50),
	  @valor varchar(4),
	  @cupo int,
	  @monto money)
AS
BEGIN
	INSERT INTO [dbo].[TB_ITEM]
           (ID_JUEGO
           ,NOMBRE
           ,VALOR
           ,CUPO
           ,MONTO
           ,ESTATUS)
     VALUES
           (@id_juego
           ,@nombre
           ,@valor
           ,@cupo
           ,@monto
           ,1);
       
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarDatoUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarDatoUsuario]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarDatoUsuario]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarDatoUsuario](
	  @usuario varchar(50),
	  @clave varchar(1000))
AS
BEGIN
	UPDATE [dbo].[TB_USUARIO] SET 
   			[CLAVE] = IsNull(@clave, CLAVE)
     WHERE  USUARIO = @usuario;
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarDominioImpuesto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarDominioImpuesto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarDominioImpuesto]
GO

CREATE PROCEDURE [dbo].[sp_InsertarDominioImpuesto](
      @id_impuesto int,
      @id_dominio int)
AS
BEGIN
	INSERT INTO [dbo].[TB_DOMINIO_IMPUESTO]
           ([ID_IMPUESTO]
           ,[ID_DOMINIO]
           ,[ESTATUS])
     VALUES
           (@id_impuesto,
           @id_dominio,
           1);
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarConjunto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarConjunto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarConjunto]
GO

CREATE PROCEDURE [dbo].[sp_InsertarConjunto](
	  @id_juego int,
      @nombre varchar(50),
      @monto money)
AS
BEGIN
	INSERT INTO [dbo].[TB_CONJUNTO]
           ([ID_JUEGO]
           ,[NOMBRE]
           ,[MONTO]
           ,[ESTATUS])
     VALUES
           (@id_juego,
            @nombre,
            @monto,
            1)
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarImpuestosxDominio
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarImpuestosxDominio]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarImpuestosxDominio]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarImpuestosxDominio](
	  @id_dominio int)
AS
BEGIN
	SELECT 
		A.ID_DOMINIO,
		C.ID_IMPUESTO,
		C.NOMBRE,
		C.PORCENTAJE,
		C.APLICASOBRE,
		B.ESTATUS
	FROM
	dbo.TB_DOMINIO A
	JOIN TB_DOMINIO_IMPUESTO AS B
	ON A.ID_DOMINIO = B.ID_DOMINIO
	JOIN TB_IMPUESTO C
	ON B.ID_IMPUESTO = C.ID_IMPUESTO
	WHERE A.ID_DOMINIO = @id_dominio; 
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarUsuarioJuego
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarUsuarioJuego]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarUsuarioJuego]
GO

CREATE PROCEDURE [dbo].[sp_InsertarUsuarioJuego](
       @id_usuario int,
       @id_juego int,
       @max_venta money, 
       @max_posible_perdida money,
       @max_ticket_item int,
       @max_ticket int)
AS
BEGIN
	INSERT INTO [dbo].[TB_USUARIO_JUEGO]
           ([ID_USUARIO]
           ,[ID_JUEGO]
           ,[MAX_VENTA]
           ,[MAX_POSIBLE_PERDIDA]
           ,[MAX_TICKET_ITEM]
           ,[MAX_TICKET]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @id_juego,
           @max_venta,
           @max_posible_perdida,
           @max_ticket_item,
           @max_ticket,
           1)
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarSorteo]
GO

CREATE PROCEDURE [dbo].[sp_InsertarSorteo](
	  @id_sorteo int OUTPUT,
	  @id_juego int,
	  @hora datetime)
AS
BEGIN
	INSERT INTO [dbo].[TB_SORTEO]
           (ID_JUEGO
           ,HORA
           ,ESTATUS)
     VALUES
           (@id_juego
           ,@hora
           ,1);
    
    SELECT @id_sorteo = @@IDENTITY;     
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarUsuarioJuegoConjunto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarUsuarioJuegoConjunto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarUsuarioJuegoConjunto]
GO

CREATE PROCEDURE [dbo].[sp_InsertarUsuarioJuegoConjunto](
       @id_usuario int,
       @id_conjunto int,
       @id_juego int,
       @monto_max money)
AS
BEGIN
	INSERT INTO [dbo].[TB_USUARIO_JUEGO_CONJUNTO]
           ([ID_USUARIO]
           ,[ID_JUEGO]
           ,[ID_CONJUNTO]
           ,[MONTO_MAX]
           ,[ESTATUS])
     VALUES
           (@id_usuario,
           @id_juego,
           @id_conjunto,
           @monto_max,
           1)
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarSorteoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarSorteoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarSorteoItem]
GO

CREATE PROCEDURE [dbo].[sp_InsertarSorteoItem](
	  @id_juego int OUTPUT,
	  @hora time,
	  @valor varchar(4),
	  @cupo int,
	  @monto money)
AS
BEGIN
	DECLARE @id_item int;
	
	SET @id_item = (SELECT ID_ITEM from TB_ITEM where ID_JUEGO = @id_juego AND VALOR = @valor);
	
	DECLARE @id_sorteo int;
	
	SET @id_sorteo = (SELECT ID_SORTEO from TB_SORTEO where ID_JUEGO = @id_juego AND HORA = @hora);
	
	INSERT INTO [dbo].[TB_SORTEO_ITEM]
           (ID_SORTEO
           ,ID_ITEM
           ,CUPO
           ,MONTO
           ,ESTATUS)
     VALUES
           (@id_sorteo
           ,@id_item
           ,@cupo
           ,@monto
           ,1);
        
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarSorteoDia
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarSorteoDia]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarSorteoDia]
GO

CREATE PROCEDURE [dbo].[sp_InsertarSorteoDia](
	  @id_dia int,
	  @id_sorteo int,
	  @estatus int)
AS
BEGIN
	INSERT INTO [dbo].[TB_DIA_SORTEO](
			ID_SORTEO
           ,ID_DIA
           ,ESTATUS)
     VALUES
           (@id_sorteo
           ,@id_dia
           ,@estatus);
       
END
GO


-- ----------------------------
-- Procedure structure for sp_InsertarConjuntoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_InsertarConjuntoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_InsertarConjuntoItem]
GO

CREATE PROCEDURE [dbo].[sp_InsertarConjuntoItem](
	  @id_juego int,
	  @nombreconjunto varchar(50),
	  @valoritem varchar(4),
	  @cupo int,
	  @monto money)
AS
BEGIN
	DECLARE @id_item int;
	
	SET @id_item = (SELECT ID_ITEM from TB_ITEM where ID_JUEGO = @id_juego AND VALOR = @valoritem);
	
	DECLARE @id_conjunto int;
	
	SET @id_conjunto = (SELECT ID_CONJUNTO from TB_CONJUNTO where ID_JUEGO = @id_juego AND NOMBRE = @nombreconjunto);
	
	INSERT INTO [dbo].[TB_CONJUNTO_ITEM]
           ([ID_ITEM]
           ,[ID_CONJUNTO]
           ,[CUPO_MAX]
           ,[MONTO_MAX]
           ,[ESTATUS])
     VALUES
           (@id_item,
           @id_conjunto,
           @cupo,
           @monto,
           1);
        
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarUsuarioJuegoConjuntos
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarUsuarioJuegoConjuntos]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarUsuarioJuegoConjuntos]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarUsuarioJuegoConjuntos](
	  @id_usuario int,
	  @id_juego int)
AS
BEGIN
	SELECT 
		B.ID_USUARIOJUEGOCONJUNTO,
		D.ID_CONJUNTO,
		A.ID_USUARIO,
		C.ID_JUEGO,
		D.NOMBRE,
		D.MONTO,
		B.MONTO_MAX,
		B.ESTATUS 
	FROM dbo.[TB_USUARIO] A
	JOIN dbo.[TB_USUARIO_JUEGO_CONJUNTO] B
	ON A.ID_USUARIO = B.ID_USUARIO
	JOIN dbo.[TB_JUEGO] C
	ON B.ID_JUEGO = C.ID_JUEGO
	JOIN dbo.[TB_CONJUNTO] D
	ON B.ID_CONJUNTO = D.ID_CONJUNTO
	WHERE A.ID_USUARIO = @id_usuario AND C.ID_JUEGO = @id_juego;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarItemsxSorteo
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarItemsxSorteo]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarItemsxSorteo]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarItemsxSorteo](
	  @id_juego int,
	  @id_sorteo int)
AS
BEGIN
	SELECT 
		A.ID_SORTEO,
		C.ID_ITEM,
		C.NOMBRE,
		C.VALOR,
		B.CUPO,
		B.MONTO,
		B.ESTATUS
	FROM
	dbo.TB_SORTEO_ITEM B
	JOIN [TB_SORTEO] A
	ON B.ID_SORTEO = A.ID_SORTEO
	JOIN dbo.TB_ITEM C
	ON B.ID_ITEM = C.ID_ITEM
	WHERE A.ID_JUEGO = @id_juego
	AND B.ID_SORTEO = @id_sorteo;  
END
GO


-- ----------------------------
-- Procedure structure for sp_ValidarAperturasUsuario
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ValidarAperturasUsuario]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ValidarAperturasUsuario]
GO

CREATE PROCEDURE [dbo].[sp_ValidarAperturasUsuario](
	  @id_usuario int )
AS
BEGIN
	SELECT ID_APERTURA FROM TB_APERTURA 
	WHERE ID_USUARIO = @id_usuario
	AND ESTATUS = 1;
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarItemsxConjunto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarItemsxConjunto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarItemsxConjunto]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarItemsxConjunto](
	  @id_juego int,
	  @id_conjunto int)
AS
BEGIN
	SELECT 
		A.ID_CONJUNTO,
		C.ID_ITEM,
		C.NOMBRE,
		C.VALOR,
		B.CUPO_MAX,
		B.MONTO_MAX,
		B.ESTATUS
	FROM
	dbo.TB_CONJUNTO_ITEM B
	JOIN [TB_CONJUNTO] A
	ON B.ID_CONJUNTO = A.ID_CONJUNTO
	JOIN dbo.TB_ITEM C
	ON B.ID_ITEM = C.ID_ITEM
	WHERE A.ID_JUEGO = @id_juego
	AND A.ID_CONJUNTO = @id_conjunto;  
END
GO


-- ----------------------------
-- Procedure structure for sp_RegistrarApertura
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RegistrarApertura]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_RegistrarApertura]
GO

CREATE PROCEDURE [dbo].[sp_RegistrarApertura](
	  @id_apertura int OUTPUT,
	  @id_usuario int,
	  @monto_apertura money)
AS
BEGIN
		 INSERT INTO [dbo].[TB_APERTURA]
           (ID_USUARIO
           ,MONTO_APERTURA
           ,ESTATUS)
		 VALUES
			   (@id_usuario
			   ,@monto_apertura
			   ,1);
			   
	SELECT  @id_apertura = @@IDENTITY ;
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarUsuarioJuegoConjunto
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarUsuarioJuegoConjunto]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarUsuarioJuegoConjunto]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarUsuarioJuegoConjunto](
       @id_usuario int,
       @id_conjunto int,
       @id_juego int,
       @monto_max money,
       @estatus int)
AS
BEGIN
	
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_USUARIO_JUEGO_CONJUNTO] WHERE
        [ID_USUARIO] = @id_usuario
		AND [ID_JUEGO] = @id_juego
        AND [ID_CONJUNTO] = @id_conjunto
        AND ESTATUS = 1);
        
    IF (@ASIGNADO <> 0)
		BEGIN       
			UPDATE [dbo].[TB_USUARIO_JUEGO_CONJUNTO]
			SET
				   [MONTO_MAX] = IsNull(@monto_max, MONTO_MAX),
				   [ESTATUS] = IsNull(@estatus, ESTATUS)
			WHERE 
				[ID_USUARIO] = @id_usuario
				AND [ID_JUEGO] = @id_juego
				AND [ID_CONJUNTO] = @id_conjunto;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[TB_USUARIO_JUEGO_CONJUNTO]
			   ([ID_USUARIO]
			   ,[ID_JUEGO]
			   ,[ID_CONJUNTO]
			   ,[MONTO_MAX]
			   ,[ESTATUS])
		    VALUES
			   (@id_usuario,
			   @id_juego,
			   @id_conjunto,
			   @monto_max,
			   1);
		END     
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarSorteoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarSorteoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarSorteoItem]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarSorteoItem](
	  @id_sorteo int,
	  @id_item int,
	  @id_juego int,
	  @hora time,
	  @valor varchar(4),
	  @cupo int,
	  @monto money,
	  @estatus bit)
AS
BEGIN
    DECLARE @ID_ITEM_T int;
    DECLARE @ID_SORTEO_T int;
	DECLARE @ASIGNADO INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_SORTEO_ITEM] WHERE
       [ID_SORTEO] = @id_sorteo AND [ID_ITEM] = @id_item
       AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
		BEGIN
			UPDATE [dbo].[TB_SORTEO_ITEM]
			SET 
				  [CUPO] = IsNull(@cupo, CUPO)
				 ,[MONTO] = IsNull(@monto, MONTO)
				 ,[ESTATUS] = IsNull(@estatus, ESTATUS)
			 WHERE 
				[ID_SORTEO] = @id_sorteo AND [ID_ITEM] = @id_item;
		END
	ELSE
		BEGIN
			SET @ID_ITEM_T = (SELECT ID_ITEM from TB_ITEM where ID_JUEGO = @id_juego AND VALOR = @valor);
			SET @ID_SORTEO_T = (SELECT ID_SORTEO from TB_SORTEO where ID_JUEGO = @id_juego AND HORA = @hora);
			
			INSERT INTO [dbo].[TB_SORTEO_ITEM]
			   (ID_SORTEO
			   ,ID_ITEM
			   ,CUPO
			   ,MONTO
			   ,ESTATUS)
			VALUES
				(@id_sorteo
				,@id_item
				,@cupo
				,@monto
				,1);
		END	
END
GO


-- ----------------------------
-- Procedure structure for sp_ActualizarConjuntoItem
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ActualizarConjuntoItem]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ActualizarConjuntoItem]
GO

CREATE PROCEDURE [dbo].[sp_ActualizarConjuntoItem](
	  @id_item int,
	  @id_conjunto int,
	  @id_juego int,
	  @nombreconjunto varchar(50),
	  @valoritem int,
	  @cupo int,
	  @monto money,
	  @estatus bit)
AS
BEGIN
	DECLARE @ASIGNADO INT;
	DECLARE @ID_ITEM_T INT;
	DECLARE @ID_CONJUNTO_T INT;
	
	SET @ASIGNADO = (SELECT COUNT(*) FROM [TB_CONJUNTO_ITEM]  WHERE 
		[ID_ITEM] = @id_item AND ID_CONJUNTO = @id_conjunto
		AND ESTATUS = 1);
    
    IF (@ASIGNADO <> 0)
		BEGIN
			UPDATE [dbo].[TB_CONJUNTO_ITEM]
			SET 
				  [CUPO_MAX] = IsNull(@cupo, CUPO_MAX)
				 ,[MONTO_MAX] = IsNull(@monto, MONTO_MAX)
				 ,[ESTATUS] = IsNull(@estatus, ESTATUS)
			 WHERE 
				[ID_ITEM] = @id_item AND ID_CONJUNTO = @id_conjunto;
		END
	ELSE
		BEGIN
			SET @ID_ITEM_T = (SELECT ID_ITEM from TB_ITEM where ID_JUEGO = @id_juego AND VALOR = @valoritem);	
			SET @ID_CONJUNTO_T = (SELECT ID_CONJUNTO from TB_CONJUNTO where ID_JUEGO = @id_juego AND NOMBRE = @nombreconjunto);
	
			INSERT INTO [dbo].[TB_CONJUNTO_ITEM]
				   ([ID_ITEM]
				   ,[ID_CONJUNTO]
				   ,[CUPO_MAX]
				   ,[MONTO_MAX]
				   ,[ESTATUS])
			VALUES
				   (@id_item,
				   @id_conjunto,
				   @cupo,
				   @monto,
				   1);
		END
END
GO


-- ----------------------------
-- Procedure structure for sp_ConsultarApertura
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ConsultarApertura]') AND type IN ('P', 'PC', 'RF', 'X'))
	DROP PROCEDURE[dbo].[sp_ConsultarApertura]
GO

CREATE PROCEDURE [dbo].[sp_ConsultarApertura](
	@id_usuario int)
AS
BEGIN
	SELECT 
		ID_APERTURA,
		ID_USUARIO,
		FECHA_APERTURA,
		MONTO_APERTURA,
		COALESCE(FECHA_CIERRE,'') AS FECHA_CIERRE,
		COALESCE(MONTO_CIERRE,'') AS MONTO_CIERRE,
		ESTATUS
	FROM dbo.[TB_APERTURA]
	WHERE ID_USUARIO = @id_usuario AND ESTATUS = 1;
END
GO


-- ----------------------------
-- Primary Key structure for table TB_APERTURA
-- ----------------------------
ALTER TABLE [dbo].[TB_APERTURA] ADD CONSTRAINT [PK_TB_APERTURA] PRIMARY KEY NONCLUSTERED ([ID_APERTURA])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_AUDITORIA
-- ----------------------------
ALTER TABLE [dbo].[TB_AUDITORIA] ADD CONSTRAINT [PK_TB_AUDITORIA] PRIMARY KEY NONCLUSTERED ([ID_AUDITORIA])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_COMISION
-- ----------------------------
ALTER TABLE [dbo].[TB_COMISION] ADD CONSTRAINT [PK_TB_COMISION] PRIMARY KEY NONCLUSTERED ([ID_COMISION])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table TB_CONJUNTO
-- ----------------------------
ALTER TABLE [dbo].[TB_CONJUNTO] ADD CONSTRAINT [CONJUNTO_JUEGO] UNIQUE NONCLUSTERED ([ID_JUEGO] ASC, [NOMBRE] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_CONJUNTO
-- ----------------------------
ALTER TABLE [dbo].[TB_CONJUNTO] ADD CONSTRAINT [PK_TB_CONJUNTO] PRIMARY KEY NONCLUSTERED ([ID_CONJUNTO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_CONJUNTO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_CONJUNTO_ITEM] ADD CONSTRAINT [PK_TB_CONJUNTO_ITEM] PRIMARY KEY NONCLUSTERED ([ID_CONJUNTOITEM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_DIA
-- ----------------------------
ALTER TABLE [dbo].[TB_DIA] ADD CONSTRAINT [PK_TB_DIA] PRIMARY KEY NONCLUSTERED ([ID_DIA])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_DIA_SORTEO
-- ----------------------------
ALTER TABLE [dbo].[TB_DIA_SORTEO] ADD CONSTRAINT [PK_TB_DIA_SORTEO] PRIMARY KEY NONCLUSTERED ([ID_DIASORTEO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_DISPONIBLE_USUARIO_SORTEO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM] ADD CONSTRAINT [PK_TB_BLOQUEO_USUARIO_SORTEO_ITEM] PRIMARY KEY NONCLUSTERED ([ID_DISPONIBLEUSUARIOSORTEOITEM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table TB_DOMINIO
-- ----------------------------
ALTER TABLE [dbo].[TB_DOMINIO] ADD CONSTRAINT [IDENTIFICACION_DOMINIO] UNIQUE NONCLUSTERED ([NUMEROIDENTIFICACION] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_DOMINIO
-- ----------------------------
ALTER TABLE [dbo].[TB_DOMINIO] ADD CONSTRAINT [PK_TB_DOMINIO] PRIMARY KEY NONCLUSTERED ([ID_DOMINIO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_DOMINIO_IMPUESTO
-- ----------------------------
ALTER TABLE [dbo].[TB_DOMINIO_IMPUESTO] ADD CONSTRAINT [PK_TB_DOMINIO_IMPUESTO] PRIMARY KEY NONCLUSTERED ([ID_DOMINIOIMPUESTOS])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_EVENTO
-- ----------------------------
ALTER TABLE [dbo].[TB_EVENTO] ADD CONSTRAINT [PK_TB_EVENTO] PRIMARY KEY NONCLUSTERED ([ID_EVENTO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_IMPUESTO
-- ----------------------------
ALTER TABLE [dbo].[TB_IMPUESTO] ADD CONSTRAINT [PK_TB_IMPUESTO] PRIMARY KEY NONCLUSTERED ([ID_IMPUESTO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table TB_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_ITEM] ADD CONSTRAINT [ITEM_JUEGO] UNIQUE NONCLUSTERED ([ID_JUEGO] ASC, [VALOR] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_ITEM] ADD CONSTRAINT [PK_TB_ITEM] PRIMARY KEY NONCLUSTERED ([ID_ITEM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_JUEGO
-- ----------------------------
ALTER TABLE [dbo].[TB_JUEGO] ADD CONSTRAINT [PK_TB_JUEGO] PRIMARY KEY NONCLUSTERED ([ID_JUEGO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_JUGADA
-- ----------------------------
ALTER TABLE [dbo].[TB_JUGADA] ADD CONSTRAINT [PK_TB_JUGADA] PRIMARY KEY NONCLUSTERED ([ID_JUGADA])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_MONEDERO
-- ----------------------------
ALTER TABLE [dbo].[TB_MONEDERO] ADD CONSTRAINT [PK_TB_MONEDERO] PRIMARY KEY NONCLUSTERED ([ID_OPERACION])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_OPCIONMENU
-- ----------------------------
ALTER TABLE [dbo].[TB_OPCIONMENU] ADD CONSTRAINT [PK_TB_OPCIONMENU] PRIMARY KEY NONCLUSTERED ([ID_OPCIONMENU])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Triggers structure for table TB_RESULTADO
-- ----------------------------
CREATE TRIGGER [dbo].[tg_TotalizarResultado]
ON [dbo].[TB_RESULTADO]
WITH EXECUTE AS CALLER
FOR INSERT
AS
DECLARE 
	   @id_sorteo INT,
	   @id_juego INT,
	   @id_item INT; 
	   
	SELECT @id_sorteo = ins.id_sorteo FROM INSERTED ins;;
	SELECT @id_juego = ins.id_juego FROM INSERTED ins;;
	SELECT @id_item = ins.id_item FROM INSERTED ins;;

	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATE,GETDATE(),101)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,GETDATE(),101))
	
	select @fechaD, @fechaH

	UPDATE TB_JUGADA 
	SET ESTATUS = 5
	WHERE ID_JUGADA IN (SELECT B.ID_JUGADA 
	FROM TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE B.ID_SORTEO = @id_sorteo AND B.ID_JUEGO = @id_juego
	AND B.ID_ITEM = @id_item AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH
	AND B.ESTATUS = 1);
	
	UPDATE TB_TICKET 
	SET ESTATUS = 5 
	WHERE ID_TICKET IN (SELECT A.ID_TICKET
	FROM TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE B.ID_SORTEO = @id_sorteo AND B.ID_JUEGO = @id_juego
	AND B.ID_ITEM = @id_item AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH
	AND A.ESTATUS = 1);
GO

CREATE TRIGGER [dbo].[tg_TotalizarResultadoActualizacion]
ON [dbo].[TB_RESULTADO]
WITH EXECUTE AS CALLER
INSTEAD OF UPDATE
AS
BEGIN
DECLARE 
	   @id_resultado INT,
	   @id_sorteo INT,
	   @id_juego INT,
	   @id_item INT; 
	 
	SELECT @id_resultado = ins.id_resultado FROM INSERTED ins;   
	SELECT @id_sorteo = ins.id_sorteo FROM INSERTED ins;
	SELECT @id_juego = ins.id_juego FROM INSERTED ins;
	SELECT @id_item = ins.id_item FROM INSERTED ins;

	DECLARE 
		   @idsorteo INT,
		   @idjuego INT,
		   @iditem INT; 
	
	SET @idsorteo = (SELECT ID_SORTEO FROM TB_RESULTADO WHERE ID_RESULTADO = @id_resultado)
	SET @idjuego = (SELECT ID_JUEGO FROM TB_RESULTADO WHERE ID_RESULTADO = @id_resultado)
	SET @iditem = (SELECT ID_ITEM FROM TB_RESULTADO WHERE ID_RESULTADO = @id_resultado)
	
	DECLARE @fechaH datetime
	DECLARE @fechaD datetime

	SET @fechaD = CONVERT(DATE,GETDATE(),101)
	SET @fechaH = DATEADD(dd,1,CONVERT(DATE,GETDATE(),101))
	
	SELECT @FECHAD 
	
	UPDATE TB_JUGADA
	SET ESTATUS = 1
	WHERE ID_JUGADA IN (SELECT B.ID_JUGADA 
	FROM TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE B.ID_SORTEO = @idsorteo AND B.ID_JUEGO = @idjuego
	AND B.ID_ITEM = @iditem AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH
	AND (B.ESTATUS <> 4 OR B.ESTATUS <> 3));
	
	UPDATE TB_TICKET 
	SET ESTATUS = 1 
	WHERE ID_TICKET IN (SELECT A.ID_TICKET
	FROM TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE B.ID_SORTEO = @idsorteo AND B.ID_JUEGO = @idjuego
	AND B.ID_ITEM = @iditem AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH
	AND (A.ESTATUS <> 4 OR A.ESTATUS <> 3));

	UPDATE TB_JUGADA 
	SET ESTATUS = 5
	WHERE ID_JUGADA IN (SELECT B.ID_JUGADA 
	FROM TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE B.ID_SORTEO = @id_sorteo AND B.ID_JUEGO = @id_juego
	AND B.ID_ITEM = @id_item AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH
	AND B.ESTATUS = 1);
	
	UPDATE TB_TICKET 
	SET ESTATUS = 5 
	WHERE ID_TICKET IN (SELECT A.ID_TICKET
	FROM TB_TICKET A
	JOIN TB_JUGADA B
	ON A.ID_TICKET = B.ID_TICKET
	WHERE B.ID_SORTEO = @id_sorteo AND B.ID_JUEGO = @id_juego
	AND B.ID_ITEM = @id_item AND A.FECHA_HORA BETWEEN @fechaD AND @fechaH
	AND A.ESTATUS = 1);
	
	UPDATE [Loto].[dbo].[TB_RESULTADO]
	   SET [ID_ITEM] = @id_item,
	   [ID_JUEGO] = @id_juego,
	   [ID_SORTEO] = @id_sorteo
	 WHERE ID_RESULTADO = @id_resultado;
END
GO


-- ----------------------------
-- Primary Key structure for table TB_RESULTADO
-- ----------------------------
ALTER TABLE [dbo].[TB_RESULTADO] ADD CONSTRAINT [PK_TB_RESULTADO] PRIMARY KEY NONCLUSTERED ([ID_RESULTADO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Indexes structure for table TB_SOLICITUD
-- ----------------------------
CREATE NONCLUSTERED INDEX [CODIGO_SOLICITUD]
ON [dbo].[TB_SOLICITUD] (
  [CODIGOSOLICITUD] ASC
)
GO


-- ----------------------------
-- Primary Key structure for table TB_SOLICITUD
-- ----------------------------
ALTER TABLE [dbo].[TB_SOLICITUD] ADD CONSTRAINT [PK_TB_SOLICITUD] PRIMARY KEY NONCLUSTERED ([ID_SOLICITUD])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table TB_SORTEO
-- ----------------------------
ALTER TABLE [dbo].[TB_SORTEO] ADD CONSTRAINT [HORA_SORTEO_JUEGO] UNIQUE NONCLUSTERED ([ID_JUEGO] ASC, [HORA] ASC, [ESTATUS] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_SORTEO
-- ----------------------------
ALTER TABLE [dbo].[TB_SORTEO] ADD CONSTRAINT [PK_TB_SORTEO] PRIMARY KEY NONCLUSTERED ([ID_SORTEO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_SORTEO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_SORTEO_ITEM] ADD CONSTRAINT [PK_TB_SORTEO_ITEM] PRIMARY KEY NONCLUSTERED ([ID_SORTEOITEM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_TICKET
-- ----------------------------
ALTER TABLE [dbo].[TB_TICKET] ADD CONSTRAINT [PK_TB_TICKET] PRIMARY KEY NONCLUSTERED ([ID_TICKET])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_TIPOJUEGO
-- ----------------------------
ALTER TABLE [dbo].[TB_TIPOJUEGO] ADD CONSTRAINT [PK_TB_TIPOJUEGO] PRIMARY KEY NONCLUSTERED ([ID_TIPOJUEGO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_TIPOOPERACION
-- ----------------------------
ALTER TABLE [dbo].[TB_TIPOOPERACION] ADD CONSTRAINT [PK_TB_TIPOOPERACION] PRIMARY KEY NONCLUSTERED ([ID_TIPOOPERACION])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_TIPOUSUARIO
-- ----------------------------
ALTER TABLE [dbo].[TB_TIPOUSUARIO] ADD CONSTRAINT [PK_TB_TIPOUSUARIO] PRIMARY KEY NONCLUSTERED ([ID_TIPOUSUARIO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_TIPOUSUARIO_OPCIONMENU
-- ----------------------------
ALTER TABLE [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ADD CONSTRAINT [PK_TB_TIPOUSUARIO_OPCIONMENU] PRIMARY KEY NONCLUSTERED ([ID_TIPOUSUARIOOPCIONMENU])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Uniques structure for table TB_USUARIO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO] ADD CONSTRAINT [LOGINUSUARIO] UNIQUE NONCLUSTERED ([USUARIO] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

ALTER TABLE [dbo].[TB_USUARIO] ADD CONSTRAINT [NUMEROIDENTIFICACION] UNIQUE NONCLUSTERED ([NUMEROIDENTIFICACION] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_USUARIO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO] ADD CONSTRAINT [PK_TB_USUARIO] PRIMARY KEY NONCLUSTERED ([ID_USUARIO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_USUARIO_JUEGO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_JUEGO] ADD CONSTRAINT [PK_TB_USUARIO_JUEGO] PRIMARY KEY NONCLUSTERED ([ID_USUARIOJUEGO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_USUARIO_JUEGO_CONJUNTO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO] ADD CONSTRAINT [PK_TB_USUARIO_JUEGO_CONJUNTO] PRIMARY KEY NONCLUSTERED ([ID_USUARIOJUEGOCONJUNTO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_USUARIO_JUEGO_CONJUNTO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM] ADD CONSTRAINT [PK_TB_USUARIO_JUEGO_CONJUNTO_ITEM] PRIMARY KEY NONCLUSTERED ([ID_USUARIOJUEGOCONJUNTOITEM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_USUARIO_OPCIONMENU
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_OPCIONMENU] ADD CONSTRAINT [PK_TB_USUARIO_OPCIONMENU] PRIMARY KEY NONCLUSTERED ([ID_USUARIOOPCIONMENU])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_USUARIO_SORTEO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_SORTEO] ADD CONSTRAINT [PK_TB_USUARIO_SORTEO] PRIMARY KEY NONCLUSTERED ([ID_USUARIOSORTEO])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table TB_USUARIO_SORTEO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_SORTEO_ITEM] ADD CONSTRAINT [PK_TB_USUARIO_SORTEO_ITEM] PRIMARY KEY NONCLUSTERED ([ID_USUARIOSORTEOITEM])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table TB_APERTURA
-- ----------------------------
ALTER TABLE [dbo].[TB_APERTURA] ADD CONSTRAINT [fk_usuario_apertura] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_AUDITORIA
-- ----------------------------
ALTER TABLE [dbo].[TB_AUDITORIA] ADD CONSTRAINT [fk_evento_auditoria] FOREIGN KEY ([ID_EVENTO]) REFERENCES [TB_EVENTO] ([ID_EVENTO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_AUDITORIA] ADD CONSTRAINT [fk_usuario_auditoria] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_COMISION
-- ----------------------------
ALTER TABLE [dbo].[TB_COMISION] ADD CONSTRAINT [fk_usuario_comision] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_CONJUNTO
-- ----------------------------
ALTER TABLE [dbo].[TB_CONJUNTO] ADD CONSTRAINT [fk_juego_conjunto] FOREIGN KEY ([ID_JUEGO]) REFERENCES [TB_JUEGO] ([ID_JUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_CONJUNTO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_CONJUNTO_ITEM] ADD CONSTRAINT [fk_conjunto_conjuntoitem] FOREIGN KEY ([ID_CONJUNTO]) REFERENCES [TB_CONJUNTO] ([ID_CONJUNTO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_CONJUNTO_ITEM] ADD CONSTRAINT [fk_item_conjuntoitem] FOREIGN KEY ([ID_ITEM]) REFERENCES [TB_ITEM] ([ID_ITEM]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_DIA_SORTEO
-- ----------------------------
ALTER TABLE [dbo].[TB_DIA_SORTEO] ADD CONSTRAINT [fk_dia_diasorteo] FOREIGN KEY ([ID_DIA]) REFERENCES [TB_DIA] ([ID_DIA]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_DIA_SORTEO] ADD CONSTRAINT [fk_sorteo_diasorteo] FOREIGN KEY ([ID_SORTEO]) REFERENCES [TB_SORTEO] ([ID_SORTEO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_DISPONIBLE_USUARIO_SORTEO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM] ADD CONSTRAINT [fk_item_disponibleusuariosorteoitem] FOREIGN KEY ([ID_ITEM]) REFERENCES [TB_ITEM] ([ID_ITEM]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM] ADD CONSTRAINT [fk_sorteo_disponibleusuariosorteoitem] FOREIGN KEY ([ID_SORTEO]) REFERENCES [TB_SORTEO] ([ID_SORTEO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_DISPONIBLE_USUARIO_SORTEO_ITEM] ADD CONSTRAINT [fk_usuario_disponibleusuariosorteoitem] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_DOMINIO_IMPUESTO
-- ----------------------------
ALTER TABLE [dbo].[TB_DOMINIO_IMPUESTO] ADD CONSTRAINT [fk_dominio_dominioimpuesto] FOREIGN KEY ([ID_DOMINIO]) REFERENCES [TB_DOMINIO] ([ID_DOMINIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_DOMINIO_IMPUESTO] ADD CONSTRAINT [fk_impuesto_dominioimpuesto] FOREIGN KEY ([ID_IMPUESTO]) REFERENCES [TB_IMPUESTO] ([ID_IMPUESTO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_ITEM] ADD CONSTRAINT [fk_juego_item] FOREIGN KEY ([ID_JUEGO]) REFERENCES [TB_JUEGO] ([ID_JUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_JUEGO
-- ----------------------------
ALTER TABLE [dbo].[TB_JUEGO] ADD CONSTRAINT [fk_tipojuego_juego] FOREIGN KEY ([ID_TIPOJUEGO]) REFERENCES [TB_TIPOJUEGO] ([ID_TIPOJUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_JUGADA
-- ----------------------------
ALTER TABLE [dbo].[TB_JUGADA] ADD CONSTRAINT [fk_conjunto_jugada] FOREIGN KEY ([ID_CONJUNTO]) REFERENCES [TB_CONJUNTO] ([ID_CONJUNTO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_JUGADA] ADD CONSTRAINT [fk_item_jugada] FOREIGN KEY ([ID_ITEM]) REFERENCES [TB_ITEM] ([ID_ITEM]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_JUGADA] ADD CONSTRAINT [fk_juego_jugada] FOREIGN KEY ([ID_JUEGO]) REFERENCES [TB_JUEGO] ([ID_JUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_JUGADA] ADD CONSTRAINT [fk_sorteo_jugada] FOREIGN KEY ([ID_SORTEO]) REFERENCES [TB_SORTEO] ([ID_SORTEO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_JUGADA] ADD CONSTRAINT [fk_ticket_jugada] FOREIGN KEY ([ID_TICKET]) REFERENCES [TB_TICKET] ([ID_TICKET]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_MONEDERO
-- ----------------------------
ALTER TABLE [dbo].[TB_MONEDERO] ADD CONSTRAINT [fk_tipooperacion_monedero] FOREIGN KEY ([ID_TIPOOPERACION]) REFERENCES [TB_TIPOOPERACION] ([ID_TIPOOPERACION]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_MONEDERO] ADD CONSTRAINT [fk_usuario_monedero] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_OPCIONMENU
-- ----------------------------
ALTER TABLE [dbo].[TB_OPCIONMENU] ADD CONSTRAINT [fk_opcionmenu_opcionmenu] FOREIGN KEY ([ID_OPCIONMENUPADRE]) REFERENCES [TB_OPCIONMENU] ([ID_OPCIONMENU]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_RESULTADO
-- ----------------------------
ALTER TABLE [dbo].[TB_RESULTADO] ADD CONSTRAINT [fk_item_resultado] FOREIGN KEY ([ID_ITEM]) REFERENCES [TB_ITEM] ([ID_ITEM]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_RESULTADO] ADD CONSTRAINT [fk_juego_resultado] FOREIGN KEY ([ID_JUEGO]) REFERENCES [TB_JUEGO] ([ID_JUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_RESULTADO] ADD CONSTRAINT [fk_sorteo_resultado] FOREIGN KEY ([ID_SORTEO]) REFERENCES [TB_SORTEO] ([ID_SORTEO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_SOLICITUD
-- ----------------------------
ALTER TABLE [dbo].[TB_SOLICITUD] ADD CONSTRAINT [fk_tipooperacion_solicitud] FOREIGN KEY ([ID_TIPOOPERACION]) REFERENCES [TB_TIPOOPERACION] ([ID_TIPOOPERACION]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_SOLICITUD] ADD CONSTRAINT [fk_usuario_solicitud] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_SORTEO
-- ----------------------------
ALTER TABLE [dbo].[TB_SORTEO] ADD CONSTRAINT [fk_juego_sorteo] FOREIGN KEY ([ID_JUEGO]) REFERENCES [TB_JUEGO] ([ID_JUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_SORTEO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_SORTEO_ITEM] ADD CONSTRAINT [fk_item_sorteoitem] FOREIGN KEY ([ID_ITEM]) REFERENCES [TB_ITEM] ([ID_ITEM]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_SORTEO_ITEM] ADD CONSTRAINT [fk_sorteo_sorteoitem] FOREIGN KEY ([ID_SORTEO]) REFERENCES [TB_SORTEO] ([ID_SORTEO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_TICKET
-- ----------------------------
ALTER TABLE [dbo].[TB_TICKET] ADD CONSTRAINT [fk_usuario_ticket] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_TIPOUSUARIO_OPCIONMENU
-- ----------------------------
ALTER TABLE [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ADD CONSTRAINT [fk_opcionmenu_tipousuarioopcionmenu] FOREIGN KEY ([ID_OPCIONMENU]) REFERENCES [TB_OPCIONMENU] ([ID_OPCIONMENU]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ADD CONSTRAINT [fk_tipousuario_tipousuarioopcionmenu] FOREIGN KEY ([ID_TIPOUSUARIO]) REFERENCES [TB_TIPOUSUARIO] ([ID_TIPOUSUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_USUARIO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO] ADD CONSTRAINT [fk_dominio_usuario] FOREIGN KEY ([ID_DOMINIO]) REFERENCES [TB_DOMINIO] ([ID_DOMINIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO] ADD CONSTRAINT [fk_tipousuario_usuario] FOREIGN KEY ([ID_TIPOUSUARIO]) REFERENCES [TB_TIPOUSUARIO] ([ID_TIPOUSUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO] ADD CONSTRAINT [fk_usuario_usuario] FOREIGN KEY ([ID_USUARIOPADRE]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_USUARIO_JUEGO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_JUEGO] ADD CONSTRAINT [fk_juego_usuariojuego] FOREIGN KEY ([ID_JUEGO]) REFERENCES [TB_JUEGO] ([ID_JUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO] ADD CONSTRAINT [fk_usuario_usuariojuego] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_USUARIO_JUEGO_CONJUNTO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO] ADD CONSTRAINT [fk_conjunto_usuariojuegoconjunto] FOREIGN KEY ([ID_CONJUNTO]) REFERENCES [TB_CONJUNTO] ([ID_CONJUNTO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO] ADD CONSTRAINT [fk_juego_usuariojuegoconjunto] FOREIGN KEY ([ID_JUEGO]) REFERENCES [TB_JUEGO] ([ID_JUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO] ADD CONSTRAINT [fk_usuario_usuariojuegoconjunto] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_USUARIO_JUEGO_CONJUNTO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM] ADD CONSTRAINT [fk_conjunto_usuariojuegoconjuntoitem] FOREIGN KEY ([ID_CONJUNTO]) REFERENCES [TB_CONJUNTO] ([ID_CONJUNTO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM] ADD CONSTRAINT [fk_item_usuariojuegoconjuntoitem] FOREIGN KEY ([ID_ITEM]) REFERENCES [TB_ITEM] ([ID_ITEM]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM] ADD CONSTRAINT [fk_juego_usuariojuegoconjuntoitem] FOREIGN KEY ([ID_JUEGO]) REFERENCES [TB_JUEGO] ([ID_JUEGO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_JUEGO_CONJUNTO_ITEM] ADD CONSTRAINT [fk_usuario_usuariojuegoconjuntoitem] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_USUARIO_OPCIONMENU
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_OPCIONMENU] ADD CONSTRAINT [fk_opcionmenu_usuarioopcionmenu] FOREIGN KEY ([ID_OPCIONMENU]) REFERENCES [TB_OPCIONMENU] ([ID_OPCIONMENU]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_OPCIONMENU] ADD CONSTRAINT [fk_usuario_usuarioopcionmenu] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_USUARIO_SORTEO
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_SORTEO] ADD CONSTRAINT [fk_usuario_usuariosorteo] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_SORTEO] ADD CONSTRAINT [fk_sorteo_usuariosorteo] FOREIGN KEY ([ID_SORTEO]) REFERENCES [TB_SORTEO] ([ID_SORTEO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table TB_USUARIO_SORTEO_ITEM
-- ----------------------------
ALTER TABLE [dbo].[TB_USUARIO_SORTEO_ITEM] ADD CONSTRAINT [fk_item_usuariosorteoitem] FOREIGN KEY ([ID_ITEM]) REFERENCES [TB_ITEM] ([ID_ITEM]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_SORTEO_ITEM] ADD CONSTRAINT [fk_sorteo_usuariosorteoitem] FOREIGN KEY ([ID_SORTEO]) REFERENCES [TB_SORTEO] ([ID_SORTEO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[TB_USUARIO_SORTEO_ITEM] ADD CONSTRAINT [fk_usuario_usuariosorteoitem] FOREIGN KEY ([ID_USUARIO]) REFERENCES [TB_USUARIO] ([ID_USUARIO]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

-- ----------------------------
-- Records of [TB_USUARIO]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TB_USUARIO] ON
GO

INSERT INTO [dbo].[TB_USUARIO] ([ID_DOMINIO], [ID_TIPOUSUARIO], [ID_USUARIOPADRE], [NOMBRE], [APELLIDO], [NUMEROIDENTIFICACION], [USUARIO], [CORREOELECTRONICO], [ESTATUS], [CADUCIDAD], [CLAVE]) VALUES (NULL, N'1', NULL, N'Hector', N'Diaz', N'14578963', N'hectordiaz', N'diazhh@gmail.com', N'1', NULL, N'Mgd11JnFPb1BA1dzyIxWrQ==                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
GO

-- ----------------------------
-- Records of [TB_OPCIONMENU]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TB_OPCIONMENU] ON
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'1', NULL, N'Inicio', N'Opcion 1', N'home', N'1000', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'2', NULL, N'Administración Dominios', N'Opcion 2', N'domain', N'1500', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'3', NULL, N'Administración Usuarios Internos', N'Opcion3', N'internal-users', N'1600', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'4', NULL, N'Administración Juegos', N'Opcion 4', N'games', N'1900', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'5', NULL, N'Administración Impuestos', N'Opcion 5', N'taxes', N'2000', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'6', NULL, N'Administración Usuarios de Dominio', N'Opcion 6', N'admin-users/home/0', N'2200', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'7', NULL, N'Reporte Balance', N'Opcion 7', N'reports/domain-balance', N'2400', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'8', NULL, N'Reporte Cierre', N'Opcion 8', N'reports/domain-close', N'2600', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'9', NULL, N'Reporte Cuadre Banca', N'Opcion 9', N'reports/quad-bank', N'2800', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'18', NULL, N'Administración de Bloqueos', N'Opcion 14', N'blocks', N'3300', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'19', NULL, N'Reporte Ventas', N'Opcion 15', N'reports/agency-report-sales', N'3400', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'20', NULL, N'Reporte Tickets', N'Opcion 16', N'reports/ticket-report', N'3500', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'21', NULL, N'Administración de Resultados', N'Opcion 17', N'result', N'3600', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'23', NULL, N'Reporte Proyecciones', N'Opcion 18', N'reports/detail-sales', N'4000', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'13', NULL, N'Administración de Grupos', N'Opcion 10', N'admin-users/home/1', N'2900', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'14', NULL, N'Administración de Comercializadoras', N'Opcion 11', N'admin-users/home/2', N'3000', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'15', NULL, N'Administración de Agencias', N'Opcion 12', N'admin-users/home/3', N'3100', N'1')
GO

INSERT INTO [dbo].[TB_OPCIONMENU] ([ID_OPCIONMENU], [ID_OPCIONMENUPADRE], [NOMBRE], [DESCRIPCION], [URL], [POSICION], [ESTATUS]) VALUES (N'16', NULL, N'Administración de Taquillas', N'Opcion 13', N'admin-users/home/4', N'3200', N'1')
GO

SET IDENTITY_INSERT [dbo].[TB_OPCIONMENU] OFF
GO


-- ----------------------------
-- Records of [TB_TIPOUSUARIO]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TB_TIPOUSUARIO] ON
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO] ([ID_TIPOUSUARIO], [DESCRIPCION], [ESTATUS]) VALUES (N'1', N'Administrador', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO] ([ID_TIPOUSUARIO], [DESCRIPCION], [ESTATUS]) VALUES (N'2', N'Dominio', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO] ([ID_TIPOUSUARIO], [DESCRIPCION], [ESTATUS]) VALUES (N'3', N'Grupo', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO] ([ID_TIPOUSUARIO], [DESCRIPCION], [ESTATUS]) VALUES (N'4', N'Comercializadora', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO] ([ID_TIPOUSUARIO], [DESCRIPCION], [ESTATUS]) VALUES (N'5', N'Agencia', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO] ([ID_TIPOUSUARIO], [DESCRIPCION], [ESTATUS]) VALUES (N'6', N'Taquilla', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO] ([ID_TIPOUSUARIO], [DESCRIPCION], [ESTATUS]) VALUES (N'7', N'Interno', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO] ([ID_TIPOUSUARIO], [DESCRIPCION], [ESTATUS]) VALUES (N'8', N'Movil', N'1')
GO

SET IDENTITY_INSERT [dbo].[TB_TIPOUSUARIO] OFF
GO

-- ----------------------------
-- Records of [TB_JUEGO]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TB_JUEGO] ON
GO

INSERT INTO [dbo].[TB_JUEGO] ([ID_JUEGO], [ID_TIPOJUEGO], [NOMBRE], [ESTATUS], [FACTORPAGO], [TIEMPOCIERRE]) VALUES (N'31', N'1', N'LotoPanda', N'1', N'30', N'5')
GO

SET IDENTITY_INSERT [dbo].[TB_JUEGO] OFF
GO

-- ----------------------------
-- Records of [TB_DIA]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TB_DIA] ON
GO

INSERT INTO [dbo].[TB_DIA] ([ID_DIA], [NOMBRE], [ESTATUS]) VALUES (N'1', N'LUNES', N'1')
GO

INSERT INTO [dbo].[TB_DIA] ([ID_DIA], [NOMBRE], [ESTATUS]) VALUES (N'2', N'MARTES', N'1')
GO

INSERT INTO [dbo].[TB_DIA] ([ID_DIA], [NOMBRE], [ESTATUS]) VALUES (N'3', N'MIERCOLES', N'1')
GO

INSERT INTO [dbo].[TB_DIA] ([ID_DIA], [NOMBRE], [ESTATUS]) VALUES (N'4', N'JUEVES', N'1')
GO

INSERT INTO [dbo].[TB_DIA] ([ID_DIA], [NOMBRE], [ESTATUS]) VALUES (N'5', N'VIERNES', N'1')
GO

INSERT INTO [dbo].[TB_DIA] ([ID_DIA], [NOMBRE], [ESTATUS]) VALUES (N'6', N'SABADO', N'1')
GO

INSERT INTO [dbo].[TB_DIA] ([ID_DIA], [NOMBRE], [ESTATUS]) VALUES (N'7', N'DOMINGO', N'1')
GO

SET IDENTITY_INSERT [dbo].[TB_DIA] OFF
GO

-- ----------------------------
-- Records of [TB_TIPOJUEGO]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TB_TIPOJUEGO] ON
GO

INSERT INTO [dbo].[TB_TIPOJUEGO] ([ID_TIPOJUEGO], [DESCRIPCION], [PAGINA], [ESTATUS]) VALUES (N'1', N'Ruleta', N'../create-games', N'1')
GO

SET IDENTITY_INSERT [dbo].[TB_TIPOJUEGO] OFF
GO

-- ----------------------------
-- Records of [TB_TIPOOPERACION]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TB_TIPOOPERACION] ON
GO

INSERT INTO [dbo].[TB_TIPOOPERACION] ([ID_TIPOOPERACION], [DESCRIPCION], [OPERACION], [ESTATUS]) VALUES (N'1', N'Abono', N'C', N'1')
GO

INSERT INTO [dbo].[TB_TIPOOPERACION] ([ID_TIPOOPERACION], [DESCRIPCION], [OPERACION], [ESTATUS]) VALUES (N'2', N'Premio', N'C', N'1')
GO

INSERT INTO [dbo].[TB_TIPOOPERACION] ([ID_TIPOOPERACION], [DESCRIPCION], [OPERACION], [ESTATUS]) VALUES (N'3', N'Apuesta', N'D', N'1')
GO

INSERT INTO [dbo].[TB_TIPOOPERACION] ([ID_TIPOOPERACION], [DESCRIPCION], [OPERACION], [ESTATUS]) VALUES (N'4', N'Retiro', N'D', N'1')
GO

SET IDENTITY_INSERT [dbo].[TB_TIPOOPERACION] OFF
GO

-- ----------------------------
-- Records of [TB_TIPOUSUARIO_OPCIONMENU]
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ON
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'2', N'1', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'5', N'2', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'7', N'4', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'8', N'5', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'9', N'1', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'57', N'7', N'5', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'58', N'8', N'5', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'59', N'9', N'5', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'13', N'1', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'19', N'6', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'25', N'7', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'26', N'7', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'27', N'7', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'53', N'14', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'54', N'18', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'55', N'18', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'28', N'7', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'29', N'8', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'30', N'8', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'31', N'9', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'32', N'9', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'33', N'9', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'34', N'9', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'35', N'1', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'36', N'1', N'5', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'38', N'8', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'39', N'8', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'40', N'13', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'41', N'14', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'42', N'15', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'43', N'16', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'44', N'14', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'45', N'15', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'46', N'16', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'47', N'15', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'48', N'16', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'49', N'16', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'50', N'15', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'51', N'13', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'52', N'16', N'5', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'61', N'19', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'62', N'19', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'63', N'19', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'64', N'19', N'5', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'65', N'20', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'66', N'20', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'67', N'20', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'68', N'20', N'5', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'70', N'21', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'71', N'21', N'7', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'72', N'19', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'73', N'23', N'1', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'74', N'23', N'2', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'75', N'23', N'3', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'76', N'23', N'4', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'77', N'23', N'5', N'1')
GO

INSERT INTO [dbo].[TB_TIPOUSUARIO_OPCIONMENU] ([ID_TIPOUSUARIOOPCIONMENU], [ID_OPCIONMENU], [ID_TIPOUSUARIO], [ESTATUS]) VALUES (N'6', N'3', N'1', N'1')
GO

SET IDENTITY_INSERT [dbo].[TB_TIPOUSUARIO_OPCIONMENU] OFF
GO


CREATE DATABASE NLP
GO
USE [NLP]
GO
/****** Object:  Schema [NER]    Script Date: 15-10-2022 16:28:48 ******/
CREATE SCHEMA [NER]
GO
/****** Object:  Table [dbo].[ClaimsDescInfo]    Script Date: 15-10-2022 16:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimsDescInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimsDesc] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NER].[EntityList]    Script Date: 15-10-2022 16:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NER].[EntityList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntityLabel] [varchar](255) NULL,
	[EntityValue] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NER].[EntityMaster]    Script Date: 15-10-2022 16:28:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NER].[EntityMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntityLabel] [varchar](255) NULL
) ON [PRIMARY]
GO


--INSERT SOME CLAIMS DATA
USE [NLP]
GO
SET IDENTITY_INSERT [dbo].[ClaimsDescInfo] ON 
GO
INSERT [dbo].[ClaimsDescInfo] ([ID], [ClaimsDesc]) VALUES (1, N'Varun fell from the building and broke his knee.')
GO
INSERT [dbo].[ClaimsDescInfo] ([ID], [ClaimsDesc]) VALUES (2, N'Aditya got a back strain while lifting a heavy object.')
GO
INSERT [dbo].[ClaimsDescInfo] ([ID], [ClaimsDesc]) VALUES (3, N'Vijay got his fingers burnt due to an electric shock.')
GO
SET IDENTITY_INSERT [dbo].[ClaimsDescInfo] OFF
GO

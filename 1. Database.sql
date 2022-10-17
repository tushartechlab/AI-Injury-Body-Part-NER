CREATE DATABASE NLP
GO
USE [NLP]
GO
/****** Object:  Schema [NER]    Script Date: 17-10-2022 12:56:33 ******/
CREATE SCHEMA [NLP]
GO
/****** Object:  Table [dbo].[ClaimsDescInfo]    Script Date: 17-10-2022 12:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimsDescInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimsDesc] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NER].[EntityList]    Script Date: 17-10-2022 12:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NER].[EntityList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntityLabel] [varchar](255) NULL,
	[EntityValue] [varchar](255) NULL,
	[ClaimsID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NER].[EntityMaster]    Script Date: 17-10-2022 12:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NER].[EntityMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EntityLabel] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NER].[LemmatizerData]    Script Date: 17-10-2022 12:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NER].[LemmatizerData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimsID] [int] NULL,
	[OldDescription] [varchar](255) NULL,
	[NewDescription] [varchar](255) NULL,
	[isaltered] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [NER].[PhraseDetectionData]    Script Date: 17-10-2022 12:56:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [NER].[PhraseDetectionData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimsID] [int] NULL,
	[OldDescription] [varchar](255) NULL,
	[NewDescription] [varchar](255) NULL,
	[isaltered] [bit] NULL
) ON [PRIMARY]
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
SET IDENTITY_INSERT [NER].[EntityList] ON 
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (1, N'INJURY CAUSE', N'fall', 1)
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (2, N'INJURY', N'break', 1)
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (3, N'BODY PART', N'knee', 1)
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (4, N'BODY PART', N'back', 2)
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (5, N'INJURY', N'strain', 2)
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (6, N'INJURY CAUSE', N'lift', 2)
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (7, N'BODY PART', N'finger', 3)
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (8, N'INJURY', N'burn', 3)
GO
INSERT [NER].[EntityList] ([ID], [EntityLabel], [EntityValue], [ClaimsID]) VALUES (9, N'INJURY CAUSE', N'shock', 3)
GO
SET IDENTITY_INSERT [NER].[EntityList] OFF
GO
SET IDENTITY_INSERT [NER].[EntityMaster] ON 
GO
INSERT [NER].[EntityMaster] ([ID], [EntityLabel]) VALUES (1, N'Body Part')
GO
INSERT [NER].[EntityMaster] ([ID], [EntityLabel]) VALUES (2, N'Injury Type')
GO
INSERT [NER].[EntityMaster] ([ID], [EntityLabel]) VALUES (3, N'Injury Cause')
GO
SET IDENTITY_INSERT [NER].[EntityMaster] OFF
GO
SET IDENTITY_INSERT [NER].[LemmatizerData] ON 
GO
INSERT [NER].[LemmatizerData] ([id], [ClaimsID], [OldDescription], [NewDescription], [isaltered]) VALUES (1, 1, N'Varun fell from the building and broke his knee.', N'Varun fall from the building and break his knee.', 1)
GO
INSERT [NER].[LemmatizerData] ([id], [ClaimsID], [OldDescription], [NewDescription], [isaltered]) VALUES (2, 2, N'Aditya got a back strain while lifting a heavy object.', N'Aditya get a back strain while lift a heavy object.', 1)
GO
INSERT [NER].[LemmatizerData] ([id], [ClaimsID], [OldDescription], [NewDescription], [isaltered]) VALUES (3, 3, N'Vijay got his fingers burnt due to an electric-shock.', N'Vijay get his finger burn due to an electric-shock.', 1)
GO
SET IDENTITY_INSERT [NER].[LemmatizerData] OFF
GO
SET IDENTITY_INSERT [NER].[PhraseDetectionData] ON 
GO
INSERT [NER].[PhraseDetectionData] ([id], [ClaimsID], [OldDescription], [NewDescription], [isaltered]) VALUES (1, 1, N'Varun fell from the building and broke his knee.', N'Varun fell from the building and broke his knee.', 0)
GO
INSERT [NER].[PhraseDetectionData] ([id], [ClaimsID], [OldDescription], [NewDescription], [isaltered]) VALUES (2, 2, N'Aditya got a back strain while lifting a heavy object.', N'Aditya got a back strain while lifting a heavy object.', 0)
GO
INSERT [NER].[PhraseDetectionData] ([id], [ClaimsID], [OldDescription], [NewDescription], [isaltered]) VALUES (3, 3, N'Vijay got his fingers burnt due to an electric shock.', N'Vijay got his fingers burnt due to an electric-shock.', 1)
GO
SET IDENTITY_INSERT [NER].[PhraseDetectionData] OFF
GO

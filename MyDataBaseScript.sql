USE [master]
GO
/****** Object:  Database [Anioi_DB]    Script Date: 5.06.2020 15:09:56 ******/
CREATE DATABASE [Anioi_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FINALFINAL_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FINALFINAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FINALFINAL_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FINALFINAL.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Anioi_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Anioi_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Anioi_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Anioi_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Anioi_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Anioi_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Anioi_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Anioi_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Anioi_DB] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [Anioi_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Anioi_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Anioi_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Anioi_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Anioi_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Anioi_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Anioi_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Anioi_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Anioi_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Anioi_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Anioi_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Anioi_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Anioi_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Anioi_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Anioi_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Anioi_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Anioi_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Anioi_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Anioi_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Anioi_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Anioi_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Anioi_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Anioi_DB', N'ON'
GO
ALTER DATABASE [Anioi_DB] SET QUERY_STORE = OFF
GO
USE [Anioi_DB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5.06.2020 15:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 5.06.2020 15:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversation]    Script Date: 5.06.2020 15:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversation](
	[ConservationID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[creator_id] [int] NOT NULL,
	[MessageID] [int] NOT NULL,
	[NewMessage] [bit] NOT NULL,
 CONSTRAINT [PK_Conversation] PRIMARY KEY CLUSTERED 
(
	[ConservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 5.06.2020 15:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[ConversationId] [int] NOT NULL,
	[SenderId] [int] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[MessageCreated_at] [datetime] NOT NULL,
	[Attachment] [nvarchar](50) NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participants]    Script Date: 5.06.2020 15:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participants](
	[ParticipantID] [int] IDENTITY(1,1) NOT NULL,
	[ConversationId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Participants] PRIMARY KEY CLUSTERED 
(
	[ParticipantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publish]    Script Date: 5.06.2020 15:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publish](
	[PublishID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[ActivePublish] [bit] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CategoryID] [int] NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Publish] PRIMARY KEY CLUSTERED 
(
	[PublishID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5.06.2020 15:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[EmailID] [varchar](254) NOT NULL,
	[DateOfBirth] [datetime] NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IsEmailVerified] [bit] NOT NULL,
	[ActivationCode] [uniqueidentifier] NOT NULL,
	[ResetPasswordCode] [nvarchar](100) NULL,
 CONSTRAINT [PK__User__1788CCACE0C349B7] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Adventure')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Biography')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Education')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Novels')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (8, N'Science Fiction')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName]) VALUES (1, N'Adana')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (2, N'Adıyaman')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (3, N'Afyon')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (4, N'Ağrı')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (5, N'Amasya')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (6, N'Ankara')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (7, N'Antalya')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (8, N'Artvin')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (9, N'Aydın')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (10, N'Balıkesir')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (11, N'Bilecik')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (12, N'Bingöl')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (13, N'Bitlis')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (14, N'Bolu')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (15, N'Burdur')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (16, N'Bursa')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (17, N'Çanakkale')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (18, N'Çankırı')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (19, N'Çorum')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (20, N'Denizli')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (21, N'Diyarbakır')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (22, N'Edirne')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (23, N'Elazığ')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (24, N'Erzincan')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (25, N'Erzurum')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (26, N'Eskişehir')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (27, N'Gaziantep')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (28, N'Giresun')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (29, N'Gümüşhane')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (30, N'Hakkari')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (31, N'Hatay')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (32, N'Isparta')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (33, N'Mersin')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (34, N'İstanbul')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (35, N'İzmir')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (36, N'Kars')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (37, N'Kastamonu')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (38, N'Kayseri')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (39, N'Kırklareli')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (40, N'Kırşehir')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (41, N'Kocaeli')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (42, N'Konya')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (43, N'Kütahya')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (44, N'Malatya')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (45, N'Manisa')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (46, N'K.Maraş')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (47, N'Mardin')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (48, N'Muğla')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (49, N'Muş')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (50, N'Nevşehir')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (51, N'Niğde')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (52, N'Ordu')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (53, N'Rize')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (54, N'Sakarya')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (55, N'Samsun')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (56, N'Siirt')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (57, N'Sinop')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (58, N'Sivas')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (59, N'Tekirdağ')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (60, N'Tokat')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (61, N'Trabzon')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (62, N'Tunceli')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (63, N'Şanlıurfa')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (64, N'Uşak')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (65, N'Van')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (66, N'Yozgat')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (67, N'Zonguldak')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (68, N'Aksaray')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (69, N'Bayburt')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (70, N'Karaman')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (71, N'Kırıkkale')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (72, N'Batman')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (73, N'Şırnak')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (74, N'Bartın')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (75, N'Ardahan')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (76, N'Iğdır')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (77, N'Yalova')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (78, N'Karabük')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (79, N'Kilis')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (80, N'Osmaniye')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (81, N'Düzce')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (82, N'Eşme')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (83, N'Datça')
INSERT [dbo].[City] ([CityID], [CityName]) VALUES (84, N'Bergama')
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Publish] ON 

INSERT [dbo].[Publish] ([PublishID], [UserID], [CityID], [ActivePublish], [Description], [ImageUrl], [CategoryID], [ItemName]) VALUES (26, 8, 35, 1, N'Welcome to the Adventure Zone!', N'https://m.media-amazon.com/images/I/61Vo-ZR3k6L.jpg', 1, N'The Adventure Zone: Here There Be Gerblins')
INSERT [dbo].[Publish] ([PublishID], [UserID], [CityID], [ActivePublish], [Description], [ImageUrl], [CategoryID], [ItemName]) VALUES (27, 8, 83, 0, N'Biography of Leonardo da Vinci', N'https://m.media-amazon.com/images/I/61VMbkvRXUL.jpg', 3, N'Leonardo da Vinci')
INSERT [dbo].[Publish] ([PublishID], [UserID], [CityID], [ActivePublish], [Description], [ImageUrl], [CategoryID], [ItemName]) VALUES (28, 8, 84, 0, N'9 Ways to Create a Culture of Empathy and Responsibility Using Restorative Justice', N'https://m.media-amazon.com/images/I/51NFRfTZ4XL.jpg', 4, N'Hacking School Discipline')
INSERT [dbo].[Publish] ([PublishID], [UserID], [CityID], [ActivePublish], [Description], [ImageUrl], [CategoryID], [ItemName]) VALUES (29, 8, 82, 0, N'From the author of Me Before You, set in Depression-era America, a breathtaking story of five extraordinary women and their remarkable journey through the mountains of Kentucky and beyond.', N'https://m.media-amazon.com/images/I/51aQGTp2VfL.jpg', 5, N'The Giver of Stars: A Novel')
INSERT [dbo].[Publish] ([PublishID], [UserID], [CityID], [ActivePublish], [Description], [ImageUrl], [CategoryID], [ItemName]) VALUES (30, 8, 26, 0, N'“Exhalation by Ted Chiang is a collection of short stories that will make you think, grapple with big questions, and feel more human. The best kind of science fiction.” —Barack Obama, via Facebook', N'https://m.media-amazon.com/images/I/418U1PiNSHL.jpg', 8, N'Exhalation: Stories')
INSERT [dbo].[Publish] ([PublishID], [UserID], [CityID], [ActivePublish], [Description], [ImageUrl], [CategoryID], [ItemName]) VALUES (31, 9, 64, 0, N'In this fantasy classic, master storyteller J.R.R. Tolkein creates a bewitching world filled with delightful creatures and thrilling dangers.', N'https://images-na.ssl-images-amazon.com/images/I/31zkUp87NjL._SX318_BO1,204,203,200_.jpg', 1, N'Hobbit')
SET IDENTITY_INSERT [dbo].[Publish] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [EmailID], [DateOfBirth], [Password], [IsEmailVerified], [ActivationCode], [ResetPasswordCode]) VALUES (2, N'Ahmet', N'Ünlü', N'nasuhcan99@gmail.com', CAST(N'1997-11-11T00:00:00.000' AS DateTime), N'pmqyMbiHsfjPOa2V7stNUEBkBug47/xrEBRMvy5CmtA=', 1, N'6714d949-fd88-47ce-9ebe-d3ad950a2be6', N'11730535-8e75-46ba-bea2-ca3c4115345f')
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [EmailID], [DateOfBirth], [Password], [IsEmailVerified], [ActivationCode], [ResetPasswordCode]) VALUES (7, N'Ozan ', N'Bayar', N'ozanbyar@gmail.com', CAST(N'1999-02-11T00:00:00.000' AS DateTime), N'+RsbtgdWIF2BBBGqwvWrdJEz5yXBbf+neufw+Qwm9cs=', 1, N'e310cc48-a741-430f-a689-559722414a77', NULL)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [EmailID], [DateOfBirth], [Password], [IsEmailVerified], [ActivationCode], [ResetPasswordCode]) VALUES (8, N'Ilker', N'Mavili', N'ilkermavili5369@hotmail.com', CAST(N'1999-06-04T00:00:00.000' AS DateTime), N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', 1, N'681eff27-0b95-4842-b03b-c277f7049e78', NULL)
INSERT [dbo].[User] ([UserID], [FirstName], [LastName], [EmailID], [DateOfBirth], [Password], [IsEmailVerified], [ActivationCode], [ResetPasswordCode]) VALUES (9, N'Deneme', N'Mail', N'denememail4864@gmail.com', CAST(N'1997-05-13T00:00:00.000' AS DateTime), N'jZae727K08KaOmKSgOaGzww/XVqGr/PKEgIMkjrcbJI=', 1, N'53a7550d-f18f-4c98-b290-ed883234ff87', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Conversation]  WITH CHECK ADD  CONSTRAINT [FK_Conversation_Messages] FOREIGN KEY([MessageID])
REFERENCES [dbo].[Messages] ([MessageID])
GO
ALTER TABLE [dbo].[Conversation] CHECK CONSTRAINT [FK_Conversation_Messages]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Conversation] FOREIGN KEY([ConversationId])
REFERENCES [dbo].[Conversation] ([ConservationID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Conversation]
GO
ALTER TABLE [dbo].[Participants]  WITH CHECK ADD  CONSTRAINT [FK_Participants_Conversation1] FOREIGN KEY([ConversationId])
REFERENCES [dbo].[Conversation] ([ConservationID])
GO
ALTER TABLE [dbo].[Participants] CHECK CONSTRAINT [FK_Participants_Conversation1]
GO
ALTER TABLE [dbo].[Publish]  WITH CHECK ADD  CONSTRAINT [FK_Publish_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Publish] CHECK CONSTRAINT [FK_Publish_Category]
GO
ALTER TABLE [dbo].[Publish]  WITH CHECK ADD  CONSTRAINT [FK_Publish_City1] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Publish] CHECK CONSTRAINT [FK_Publish_City1]
GO
ALTER TABLE [dbo].[Publish]  WITH CHECK ADD  CONSTRAINT [FK_Publish_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Publish] CHECK CONSTRAINT [FK_Publish_User]
GO
USE [master]
GO
ALTER DATABASE [Anioi_DB] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Zelentsov_eyes]    Script Date: 25.10.2023 13:30:46 ******/
CREATE DATABASE [Zelentsov_eyes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Zelentsov_eyes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Zelentsov_eyes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Zelentsov_eyes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Zelentsov_eyes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zelentsov_eyes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zelentsov_eyes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zelentsov_eyes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zelentsov_eyes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Zelentsov_eyes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zelentsov_eyes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Zelentsov_eyes] SET  MULTI_USER 
GO
ALTER DATABASE [Zelentsov_eyes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zelentsov_eyes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zelentsov_eyes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zelentsov_eyes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Zelentsov_eyes] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Zelentsov_eyes]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
	[DirectorName] [nvarchar](100) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[Address] [nvarchar](300) NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 25.10.2023 13:30:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (101, N'СервисПив', 3, N'znosov@vasilev.ru', N'+7 (922) 325-12-93', N'', 329, N'Никита Александрович Королёв', N'6861024038', N'218034630', N'840377, Рязанская область, город Щёлково, пл. Бухарестская, 42')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (102, N'СантехСеверЛенМашина', 5, N'pgorbacev@vasilev.net', N'+7 (812) 214-73-94', N'\agents\agent_99.png', 201, N'Павел Максимович Рожков', N'3506691089', N'830713603', N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (103, N'ЭлектроРемОрионЛизинг', 1, N'anfisa.fedotova@tvetkov.ru', N'+7 (495) 513-93-16', N'\agents\agent_93.png', 198, N'Тарасова Дан Львович', N'1340072597', N'500478249', N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (104, N'РыбАлмазГаражСнаб', 1, N'diana.gorbunov@gromov.ru', N'+7 (35222) 46-54-74', N'\agents\agent_29.png', 50, N'Власов Ян Львович', N'2135119617', N'916748563', N'278792, Воронежская область, город Люберцы, ул. Космонавтов, 07')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (105, N'CибБашкирТекстиль', 2, N'vzimina@zdanova.com', N'+7 (35222) 92-28-68', N'\agents\agent_94.png', 218, N'Григорий Владимирович Елисеева', N'7392007090', N'576103661', N'429540, Мурманская область, город Воскресенск, пл. Славы, 36')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (106, N'ЮпитерТяжОрионЭкспедиция', 4, N'gblokin@orlov.net', N'+7 (812) 819-51-58', N'\agents\agent_69.png', 446, N'Валерий Евгеньевич Виноградов', N'6843174002', N'935556458', N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (107, N'КазаньТекстиль', 4, N'osimonova@andreeva.com', N'+7 (922) 936-37-67', N'\agents\agent_72.png', 156, N'Александров Бронислав Максимович', N'4584384019', N'149680499', N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (108, N'МясИнфоМясТраст', 4, N'dgulyev@krasilnikov.ru', N'+7 (812) 375-59-29', N'\agents\agent_43.png', 16, N'Лихачёваа Оксана Романовна', N'6387079446', N'113956342', N'873144, Курская область, город Талдом, проезд Домодедовская, 46')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (109, N'АвтоТомскЦементЦентр', 2, N'kabanov.valentina@subbotina.ru', N'+7 (35222) 24-98-18', N'\agents\agent_40.png', 71, N'Леонид Иванович Афанасьева', N'8317739640', N'940326934', N'282009, Вологодская область, город Красногорск, пл. Домодедовская, 14')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (110, N'Радио', 6, N'rtretykova@kozlov.ru', N'+7 (35222) 84-44-92', N'\agents\agent_68.png', 221, N'Эмма Андреевна Колесникова', N'9077613654', N'657690787', N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (111, N'ДизайнФинансМикро', 4, N'varvara15@belousov.ru', N'+7 (495) 223-67-97', N'', 462, N'Кузьма Борисович Королёва', N'2700182907', N'141912770', N'775051, Иркутская область, город Серебряные Пруды, спуск Домодедовская, 41')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (112, N'Креп', 1, N'savina.dominika@belousova.com', N'+7 (495) 315-25-86', N'\agents\agent_64.png', 371, N'Назар Алексеевич Григорьева', N'4880732317', N'258673591', N'336489, Калининградская область, город Можайск, наб. Славы, 35')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (113, N'ЖелДорДизайнМетизТраст', 6, N'lnikitina@kulikova.com', N'8-800-692-72-18', N'', 290, N'Игорь Львович Агафонова', N'7669116841', N'906390137', N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (114, N'Асбоцемент', 5, N'antonin19@panfilov.ru', N'+7 (812) 152-28-78', N'\agents\agent_59.png', 273, N'Никитинаа Антонина Андреевна', N'1261407459', N'745921890', N'030119, Курганская область, город Дмитров, пер. Славы, 47')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (115, N'Мобайл', 6, N'rafail22@orlov.ru', N'+7 (495) 532-54-42', N'\agents\agent_53.png', 40, N'Горшков Кузьма Фёдорович', N'3655195522', N'395816585', N'273144, Калужская область, город Наро-Фоминск, бульвар Чехова, 70')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (116, N'ТекстильУралАвтоОпт', 1, N'hkononova@pavlova.ru', N'+7 (495) 418-67-55', N'\agents\agent_97.png', 176, N'Алина Сергеевна Дьячковаа', N'3930950057', N'678529397', N'028936, Магаданская область, город Видное, ул. Гагарина, 54')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (117, N'Башкир', 3, N'iskra.sergeev@zykov.com', N'8-800-656-63-99', N'\agents\agent_33.png', 35, N'Одинцова Розалина Дмитриевна', N'3105334340', N'117513650', N'513065, Рязанская область, город Одинцово, шоссе Славы, 93')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (118, N'ГорДор', 2, N'maiy12@koklov.net', N'+7 (812) 364-46-64', N'\agents\agent_77.png', 175, N'Нонна Львовна Одинцоваа', N'7088187045', N'440309946', N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (119, N'Компания Рос', 5, N'odenisov@knyzeva.ru', N'+7 (35222) 32-99-94', N'', 252, N'Алёна Ивановна Тимофеева', N'5502989807', N'518320454', N'479740, Оренбургская область, город Наро-Фоминск, наб. Будапештсткая, 36')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (120, N'КазЮпитерТомск', 4, N'tgavrilov@frolov.ru', N'+7 (35222) 24-85-54', N'\agents\agent_85.png', 244, N'Рафаил Андреевич Копылов', N'9201745524', N'510248846', N'393450, Тульская область, город Кашира, пр. 1905 года, 47')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (121, N'СеверГаз', 6, N'smukina@evseev.com', N'+7 (812) 973-88-81', N'\agents\agent_15.png', 83, N'Валериан Андреевич Кириллова', N'7908427926', N'249521550', N'509479, Орловская область, город Павловский Посад, спуск Бухарестская, 28')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (122, N'Компания КазАлмаз', 5, N'irina.gusina@vlasova.ru', N'+7 (922) 692-21-57', N'\agents\agent_105.png', 396, N'Марк Фёдорович Муравьёва', N'3084797352', N'123190924', N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (123, N'ЦементАсбоцементОрионТраст', 4, N'igulyeva@kostina.ru', N'+7 (495) 979-36-66', N'\agents\agent_28.png', 441, N'Павлова Марк Александрович', N'2972154471', N'668972219', N'221534, Орловская область, город Серебряные Пруды, проезд Гагарина, 54')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (124, N'Компания Электро', 5, N'blokin.sofiy@terentev.ru', N'+7 (35222) 63-92-83', N'\agents\agent_41.png', 340, N'Кабанов Кирилл Максимович', N'4335399269', N'780051451', N'183744, Рязанская область, город Клин, въезд Косиора, 29')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (125, N'БашкирЮпитерТомск', 1, N'dyckov.veniamin@kotova.ru', N'+7 (812) 395-91-75', N'\agents\agent_84.png', 139, N'Фадеева Раиса Александровна', N'1606315697', N'217799345', N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (126, N'ОрионВектор', 1, N'subbotin.rostislav@zueva.org', N'+7 (922) 456-59-29', N'\agents\agent_22.png', 496, N'Алексей Борисович Семёнова', N'5687675108', N'816451597', N'138159, Свердловская область, город Подольск, спуск Балканская, 72')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (127, N'Рос', 3, N'potapov.abram@trofimova.org', N'+7 (922) 822-88-76', N'\agents\agent_36.png', 158, N'Никифороваа Рената Сергеевна', N'6729448041', N'935241906', N'412597, Калужская область, город Клин, пр. Гагарина, 57')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (128, N'ДизайнВосток', 2, N'efimova.timofei@tretykova.ru', N'+7 (922) 767-84-15', N'\agents\agent_17.png', 188, N'Добрыня Сергеевич Кабанов', N'6222265808', N'245694799', N'680394, Оренбургская область, город Павловский Посад, спуск Косиора, 50')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (129, N'РемГаражЛифт', 4, N'novikova.gleb@sestakov.ru', N'+7 (35222) 18-85-61', N'\agents\agent_90.png', 374, N'Филатов Владимир Максимович', N'1656477206', N'988968838', N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (130, N'ПивГлав', 5, N'sofiy.bolsakov@isakova.ru', N' 8-800-153-74-46', N'\agents\agent_27.png', 329, N'Клим Иванович Юдин', N'3090235456', N'870818930', N'244290, Астраханская область, город Талдом, проезд Космонавтов, 17')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (131, N'Компания Гараж', 5, N'asiryeva@andreeva.com', N'+7 (35222) 22-47-12', N'\agents\agent_91.png', 413, N'Владлена Фёдоровна Ларионоваа', N'6190244524', N'399106161', N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (132, N'Монтаж', 3, N'zakar.sazonova@gavrilov.ru', N'+7 (495) 783-36-97', N'\agents\agent_66.png', 300, N'Блохина Сергей Максимович', N'6142194281', N'154457435', N'066594, Магаданская область, город Шаховская, спуск Сталина, 59')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (133, N'ВодГараж', 4, N'pmaslov@fomiceva.com', N'+7 (35222) 11-75-66', N'\agents\agent_92.png', 250, N'Лаврентий Фёдорович Логинова', N'5575072431', N'684290320', N'988899, Саратовская область, город Раменское, пр. Славы, 40')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (134, N'Компания Метал', 5, N'vasileva.tatyna@lebedeva.net', N'+7 (35222) 99-39-28', N'\agents\agent_16.png', 167, N'Валентина Ивановна Громова', N'9933367989', N'856443865', N'908229, Иркутская область, город Истра, бульвар Бухарестская, 97')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (135, N'Бум', 3, N'belova.vikentii@konstantinova.net', N'+7 (922) 282-82-91', N'\agents\agent_103.png', 82, N'Татьяна Сергеевна Королёваа', N'1953785418', N'122905583', N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (136, N'Гор', 6, N'rostislav.savelev@dmitrieva.ru', N'+7 (812) 327-52-23', N'\agents\agent_46.png', 85, N'Адриан Александрович Одинцов', N'6196739969', N'784512010', N'245009, Белгородская область, город Коломна, шоссе Домодедовская, 93')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (137, N'МясРеч', 1, N'bkozlov@volkov.ru', N'+7 (812) 256-74-95', N'\agents\agent_83.png', 355, N'Белоусоваа Ирина Максимовна', N'9254261217', N'656363498', N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (138, N'МясТрансМоторЛизинг', 4, N'vlad.sokolov@andreev.org', N'+7 (495) 489-75-57', N'\agents\agent_87.png', 268, N'Тамара Дмитриевна Семёноваа', N'6148685143', N'196332656', N'765320, Ивановская область, город Шатура, спуск Гоголя, 88')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (139, N'Компания ТелекомХмельГаражПром', 5, N'qkolesnikova@kalinina.ru', N' 8-800-617-13-37', N'\agents\agent_96.png', 457, N'Костина Татьяна Борисовна', N'1614623826', N'824882264', N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (140, N'МетизТехАвтоПроф', 5, N'anastasiy.gromov@samsonova.com', N'8-800-192-74-77', N'\agents\agent_58.png', 321, N'Егор Фёдорович Третьякова', N'2988890076', N'215491048', N'713016, Брянская область, город Подольск, пл. Домодедовская, 93')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (141, N'РосАвтоМонтаж', 5, N'lapin.inessa@isaeva.com', N' 8-800-468-91-51', N'\agents\agent_80.png', 10, N'Диана Алексеевна Исаковаа', N'4735043946', N'263682488', N'331914, Курская область, город Ногинск, спуск Ладыгина, 66')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (142, N'Компания КрепГаз', 5, N'iturova@isakova.ru', N' 8-800-971-62-32', N'\agents\agent_48.png', 50, N'Эмилия Фёдоровна Шилова', N'2910821636', N'169856199', N'415525, Воронежская область, город Орехово-Зуево, спуск Ленина, 14')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (143, N'БухТеле', 1, N'vasilev.svetlana@saskov.org', N'+7 (35222) 89-78-68', N'\agents\agent_18.png', 171, N'Клавдия Романовна Савина', N'3547826061', N'581933218', N'481781, Астраханская область, город Орехово-Зуево, спуск Ломоносова, 67')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (144, N'ТяжМяж', 6, N'bzykov@baranov.com', N'+7 (812) 425-28-46', N'\agents\agent_55.png', 472, N'Юлия Львовна Горбунова', N'6391522710', N'209038885', N'255489, Самарская область, город Озёры, ул. Ломоносова, 09')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (145, N'Тех', 4, N'vasilisa99@belyev.ru', N'+7 (922) 113-94-49', N'\agents\agent_86.png', 278, N'Аким Романович Логинова', N'9282924869', N'587356429', N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (146, N'ГлавITФлотПроф', 3, N'savva.rybov@kolobov.ru', N'+7 (35222) 33-48-16', N'\agents\agent_89.png', 62, N'Зыкова Стефан Максимович', N'2561361494', N'525678825', N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (147, N'Восток', 3, N'nsitnikova@tikonova.org', N'+7 (495) 227-66-48', N'', 380, N'Савинаа Нина Александровна', N'8929775900', N'788028687', N'284236, Воронежская область, город Павловский Посад, бульвар Ленина, 28')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (148, N'ТелекомЮпитер', 2, N'kulikov.adrian@zuravlev.org', N'+7 (812) 798-33-53', N'\agents\agent_106.png', 302, N'Калинина Татьяна Ивановна', N'9383182378', N'944520594', N'959793, Курская область, город Егорьевск, бульвар Ленина, 72')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (149, N'МонтажВекторМобайлЦентр', 1, N'pavel.davydova@tretykov.net', N'+7 (495) 566-98-62', N'\agents\agent_32.png', 372, N'Захар Александрович Панова', N'4433392652', N'757806909', N'094869, Ленинградская область, город Ступино, наб. Ленина, 80')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (150, N'ВостокГлав', 5, N'gordei95@kirillov.ru', N'+7 (922) 329-34-28', N'\agents\agent_88.png', 107, N'Инга Фёдоровна Дмитриева', N'3580946305', N'405017349', N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (151, N'Компания КрепЦемент', 5, N'rusakov.efim@nikiforov.ru', N'8-800-628-79-67', N'\agents\agent_75.png', 426, N'Екатерина Львовна Суворова', N'3025099903', N'606083992', N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (152, N'ЖелДор', 1, N'karitonova.fedosy@vasileva.net', N'+7 (35222) 26-55-64', N'\agents\agent_51.png', 429, N'Симоноваа Лариса Борисовна', N'9392505809', N'911026119', N'860124, Иркутская область, город Егорьевск, пер. Гагарина, 67')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (153, N'Компания Хмель', 5, N'ermakov.mark@isakova.ru', N'+7 (35222) 27-19-66', N'\agents\agent_67.png', 2, N'Владимир Борисович Суворова', N'9004087602', N'297273898', N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (154, N'Цемент', 5, N'panova.klementina@bobrov.ru', N'+7 (922) 859-19-97', N'\agents\agent_79.png', 340, N'Анфиса Фёдоровна Буроваа', N'9662118663', N'650216214', N'084315, Амурская область, город Шаховская, наб. Чехова, 62')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (155, N'ЛенМобайлМикро', 3, N'frolov.artem@zuravlev.ru', N'+7 (35222) 96-34-97', N'\agents\agent_52.png', 341, N'Изабелла Евгеньевна Дьячкова', N'6729041572', N'828657559', N'737175, Ростовская область, город Одинцово, ул. Космонавтов, 99')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (156, N'Компания ТверьДизайн', 5, N'ypotapov@kolesnikova.ru', N' 8-800-234-93-22', N'\agents\agent_37.png', 271, N'Доминика Александровна Никитинаа', N'3567301661', N'623881311', N'672492, Калининградская область, город Москва, проезд Сталина, 64')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (157, N'ВодТверьХозМашина', 1, N'tkrylov@baranova.net', N'+7 (495) 756-36-72', N'\agents\agent_81.png', 8, N'Александра Дмитриевна Ждановаа', N'4174253174', N'522227145', N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (158, N'ТелеГлавВекторСбыт', 1, N'nsitnikov@kovaleva.ru', N'+7 (922) 619-91-52', N'\agents\agent_56.png', 185, N'Екатерина Фёдоровна Ковалёва', N'9504787157', N'419758597', N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (159, N'БашкирИнжКрепСбыт', 5, N'vlad.molcanov@fomicev.ru', N'+7 (922) 495-46-18', N'\agents\agent_24.png', 475, N'Алиса Фёдоровна Архипова', N'6771467761', N'977595370', N'191420, Новосибирская область, город Ногинск, пер. Будапештсткая, 28')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (160, N'ТрансТверь', 2, N'dorofeev.milan@vorobeva.net', N'+7 (35222) 22-74-12', N'\agents\agent_25.png', 495, N'Алина Романовна Овчинникова', N'3311036393', N'590018934', N'818676, Томская область, город Павловский Посад, ул. Ладыгина, 27')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (161, N'ТелеСеверМикро', 2, N'koseleva.ylii@potapov.ru', N'+7 (35222) 66-26-65', N'\agents\agent_12.png', 254, N'Селезнёв Василий Евгеньевич', N'9534974527', N'344691556', N'046300, Орловская область, город Ступино, бульвар Бухарестская, 13')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (162, N'CибПивОмскСнаб', 1, N'evorontova@potapova.ru', N'+7 (812) 743-49-87', N'', 477, N'Людмила Александровна Сафонова', N'5676173945', N'256512286', N'816260, Ивановская область, город Москва, ул. Гагарина, 31')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (163, N'ЛенБухМикро-H', 3, N'rybov.tatyna@merkuseva.com', N'+7 (812) 421-59-75', N'\agents\agent_30.png', 242, N'Субботин Герасим Владимирович', N'5943902570', N'103426359', N'078797, Мурманская область, город Коломна, пр. Гоголя, 94')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (164, N'ЮпитерЛенГараж-М', 2, N'larkipova@gorbunov.ru', N'+7 (812) 229-34-18', N'\agents\agent_73.png', 470, N'Васильева Валерия Борисовна', N'2038393690', N'259672761', N'339507, Московская область, город Видное, ул. Космонавтов, 11')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (165, N'МорВостокТомскПром', 4, N'lev.efremov@frolov.ru', N'+7 (922) 258-96-16', N'\agents\agent_20.png', 198, N'Гавриил Евгеньевич Селиверстов', N'4082127026', N'544686044', N'034623, Белгородская область, город Павловский Посад, проезд Ломоносова, 72')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (166, N'Компания ФинансСервис', 5, N'robert.serbakov@safonova.ru', N' 8-800-358-54-99', N'\agents\agent_63.png', 395, N'Клавдия Сергеевна Виноградова', N'7491491391', N'673621812', N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (167, N'Метиз', 5, N'mersova@rodionova.ru', N'+7 (35222) 81-78-92', N'\agents\agent_54.png', 168, N'Ян Иванович Егоров', N'4433116074', N'949226221', N'455463, Ярославская область, город Серпухов, пер. Бухарестская, 01')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (168, N'ФлотБух', 2, N'tkuznetova@sukanova.ru', N'+7 (922) 155-75-21', N'\agents\agent_21.png', 385, N'Муравьёваа Мария Дмитриевна', N'4868711532', N'409331823', N'741647, Ульяновская область, город Наро-Фоминск, ул. 1905 года, 11')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (169, N'КазХоз', 4, N'istrelkova@fomin.ru', N'8-800-955-44-52', N'', 213, N'Степанова Роман Иванович', N'6503377671', N'232279972', N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (170, N'Орион', 6, N'aleksei63@kiselev.ru', N'+7 (35222) 58-77-96', N'\agents\agent_102.png', 166, N'Мартынов Михаил Борисович', N'2670166502', N'716874456', N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (171, N'РечИнж', 4, N'qloginova@antonov.com', N'+7 (812) 971-47-98', N'\agents\agent_8.png', 426, N'Донат Иванович Кудрявцев', N'9289300952', N'534867576', N'862241, Кемеровская область, город Москва, пер. Славы, 63')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (172, N'РосПивТверь', 4, N'vitalii.melnikov@kopylov.com', N'+7 (922) 692-73-72', N'\agents\agent_11.png', 368, N'Люся Фёдоровна Горшковаа', N'2857470864', N'732899890', N'053965, Магаданская область, город Видное, наб. Балканская, 41')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (173, N'КрепТелекомТекстильМашина', 3, N'ignatov.adam@kononova.org', N'+7 (922) 278-54-95', N'\agents\agent_39.png', 259, N'Богданов Денис Максимович', N'7626613684', N'187506967', N'754514, Тверская область, город Люберцы, пл. Домодедовская, 84')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (174, N'МорГлавМонтажЭкспедиция', 4, N'flukin@moiseeva.com', N'+7 (812) 161-96-49', N'\agents\agent_34.png', 329, N'Анастасия Львовна Субботинаа', N'8619846965', N'796144573', N'313619, Читинская область, город Чехов, ул. Ленина, 38')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (175, N'ТекстильУралВод', 6, N'obespalov@alekseev.org', N'+7 (495) 614-67-93', N'\agents\agent_9.png', 28, N'Эльвира Фёдоровна Герасимова', N'8336124514', N'871193263', N'872673, Ярославская область, город Видное, спуск Славы, 04')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (176, N'Газ', 3, N'ulyna.antonov@noskov.ru', N'8-800-278-78-32', N'\agents\agent_101.png', 170, N'Терентьев Илларион Максимович', N'8876413796', N'955381891', N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (177, N'ТомскТранс', 5, N'antonina.krasilnikov@nikonov.ru', N'+7 (35222) 66-22-46', N'\agents\agent_47.png', 427, N'Архипова Юрий Дмитриевич', N'6523850838', N'970092830', N'271624, Свердловская область, город Озёры, ул. Косиора, 21')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (178, N'Компания ТехТеле', 5, N'anfisa63@sobolev.ru', N'8-800-943-36-45', N'\agents\agent_42.png', 465, N'Тихонова Валериан Владимирович', N'1553744119', N'713327632', N'285256, Магаданская область, город Дмитров, шоссе Ладыгина, 20')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (179, N'СофтИнжIT', 4, N'yliy.efimov@zdanova.ru', N' 8-800-319-27-45', N'\agents\agent_50.png', 460, N'Виктор Львович Михайлова', N'2368693812', N'791368408', N'146295, Тверская область, город Одинцово, въезд Бухарестская, 78')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (180, N'Компания Монтаж', 5, N'afanasev.anastasiy@muravev.ru', N'+7 (495) 626-86-13', N'\agents\agent_100.png', 124, N'Силин Даниил Иванович', N'6206428565', N'118570048', N'036381, Брянская область, город Кашира, бульвар Гагарина, 76')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (181, N'СтройГорНефть', 4, N'lysy.kolesnikova@molcanova.com', N'+7 (495) 852-82-84', N'\agents\agent_62.png', 161, N'Тарасова Макар Максимович', N'5916775587', N'398299418', N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (182, N'ЦементХмельОрионНаладка', 4, N'daniil.selezneva@safonova.com', N'+7 (922) 419-14-19', N'\agents\agent_49.png', 61, N'Максим Евгеньевич Гурьева', N'2118874929', N'482607758', N'014379, Кировская область, город Озёры, пр. Будапештсткая, 28')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (183, N'Компания ОрионСтройЛифт', 5, N'artemii.abramova@arkipov.ru', N'8-800-381-59-97', N'', 467, N'Щукина Искра Максимовна', N'8834229587', N'958311664', N'819305, Воронежская область, город Талдом, шоссе Ломоносова, 36')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (184, N'Тяж', 3, N'rodionova.ulyna@noskov.ru', N'+7 (922) 547-77-52', N'\agents\agent_35.png', 207, N'Белов Влад Александрович', N'5484904441', N'943388774', N'650482, Смоленская область, город Коломна, проезд Косиора, 95')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (185, N'ЦементАсбоцемент', 1, N'polykov.veronika@artemeva.ru', N'+7 (922) 133-68-96', N'\agents\agent_76.png', 426, N'Воронова Мария Александровна', N'4345774724', N'352469905', N'619540, Курская область, город Раменское, пл. Балканская, 12')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (186, N'ГазДизайнЖелДор', 2, N'elizaveta.komarov@rybakov.net', N'+7 (35222) 39-88-91', N'\agents\agent_74.png', 236, N'Лев Иванович Третьяков', N'2396029740', N'458924890', N'695230, Курская область, город Красногорск, пр. Гоголя, 64')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (187, N'РемСантехОмскБанк', 4, N'anisimov.mark@vorobev.ru', N'+7 (35222) 76-15-56', N'\agents\agent_82.png', 442, N'Фокина Искра Максимовна', N'6823050572', N'176488617', N'289468, Омская область, город Видное, пер. Балканская, 33')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (188, N'Мясо', 3, N'ulyna.antonov@noskov.ru', N'+7 (922) 315-51-42', N'\agents\agent_107.png', 170, N'Терентьев Илларион Максимович', N'1876413796', N'955381891', N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (189, N'КрепГаражСантехМаш', 6, N'vladlen84@ersova.net', N'+7 (495) 172-31-91', N'\agents\agent_10.png', 330, N'Аркадий Романович Тихонов', N'7574946061', N'146206755', N'207204, Пензенская область, город Одинцово, пер. Гагарина, 80')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (190, N'ИнжITЖелДор-H', 3, N'karitonov.aleksandra@samoilov.com', N'+7 (495) 324-18-82', N'\agents\agent_14.png', 129, N'Колесникова Август Владимирович', N'8103088511', N'604606043', N'019291, Вологодская область, город Клин, ул. Космонавтов, 96')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (191, N'Рем', 1, N'zanna25@nikiforova.com', N'+7 (35222) 46-69-69', N'\agents\agent_104.png', 329, N'Шароваа Елизавета Львовна', N'3203830728', N'456254820', N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (192, N'ФинансТелеТверь', 6, N'medvedev.klim@afanasev.com', N'+7 (495) 839-58-56', N'\agents\agent_70.png', 100, N'Зайцеваа Дарья Сергеевна', N'2646091050', N'971874277', N'687171, Томская область, город Лотошино, пл. Славы, 59')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (193, N'Строй', 3, N'soloveva.adam@andreev.ru', N'+7 (922) 129-57-13', N'\agents\agent_57.png', 12, N'Кудрявцев Адриан Андреевич', N'6678884759', N'279288618', N'763019, Омская область, город Шатура, пл. Сталина, 56')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (194, N'ЭлектроITITСбыт', 1, N'eliseeva.sofy@gorskov.net', N'+7 (812) 326-15-27', N'\agents\agent_23.png', 452, N'Якушеваа Варвара Романовна', N'1532104861', N'112607081', N'855489, Вологодская область, город Серебряные Пруды, пл. Ломоносова, 57')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (195, N'ЛенХозМясБанк', 2, N'bobrov.viktor@kazakova.ru', N'+7 (35222) 26-15-93', N'\agents\agent_31.png', 17, N'Арсений Алексеевич Виноградова', N'9266199692', N'335770867', N'702413, Саратовская область, город Люберцы, въезд Чехова, 15')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (196, N'ЭлектроМоторТрансСнос', 4, N'inessa.voronov@sidorova.ru', N'+7 (495) 951-23-53', N'\agents\agent_98.png', 151, N'Людмила Евгеньевна Новиковаа', N'6608362851', N'799760512', N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (197, N'Компания СервисРадиоГор', 5, N'nika.nekrasova@kovalev.ru', N'+7 (812) 871-21-15', N'\agents\agent_65.png', 169, N'Попов Вадим Александрович', N'8880473721', N'729975116', N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (198, N'Компания МясДизайнДизайн', 5, N'gleb.gulyev@belyeva.com', N'+7 (495) 752-21-98', N'\agents\agent_78.png', 491, N'Клементина Сергеевна Стрелкова', N'8004989990', N'908629456', N'557264, Брянская область, город Серпухов, въезд Гоголя, 34')
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (199, N'БашкирФлотМотор-H', 2, N'morozova.nika@kazakova.ru', N'+7 (812) 737-79-77', N'\agents\agent_61.png', 416, N'Марат Алексеевич Фролов', N'1657476072', N'934931159', N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94')
GO
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Email], [Phone], [Logo], [Priority], [DirectorName], [INN], [KPP], [Address]) VALUES (200, N'СофтМонтажХозСбыт', 4, N'zinaida90@filippov.org', N'+7 (495) 396-23-64', N'\agents\agent_44.png', 403, N'Харитонов Антонин Владимирович', N'5408216010', N'737659265', N'860932, Калужская область, город Наро-Фоминск, ул. Балканская, 78')
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'ЗАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'МКК', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'МФО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'ОАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'ООО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'ПАО', NULL)
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (51, N'Маска на лицо открытого типа 4556', 4, N'7560408', 3, 3, CAST(1576.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (52, N'Очки прозрачные затемненные 2256', 4, N'76452269', 3, 9, CAST(342.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (53, N'Маска защитная закрытого типа 1359', 3, N'75996796', 4, 12, CAST(198.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (54, N'Защита глаз с клапаном 2579', 4, N'50785095', 3, 5, CAST(832.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (55, N'Маска на лицо затемненные 5068', 4, N'44451659', 3, 6, CAST(1713.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (56, N'Очки прозрачные открытого типа 2830', 1, N'67633308', 5, 2, CAST(1269.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (57, N'Маска на лицо с клапаном 3370', 2, N'81175619', 1, 3, CAST(822.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (58, N'Маска защитная затемненные 1396', 2, N'21739873', 2, 10, CAST(744.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (59, N'Защита глаз затемненные 1999', 1, N'83267291', 1, 8, CAST(1105.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (60, N'Маска защитная с клапаном 2921', 3, N'42906442', 4, 3, CAST(273.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (61, N'Очки красные затемненные 5288', 3, N'17973888', 5, 10, CAST(1383.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (62, N'Маска защитная закрытого типа 1508', 3, N'38631872', 5, 10, CAST(1521.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (63, N'Защита глаз от воды с клапаном 5141', 2, N'48232658', 2, 10, CAST(1754.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (64, N'Очки прозрачные с клапаном 4732', 4, N'9796980', 4, 5, CAST(1806.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (65, N'Маска на лицо открытого типа 3158', 2, N'47415783', 5, 1, CAST(1285.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (66, N'Очки прозрачные с клапаном 5034', 2, N'6783736', 3, 12, CAST(1475.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (67, N'Защита глаз затемненные 1922', 3, N'63567187', 4, 9, CAST(1562.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (68, N'Защита глаз от воды с клапаном 1498', 2, N'73250951', 5, 12, CAST(1868.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (69, N'Защита глаз от пыли затемненные 6614', 2, N'89589447', 1, 7, CAST(1370.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (70, N'Очки темные открытого типа 4067', 2, N'74666994', 2, 5, CAST(792.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (71, N'Защита глаз открытого типа 3465', 3, N'35778001', 2, 4, CAST(212.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (72, N'Защита глаз от воды закрытого типа 6052', 2, N'80684143', 2, 9, CAST(589.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (73, N'Очки прозрачные затемненные 5848', 4, N'86254159', 4, 8, CAST(878.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (74, N'Маска на лицо закрытого типа 4426', 2, N'78789007', 5, 8, CAST(185.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (75, N'Маска на лицо открытого типа 6456', 4, N'23804393', 3, 12, CAST(1343.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (76, N'Защита глаз открытого типа 2381', 4, N'80410937', 5, 2, CAST(1690.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (77, N'Очки прозрачные открытого типа 6480', 3, N'23552742', 5, 12, CAST(729.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (78, N'Маска на лицо затемненные 6914', 2, N'16837832', 1, 9, CAST(296.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (79, N'Защита глаз открытого типа 1876', 2, N'18274186', 1, 6, CAST(1754.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (80, N'Защита глаз с клапаном 2715', 2, N'65896850', 3, 11, CAST(1769.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (81, N'Защита глаз от воды с клапаном 2922', 1, N'32589387', 1, 3, CAST(1436.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (82, N'Маска защитная затемненные 3116', 2, N'16694924', 3, 4, CAST(1042.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (83, N'Маска защитная открытого типа 5493', 4, N'28669954', 4, 9, CAST(565.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (84, N'Очки темные с клапаном 4354', 2, N'26078631', 2, 6, CAST(1627.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (85, N'Защита глаз от пыли открытого типа 5443', 3, N'87162470', 5, 8, CAST(1180.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (86, N'Маска на лицо с клапаном 6789', 1, N'75277715', 2, 1, CAST(874.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (87, N'Защита глаз с клапаном 1456', 4, N'89728004', 3, 10, CAST(1676.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (88, N'Очки прозрачные закрытого типа 1090', 1, N'51936367', 2, 12, CAST(335.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (89, N'Защита глаз от воды закрытого типа 1351', 3, N'33766997', 4, 11, CAST(453.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (90, N'Защита глаз с клапаном 4657', 3, N'60888572', 3, 12, CAST(638.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (91, N'Очки прозрачные затемненные 2009', 2, N'60643813', 2, 10, CAST(1070.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (92, N'Очки темные с клапаном 2774', 3, N'74007987', 5, 11, CAST(534.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (93, N'Очки прозрачные затемненные 4299', 1, N'30033340', 1, 7, CAST(708.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (94, N'Защита глаз от воды закрытого типа 5795', 4, N'37743614', 1, 11, CAST(1790.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (95, N'Защита глаз от пыли с клапаном 6767', 2, N'57763347', 4, 5, CAST(371.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (96, N'Защита глаз затемненные 1433', 1, N'19163774', 3, 12, CAST(1301.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (97, N'Очки прозрачные с клапаном 2870', 1, N'14625901', 2, 1, CAST(1483.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (98, N'Очки прозрачные с клапаном 2928', 4, N'72314954', 1, 2, CAST(1467.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (99, N'Очки прозрачные закрытого типа 1153', 2, N'18277077', 3, 12, CAST(375.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent], [Description], [Image]) VALUES (100, N'Маска на лицо закрытого типа 2053', 2, N'48084823', 5, 3, CAST(1617.00 AS Decimal(10, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (1, 104, 83, CAST(N'2014-06-25' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (2, 172, 92, CAST(N'2011-01-04' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (3, 173, 61, CAST(N'2015-07-03' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (4, 108, 71, CAST(N'2019-06-06' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (5, 115, 51, CAST(N'2014-03-28' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (6, 115, 81, CAST(N'2019-02-13' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (7, 171, 88, CAST(N'2012-04-26' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (8, 142, 52, CAST(N'2019-01-22' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (9, 156, 82, CAST(N'2017-12-09' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (10, 119, 85, CAST(N'2013-03-18' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (11, 117, 68, CAST(N'2016-11-06' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (12, 104, 68, CAST(N'2018-08-22' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (13, 159, 98, CAST(N'2012-08-06' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (14, 171, 78, CAST(N'2011-02-27' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (15, 108, 90, CAST(N'2016-01-09' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (16, 109, 91, CAST(N'2018-01-14' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (17, 101, 59, CAST(N'2010-07-20' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (18, 143, 56, CAST(N'2012-11-24' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (19, 147, 94, CAST(N'2017-12-15' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (20, 160, 73, CAST(N'2015-06-24' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (21, 111, 79, CAST(N'2018-03-05' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (22, 104, 83, CAST(N'2016-12-16' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (23, 195, 81, CAST(N'2019-03-10' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (24, 189, 83, CAST(N'2017-10-25' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (25, 119, 63, CAST(N'2013-06-16' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (26, 178, 58, CAST(N'2016-05-05' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (27, 177, 53, CAST(N'2018-05-01' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (28, 101, 84, CAST(N'2011-03-17' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (29, 184, 99, CAST(N'2010-05-08' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (30, 184, 87, CAST(N'2014-01-16' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (31, 189, 59, CAST(N'2010-09-13' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (32, 128, 67, CAST(N'2017-06-15' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (33, 126, 87, CAST(N'2011-01-06' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (34, 108, 62, CAST(N'2013-01-28' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (35, 119, 70, CAST(N'2014-09-13' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (36, 147, 64, CAST(N'2010-11-04' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (37, 136, 66, CAST(N'2017-12-19' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (38, 111, 87, CAST(N'2013-06-26' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (39, 108, 95, CAST(N'2012-10-15' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (40, 194, 97, CAST(N'2015-09-05' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (41, 171, 58, CAST(N'2012-08-26' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (42, 194, 94, CAST(N'2012-06-04' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (43, 177, 96, CAST(N'2012-06-11' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (44, 123, 58, CAST(N'2018-05-23' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (45, 158, 66, CAST(N'2013-08-24' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (46, 109, 66, CAST(N'2011-05-10' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (47, 126, 64, CAST(N'2013-02-03' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (48, 143, 91, CAST(N'2017-06-24' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (49, 183, 81, CAST(N'2010-09-13' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (50, 149, 68, CAST(N'2017-09-10' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (51, 136, 68, CAST(N'2016-09-17' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (52, 163, 64, CAST(N'2013-04-18' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (53, 136, 67, CAST(N'2010-08-27' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (54, 173, 64, CAST(N'2017-07-06' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (55, 123, 83, CAST(N'2013-07-10' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (56, 174, 79, CAST(N'2019-12-23' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (57, 165, 87, CAST(N'2019-11-07' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (58, 179, 84, CAST(N'2011-07-20' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (59, 172, 70, CAST(N'2011-02-05' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (60, 101, 58, CAST(N'2016-04-17' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (61, 147, 56, CAST(N'2018-02-06' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (62, 144, 62, CAST(N'2012-01-04' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (63, 144, 82, CAST(N'2018-12-07' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (64, 101, 58, CAST(N'2019-02-12' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (65, 182, 67, CAST(N'2010-11-10' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (66, 175, 59, CAST(N'2013-03-23' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (67, 152, 93, CAST(N'2019-09-26' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (68, 108, 99, CAST(N'2013-08-24' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (69, 142, 93, CAST(N'2015-10-18' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (70, 195, 55, CAST(N'2012-12-28' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (71, 163, 71, CAST(N'2019-08-09' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (72, 117, 91, CAST(N'2010-03-23' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (73, 111, 76, CAST(N'2010-12-21' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (74, 111, 76, CAST(N'2010-02-21' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (75, 152, 79, CAST(N'2014-03-24' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (76, 124, 62, CAST(N'2018-04-18' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (77, 147, 75, CAST(N'2011-11-12' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (78, 190, 69, CAST(N'2017-12-17' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (79, 109, 89, CAST(N'2018-06-24' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (80, 184, 81, CAST(N'2014-07-10' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (81, 167, 98, CAST(N'2019-03-05' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (82, 104, 100, CAST(N'2017-07-20' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (83, 160, 65, CAST(N'2019-01-08' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (84, 124, 76, CAST(N'2017-05-05' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (85, 156, 85, CAST(N'2013-01-12' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (86, 195, 53, CAST(N'2012-10-12' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (87, 161, 60, CAST(N'2014-04-12' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (88, 101, 97, CAST(N'2018-09-11' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (89, 119, 97, CAST(N'2018-01-18' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (90, 124, 100, CAST(N'2015-03-07' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (91, 127, 59, CAST(N'2012-10-08' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (92, 183, 67, CAST(N'2014-01-08' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (93, 136, 76, CAST(N'2011-10-27' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (94, 121, 93, CAST(N'2012-08-18' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (95, 200, 77, CAST(N'2011-11-01' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (96, 160, 98, CAST(N'2011-12-16' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (97, 123, 89, CAST(N'2013-04-18' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (98, 173, 99, CAST(N'2010-06-09' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (99, 152, 72, CAST(N'2015-02-12' AS Date), 12)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (100, 123, 74, CAST(N'2012-08-01' AS Date), 1)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N' Закрытого типа', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N' Затемненные', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N' Открытого типа', NULL)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N' С клапаном', NULL)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [Zelentsov_eyes] SET  READ_WRITE 
GO

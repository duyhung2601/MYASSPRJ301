USE [master]
GO
/****** Object:  Database [projectCheckAttend]    Script Date: 7/4/2022 9:43:36 PM ******/
CREATE DATABASE [projectCheckAttend]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projectCheckAttend', FILENAME = N'D:\New folder\MSSQL15.SQLEXPRESS\MSSQL\DATA\projectCheckAttend.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projectCheckAttend_log', FILENAME = N'D:\New folder\MSSQL15.SQLEXPRESS\MSSQL\DATA\projectCheckAttend_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [projectCheckAttend] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectCheckAttend].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectCheckAttend] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [projectCheckAttend] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectCheckAttend] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectCheckAttend] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectCheckAttend] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectCheckAttend] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectCheckAttend] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectCheckAttend] SET  ENABLE_BROKER 
GO
ALTER DATABASE [projectCheckAttend] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectCheckAttend] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectCheckAttend] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectCheckAttend] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectCheckAttend] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectCheckAttend] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectCheckAttend] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectCheckAttend] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [projectCheckAttend] SET  MULTI_USER 
GO
ALTER DATABASE [projectCheckAttend] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectCheckAttend] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectCheckAttend] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectCheckAttend] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectCheckAttend] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projectCheckAttend] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [projectCheckAttend] SET QUERY_STORE = OFF
GO
USE [projectCheckAttend]
GO
/****** Object:  Table [dbo].[CheckAttedance]    Script Date: 7/4/2022 9:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CheckAttedance](
	[CaID] [int] IDENTITY(1,1) NOT NULL,
	[SlotID] [int] NOT NULL,
	[SID] [int] NOT NULL,
	[CheckAttendance] [bit] NOT NULL,
	[Comment] [nvarchar](200) NOT NULL,
	[Taker] [nvarchar](50) NOT NULL,
	[RecordTime] [datetime] NULL,
 CONSTRAINT [PK_CheckAttedance] PRIMARY KEY CLUSTERED 
(
	[CaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 7/4/2022 9:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[SID] [int] NOT NULL,
	[GroupID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 7/4/2022 9:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nchar](10) NOT NULL,
	[SubID] [int] NOT NULL,
	[Term] [nvarchar](50) NOT NULL,
	[Campus] [nvarchar](50) NOT NULL,
	[Department] [nvarchar](50) NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 7/4/2022 9:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[InstructorID] [int] IDENTITY(1,1) NOT NULL,
	[IName] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/4/2022 9:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomCode] [nvarchar](50) NOT NULL,
	[Campus] [nvarchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 7/4/2022 9:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Slot] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Slot] PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/4/2022 9:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[Scode] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Gender] [bit] NOT NULL,
	[img] [ntext] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/4/2022 9:43:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubID] [int] IDENTITY(1,1) NOT NULL,
	[SubCode] [nvarchar](50) NOT NULL,
	[SubName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CheckAttedance] ON 

INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (163, 1, 39, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.893' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (164, 1, 10, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.893' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (165, 1, 11, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (166, 1, 58, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (167, 1, 53, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (168, 1, 54, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (169, 1, 55, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (170, 1, 16, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (171, 1, 17, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (172, 1, 18, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.897' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (173, 1, 19, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (174, 1, 21, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (175, 1, 42, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (176, 1, 43, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (177, 1, 24, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (178, 1, 25, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (179, 1, 46, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (180, 1, 27, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (181, 1, 48, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (182, 1, 49, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (183, 1, 40, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (184, 1, 41, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (185, 1, 12, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (186, 1, 13, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (187, 1, 14, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (188, 1, 35, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (189, 1, 36, 0, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (190, 1, 37, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.900' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (191, 1, 38, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.903' AS DateTime))
INSERT [dbo].[CheckAttedance] ([CaID], [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) VALUES (192, 1, 15, 1, N'', N'4', CAST(N'2022-07-04T01:16:38.903' AS DateTime))
SET IDENTITY_INSERT [dbo].[CheckAttedance] OFF
GO
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (22, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (23, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (26, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (28, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (29, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (30, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (31, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (32, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (33, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (34, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 4)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (9, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (44, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (45, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (47, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 5)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (39, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (21, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (42, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (43, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (24, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (25, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (46, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (27, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (48, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (49, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (40, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (41, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (12, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (13, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (14, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (35, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (36, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (37, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (38, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (15, 6)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (10, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (11, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (58, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (53, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (54, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (55, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (16, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (17, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (18, 7)
INSERT [dbo].[Enroll] ([SID], [GroupID]) VALUES (19, 7)
GO
USE [master]
GO
ALTER DATABASE [projectCheckAttend] SET  READ_WRITE 
GO

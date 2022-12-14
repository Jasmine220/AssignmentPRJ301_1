USE [master]
GO
/****** Object:  Database [PRJ301_FALL2022_Assignment]    Script Date: 11/23/2022 11:34:16 PM ******/
CREATE DATABASE [PRJ301_FALL2022_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRJ301_FALL2022_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.GIAOLANG\MSSQL\DATA\PRJ301_FALL2022_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRJ301_FALL2022_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.GIAOLANG\MSSQL\DATA\PRJ301_FALL2022_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_FALL2022_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET QUERY_STORE = OFF
GO
USE [PRJ301_FALL2022_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [varchar](150) NOT NULL,
	[username] [varchar](150) NULL,
	[password] [varchar](150) NULL,
	[displayname] [varchar](150) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Role]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Role](
	[id] [varchar](150) NOT NULL,
	[rolid] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attandance]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attandance](
	[sesid] [int] NOT NULL,
	[stdid] [int] NOT NULL,
	[present] [bit] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[record_time] [datetime] NULL,
 CONSTRAINT [PK_Attandance] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC,
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NULL,
	[furl] [varchar](150) NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[sem] [varchar](150) NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rolid] [int] NOT NULL,
	[rolname] [varchar](150) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rolid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[rolid] [int] NOT NULL,
	[fid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sesid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[tid] [int] NOT NULL,
	[index] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[attanded] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stdid] [int] NOT NULL,
	[stdname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Group]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Group](
	[stdid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Student_Group] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 11/23/2022 11:34:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'1', N'sonnt', N'123', N'Ngo Tung Son')
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'2', N'tuanvm', N'123', N'Vuong Minh Tuan')
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'3', N'hoangnvhe123', N'123', N'Tran Van Hoang')
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'4', N'trangdthe123', N'123', N'Dang Thuy Trang')
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'5', N'longnthe123', N'123', N'Nguyen Thanh Long')
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'6', N'khanhhdhe123', N'123', N'Hua Duy Khanh')
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'7', N'vuhcahe123', N'123', N'Hoang Chu Anh Vu')
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'8', N'anhntqhe123', N'123', N'Nguyen Thi Quynh Anh')
INSERT [dbo].[Account] ([id], [username], [password], [displayname]) VALUES (N'9', N'chilp', N'123', N'Le Phuong Chi')
GO
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'1', 1)
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'2', 1)
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'3', 2)
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'4', 2)
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'5', 2)
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'6', 2)
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'7', 2)
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'8', 2)
INSERT [dbo].[Account_Role] ([id], [rolid]) VALUES (N'9', 1)
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 3, 0, N'3', CAST(N'2022-11-07T16:37:14.210' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 4, 0, N'9', CAST(N'2022-11-07T16:37:14.210' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 5, 0, N'dgdsg', CAST(N'2022-11-07T16:37:14.210' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, 7, 0, N'covid 19', CAST(N'2022-11-07T16:37:14.210' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 3, 0, N'X', CAST(N'2022-11-08T14:02:58.773' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 4, 0, N'X', CAST(N'2022-11-08T14:02:58.773' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 5, 0, N'', CAST(N'2022-11-08T14:02:58.773' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (3, 7, 0, N'', CAST(N'2022-11-08T14:02:58.770' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 3, 0, N' no reason', CAST(N'2022-11-08T22:24:55.857' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 4, 1, N'xcbxcb', CAST(N'2022-11-08T22:24:55.857' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 5, 0, N'covid', CAST(N'2022-11-08T22:24:55.857' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (4, 7, 1, N'', CAST(N'2022-11-08T22:24:55.860' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 3, 0, N'', CAST(N'2022-11-02T21:56:36.163' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 5, 0, N'25', CAST(N'2022-11-02T21:56:36.167' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 6, 0, N'26', CAST(N'2022-11-02T21:56:36.167' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, 7, 0, N'', CAST(N'2022-11-02T21:56:36.167' AS DateTime))
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 5, 0, N'', NULL)
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (8, 6, 0, N'', NULL)
GO
INSERT [dbo].[Feature] ([fid], [fname], [furl]) VALUES (1, N'time_table_lecturer', N'/lecturer/timetable')
INSERT [dbo].[Feature] ([fid], [fname], [furl]) VALUES (2, N'record_attandance_lecturer', N'/lecturer/recordattendance')
INSERT [dbo].[Feature] ([fid], [fname], [furl]) VALUES (3, N'take_attandance_lecturer', N'/lecturer/attandance')
INSERT [dbo].[Feature] ([fid], [fname], [furl]) VALUES (4, N'time_table_student', N'/student/timetable')
INSERT [dbo].[Feature] ([fid], [fname], [furl]) VALUES (5, N'record_attandance_student', N'/student/recordattendance')
INSERT [dbo].[Feature] ([fid], [fname], [furl]) VALUES (6, N'student_home', N'/student/home')
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (1, N'PRJ301-01', 1, 1, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (2, N'PRJ301-02', 1, 1, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (3, N'PRJ301-03', 1, 2, N'FALL', 2022)
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (4, N'PRO192-01', 2, 9, N'FALL', 2022)
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (1, N'Sonnt5')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (2, N'Tuanvm2')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (9, N'ChiLP')
GO
INSERT [dbo].[Role] ([rolid], [rolname]) VALUES (1, N'lecturer')
INSERT [dbo].[Role] ([rolid], [rolname]) VALUES (2, N'student')
GO
INSERT [dbo].[Role_Feature] ([rolid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([rolid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([rolid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([rolid], [fid]) VALUES (2, 4)
INSERT [dbo].[Role_Feature] ([rolid], [fid]) VALUES (2, 5)
INSERT [dbo].[Role_Feature] ([rolid], [fid]) VALUES (2, 6)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'DE-205')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'DE-307')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (3, N'DE-204')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (4, N'DE-224')
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (1, 1, 1, CAST(N'2022-11-02' AS Date), 1, 1, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (2, 1, 1, CAST(N'2022-11-04' AS Date), 1, 2, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (3, 1, 1, CAST(N'2022-11-07' AS Date), 1, 3, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (4, 1, 1, CAST(N'2022-11-08' AS Date), 1, 4, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (5, 1, 1, CAST(N'2022-11-11' AS Date), 1, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (6, 2, 1, CAST(N'2022-11-02' AS Date), 2, 1, 1, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (7, 2, 1, CAST(N'2022-11-04' AS Date), 2, 2, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (8, 2, 1, CAST(N'2022-11-07' AS Date), 2, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (9, 2, 1, CAST(N'2022-11-09' AS Date), 2, 4, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (10, 2, 1, CAST(N'2022-11-11' AS Date), 2, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (11, 3, 2, CAST(N'2022-11-01' AS Date), 1, 1, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (12, 3, 2, CAST(N'2022-11-03' AS Date), 1, 2, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (13, 3, 2, CAST(N'2022-11-02' AS Date), 1, 3, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (14, 3, 2, CAST(N'2022-11-04' AS Date), 1, 4, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (15, 3, 2, CAST(N'2022-11-07' AS Date), 1, 5, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (16, 4, 1, CAST(N'2022-11-06' AS Date), 3, 1, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (17, 4, 1, CAST(N'2022-11-09' AS Date), 3, 2, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (18, 4, 1, CAST(N'2022-11-11' AS Date), 3, 3, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (19, 4, 1, CAST(N'2022-11-13' AS Date), 3, 4, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (20, 4, 1, CAST(N'2022-11-15' AS Date), 3, 5, 1, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (21, 1, 1, CAST(N'2022-11-02' AS Date), 4, 1, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (22, 1, 1, CAST(N'2022-11-04' AS Date), 4, 2, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (23, 1, 1, CAST(N'2022-11-07' AS Date), 4, 3, 2, 1)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (24, 1, 1, CAST(N'2022-11-09' AS Date), 4, 4, 2, 0)
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (25, 1, 1, CAST(N'2022-11-11' AS Date), 4, 5, 2, 0)
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (1, N'Student 1')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (2, N'Student 2')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (3, N'Tran Van Hoang')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (4, N'Dang Thuy Trang')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (5, N'Nguyen Thanh Long')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (6, N'Hua Duy Khanh')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (7, N'Hoang Chu Anh Vu')
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (8, N'Nguyen Thi Quynh Anh')
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (3, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (4, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (5, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (6, 4)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 1)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 2)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 3)
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (7, 4)
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (1, N'PRJ301')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (2, N'PRO192')
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (3, N'MAS291')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (1, N'7h30 - 9h')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (2, N'9h10 - 10h40')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (3, N'10h50 - 12h20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (4, N'12h50 - 14h20')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (5, N'14h30 - 16h')
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (6, N'16h10 - 17h40')
GO
ALTER TABLE [dbo].[Account_Role]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Account_Role] CHECK CONSTRAINT [FK_Account_Role_Account]
GO
ALTER TABLE [dbo].[Account_Role]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role_Role] FOREIGN KEY([rolid])
REFERENCES [dbo].[Role] ([rolid])
GO
ALTER TABLE [dbo].[Account_Role] CHECK CONSTRAINT [FK_Account_Role_Role]
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Session] FOREIGN KEY([sesid])
REFERENCES [dbo].[Session] ([sesid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Session]
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([rolid])
REFERENCES [dbo].[Role] ([rolid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecturer]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Group]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Student]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_FALL2022_Assignment] SET  READ_WRITE 
GO

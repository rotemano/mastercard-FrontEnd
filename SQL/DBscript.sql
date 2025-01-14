USE [master]
GO
/****** Object:  Database [MasterCard_DB]    Script Date: 11/08/2021 12:09:48 ******/
CREATE DATABASE [MasterCard_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterCard_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MasterCard_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterCard_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MasterCard_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MasterCard_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterCard_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterCard_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterCard_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterCard_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterCard_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterCard_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterCard_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterCard_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterCard_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterCard_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterCard_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterCard_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterCard_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterCard_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterCard_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterCard_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterCard_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterCard_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterCard_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterCard_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterCard_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterCard_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterCard_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterCard_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterCard_DB] SET  MULTI_USER 
GO
ALTER DATABASE [MasterCard_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterCard_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterCard_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterCard_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterCard_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterCard_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterCard_DB] SET QUERY_STORE = OFF
GO
USE [MasterCard_DB]
GO
/****** Object:  Table [dbo].[answers]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NULL,
	[label] [nvarchar](500) NULL,
	[score] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question_types]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[desc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](500) NULL,
	[type_id] [int] NULL,
	[max_score] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_answer_comments]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_answer_comments](
	[user_id] [int] NULL,
	[question_id] [int] NULL,
	[submit_datetime] [datetime] NULL,
	[comment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_answers]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_answers](
	[user_id] [int] NULL,
	[question_id] [int] NULL,
	[answer_id] [int] NULL,
	[submit_datetime] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[answers] ON 

INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (1, 1, N'4', 0)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (2, 1, N'6-8', 50)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (3, 1, N'12+', 90)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (4, 2, N'Password must be six or more characters long', 30)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (5, 2, N'Password must contain Uppercase characters A-Z', 30)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (6, 2, N'Password must contain Digits 0-9', 20)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (7, 2, N'Password must contain Special characters (!, $, #, %, etc.)', 20)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (8, 2, N'Password must contain Lowercase characters a-z', 20)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (9, 3, N'paypal', 50)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (10, 3, N'credit', 50)
INSERT [dbo].[answers] ([id], [question_id], [label], [score]) VALUES (11, 3, N'bit', 50)
SET IDENTITY_INSERT [dbo].[answers] OFF
GO
SET IDENTITY_INSERT [dbo].[question_types] ON 

INSERT [dbo].[question_types] ([id], [desc]) VALUES (1, N'multi choice')
INSERT [dbo].[question_types] ([id], [desc]) VALUES (2, N'single choice')
SET IDENTITY_INSERT [dbo].[question_types] OFF
GO
SET IDENTITY_INSERT [dbo].[questions] ON 

INSERT [dbo].[questions] ([id], [label], [type_id], [max_score]) VALUES (1, N'password policy – pass length', 2, 90)
INSERT [dbo].[questions] ([id], [label], [type_id], [max_score]) VALUES (2, N'password policy - pass complexity', 1, 60)
INSERT [dbo].[questions] ([id], [label], [type_id], [max_score]) VALUES (3, N'what are the pay digital method for your site', 1, 100)
SET IDENTITY_INSERT [dbo].[questions] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [user_name]) VALUES (1, N'JohnBrown')
INSERT [dbo].[users] ([id], [user_name]) VALUES (2, N'MikiBuganim')
INSERT [dbo].[users] ([id], [user_name]) VALUES (3, N'BruceLee')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[users_answer_comments] ([user_id], [question_id], [submit_datetime], [comment]) VALUES (1, 1, CAST(N'2021-08-09T21:34:29.990' AS DateTime), N'')
INSERT [dbo].[users_answer_comments] ([user_id], [question_id], [submit_datetime], [comment]) VALUES (1, 2, CAST(N'2021-08-09T21:34:29.990' AS DateTime), N'great question!')
INSERT [dbo].[users_answer_comments] ([user_id], [question_id], [submit_datetime], [comment]) VALUES (2, 2, CAST(N'2021-08-09T22:28:39.920' AS DateTime), N'password is 10 characters long!')
INSERT [dbo].[users_answer_comments] ([user_id], [question_id], [submit_datetime], [comment]) VALUES (1, 2, CAST(N'2021-08-09T23:07:40.357' AS DateTime), N'no comment')
INSERT [dbo].[users_answer_comments] ([user_id], [question_id], [submit_datetime], [comment]) VALUES (1, 3, CAST(N'2021-08-11T10:48:17.750' AS DateTime), N'comment')
GO
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 1, CAST(N'2021-08-09T21:34:29.990' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-09T21:34:29.990' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-09T21:34:29.990' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-09T21:34:29.990' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T10:47:20.387' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-11T10:47:20.387' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-11T10:47:20.387' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T10:47:20.387' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 10, CAST(N'2021-08-11T10:47:20.387' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T10:48:17.750' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-11T10:48:17.750' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-11T10:48:17.750' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 6, CAST(N'2021-08-11T10:48:17.750' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T10:48:17.750' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 11, CAST(N'2021-08-11T10:48:17.750' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (2, 1, 3, CAST(N'2021-08-09T22:28:39.920' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (2, 2, 4, CAST(N'2021-08-09T22:28:39.920' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (2, 2, 5, CAST(N'2021-08-09T22:28:39.920' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (2, 3, 9, CAST(N'2021-08-09T22:28:39.920' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (2, 3, 10, CAST(N'2021-08-09T22:28:39.920' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (3, 1, 1, CAST(N'2021-08-09T22:53:09.040' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (3, 2, 7, CAST(N'2021-08-09T22:53:09.040' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (3, 3, 9, CAST(N'2021-08-09T22:53:09.040' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-09T23:07:40.357' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-09T23:07:40.357' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-09T23:07:40.357' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-09T23:07:40.357' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 1, CAST(N'2021-08-11T09:47:07.310' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-11T09:47:07.310' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T09:47:07.310' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 8, CAST(N'2021-08-11T09:52:47.593' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T09:52:47.593' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T09:52:47.593' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-11T10:24:29.223' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-11T10:24:29.223' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T10:24:29.223' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T10:24:29.223' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 10, CAST(N'2021-08-11T10:24:29.223' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 8, CAST(N'2021-08-11T10:25:37.483' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T10:25:37.483' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 10, CAST(N'2021-08-11T10:25:37.483' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T10:30:43.430' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 7, CAST(N'2021-08-11T10:30:43.430' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 10, CAST(N'2021-08-11T10:30:43.430' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 11, CAST(N'2021-08-11T10:30:43.430' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T10:36:36.237' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-11T10:36:36.237' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 7, CAST(N'2021-08-11T10:36:36.237' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-11T10:36:36.237' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 10, CAST(N'2021-08-11T10:36:36.237' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T10:36:36.237' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 11, CAST(N'2021-08-11T11:55:44.547' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 7, CAST(N'2021-08-11T11:55:44.547' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 2, CAST(N'2021-08-11T11:55:44.547' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T11:58:53.127' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 7, CAST(N'2021-08-11T11:58:53.127' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-11T11:58:53.127' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-11T11:58:53.127' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T11:58:53.127' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 10, CAST(N'2021-08-11T11:58:53.127' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T12:03:25.937' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-11T12:03:25.937' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-11T12:03:25.937' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T12:03:25.937' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 10, CAST(N'2021-08-11T12:03:25.937' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 1, 3, CAST(N'2021-08-11T12:04:22.600' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 4, CAST(N'2021-08-11T12:04:22.600' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 2, 5, CAST(N'2021-08-11T12:04:22.600' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 9, CAST(N'2021-08-11T12:04:22.600' AS DateTime))
INSERT [dbo].[users_answers] ([user_id], [question_id], [answer_id], [submit_datetime]) VALUES (1, 3, 10, CAST(N'2021-08-11T12:04:22.600' AS DateTime))
GO
ALTER TABLE [dbo].[answers] ADD  CONSTRAINT [DF_answers_score]  DEFAULT ((0)) FOR [score]
GO
/****** Object:  StoredProcedure [dbo].[sp_calc_score]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_calc_score]
@user_id int
as

--sp_calc_score 1

declare @max_date_time datetime=null 
	
select @max_date_time= max(submit_datetime) from users_answers 
					   where[user_id]=@user_id
print @max_date_time
--calc for 1 choice questions
select q.id ,q.label,q.max_score , cast(score/(max_score*1.0)*100 as int) earned_score
into #t1
from questions q left join answers a on q.id=a.question_id
     inner join users_answers ua on ua.answer_id=a.id
where type_id=2 and [user_id]=@user_id and submit_datetime=@max_date_time

union

--calc for multiple choice questions
select q.id,q.label,q.max_score ,
		case when count(*)>1 then --When more than one answer is selected
			cast( case when sum(score)>(max_score) then 100 else  sum(score)/(max_score*1.0)*100 end as int) --100 will be the max score for question
		else --When only one answer is selected, devide score by 2
			cast(sum(score)/(max_score*1.0)*100 as int)/2 end earned_score
from questions q left join answers a on q.id=a.question_id
     inner join users_answers ua on ua.answer_id=a.id
where type_id=1 and [user_id]=@user_id and submit_datetime=@max_date_time
group by q.id,q.label,q.max_score 

--select * from #t1
--calc all question together as 100%
select floor((sum(earned_score)/count(*))/10) score
from #t1


--sp_calc_score 3
GO
/****** Object:  StoredProcedure [dbo].[sp_get_answers]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_get_answers]
as
SELECT id
      ,question_id
      ,[label]
  FROM answers
GO
/****** Object:  StoredProcedure [dbo].[sp_get_questions]    Script Date: 11/08/2021 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_get_questions]
as
select id,label,[type_id] from questions
GO
USE [master]
GO
ALTER DATABASE [MasterCard_DB] SET  READ_WRITE 
GO

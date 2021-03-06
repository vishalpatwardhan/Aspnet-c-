USE [master]
GO
/****** Object:  Database [DBExcersize]    Script Date: 12/23/2012 17:47:39 ******/
CREATE DATABASE [DBExcersize] ON  PRIMARY 
( NAME = N'DBExcersize', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS2008\MSSQL\DATA\DBExcersize.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBExcersize_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS2008\MSSQL\DATA\DBExcersize_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBExcersize] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBExcersize].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBExcersize] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DBExcersize] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DBExcersize] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DBExcersize] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DBExcersize] SET ARITHABORT OFF
GO
ALTER DATABASE [DBExcersize] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DBExcersize] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DBExcersize] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DBExcersize] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DBExcersize] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DBExcersize] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DBExcersize] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DBExcersize] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DBExcersize] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DBExcersize] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DBExcersize] SET  DISABLE_BROKER
GO
ALTER DATABASE [DBExcersize] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DBExcersize] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DBExcersize] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DBExcersize] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DBExcersize] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DBExcersize] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DBExcersize] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DBExcersize] SET  READ_WRITE
GO
ALTER DATABASE [DBExcersize] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DBExcersize] SET  MULTI_USER
GO
ALTER DATABASE [DBExcersize] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DBExcersize] SET DB_CHAINING OFF
GO
USE [DBExcersize]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 12/23/2012 17:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[TeacherName] [varchar](25) NULL,
	[StandardId] [int] NULL,
 CONSTRAINT [pk_teacher_tid] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Standard]    Script Date: 12/23/2012 17:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Standard](
	[StandardId] [int] IDENTITY(1,1) NOT NULL,
	[StandardName] [varchar](25) NULL,
	[Description] [varchar](25) NULL,
 CONSTRAINT [pk_standard_sid] PRIMARY KEY CLUSTERED 
(
	[StandardId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/23/2012 17:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](25) NULL,
	[StandardId] [int] NULL,
 CONSTRAINT [pk_student_sid] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/23/2012 17:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](25) NULL,
	[Location] [varchar](25) NULL,
	[TeacherId] [int] NULL,
 CONSTRAINT [pk_course_tid] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 12/23/2012 17:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAddress]    Script Date: 12/23/2012 17:47:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentAddress](
	[StudentId] [int] NULL,
	[Address1] [varchar](25) NULL,
	[Address2] [varchar](25) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](25) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [fk_studentstandard_sid]    Script Date: 12/23/2012 17:47:49 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [fk_studentstandard_sid] FOREIGN KEY([StandardId])
REFERENCES [dbo].[Standard] ([StandardId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [fk_studentstandard_sid]
GO
/****** Object:  ForeignKey [fk_courseteacher_tid]    Script Date: 12/23/2012 17:47:49 ******/
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [fk_courseteacher_tid] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [fk_courseteacher_tid]
GO
/****** Object:  ForeignKey [fk_studentcoursecourse_scid]    Script Date: 12/23/2012 17:47:49 ******/
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [fk_studentcoursecourse_scid] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [fk_studentcoursecourse_scid]
GO
/****** Object:  ForeignKey [fk_studentcoursestudent_scid]    Script Date: 12/23/2012 17:47:49 ******/
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [fk_studentcoursestudent_scid] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [fk_studentcoursestudent_scid]
GO
/****** Object:  ForeignKey [fk_studentaddressstudent_sid]    Script Date: 12/23/2012 17:47:49 ******/
ALTER TABLE [dbo].[StudentAddress]  WITH CHECK ADD  CONSTRAINT [fk_studentaddressstudent_sid] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAddress] CHECK CONSTRAINT [fk_studentaddressstudent_sid]
GO

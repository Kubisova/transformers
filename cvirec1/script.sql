USE [master]
GO
/****** Object:  Database [DepartmentStructure]    Script Date: 14.5.2019 17:03:05 ******/
CREATE DATABASE [DepartmentStructure]
 CONTAINMENT = NONE
 
USE [master]
GO
ALTER DATABASE [DepartmentStructure] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DepartmentStructure].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DepartmentStructure] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DepartmentStructure] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DepartmentStructure] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DepartmentStructure] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DepartmentStructure] SET ARITHABORT OFF 
GO
ALTER DATABASE [DepartmentStructure] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DepartmentStructure] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DepartmentStructure] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DepartmentStructure] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DepartmentStructure] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DepartmentStructure] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DepartmentStructure] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DepartmentStructure] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DepartmentStructure] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DepartmentStructure] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DepartmentStructure] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DepartmentStructure] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DepartmentStructure] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DepartmentStructure] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DepartmentStructure] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DepartmentStructure] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DepartmentStructure] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DepartmentStructure] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DepartmentStructure] SET  MULTI_USER 
GO
ALTER DATABASE [DepartmentStructure] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DepartmentStructure] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DepartmentStructure] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DepartmentStructure] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DepartmentStructure] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DepartmentStructure] SET QUERY_STORE = OFF
GO
USE [DepartmentStructure]
GO
/****** Object:  Table [dbo].[CompanyLevel]    Script Date: 14.5.2019 17:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyLevel](
	[CompanyLevelID] [int] NOT NULL,
	[LevelName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyLevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 14.5.2019 17:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[DepartmentCode] [nchar](8) NOT NULL,
	[HeadDepartment] [int] NULL,
	[CompanyLevelID] [int] NOT NULL,
	[IDCompany] [int] NULL,
	[EmployeeID] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 14.5.2019 17:03:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CompanyLevel] ([CompanyLevelID], [LevelName]) VALUES (1, N'Company')
INSERT [dbo].[CompanyLevel] ([CompanyLevelID], [LevelName]) VALUES (2, N'Division')
INSERT [dbo].[CompanyLevel] ([CompanyLevelID], [LevelName]) VALUES (3, N'Project')
INSERT [dbo].[CompanyLevel] ([CompanyLevelID], [LevelName]) VALUES (4, N'Department')
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Department1] FOREIGN KEY([HeadDepartment])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Department1]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_department_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_department_Employee]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentCompanyLevel] FOREIGN KEY([CompanyLevelID])
REFERENCES [dbo].[CompanyLevel] ([CompanyLevelID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_DepartmentCompanyLevel]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
USE [master]
GO
ALTER DATABASE [DepartmentStructure] SET  READ_WRITE 
GO

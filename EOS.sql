USE [master]
GO
/****** Object:  Database [EOS]    Script Date: 03/09/2020 6:09:37 CH ******/
CREATE DATABASE [EOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EOS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EOS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EOS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [EOS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EOS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EOS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EOS] SET  MULTI_USER 
GO
ALTER DATABASE [EOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EOS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EOS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EOS]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 03/09/2020 6:09:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nchar](200) NULL,
	[isTrue] [bit] NULL,
	[QuestionID] [int] NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 03/09/2020 6:09:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamCode] [nchar](100) NOT NULL,
	[ExamName] [nchar](50) NULL,
	[Time] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Exam_1] PRIMARY KEY CLUSTERED 
(
	[ExamCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 03/09/2020 6:09:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[user] [nchar](50) NULL,
	[pass] [nchar](50) NULL,
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[ExamCode] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 03/09/2020 6:09:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nchar](300) NULL,
	[Point] [float] NULL,
	[ExamCode] [nchar](100) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentExam]    Script Date: 03/09/2020 6:09:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login id] [int] NULL,
	[ExamCode] [nchar](100) NULL,
 CONSTRAINT [PK_StudentExam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentExamDetail]    Script Date: 03/09/2020 6:09:37 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExamDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[StudentExamID] [int] NULL,
	[QuestionID] [int] NULL,
	[AnswerId] [int] NULL,
	[IsTrue] [bit] NULL,
 CONSTRAINT [PK_StudentExamDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (1, N'A - C# is a modern, general-purpose, object-oriented programming language developed by Microsoft.                                                                                                       ', 0, 1)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (2, N'B - C# was developed by Anders Hejlsberg and his team during the development of .Net Framework.                                                                                                         ', 0, 1)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (3, N'C - C# is designed for Common Language Infrastructure (CLI).                                                                                                                                            ', 0, 1)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (4, N'D - All of the above.                                                                                                                                                                                   ', 1, 1)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (5, N'A - ToSingle                                                                                                                                                                                            ', 0, 2)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (6, N'B - ToByte                                                                                                                                                                                              ', 1, 2)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (7, N'C - ToChar                                                                                                                                                                                              ', 0, 2)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (8, N'D - ToDateTime                                                                                                                                                                                          ', 0, 2)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (9, N'A - ToInt64                                                                                                                                                                                             ', 0, 3)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (10, N'B - ToSbyte                                                                                                                                                                                             ', 0, 3)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (11, N'C - ToSingle                                                                                                                                                                                            ', 0, 3)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (12, N'D - ToString                                                                                                                                                                                            ', 1, 3)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (13, N'A - sizeof                                                                                                                                                                                              ', 1, 4)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (14, N'B - typeof                                                                                                                                                                                              ', 1, 4)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (15, N'C - &                                                                                                                                                                                                   ', 0, 4)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (16, N'D - *                                                                                                                                                                                                   ', 0, 4)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (17, N'A - Value parameters                                                                                                                                                                                    ', 0, 5)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (18, N'B - Reference parameters                                                                                                                                                                                ', 1, 5)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (19, N'C - Output parameters                                                                                                                                                                                   ', 0, 5)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (20, N'D - None of the above.                                                                                                                                                                                  ', 0, 5)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (21, N'A - IsFixedSize                                                                                                                                                                                         ', 1, 6)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (22, N'B - IsStatic                                                                                                                                                                                            ', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (23, N'C - Length                                                                                                                                                                                              ', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (24, N'D-None of the above.                                                                                                                                                                                    ', 0, 6)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (25, N'A - Member variables are the attributes of an object (from design perspective) and they are kept private to implement encapsulation.                                                                    ', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (26, N'B - These private variables can only be accessed using the public member functions.                                                                                                                     ', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (27, N'C - Both of the above                                                                                                                                                                                   ', 1, 7)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (28, N'D - None of the above.                                                                                                                                                                                  ', 0, 7)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (29, N'A - null                                                                                                                                                                                                ', 1, 17)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (30, N'B - 0                                                                                                                                                                                                   ', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (31, N'C - Depends upon the type of variable                                                                                                                                                                   ', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (32, N'D - Not assigned                                                                                                                                                                                        ', 0, 17)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (33, N'A - 8 bit                                                                                                                                                                                               ', 1, 18)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (34, N'B - 16 bit                                                                                                                                                                                              ', 0, 18)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (35, N'C - 32 bit                                                                                                                                                                                              ', 0, 18)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (36, N'D - 64 bit                                                                                                                                                                                              ', 0, 18)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (37, N'A - ''\u0000''                                                                                                                                                                                            ', 1, 19)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (38, N'B - 0                                                                                                                                                                                                   ', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (39, N'C - null                                                                                                                                                                                                ', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (40, N'D - not defined                                                                                                                                                                                         ', 0, 19)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (41, N'A - String is immutable.                                                                                                                                                                                ', 1, 20)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (42, N'B - String can be created using new operator.                                                                                                                                                           ', 0, 20)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (43, N'C - String is a primary data type.                                                                                                                                                                      ', 0, 20)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (44, N'D - None of the above.                                                                                                                                                                                  ', 0, 20)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (45, N'A-True                                                                                                                                                                                                  ', 1, 8)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (46, N'B - false                                                                                                                                                                                               ', 0, 8)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (47, N'A-True                                                                                                                                                                                                  ', 1, 9)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (48, N'B - false                                                                                                                                                                                               ', 0, 9)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (49, N'A - warning                                                                                                                                                                                             ', 1, 10)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (50, N'B - region                                                                                                                                                                                              ', 1, 10)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (51, N'C - line                                                                                                                                                                                                ', 0, 10)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (52, N'D - error                                                                                                                                                                                               ', 0, 10)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (53, N'A - warning                                                                                                                                                                                             ', 1, 11)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (54, N'B - region                                                                                                                                                                                              ', 1, 11)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (55, N'C - line                                                                                                                                                                                                ', 0, 11)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (56, N'D - error                                                                                                                                                                                               ', 0, 11)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (57, N'A :                                                                                                                                                                                                     ', 1, 12)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (58, N'B) ::                                                                                                                                                                                                   ', 0, 12)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (59, N'C) #                                                                                                                                                                                                    ', 1, 12)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (60, N'D) none of the mentioned                                                                                                                                                                                ', 0, 12)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (61, N'A - ToInt64                                                                                                                                                                                             ', 0, 13)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (62, N'B - ToSbyte                                                                                                                                                                                             ', 0, 13)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (63, N'C - ToSingle                                                                                                                                                                                            ', 0, 13)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (64, N'D - ToString                                                                                                                                                                                            ', 1, 13)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (65, N'A-True                                                                                                                                                                                                  ', 0, 21)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (66, N'B - false                                                                                                                                                                                               ', 1, 21)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (67, N'A - Set is a collection of element which contains elements along with their key.                                                                                                                        ', 0, 22)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (68, N'B - Set is a collection of element which contains hashcode of elements.                                                                                                                                 ', 0, 22)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (69, N'C - Set is a collection of element which cannot contain duplicate elements.                                                                                                                             ', 1, 22)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (70, N'D - Set is a collection of element which can contain duplicate elements.                                                                                                                                ', 0, 22)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (71, N'A - Composition is a data structure.                                                                                                                                                                    ', 0, 23)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (72, N'B - Composition is a way to create an object.                                                                                                                                                           ', 0, 23)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (73, N'C - Holding the reference of the other class within some other class is known as composition.                                                                                                           ', 1, 23)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (74, N'D - None of the above.                                                                                                                                                                                  ', 0, 23)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (75, N'A-True                                                                                                                                                                                                  ', 1, 24)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (76, N'B - false                                                                                                                                                                                               ', 0, 24)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (77, N'A - When it detects that the object has become unreachable.                                                                                                                                             ', 1, 25)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (78, N'B - As soon as object is set as null.                                                                                                                                                                   ', 0, 25)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (79, N'C - At fixed intervalm it checks for null value.                                                                                                                                                        ', 0, 25)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (80, N'D - None of the above.                                                                                                                                                                                  ', 0, 25)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (81, N'A - It is a Thread public static method used to obtain a reference to the current thread.                                                                                                               ', 1, 26)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (82, N'B - It is a thread''s instance method used to get thread count.                                                                                                                                          ', 1, 26)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (83, N'C - It is a object''s public static method used obtain a reference to the current thread.                                                                                                                ', 0, 26)
INSERT [dbo].[Answer] ([AnswerId], [Content], [isTrue], [QuestionID]) VALUES (84, N'D - It is a object''s instance method used to get thread count.                                                                                                                                          ', 0, 26)
SET IDENTITY_INSERT [dbo].[Answer] OFF
INSERT [dbo].[Exam] ([ExamCode], [ExamName], [Time], [Date]) VALUES (N'C#code1                                                                                             ', N'C#                                                ', 50, CAST(N'2020-07-22 00:00:00.000' AS DateTime))
INSERT [dbo].[Exam] ([ExamCode], [ExamName], [Time], [Date]) VALUES (N'Java                                                                                                ', N'Java                                              ', 60, CAST(N'2020-07-27 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'duong                                             ', N'123                                               ', 1, N'C#code1                                                                                             ')
INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'duong1                                            ', N'123                                               ', 2, N'Java                                                                                                ')
INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'd1                                                ', N'123                                               ', 3, N'Java                                                                                                ')
INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'duong                                             ', N'123                                               ', 4, N'Java                                                                                                ')
INSERT [dbo].[Login] ([user], [pass], [LoginId], [ExamCode]) VALUES (N'duong123                                          ', N'123                                               ', 5, N'C#code1                                                                                             ')
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (1, N'Q 1 - Which of the following is correct about C#?                                                                                                                                                                                                                                                           ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (2, N'Q 2 - Which of the following converts a type to a byte value in C#?                                                                                                                                                                                                                                         ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (3, N'Q 3 - Which of the following converts a type to a string in C#?                                                                                                                                                                                                                                             ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (4, N'Q 4 - Which of the following operator creates a pointer to a variable in C#?                                                                                                                                                                                                                                ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (5, N'Q 5 - Which of the following method copies the reference to the memory location of an argument into the formal parameter?                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (6, N'Q 6 - Which of the following property of Array class in C# checks whether the Array has a fixed size?                                                                                                                                                                                                       ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (7, N'Q 7 - Which of the following is the correct about class member variables?                                                                                                                                                                                                                                   ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (8, N'Q 8 - Dynamic polymorphism is implemented by abstract classes and virtual functions.                                                                                                                                                                                                                        ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (9, N'Q 9 - You can define one namespace inside another namespace.                                                                                                                                                                                                                                                ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (10, N'Q 10 - Which of the following preprocessor directive lets you specify a block of code that you can expand or collapse when using the outlining feature of the Visual Studio Code Editor in C#?                                                                                                              ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (11, N'Q 11 - Which of the following preprocessor directive lets you specify a block of code that you can expand or collapse when using the outlining feature of the Visual Studio Code Editor in C#?                                                                                                              ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (12, N'Q 12 - Which of the following variable types can be assigned a value directly in C#?                                                                                                                                                                                                                        ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (13, N'Q 13 - Which of the following can be used to define the member of a class externally?                                                                                                                                                                                                                       ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (14, N'cau hoi 14                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (15, N'cau hoi 15                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (16, N'cau hoi 16                                                                                                                                                                                                                                                                                                  ', 10, N'C#code1                                                                                             ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (17, N'Q 1 - What of the following is the default value of an instance variable?                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (18, N'Q 2 - What is the size of float variable?                                                                                                                                                                                                                                                                   ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (19, N'Q 3 - What is the default value of char variable?                                                                                                                                                                                                                                                           ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (20, N'Q 4 - Which of the following is false about String?                                                                                                                                                                                                                                                         ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (21, N'Q 5 - A class always has a default constructor.                                                                                                                                                                                                                                                             ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (22, N'Q 6 - What is Set Interface?                                                                                                                                                                                                                                                                                ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (23, N'Q 7 - What is composition?                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (24, N'Q 8 - Does garbage collection guarantee that a program will not run out of memory?                                                                                                                                                                                                                          ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (25, N'Q 9 - Under what conditions is an object''s finalize() method invoked by the garbage collector?                                                                                                                                                                                                              ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (26, N'Q 10 - What is currentThread()?                                                                                                                                                                                                                                                                             ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (27, N'cau hoi 11                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (28, N'cau hoi 12                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (29, N'cau hoi 13                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (30, N'cau hoi 14                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (31, N'cau hoi 15                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
INSERT [dbo].[Question] ([QuestionId], [Content], [Point], [ExamCode]) VALUES (32, N'cau hoi 16                                                                                                                                                                                                                                                                                                  ', 10, N'Java                                                                                                ')
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[StudentExam] ON 

INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (1, 1, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (3, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (4, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (5, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (6, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (7, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (8, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (9, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (10, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (11, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (12, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (13, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (14, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (15, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (16, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (17, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (18, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (19, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (20, 1, N'C#code1                                                                                             ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (21, 4, N'Java                                                                                                ')
INSERT [dbo].[StudentExam] ([id], [Login id], [ExamCode]) VALUES (22, 1, N'C#code1                                                                                             ')
SET IDENTITY_INSERT [dbo].[StudentExam] OFF
SET IDENTITY_INSERT [dbo].[StudentExamDetail] ON 

INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (1, 1, 1, 1, NULL)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (2, 1, 1, 1, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (3, 9, 17, 29, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (4, 10, 1, 1, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (5, 11, 1, 1, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (6, 12, 1, 1, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (7, 12, 2, 5, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (8, 12, 2, 6, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (9, 12, 3, 9, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (10, 12, 4, 13, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (11, 12, 5, 17, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (12, 12, 6, 21, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (13, 13, 17, 29, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (14, 13, 18, 36, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (15, 14, 17, 29, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (16, 15, 17, 31, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (17, 16, 2, 7, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (18, 17, 17, 31, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (19, 17, 18, 36, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (20, 17, 19, 38, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (21, 17, 20, 44, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (22, 17, 21, 66, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (23, 17, 22, 67, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (24, 17, 23, 73, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (25, 18, 1, 1, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (26, 18, 3, 12, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (27, 21, 18, 36, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (28, 21, 19, 40, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (29, 21, 20, 41, 1)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (30, 22, 1, 2, 0)
INSERT [dbo].[StudentExamDetail] ([DetailId], [StudentExamID], [QuestionID], [AnswerId], [IsTrue]) VALUES (31, 22, 4, 16, 0)
SET IDENTITY_INSERT [dbo].[StudentExamDetail] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Login]    Script Date: 03/09/2020 6:09:37 CH ******/
CREATE NONCLUSTERED INDEX [IX_Login] ON [dbo].[Login]
(
	[user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Exam] FOREIGN KEY([ExamCode])
REFERENCES [dbo].[Exam] ([ExamCode])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Exam]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Exam] FOREIGN KEY([ExamCode])
REFERENCES [dbo].[Exam] ([ExamCode])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Exam]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Exam] FOREIGN KEY([ExamCode])
REFERENCES [dbo].[Exam] ([ExamCode])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Exam]
GO
ALTER TABLE [dbo].[StudentExam]  WITH CHECK ADD  CONSTRAINT [FK_StudentExam_Login] FOREIGN KEY([Login id])
REFERENCES [dbo].[Login] ([LoginId])
GO
ALTER TABLE [dbo].[StudentExam] CHECK CONSTRAINT [FK_StudentExam_Login]
GO
ALTER TABLE [dbo].[StudentExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamDetail_Answer] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answer] ([AnswerId])
GO
ALTER TABLE [dbo].[StudentExamDetail] CHECK CONSTRAINT [FK_StudentExamDetail_Answer]
GO
ALTER TABLE [dbo].[StudentExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamDetail_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[StudentExamDetail] CHECK CONSTRAINT [FK_StudentExamDetail_Question]
GO
ALTER TABLE [dbo].[StudentExamDetail]  WITH CHECK ADD  CONSTRAINT [FK_StudentExamDetail_StudentExam] FOREIGN KEY([StudentExamID])
REFERENCES [dbo].[StudentExam] ([id])
GO
ALTER TABLE [dbo].[StudentExamDetail] CHECK CONSTRAINT [FK_StudentExamDetail_StudentExam]
GO
USE [master]
GO
ALTER DATABASE [EOS] SET  READ_WRITE 
GO

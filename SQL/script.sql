USE [master]
GO
/****** Object:  Database [POC]    Script Date: 28-02-2021 19:04:45 ******/
CREATE DATABASE [POC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\POC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'POC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\POC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [POC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POC] SET ARITHABORT OFF 
GO
ALTER DATABASE [POC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POC] SET RECOVERY FULL 
GO
ALTER DATABASE [POC] SET  MULTI_USER 
GO
ALTER DATABASE [POC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [POC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [POC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'POC', N'ON'
GO
ALTER DATABASE [POC] SET QUERY_STORE = OFF
GO
USE [POC]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[product_detail_id] [int] NOT NULL,
	[size] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[brand] [varchar](50) NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FetchBrand]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FetchBrand]
(
    @brand varchar(50)
)
RETURNS TABLE AS RETURN
(
    SELECT @brand AS c1 from ProductDetails where brand = @brand
	      
)
GO
/****** Object:  UserDefinedFunction [dbo].[FetchColor]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FetchColor]
(
    @color varchar(50)
   
)
RETURNS TABLE AS RETURN
(
     SELECT @color AS c1 from ProductDetails where color = @color
)
GO
/****** Object:  Table [dbo].[Address]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addr_id] [int] NOT NULL,
	[country] [varchar](100) NULL,
	[state] [varchar](100) NULL,
	[city] [varchar](100) NULL,
	[landmark] [varchar](100) NULL,
	[postal_code] [int] NULL,
	[isHome] [binary](1) NULL,
	[isOffice] [binary](1) NULL,
	[created_on] [datetime] NULL,
	[modified_on] [datetime] NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[addr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] NOT NULL,
	[inWishList] [binary](1) NULL,
	[quantity] [int] NULL,
	[time_added] [datetime] NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[discount_id] [int] NOT NULL,
	[discount_name] [varchar](50) NULL,
	[discount_amount] [float] NULL,
	[discount_type] [int] NULL,
	[start_time] [datetime] NULL,
	[end_time] [datetime] NULL,
	[isdeleted] [bit] NULL,
	[modified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[order_item_id] [int] NOT NULL,
	[quantity] [int] NULL,
	[order_id] [int] NULL,
	[product_detail_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] NOT NULL,
	[order_status] [varchar](100) NULL,
	[order_amount] [int] NULL,
	[created_on] [datetime] NULL,
	[modified_on] [datetime] NULL,
	[user_id] [int] NULL,
	[addr_id] [int] NULL,
	[discount_id] [int] NULL,
	[cart_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] NOT NULL,
	[product_name] [varchar](50) NULL,
	[product_description] [varchar](100) NULL,
	[product_amount] [int] NULL,
	[product_image] [varbinary](1) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[tag_id] [int] NOT NULL,
	[tag] [varchar](50) NOT NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] NOT NULL,
	[email] [varchar](30) NULL,
	[first_name] [varchar](20) NULL,
	[last_name] [varchar](20) NULL,
	[date_of_birth] [date] NULL,
	[phone] [varchar](30) NULL,
	[pwd] [varchar](10) NULL,
	[date_of_join] [date] NULL,
	[modified] [datetime] NULL,
	[isdeleted] [bit] NULL,
	[last_login] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([product_detail_id])
REFERENCES [dbo].[ProductDetails] ([product_detail_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([addr_id])
REFERENCES [dbo].[Address] ([addr_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([discount_id])
REFERENCES [dbo].[Discount] ([discount_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tags]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[FetchUser]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FetchUser](@userid int) as
begin
select * from Users where user_id = @userid
end
GO
/****** Object:  StoredProcedure [dbo].[GetCommanAddress]    Script Date: 28-02-2021 19:04:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCommanAddress](@postalcode int) as
begin
select Address.user_id from Address,Orders where postal_code = @postalcode and order_status = 'created' 
end

GO
USE [master]
GO
ALTER DATABASE [POC] SET  READ_WRITE 
GO

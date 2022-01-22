USE [master]
GO
/****** Object:  Database [DbCarrito]    Script Date: 21/1/2022 8:31:46 p. m. ******/
CREATE DATABASE [DbCarrito]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DbCarrito', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbCarrito.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DbCarrito_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DbCarrito_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DbCarrito] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DbCarrito].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DbCarrito] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DbCarrito] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DbCarrito] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DbCarrito] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DbCarrito] SET ARITHABORT OFF 
GO
ALTER DATABASE [DbCarrito] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DbCarrito] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DbCarrito] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DbCarrito] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DbCarrito] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DbCarrito] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DbCarrito] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DbCarrito] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DbCarrito] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DbCarrito] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DbCarrito] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DbCarrito] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DbCarrito] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DbCarrito] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DbCarrito] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DbCarrito] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DbCarrito] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DbCarrito] SET RECOVERY FULL 
GO
ALTER DATABASE [DbCarrito] SET  MULTI_USER 
GO
ALTER DATABASE [DbCarrito] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DbCarrito] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DbCarrito] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DbCarrito] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DbCarrito] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DbCarrito] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DbCarrito', N'ON'
GO
ALTER DATABASE [DbCarrito] SET QUERY_STORE = OFF
GO
ALTER DATABASE [DbCarrito] SET  READ_WRITE 
GO

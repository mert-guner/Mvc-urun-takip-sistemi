USE [Proje]
GO
/****** Object:  Table [dbo].[login_tbl]    Script Date: 24.04.2022 16:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_adi] [nvarchar](50) NULL,
	[sifre] [nvarchar](50) NULL,
 CONSTRAINT [PK_login_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Urun_tbl]    Script Date: 24.04.2022 16:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun_tbl](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[urun_adi] [nvarchar](50) NULL,
	[urun_aciklama] [nvarchar](50) NULL,
	[urun_fiyat] [decimal](18, 2) NULL,
	[stok] [int] NULL,
 CONSTRAINT [PK_Urun_tbl] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[login_tbl] ON 

INSERT [dbo].[login_tbl] ([id], [kullanici_adi], [sifre]) VALUES (1, N'admin@mail.com', N'123')
INSERT [dbo].[login_tbl] ([id], [kullanici_adi], [sifre]) VALUES (3, N'mert@mail.com', N'123')
SET IDENTITY_INSERT [dbo].[login_tbl] OFF
SET IDENTITY_INSERT [dbo].[Urun_tbl] ON 

INSERT [dbo].[Urun_tbl] ([UrunID], [urun_adi], [urun_aciklama], [urun_fiyat], [stok]) VALUES (1, N'Samsung', N's7', CAST(3500.00 AS Decimal(18, 2)), 35)
INSERT [dbo].[Urun_tbl] ([UrunID], [urun_adi], [urun_aciklama], [urun_fiyat], [stok]) VALUES (3, N'Samsung', N's3', CAST(2500.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Urun_tbl] ([UrunID], [urun_adi], [urun_aciklama], [urun_fiyat], [stok]) VALUES (4, N'iPhone 11', N'128 GB', CAST(12000.00 AS Decimal(18, 2)), 28)
INSERT [dbo].[Urun_tbl] ([UrunID], [urun_adi], [urun_aciklama], [urun_fiyat], [stok]) VALUES (19, N'İphone 6', N'64 GB', CAST(5600.00 AS Decimal(18, 2)), 21)
INSERT [dbo].[Urun_tbl] ([UrunID], [urun_adi], [urun_aciklama], [urun_fiyat], [stok]) VALUES (20, N'SAMSUNG Galaxy S22', N'256GB', CAST(22990.00 AS Decimal(18, 2)), 100)
SET IDENTITY_INSERT [dbo].[Urun_tbl] OFF

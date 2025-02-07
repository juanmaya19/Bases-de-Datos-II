USE [jardineriaStaging]
GO
/****** Object:  Table [dbo].[DestinoTbCatProductoJr]    Script Date: 25/05/2024 10:39:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTbCatProductoJr](
	[ID_Categoria] [int] IDENTITY(1,1) NOT NULL,
	[ID_Categoria_o] [int] NULL,
	[Desc_Categoria] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoTbClienteJr]    Script Date: 25/05/2024 10:39:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTbClienteJr](
	[ID_cliente] [int] IDENTITY(1,1) NOT NULL,
	[ID_cliente_o] [int] NULL,
	[nombre_cliente] [nvarchar](50) NULL,
	[telefono] [nvarchar](15) NULL,
	[ciudad] [nvarchar](50) NULL,
	[pais] [nvarchar](50) NULL,
	[ID_empleado_rep_ventas] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoTbDetPedidoJr]    Script Date: 25/05/2024 10:39:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTbDetPedidoJr](
	[ID_hechospedido] [int] NULL,
	[ID_producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL,
	[numero_linea] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoTbEmpleadoJr]    Script Date: 25/05/2024 10:39:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTbEmpleadoJr](
	[ID_empleado] [int] IDENTITY(1,1) NOT NULL,
	[ID_empleado_o] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido1] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[ID_oficina] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoTbOficinaJr]    Script Date: 25/05/2024 10:39:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTbOficinaJr](
	[ID_oficina] [int] IDENTITY(1,1) NOT NULL,
	[ID_oficina_o] [int] NULL,
	[Descripcion] [nvarchar](10) NULL,
	[ciudad] [nvarchar](30) NULL,
	[telefono] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoTbPedidoJr]    Script Date: 25/05/2024 10:39:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTbPedidoJr](
	[ID_hechospedido] [int] IDENTITY(1,1) NOT NULL,
	[ID_hechospedido_o] [int] NULL,
	[ID_cliente] [int] NULL,
	[ID_producto] [int] NULL,
	[ID_oficina] [int] NULL,
	[ID_empleado] [int] NULL,
	[ID_tiempo] [date] NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL,
	[total] [numeric](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_hechospedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoTbProductoJr]    Script Date: 25/05/2024 10:39:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTbProductoJr](
	[ID_producto] [int] IDENTITY(1,1) NOT NULL,
	[ID_producto_o] [int] NULL,
	[nombre] [nvarchar](70) NULL,
	[Categoria] [int] NULL,
	[cantidad_en_stock] [smallint] NULL,
	[precio_venta] [numeric](15, 2) NULL,
	[precio_proveedor] [numeric](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DestinoTbTiempoJr]    Script Date: 25/05/2024 10:39:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoTbTiempoJr](
	[ID_hechospedido] [int] IDENTITY(1,1) NOT NULL,
	[ID_hechospedido_o] [int] NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_hechospedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

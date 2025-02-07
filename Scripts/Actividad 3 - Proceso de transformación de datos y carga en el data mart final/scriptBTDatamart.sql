USE [DMJardineria]
GO
/****** Object:  Table [dbo].[DestinoDimClienteDM]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DestinoDimClienteDM](
	[ID_cliente] [int] NOT NULL,
	[ID_cliente_o] [int] NULL,
	[nombre_cliente] [nvarchar](50) NULL,
	[telefono] [nvarchar](15) NULL,
	[ciudad] [nvarchar](50) NULL,
	[pais] [nvarchar](50) NULL,
	[ID_empleado_rep_ventas] [int] NULL,
	[cliente_pais] [nvarchar](103) NULL,
	[tipo-localidad] [nvarchar](13) NULL,
	[tel_organizado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCatProducto]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCatProducto](
	[ID_Categoria] [int] NOT NULL,
	[ID_Categoria_o] [int] NULL,
	[Desc_Categoria] [nvarchar](50) NULL,
	[longitud_desc_categoria] [int] NULL,
	[desc_categoria_mayuscula] [nvarchar](50) NULL,
	[categoria_clasificacion] [nvarchar](13) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCliente]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCliente](
	[ID_cliente] [int] NOT NULL,
	[ID_cliente_o] [int] NULL,
	[nombre_cliente] [nvarchar](50) NULL,
	[telefono] [nvarchar](15) NULL,
	[ciudad] [nvarchar](50) NULL,
	[pais] [nvarchar](50) NULL,
	[ID_empleado_rep_ventas] [int] NULL,
	[cliente_pais] [nvarchar](103) NULL,
	[tipo-localidad] [nvarchar](13) NULL,
	[tel_organizado] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDetPedido]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDetPedido](
	[ID_hechospedido] [int] NOT NULL,
	[ID_producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL,
	[numero_linea] [smallint] NULL,
	[total_linea] [numeric](26, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_hechospedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmpleado]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmpleado](
	[ID_empleado] [int] NOT NULL,
	[ID_empleado_o] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido1] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[ID_oficina] [int] NULL,
	[oficina_descripcion] [nvarchar](10) NULL,
	[oficina_ciudad] [nvarchar](30) NULL,
	[oficina_telefono] [nvarchar](20) NULL,
	[nombre_completo] [nvarchar](101) NULL,
	[usuario_email] [nvarchar](100) NULL,
	[estado_oficina] [nvarchar](11) NULL,
	[longitud_nombre_completo] [int] NULL,
	[email_minuscula] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimHechosPedido]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimHechosPedido](
	[ID_hechospedido] [int] NOT NULL,
	[ID_hechospedido_o] [int] NULL,
	[ID_cliente] [int] NULL,
	[ID_producto] [int] NULL,
	[ID_oficina] [int] NULL,
	[ID_empleado] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL,
	[total] [numeric](15, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_hechospedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOficina]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOficina](
	[ID_oficina] [int] NOT NULL,
	[ID_oficina_o] [int] NULL,
	[Descripcion] [nvarchar](10) NULL,
	[ciudad] [nvarchar](30) NULL,
	[telefono] [nvarchar](20) NULL,
	[descripcion_completa] [nvarchar](43) NULL,
	[estado_ubicacion] [nvarchar](21) NULL,
	[longitud_descripcion] [int] NULL,
	[codigo_area_telefono] [nvarchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProducto]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProducto](
	[ID_producto] [int] NOT NULL,
	[ID_producto_o] [int] NULL,
	[nombre] [nvarchar](70) NULL,
	[Categoria] [int] NULL,
	[Desc_Categoria] [nvarchar](50) NULL,
	[cantidad_en_stock] [smallint] NULL,
	[precio_venta] [numeric](15, 2) NULL,
	[precio_proveedor] [numeric](15, 2) NULL,
	[nivel_stock] [nvarchar](5) NULL,
	[margen_ganancia] [numeric](16, 2) NULL,
	[valor_total_stock] [numeric](21, 2) NULL,
	[longitud_nombre_producto] [int] NULL,
	[nombre_mayuscula] [nvarchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTiempo]    Script Date: 25/05/2024 10:51:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTiempo](
	[ID_hechospedido] [int] NOT NULL,
	[ID_hechospedido_o] [int] NULL,
	[fecha] [date] NULL,
	[Anio] [int] NULL,
	[Mes] [int] NULL,
	[Dia] [int] NULL,
	[DiaSemanaNum] [int] NULL,
	[Trimestre] [int] NULL,
	[Diaanio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_hechospedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimHechosPedido]  WITH CHECK ADD  CONSTRAINT [FK_DimHechosPedido_DimCliente] FOREIGN KEY([ID_hechospedido])
REFERENCES [dbo].[DimCliente] ([ID_cliente])
GO
ALTER TABLE [dbo].[DimHechosPedido] CHECK CONSTRAINT [FK_DimHechosPedido_DimCliente]
GO
ALTER TABLE [dbo].[DimHechosPedido]  WITH CHECK ADD  CONSTRAINT [FK_DimHechosPedido_DimEmpleado] FOREIGN KEY([ID_cliente])
REFERENCES [dbo].[DimEmpleado] ([ID_empleado])
GO
ALTER TABLE [dbo].[DimHechosPedido] CHECK CONSTRAINT [FK_DimHechosPedido_DimEmpleado]
GO
ALTER TABLE [dbo].[DimHechosPedido]  WITH CHECK ADD  CONSTRAINT [FK_DimHechosPedido_DimOficina] FOREIGN KEY([cantidad])
REFERENCES [dbo].[DimOficina] ([ID_oficina])
GO
ALTER TABLE [dbo].[DimHechosPedido] CHECK CONSTRAINT [FK_DimHechosPedido_DimOficina]
GO
ALTER TABLE [dbo].[DimHechosPedido]  WITH CHECK ADD  CONSTRAINT [FK_DimHechosPedido_DimProducto] FOREIGN KEY([cantidad])
REFERENCES [dbo].[DimProducto] ([ID_producto])
GO
ALTER TABLE [dbo].[DimHechosPedido] CHECK CONSTRAINT [FK_DimHechosPedido_DimProducto]
GO
ALTER TABLE [dbo].[DimHechosPedido]  WITH CHECK ADD  CONSTRAINT [FK_DimHechosPedido_DimTiempo] FOREIGN KEY([ID_cliente])
REFERENCES [dbo].[DimTiempo] ([ID_hechospedido])
GO
ALTER TABLE [dbo].[DimHechosPedido] CHECK CONSTRAINT [FK_DimHechosPedido_DimTiempo]
GO


-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/05/2017 17:51:16
-- Generated from EDMX file: E:\Dokumentumok\School\GAMF\2016-17-2\Vizuális programozás\Beadandó\Viragkereskedes\VIZP2017I\Viragkereskedes_DAL\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [w:\Viragkereskedes\viragkereskedesDB.mdf];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_enUserenOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[enOrders] DROP CONSTRAINT [FK_enUserenOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_enOrder_detailenOrder_enOrder_detail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Controller] DROP CONSTRAINT [FK_enOrder_detailenOrder_enOrder_detail];
GO
IF OBJECT_ID(N'[dbo].[FK_enOrder_detailenOrder_enOrder]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Order_Controller] DROP CONSTRAINT [FK_enOrder_detailenOrder_enOrder];
GO
IF OBJECT_ID(N'[dbo].[FK_enAccessoryenAccessory_vs_product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[enAccessories_vs_products] DROP CONSTRAINT [FK_enAccessoryenAccessory_vs_product];
GO
IF OBJECT_ID(N'[dbo].[FK_enCategoryenProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[enProducts] DROP CONSTRAINT [FK_enCategoryenProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_enProductenBouquet_enProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdBouquets] DROP CONSTRAINT [FK_enProductenBouquet_enProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_enProductenBouquet_enBouquet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdBouquets] DROP CONSTRAINT [FK_enProductenBouquet_enBouquet];
GO
IF OBJECT_ID(N'[dbo].[FK_enProductenBouquet1_enProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdProd] DROP CONSTRAINT [FK_enProductenBouquet1_enProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_enProductenBouquet1_enBouquet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProdProd] DROP CONSTRAINT [FK_enProductenBouquet1_enBouquet];
GO
IF OBJECT_ID(N'[dbo].[FK_enProductenAccessory_vs_product_enProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accessories_vs_Products_Controller] DROP CONSTRAINT [FK_enProductenAccessory_vs_product_enProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_enProductenAccessory_vs_product_enAccessory_vs_product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Accessories_vs_Products_Controller] DROP CONSTRAINT [FK_enProductenAccessory_vs_product_enAccessory_vs_product];
GO
IF OBJECT_ID(N'[dbo].[FK_enProductenOrder_detail_enProduct]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_Order_Controller] DROP CONSTRAINT [FK_enProductenOrder_detail_enProduct];
GO
IF OBJECT_ID(N'[dbo].[FK_enProductenOrder_detail_enOrder_detail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Product_Order_Controller] DROP CONSTRAINT [FK_enProductenOrder_detail_enOrder_detail];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[enCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enCategories];
GO
IF OBJECT_ID(N'[dbo].[enProducts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enProducts];
GO
IF OBJECT_ID(N'[dbo].[enOrder_details]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enOrder_details];
GO
IF OBJECT_ID(N'[dbo].[enAccessories_vs_products]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enAccessories_vs_products];
GO
IF OBJECT_ID(N'[dbo].[enAccessories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enAccessories];
GO
IF OBJECT_ID(N'[dbo].[enOrders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enOrders];
GO
IF OBJECT_ID(N'[dbo].[enUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enUsers];
GO
IF OBJECT_ID(N'[dbo].[enBouquetSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[enBouquetSet];
GO
IF OBJECT_ID(N'[dbo].[Order_Controller]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Order_Controller];
GO
IF OBJECT_ID(N'[dbo].[ProdBouquets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProdBouquets];
GO
IF OBJECT_ID(N'[dbo].[ProdProd]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProdProd];
GO
IF OBJECT_ID(N'[dbo].[Accessories_vs_Products_Controller]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Accessories_vs_Products_Controller];
GO
IF OBJECT_ID(N'[dbo].[Product_Order_Controller]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Product_Order_Controller];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'enCategories'
CREATE TABLE [dbo].[enCategories] (
    [category_id] int IDENTITY(1,1) NOT NULL,
    [category_name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'enProducts'
CREATE TABLE [dbo].[enProducts] (
    [product_id] int IDENTITY(1,1) NOT NULL,
    [product_name] nvarchar(max)  NOT NULL,
    [product_price_net] int  NOT NULL,
    [product_fees] int  NOT NULL,
    [product_sale] bit  NOT NULL,
    [product_description] nvarchar(max)  NOT NULL,
    [product_icon] nvarchar(max)  NOT NULL,
    [product_active] bit  NOT NULL,
    [product_price_gross] int  NOT NULL,
    [enCategory_category_id] int  NOT NULL
);
GO

-- Creating table 'enOrder_details'
CREATE TABLE [dbo].[enOrder_details] (
    [product_amount] int  NOT NULL,
    [product_price] int  NOT NULL,
    [Id] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'enAccessories_vs_products'
CREATE TABLE [dbo].[enAccessories_vs_products] (
    [accessory_amount] int  NOT NULL,
    [Id] int IDENTITY(1,1) NOT NULL,
    [enAccessory_accessory_id] int  NOT NULL
);
GO

-- Creating table 'enAccessories'
CREATE TABLE [dbo].[enAccessories] (
    [accessory_id] int IDENTITY(1,1) NOT NULL,
    [accessory_name] nvarchar(max)  NOT NULL,
    [accessory_price] int  NOT NULL
);
GO

-- Creating table 'enOrders'
CREATE TABLE [dbo].[enOrders] (
    [order_id] int IDENTITY(1,1) NOT NULL,
    [order_price] int  NOT NULL,
    [order_date] datetime  NOT NULL,
    [enUsers_user_id] int  NOT NULL
);
GO

-- Creating table 'enUsers'
CREATE TABLE [dbo].[enUsers] (
    [user_id] int IDENTITY(1,1) NOT NULL,
    [user_name] nvarchar(max)  NOT NULL,
    [user_password] nvarchar(max)  NOT NULL,
    [user_admin] bit  NOT NULL
);
GO

-- Creating table 'enBouquetSet'
CREATE TABLE [dbo].[enBouquetSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [product_amount] int  NOT NULL
);
GO

-- Creating table 'Order_Controller'
CREATE TABLE [dbo].[Order_Controller] (
    [enOrder_detail_Id] int  NOT NULL,
    [enOrders_order_id] int  NOT NULL
);
GO

-- Creating table 'ProdBouquets'
CREATE TABLE [dbo].[ProdBouquets] (
    [bouquet_id_product_id] int  NOT NULL,
    [enBouquets_Id] int  NOT NULL
);
GO

-- Creating table 'ProdProd'
CREATE TABLE [dbo].[ProdProd] (
    [enProducts_product_id] int  NOT NULL,
    [BouquetId_Id] int  NOT NULL
);
GO

-- Creating table 'Accessories_vs_Products_Controller'
CREATE TABLE [dbo].[Accessories_vs_Products_Controller] (
    [enProducts_product_id] int  NOT NULL,
    [enAccessory_vs_product_Id] int  NOT NULL
);
GO

-- Creating table 'Product_Order_Controller'
CREATE TABLE [dbo].[Product_Order_Controller] (
    [enProduct_product_id] int  NOT NULL,
    [enOrder_detail_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [category_id] in table 'enCategories'
ALTER TABLE [dbo].[enCategories]
ADD CONSTRAINT [PK_enCategories]
    PRIMARY KEY CLUSTERED ([category_id] ASC);
GO

-- Creating primary key on [product_id] in table 'enProducts'
ALTER TABLE [dbo].[enProducts]
ADD CONSTRAINT [PK_enProducts]
    PRIMARY KEY CLUSTERED ([product_id] ASC);
GO

-- Creating primary key on [Id] in table 'enOrder_details'
ALTER TABLE [dbo].[enOrder_details]
ADD CONSTRAINT [PK_enOrder_details]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'enAccessories_vs_products'
ALTER TABLE [dbo].[enAccessories_vs_products]
ADD CONSTRAINT [PK_enAccessories_vs_products]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [accessory_id] in table 'enAccessories'
ALTER TABLE [dbo].[enAccessories]
ADD CONSTRAINT [PK_enAccessories]
    PRIMARY KEY CLUSTERED ([accessory_id] ASC);
GO

-- Creating primary key on [order_id] in table 'enOrders'
ALTER TABLE [dbo].[enOrders]
ADD CONSTRAINT [PK_enOrders]
    PRIMARY KEY CLUSTERED ([order_id] ASC);
GO

-- Creating primary key on [user_id] in table 'enUsers'
ALTER TABLE [dbo].[enUsers]
ADD CONSTRAINT [PK_enUsers]
    PRIMARY KEY CLUSTERED ([user_id] ASC);
GO

-- Creating primary key on [Id] in table 'enBouquetSet'
ALTER TABLE [dbo].[enBouquetSet]
ADD CONSTRAINT [PK_enBouquetSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [enOrder_detail_Id], [enOrders_order_id] in table 'Order_Controller'
ALTER TABLE [dbo].[Order_Controller]
ADD CONSTRAINT [PK_Order_Controller]
    PRIMARY KEY CLUSTERED ([enOrder_detail_Id], [enOrders_order_id] ASC);
GO

-- Creating primary key on [bouquet_id_product_id], [enBouquets_Id] in table 'ProdBouquets'
ALTER TABLE [dbo].[ProdBouquets]
ADD CONSTRAINT [PK_ProdBouquets]
    PRIMARY KEY CLUSTERED ([bouquet_id_product_id], [enBouquets_Id] ASC);
GO

-- Creating primary key on [enProducts_product_id], [BouquetId_Id] in table 'ProdProd'
ALTER TABLE [dbo].[ProdProd]
ADD CONSTRAINT [PK_ProdProd]
    PRIMARY KEY CLUSTERED ([enProducts_product_id], [BouquetId_Id] ASC);
GO

-- Creating primary key on [enProducts_product_id], [enAccessory_vs_product_Id] in table 'Accessories_vs_Products_Controller'
ALTER TABLE [dbo].[Accessories_vs_Products_Controller]
ADD CONSTRAINT [PK_Accessories_vs_Products_Controller]
    PRIMARY KEY CLUSTERED ([enProducts_product_id], [enAccessory_vs_product_Id] ASC);
GO

-- Creating primary key on [enProduct_product_id], [enOrder_detail_Id] in table 'Product_Order_Controller'
ALTER TABLE [dbo].[Product_Order_Controller]
ADD CONSTRAINT [PK_Product_Order_Controller]
    PRIMARY KEY CLUSTERED ([enProduct_product_id], [enOrder_detail_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [enUsers_user_id] in table 'enOrders'
ALTER TABLE [dbo].[enOrders]
ADD CONSTRAINT [FK_enUserenOrder]
    FOREIGN KEY ([enUsers_user_id])
    REFERENCES [dbo].[enUsers]
        ([user_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enUserenOrder'
CREATE INDEX [IX_FK_enUserenOrder]
ON [dbo].[enOrders]
    ([enUsers_user_id]);
GO

-- Creating foreign key on [enOrder_detail_Id] in table 'Order_Controller'
ALTER TABLE [dbo].[Order_Controller]
ADD CONSTRAINT [FK_enOrder_detailenOrder_enOrder_detail]
    FOREIGN KEY ([enOrder_detail_Id])
    REFERENCES [dbo].[enOrder_details]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [enOrders_order_id] in table 'Order_Controller'
ALTER TABLE [dbo].[Order_Controller]
ADD CONSTRAINT [FK_enOrder_detailenOrder_enOrder]
    FOREIGN KEY ([enOrders_order_id])
    REFERENCES [dbo].[enOrders]
        ([order_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enOrder_detailenOrder_enOrder'
CREATE INDEX [IX_FK_enOrder_detailenOrder_enOrder]
ON [dbo].[Order_Controller]
    ([enOrders_order_id]);
GO

-- Creating foreign key on [enAccessory_accessory_id] in table 'enAccessories_vs_products'
ALTER TABLE [dbo].[enAccessories_vs_products]
ADD CONSTRAINT [FK_enAccessoryenAccessory_vs_product]
    FOREIGN KEY ([enAccessory_accessory_id])
    REFERENCES [dbo].[enAccessories]
        ([accessory_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enAccessoryenAccessory_vs_product'
CREATE INDEX [IX_FK_enAccessoryenAccessory_vs_product]
ON [dbo].[enAccessories_vs_products]
    ([enAccessory_accessory_id]);
GO

-- Creating foreign key on [enCategory_category_id] in table 'enProducts'
ALTER TABLE [dbo].[enProducts]
ADD CONSTRAINT [FK_enCategoryenProduct]
    FOREIGN KEY ([enCategory_category_id])
    REFERENCES [dbo].[enCategories]
        ([category_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enCategoryenProduct'
CREATE INDEX [IX_FK_enCategoryenProduct]
ON [dbo].[enProducts]
    ([enCategory_category_id]);
GO

-- Creating foreign key on [bouquet_id_product_id] in table 'ProdBouquets'
ALTER TABLE [dbo].[ProdBouquets]
ADD CONSTRAINT [FK_enProductenBouquet_enProduct]
    FOREIGN KEY ([bouquet_id_product_id])
    REFERENCES [dbo].[enProducts]
        ([product_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [enBouquets_Id] in table 'ProdBouquets'
ALTER TABLE [dbo].[ProdBouquets]
ADD CONSTRAINT [FK_enProductenBouquet_enBouquet]
    FOREIGN KEY ([enBouquets_Id])
    REFERENCES [dbo].[enBouquetSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enProductenBouquet_enBouquet'
CREATE INDEX [IX_FK_enProductenBouquet_enBouquet]
ON [dbo].[ProdBouquets]
    ([enBouquets_Id]);
GO

-- Creating foreign key on [enProducts_product_id] in table 'ProdProd'
ALTER TABLE [dbo].[ProdProd]
ADD CONSTRAINT [FK_enProductenBouquet1_enProduct]
    FOREIGN KEY ([enProducts_product_id])
    REFERENCES [dbo].[enProducts]
        ([product_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [BouquetId_Id] in table 'ProdProd'
ALTER TABLE [dbo].[ProdProd]
ADD CONSTRAINT [FK_enProductenBouquet1_enBouquet]
    FOREIGN KEY ([BouquetId_Id])
    REFERENCES [dbo].[enBouquetSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enProductenBouquet1_enBouquet'
CREATE INDEX [IX_FK_enProductenBouquet1_enBouquet]
ON [dbo].[ProdProd]
    ([BouquetId_Id]);
GO

-- Creating foreign key on [enProducts_product_id] in table 'Accessories_vs_Products_Controller'
ALTER TABLE [dbo].[Accessories_vs_Products_Controller]
ADD CONSTRAINT [FK_enProductenAccessory_vs_product_enProduct]
    FOREIGN KEY ([enProducts_product_id])
    REFERENCES [dbo].[enProducts]
        ([product_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [enAccessory_vs_product_Id] in table 'Accessories_vs_Products_Controller'
ALTER TABLE [dbo].[Accessories_vs_Products_Controller]
ADD CONSTRAINT [FK_enProductenAccessory_vs_product_enAccessory_vs_product]
    FOREIGN KEY ([enAccessory_vs_product_Id])
    REFERENCES [dbo].[enAccessories_vs_products]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enProductenAccessory_vs_product_enAccessory_vs_product'
CREATE INDEX [IX_FK_enProductenAccessory_vs_product_enAccessory_vs_product]
ON [dbo].[Accessories_vs_Products_Controller]
    ([enAccessory_vs_product_Id]);
GO

-- Creating foreign key on [enProduct_product_id] in table 'Product_Order_Controller'
ALTER TABLE [dbo].[Product_Order_Controller]
ADD CONSTRAINT [FK_enProductenOrder_detail_enProduct]
    FOREIGN KEY ([enProduct_product_id])
    REFERENCES [dbo].[enProducts]
        ([product_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [enOrder_detail_Id] in table 'Product_Order_Controller'
ALTER TABLE [dbo].[Product_Order_Controller]
ADD CONSTRAINT [FK_enProductenOrder_detail_enOrder_detail]
    FOREIGN KEY ([enOrder_detail_Id])
    REFERENCES [dbo].[enOrder_details]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enProductenOrder_detail_enOrder_detail'
CREATE INDEX [IX_FK_enProductenOrder_detail_enOrder_detail]
ON [dbo].[Product_Order_Controller]
    ([enOrder_detail_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
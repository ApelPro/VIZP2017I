
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/11/2017 19:14:23
-- Generated from EDMX file: E:\project\Viragkereskedes\Viragkereskedes_DAL\edmViragkereskedes.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [E:\project\Viragkereskedes\Viragkereskedes_DAL\Viragkereskedes.mdf];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Products'
CREATE TABLE [dbo].[Products] (
    [product_id] int IDENTITY(1,1) NOT NULL,
    [product_name] nvarchar(max)  NOT NULL,
    [product_price] int  NOT NULL,
    [product_onsale] bit  NOT NULL,
    [product_description] nvarchar(max)  NOT NULL,
    [product_icon] tinyint  NOT NULL,
    [product_active] bit  NOT NULL,
    [enProductsenBouquet_enProducts_bouquet_id] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [category_id] int IDENTITY(1,1) NOT NULL,
    [category_name] nvarchar(max)  NOT NULL,
    [enProductsenCategories_enCategories_product_id] int  NOT NULL
);
GO

-- Creating table 'Bouquet'
CREATE TABLE [dbo].[Bouquet] (
    [bouquet_id] int IDENTITY(1,1) NOT NULL,
    [bouquet_fee] int  NOT NULL
);
GO

-- Creating table 'Accessories'
CREATE TABLE [dbo].[Accessories] (
    [accessory_id] int IDENTITY(1,1) NOT NULL,
    [accessory_name] nvarchar(max)  NOT NULL,
    [accessory_price] int  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [order_id] int IDENTITY(1,1) NOT NULL,
    [order_amount] int  NOT NULL,
    [order_date] datetime  NOT NULL,
    [order_ordered] bit  NOT NULL,
    [uid_user_id] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [user_id] int IDENTITY(1,1) NOT NULL,
    [user_name] nvarchar(max)  NOT NULL,
    [user_password] nvarchar(max)  NOT NULL,
    [user_admin] bit  NOT NULL
);
GO

-- Creating table 'Orders_details'
CREATE TABLE [dbo].[Orders_details] (
    [product_number] int  NOT NULL,
    [product_amount] int  NOT NULL,
    [order_id] int  NOT NULL,
    [pid_product_id] int  NOT NULL,
    [oid_order_id] int  NOT NULL
);
GO

-- Creating table 'Accessories_vs_products'
CREATE TABLE [dbo].[Accessories_vs_products] (
    [accessory_number] int  NOT NULL,
    [accessory_id] int  NOT NULL,
    [bid_bouquet_id] int  NOT NULL,
    [acc_id_accessory_id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [product_id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [PK_Products]
    PRIMARY KEY CLUSTERED ([product_id] ASC);
GO

-- Creating primary key on [category_id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([category_id] ASC);
GO

-- Creating primary key on [bouquet_id] in table 'Bouquet'
ALTER TABLE [dbo].[Bouquet]
ADD CONSTRAINT [PK_Bouquet]
    PRIMARY KEY CLUSTERED ([bouquet_id] ASC);
GO

-- Creating primary key on [accessory_id] in table 'Accessories'
ALTER TABLE [dbo].[Accessories]
ADD CONSTRAINT [PK_Accessories]
    PRIMARY KEY CLUSTERED ([accessory_id] ASC);
GO

-- Creating primary key on [order_id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([order_id] ASC);
GO

-- Creating primary key on [user_id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([user_id] ASC);
GO

-- Creating primary key on [order_id] in table 'Orders_details'
ALTER TABLE [dbo].[Orders_details]
ADD CONSTRAINT [PK_Orders_details]
    PRIMARY KEY CLUSTERED ([order_id] ASC);
GO

-- Creating primary key on [accessory_id] in table 'Accessories_vs_products'
ALTER TABLE [dbo].[Accessories_vs_products]
ADD CONSTRAINT [PK_Accessories_vs_products]
    PRIMARY KEY CLUSTERED ([accessory_id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [enProductsenCategories_enCategories_product_id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [FK_enProductsenCategories]
    FOREIGN KEY ([enProductsenCategories_enCategories_product_id])
    REFERENCES [dbo].[Products]
        ([product_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enProductsenCategories'
CREATE INDEX [IX_FK_enProductsenCategories]
ON [dbo].[Categories]
    ([enProductsenCategories_enCategories_product_id]);
GO

-- Creating foreign key on [enProductsenBouquet_enProducts_bouquet_id] in table 'Products'
ALTER TABLE [dbo].[Products]
ADD CONSTRAINT [FK_enProductsenBouquet]
    FOREIGN KEY ([enProductsenBouquet_enProducts_bouquet_id])
    REFERENCES [dbo].[Bouquet]
        ([bouquet_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enProductsenBouquet'
CREATE INDEX [IX_FK_enProductsenBouquet]
ON [dbo].[Products]
    ([enProductsenBouquet_enProducts_bouquet_id]);
GO

-- Creating foreign key on [pid_product_id] in table 'Orders_details'
ALTER TABLE [dbo].[Orders_details]
ADD CONSTRAINT [FK_enOrder_detailsenProducts]
    FOREIGN KEY ([pid_product_id])
    REFERENCES [dbo].[Products]
        ([product_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enOrder_detailsenProducts'
CREATE INDEX [IX_FK_enOrder_detailsenProducts]
ON [dbo].[Orders_details]
    ([pid_product_id]);
GO

-- Creating foreign key on [bid_bouquet_id] in table 'Accessories_vs_products'
ALTER TABLE [dbo].[Accessories_vs_products]
ADD CONSTRAINT [FK_enAccessories_vs_productsenBouquet]
    FOREIGN KEY ([bid_bouquet_id])
    REFERENCES [dbo].[Bouquet]
        ([bouquet_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enAccessories_vs_productsenBouquet'
CREATE INDEX [IX_FK_enAccessories_vs_productsenBouquet]
ON [dbo].[Accessories_vs_products]
    ([bid_bouquet_id]);
GO

-- Creating foreign key on [acc_id_accessory_id] in table 'Accessories_vs_products'
ALTER TABLE [dbo].[Accessories_vs_products]
ADD CONSTRAINT [FK_enAccessoriesenAccessories_vs_products]
    FOREIGN KEY ([acc_id_accessory_id])
    REFERENCES [dbo].[Accessories]
        ([accessory_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enAccessoriesenAccessories_vs_products'
CREATE INDEX [IX_FK_enAccessoriesenAccessories_vs_products]
ON [dbo].[Accessories_vs_products]
    ([acc_id_accessory_id]);
GO

-- Creating foreign key on [uid_user_id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_enUsersenOrders]
    FOREIGN KEY ([uid_user_id])
    REFERENCES [dbo].[Users]
        ([user_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enUsersenOrders'
CREATE INDEX [IX_FK_enUsersenOrders]
ON [dbo].[Orders]
    ([uid_user_id]);
GO

-- Creating foreign key on [oid_order_id] in table 'Orders_details'
ALTER TABLE [dbo].[Orders_details]
ADD CONSTRAINT [FK_enOrdersenOrder_details]
    FOREIGN KEY ([oid_order_id])
    REFERENCES [dbo].[Orders]
        ([order_id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_enOrdersenOrder_details'
CREATE INDEX [IX_FK_enOrdersenOrder_details]
ON [dbo].[Orders_details]
    ([oid_order_id]);
GO

-- Creating foreign key on [order_id] in table 'Orders_details'
ALTER TABLE [dbo].[Orders_details]
ADD CONSTRAINT [FK_details_inherits_enOrders]
    FOREIGN KEY ([order_id])
    REFERENCES [dbo].[Orders]
        ([order_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [accessory_id] in table 'Accessories_vs_products'
ALTER TABLE [dbo].[Accessories_vs_products]
ADD CONSTRAINT [FK_vs_products_inherits_enAccessories]
    FOREIGN KEY ([accessory_id])
    REFERENCES [dbo].[Accessories]
        ([accessory_id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
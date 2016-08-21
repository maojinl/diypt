
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/19/2016 11:28:48
-- Generated from EDMX file: C:\workspace\asp_project\diypt.club\home\App_Code\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [diypt];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PrizeExercisePlan_PrizePlanProgram]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrizeExercisePlans] DROP CONSTRAINT [FK_PrizeExercisePlan_PrizePlanProgram];
GO
IF OBJECT_ID(N'[dbo].[FK_PrizeExercisePlanWeek_PrizeExercisePlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrizeExercisePlanWeeks] DROP CONSTRAINT [FK_PrizeExercisePlanWeek_PrizeExercisePlan];
GO
IF OBJECT_ID(N'[dbo].[FK_PrizeExercisePlanWeek_PrizeFoodPlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrizeExercisePlanWeeks] DROP CONSTRAINT [FK_PrizeExercisePlanWeek_PrizeFoodPlan];
GO
IF OBJECT_ID(N'[dbo].[FK_PrizeMemberLog_MemberExercisePlan]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrizeMemberLogs] DROP CONSTRAINT [FK_PrizeMemberLog_MemberExercisePlan];
GO
IF OBJECT_ID(N'[dbo].[FK_PrizeMemberLog_PrizeMember]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PrizeMemberLogs] DROP CONSTRAINT [FK_PrizeMemberLog_PrizeMember];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[MemberExercisePlans]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MemberExercisePlans];
GO
IF OBJECT_ID(N'[dbo].[MemberExercisePlanWeeks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MemberExercisePlanWeeks];
GO
IF OBJECT_ID(N'[dbo].[PrizeExerciseDayTimeTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeExerciseDayTimeTypes];
GO
IF OBJECT_ID(N'[dbo].[PrizeExercisePlans]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeExercisePlans];
GO
IF OBJECT_ID(N'[dbo].[PrizeExercisePlanWeeks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeExercisePlanWeeks];
GO
IF OBJECT_ID(N'[dbo].[PrizeExerciseUnits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeExerciseUnits];
GO
IF OBJECT_ID(N'[dbo].[PrizeExerciseUnitSetForDays]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeExerciseUnitSetForDays];
GO
IF OBJECT_ID(N'[dbo].[PrizeExerciseUnitSetNames]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeExerciseUnitSetNames];
GO
IF OBJECT_ID(N'[dbo].[PrizeExerciseUnitSets]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeExerciseUnitSets];
GO
IF OBJECT_ID(N'[dbo].[PrizeFoodPlans]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeFoodPlans];
GO
IF OBJECT_ID(N'[dbo].[PrizeMemberLogs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeMemberLogs];
GO
IF OBJECT_ID(N'[dbo].[PrizeMembers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizeMembers];
GO
IF OBJECT_ID(N'[dbo].[PrizePlanExperiences]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizePlanExperiences];
GO
IF OBJECT_ID(N'[dbo].[PrizePlanLevels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizePlanLevels];
GO
IF OBJECT_ID(N'[dbo].[PrizePlanLocations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizePlanLocations];
GO
IF OBJECT_ID(N'[dbo].[PrizePlanPrograms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PrizePlanPrograms];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'MemberExercisePlans'
CREATE TABLE [dbo].[MemberExercisePlans] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MemberId] int  NULL,
    [ExercisePlanId] int  NULL,
    [Status] varchar(255)  NULL,
    [StartDate] datetime  NULL,
    [StartWeight] decimal(18,2)  NULL,
    [StartWaist] decimal(18,2)  NULL,
    [StartBodyFat] decimal(18,2)  NULL,
    [EndDate] datetime  NULL,
    [EndWeight] decimal(18,2)  NULL,
    [EndWaist] decimal(18,2)  NULL,
    [EndBodyFat] decimal(18,2)  NULL
);
GO

-- Creating table 'MemberExercisePlanWeeks'
CREATE TABLE [dbo].[MemberExercisePlanWeeks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MemberId] int  NULL,
    [ExercisePlanId] int  NULL,
    [Status] varchar(255)  NULL,
    [StartDate] datetime  NULL,
    [StartWeight] decimal(18,2)  NULL,
    [StartWaist] decimal(18,2)  NULL,
    [StartBodyFat] decimal(18,2)  NULL,
    [EndDate] datetime  NULL,
    [EndWeight] decimal(18,2)  NULL,
    [EndWaist] decimal(18,2)  NULL,
    [EndBodyFat] decimal(18,2)  NULL,
    [ExercisePlanWeekId] int  NULL
);
GO

-- Creating table 'PrizeExerciseDayTimeTypes'
CREATE TABLE [dbo].[PrizeExerciseDayTimeTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DayTimeTypeName] varchar(50)  NOT NULL,
    [Image] varchar(255)  NOT NULL
);
GO

-- Creating table 'PrizeExercisePlans'
CREATE TABLE [dbo].[PrizeExercisePlans] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PlanName] varchar(255)  NOT NULL,
    [Description] varchar(max)  NULL,
    [ProgramId] int  NOT NULL,
    [LocationId] int  NOT NULL,
    [ExperienceId] int  NOT NULL,
    [LevelId] int  NOT NULL,
    [childPlanId] int  NULL
);
GO

-- Creating table 'PrizeExercisePlanWeeks'
CREATE TABLE [dbo].[PrizeExercisePlanWeeks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PrizeExercisePlanId] int  NULL,
    [PrizeFoodPlanId] int  NULL,
    [Week] int  NULL,
    [ExerciseDay1] varchar(max)  NULL,
    [ExerciseDay2] varchar(max)  NULL,
    [ExerciseDay3] varchar(max)  NULL,
    [ExerciseDay4] varchar(max)  NULL,
    [ExerciseDay5] varchar(max)  NULL,
    [ExerciseDay6] varchar(max)  NULL,
    [ExerciseDay7] varchar(max)  NULL,
    [Description] varchar(max)  NULL
);
GO

-- Creating table 'PrizeExerciseUnits'
CREATE TABLE [dbo].[PrizeExerciseUnits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Exercise] varchar(max)  NULL,
    [Reps] varchar(255)  NULL,
    [Rest] varchar(255)  NULL,
    [Weight] varchar(max)  NULL,
    [Comments] varchar(max)  NULL,
    [UnitOrder] int  NULL,
    [Tempo] varchar(255)  NULL,
    [Trainning_Set] varchar(255)  NULL
);
GO

-- Creating table 'PrizeExerciseUnitSetForDays'
CREATE TABLE [dbo].[PrizeExerciseUnitSetForDays] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PrizeExercisePlanWeekId] int  NOT NULL,
    [ExerciseDay] int  NOT NULL,
    [PrizeExerciseUnitSetNameId] int  NOT NULL,
    [DayTimeTypeId] int  NOT NULL
);
GO

-- Creating table 'PrizeExerciseUnitSetNames'
CREATE TABLE [dbo].[PrizeExerciseUnitSetNames] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UnitSetName] varchar(50)  NOT NULL
);
GO

-- Creating table 'PrizeExerciseUnitSets'
CREATE TABLE [dbo].[PrizeExerciseUnitSets] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UnitSetNameId] int  NOT NULL,
    [PrizeExerciseUnitId] int  NOT NULL,
    [Sequence] int  NOT NULL
);
GO

-- Creating table 'PrizeFoodPlans'
CREATE TABLE [dbo].[PrizeFoodPlans] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PlanName] varchar(255)  NOT NULL,
    [Description] varchar(max)  NULL,
    [FoodDay1] varchar(max)  NOT NULL,
    [FoodDay2] varchar(max)  NOT NULL,
    [FoodDay3] varchar(max)  NOT NULL,
    [FoodDay4] varchar(max)  NOT NULL,
    [FoodDay5] varchar(max)  NOT NULL,
    [FoodDay6] varchar(max)  NOT NULL,
    [FoodDay7] varchar(max)  NOT NULL,
    [Weeks] varchar(255)  NULL,
    [ProgramId] int  NULL,
    [LocationId] int  NULL,
    [ExperienceId] int  NULL,
    [LevelId] int  NULL
);
GO

-- Creating table 'PrizeMemberLogs'
CREATE TABLE [dbo].[PrizeMemberLogs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MemberId] int  NULL,
    [MemberExercisePlanId] int  NULL,
    [LogDate] datetime  NULL,
    [Weight] decimal(18,2)  NULL,
    [Waist] decimal(18,2)  NULL,
    [BodyFat] decimal(18,2)  NULL,
    [PhotoUrl] varchar(max)  NULL
);
GO

-- Creating table 'PrizeMembers'
CREATE TABLE [dbo].[PrizeMembers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [UmbracoId] int  NULL,
    [Firstname] varchar(255)  NULL,
    [Surname] varchar(255)  NULL,
    [DoB] datetime  NULL,
    [Gender] varchar(255)  NULL,
    [Country] varchar(255)  NULL,
    [Email] varchar(max)  NULL,
    [StreetAddress] varchar(max)  NULL,
    [Suburb] varchar(255)  NULL,
    [City] varchar(255)  NULL,
    [Postcode] varchar(255)  NULL,
    [State] varchar(255)  NULL,
    [Height] decimal(18,2)  NULL,
    [Weight] decimal(18,2)  NULL,
    [Password] varchar(255)  NULL,
    [Waist] decimal(18,2)  NULL,
    [BodyFat] decimal(18,2)  NULL,
    [GoalDescription] varchar(max)  NULL,
    [GoalWeight] decimal(18,2)  NULL,
    [GoalWaist] decimal(18,2)  NULL,
    [GoalBodyFat] decimal(18,2)  NULL
);
GO

-- Creating table 'PrizePlanExperiences'
CREATE TABLE [dbo].[PrizePlanExperiences] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Sequence] int  NOT NULL
);
GO

-- Creating table 'PrizePlanLevels'
CREATE TABLE [dbo].[PrizePlanLevels] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Sequence] int  NOT NULL
);
GO

-- Creating table 'PrizePlanLocations'
CREATE TABLE [dbo].[PrizePlanLocations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Sequence] int  NOT NULL
);
GO

-- Creating table 'PrizePlanPrograms'
CREATE TABLE [dbo].[PrizePlanPrograms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(255)  NOT NULL,
    [Description] varchar(max)  NULL,
    [Sequence] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'MemberExercisePlans'
ALTER TABLE [dbo].[MemberExercisePlans]
ADD CONSTRAINT [PK_MemberExercisePlans]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MemberExercisePlanWeeks'
ALTER TABLE [dbo].[MemberExercisePlanWeeks]
ADD CONSTRAINT [PK_MemberExercisePlanWeeks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id], [DayTimeTypeName] in table 'PrizeExerciseDayTimeTypes'
ALTER TABLE [dbo].[PrizeExerciseDayTimeTypes]
ADD CONSTRAINT [PK_PrizeExerciseDayTimeTypes]
    PRIMARY KEY CLUSTERED ([Id], [DayTimeTypeName] ASC);
GO

-- Creating primary key on [Id] in table 'PrizeExercisePlans'
ALTER TABLE [dbo].[PrizeExercisePlans]
ADD CONSTRAINT [PK_PrizeExercisePlans]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrizeExercisePlanWeeks'
ALTER TABLE [dbo].[PrizeExercisePlanWeeks]
ADD CONSTRAINT [PK_PrizeExercisePlanWeeks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrizeExerciseUnits'
ALTER TABLE [dbo].[PrizeExerciseUnits]
ADD CONSTRAINT [PK_PrizeExerciseUnits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [PrizeExercisePlanWeekId], [ExerciseDay], [PrizeExerciseUnitSetNameId], [DayTimeTypeId] in table 'PrizeExerciseUnitSetForDays'
ALTER TABLE [dbo].[PrizeExerciseUnitSetForDays]
ADD CONSTRAINT [PK_PrizeExerciseUnitSetForDays]
    PRIMARY KEY CLUSTERED ([PrizeExercisePlanWeekId], [ExerciseDay], [PrizeExerciseUnitSetNameId], [DayTimeTypeId] ASC);
GO

-- Creating primary key on [Id], [UnitSetName] in table 'PrizeExerciseUnitSetNames'
ALTER TABLE [dbo].[PrizeExerciseUnitSetNames]
ADD CONSTRAINT [PK_PrizeExerciseUnitSetNames]
    PRIMARY KEY CLUSTERED ([Id], [UnitSetName] ASC);
GO

-- Creating primary key on [Id], [UnitSetNameId], [PrizeExerciseUnitId], [Sequence] in table 'PrizeExerciseUnitSets'
ALTER TABLE [dbo].[PrizeExerciseUnitSets]
ADD CONSTRAINT [PK_PrizeExerciseUnitSets]
    PRIMARY KEY CLUSTERED ([Id], [UnitSetNameId], [PrizeExerciseUnitId], [Sequence] ASC);
GO

-- Creating primary key on [Id] in table 'PrizeFoodPlans'
ALTER TABLE [dbo].[PrizeFoodPlans]
ADD CONSTRAINT [PK_PrizeFoodPlans]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrizeMemberLogs'
ALTER TABLE [dbo].[PrizeMemberLogs]
ADD CONSTRAINT [PK_PrizeMemberLogs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrizeMembers'
ALTER TABLE [dbo].[PrizeMembers]
ADD CONSTRAINT [PK_PrizeMembers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrizePlanExperiences'
ALTER TABLE [dbo].[PrizePlanExperiences]
ADD CONSTRAINT [PK_PrizePlanExperiences]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrizePlanLevels'
ALTER TABLE [dbo].[PrizePlanLevels]
ADD CONSTRAINT [PK_PrizePlanLevels]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrizePlanLocations'
ALTER TABLE [dbo].[PrizePlanLocations]
ADD CONSTRAINT [PK_PrizePlanLocations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PrizePlanPrograms'
ALTER TABLE [dbo].[PrizePlanPrograms]
ADD CONSTRAINT [PK_PrizePlanPrograms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MemberExercisePlanId] in table 'PrizeMemberLogs'
ALTER TABLE [dbo].[PrizeMemberLogs]
ADD CONSTRAINT [FK_PrizeMemberLog_MemberExercisePlan]
    FOREIGN KEY ([MemberExercisePlanId])
    REFERENCES [dbo].[MemberExercisePlanWeeks]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrizeMemberLog_MemberExercisePlan'
CREATE INDEX [IX_FK_PrizeMemberLog_MemberExercisePlan]
ON [dbo].[PrizeMemberLogs]
    ([MemberExercisePlanId]);
GO

-- Creating foreign key on [ProgramId] in table 'PrizeExercisePlans'
ALTER TABLE [dbo].[PrizeExercisePlans]
ADD CONSTRAINT [FK_PrizeExercisePlan_PrizePlanProgram]
    FOREIGN KEY ([ProgramId])
    REFERENCES [dbo].[PrizePlanPrograms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrizeExercisePlan_PrizePlanProgram'
CREATE INDEX [IX_FK_PrizeExercisePlan_PrizePlanProgram]
ON [dbo].[PrizeExercisePlans]
    ([ProgramId]);
GO

-- Creating foreign key on [PrizeExercisePlanId] in table 'PrizeExercisePlanWeeks'
ALTER TABLE [dbo].[PrizeExercisePlanWeeks]
ADD CONSTRAINT [FK_PrizeExercisePlanWeek_PrizeExercisePlan]
    FOREIGN KEY ([PrizeExercisePlanId])
    REFERENCES [dbo].[PrizeExercisePlans]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrizeExercisePlanWeek_PrizeExercisePlan'
CREATE INDEX [IX_FK_PrizeExercisePlanWeek_PrizeExercisePlan]
ON [dbo].[PrizeExercisePlanWeeks]
    ([PrizeExercisePlanId]);
GO

-- Creating foreign key on [PrizeFoodPlanId] in table 'PrizeExercisePlanWeeks'
ALTER TABLE [dbo].[PrizeExercisePlanWeeks]
ADD CONSTRAINT [FK_PrizeExercisePlanWeek_PrizeFoodPlan]
    FOREIGN KEY ([PrizeFoodPlanId])
    REFERENCES [dbo].[PrizeFoodPlans]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrizeExercisePlanWeek_PrizeFoodPlan'
CREATE INDEX [IX_FK_PrizeExercisePlanWeek_PrizeFoodPlan]
ON [dbo].[PrizeExercisePlanWeeks]
    ([PrizeFoodPlanId]);
GO

-- Creating foreign key on [MemberId] in table 'PrizeMemberLogs'
ALTER TABLE [dbo].[PrizeMemberLogs]
ADD CONSTRAINT [FK_PrizeMemberLog_PrizeMember]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[PrizeMembers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PrizeMemberLog_PrizeMember'
CREATE INDEX [IX_FK_PrizeMemberLog_PrizeMember]
ON [dbo].[PrizeMemberLogs]
    ([MemberId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
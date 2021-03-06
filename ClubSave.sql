USE [LionsClub]
GO
/****** Object:  StoredProcedure [dbo].[ClubSave]    Script Date: 01/10/2012 23:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ClubSave]
(
	@ID					int OUTPUT,
	@Region				nvarchar(200),
	@Zone				nvarchar(200),
	@Number				int,
	@Name				nvarchar(200),
	@ShortName			nvarchar(50),
	@SponsoredBy		nvarchar(200),
	@ChartedDate		datetime,
	@CharterPresident	nvarchar(200),
	@ExtensionChairman  nvarchar(200),
	@GuidingLion		nvarchar(200),
	@MeetsOn			nvarchar(200),
	@IsActiveFL			bit,
	@IsDeletedFL		bit,
	@CreationDate		datetime,
	@LastUpdatedDate	datetime,
	@CreatedBy			int,
	@LastUpdatedBy		int
)
AS
BEGIN

	IF  NOT EXISTS (SELECT * FROM [Club] WHERE [ID] = @ID)
	BEGIN
		
		UPDATE [Club]
		SET [Region]			= @Region,
			[Zone]				= @Zone,
			[Number]			= @Number,
			[Name]				= @Name,
			[ShortName]			= @ShortName,
			[SponsoredBy]		= @SponsoredBy,
			[ChartedDate]		= @ChartedDate,
			[CharterPresident]	= @CharterPresident,
			[ExtensionChairman] = @ExtensionChairman,
			[GuidingLion]		= @GuidingLion,
			[MeetsOn]			= @MeetsOn,
			[IsActiveFL]		= @IsActiveFL,
			[IsDeletedFL]		= @IsDeletedFL,
			[LastUpdatedDate]	= @LastUpdatedDate,
			[LastUpdatedBy]		= @LastUpdatedBy
		WHERE [ID] = @ID;
			
		
	END
	ELSE
	BEGIN
	
		INSERT INTO [Club]
		(
			[Region],
			[Zone],
			[Number],
			[Name],
			[ShortName],
			[SponsoredBy],
			[ChartedDate],
			[CharterPresident],	
			[ExtensionChairman], 
			[GuidingLion],		
			[MeetsOn],			
			[IsActiveFL],		
			[IsDeletedFL],
			[CreationDate],
			[LastUpdatedDate],
			[CreatedBy],	
			[LastUpdatedBy]		
		)
		VALUES
		(
			@Region,
			@Zone,
			@Number,
			@Name,
			@ShortName,
			@SponsoredBy,
			@ChartedDate,
			@CharterPresident,
			@ExtensionChairman,
			@GuidingLion,
			@MeetsOn,
			@IsActiveFL,
			@IsDeletedFL,
			@CreationDate,
			@LastUpdatedDate,
			@CreatedBy,
			@LastUpdatedBy
		)
		
		SET @ID = SCOPE_IDENTITY();
		
	END

END
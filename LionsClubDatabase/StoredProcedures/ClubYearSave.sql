USE [LionsClub]
GO
/****** Object:  StoredProcedure [dbo].[ClubYearSave]    Script Date: 01/10/2012 23:39:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[ClubYearSave]
(
	@ID					int OUTPUT,
	@ClubMemberID		int,
	@ClubID				int,
	@RoleID				int,
	@FromDate			datetime,
	@ToDate				datetime,
	@IsActiveFL			bit,
	@IsDeletedFL		bit,
	@CreationDate		datetime,
	@LastUpdatedDate	datetime,
	@CreatedBy			int,
	@LastUpdatedBy		int
)
AS
BEGIN

	IF EXISTS (SELECT * FROM [ClubYear] WHERE [ID] = @ID)
	BEGIN
		
		UPDATE [ClubYear]
		SET [ClubMemberID]		= @ClubMemberID,
			[ClubID]			= @ClubID,
			[RoleID]			= @RoleID,
			[FromDate]			= @FromDate,
			[ToDate]			= @ToDate,
			[IsActiveFL]		= @IsActiveFL,
			[IsDeletedFL]		= @IsDeletedFL,
			[LastUpdatedDate]	= @LastUpdatedDate,
			[LastUpdatedBy]		= @LastUpdatedBy
		WHERE [ID] = @ID
		
	END
	ELSE
	BEGIN
	
		INSERT INTO [ClubYear]
		(
			[ClubMemberID],
			[ClubID],
			[RoleID],
			[FromDate],
			[ToDate],
			[IsActiveFL],
			[IsDeletedFL],
			[CreationDate],
			[LastUpdatedDate],
			[CreatedBy],
			[LastUpdatedBy]
		)
		VALUES
		(
			@ClubMemberID,
			@ClubID,
			@RoleID,
			@FromDate,
			@ToDate,
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
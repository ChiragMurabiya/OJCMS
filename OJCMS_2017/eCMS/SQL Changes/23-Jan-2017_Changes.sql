USE [LIVE_Nov_21_2016]
GO
/****** Object:  UserDefinedFunction [dbo].[GetLatNotesByCaseID]    Script Date: 1/24/2017 10:29:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<The One Team>
-- Create date: <23-Jan-2017, Monday>
-- Description:	<Get Latest note by case id>
-- =============================================
CREATE FUNCTION [dbo].[GetLatNotesByCaseID]
(
	@ID INT
)
RETURNS varchar(MAX)
AS
BEGIN

DECLARE @Note VARCHAR(MAX)

Select Top 1 @Note = Note from CaseProgressNote CP
LEFT JOIN CaseProgressNoteMembers CM ON CM.CaseProgressNoteID = CP.ID
inner JOIN CaseMember CAM ON CAM.ID = CP.CaseMemberID OR CAM.ID = CP.CaseMemberID
WHERE CAM.CaseID=@id
order by CP.ID 

RETURN @Note 

END

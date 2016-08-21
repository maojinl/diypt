using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Common;

/// <summary>
/// Summary description for PrizeDataAccess
/// </summary>
public class PrizeDataAccess
{
    private DIYPTEntities db;

    public PrizeDataAccess()
    {
        //
        // TODO: Add constructor logic here
        //
        db = new DIYPTEntities();
    }

    public DbDataReader GetMemberWeeklyInfo(int iMemberPlanWeekId)
    {
        db.Database.Connection.Open();
        DbCommand cmd = db.Database.Connection.CreateCommand();
        cmd.CommandText = "SELECT a.ExerciseDay, d.UnitSetName, c.DayTimeTypeName, a.DayTimeTypeId, d.Id, c.image " +
            " FROM  PrizeExerciseUnitSetForDays a, PrizeExerciseDayTimeTypes c, PrizeExerciseUnitSetNames d " +
            " WHERE a.PrizeExercisePlanWeekId = " + iMemberPlanWeekId +
            " AND a.DayTimeTypeId = c.Id AND a.PrizeExerciseUnitSetNameId = d.Id " +
            " GROUP BY a.ExerciseDay, d.Id, d.UnitSetName, a.DayTimeTypeId, c.DayTimeTypeName, c.image ORDER BY a.ExerciseDay";

        DbDataReader reader = cmd.ExecuteReader();

        return reader;
    }
}
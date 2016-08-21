using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.Common;

public partial class UserControls_MemberLanding : System.Web.UI.UserControl
{
    protected List<Label> labels;
    protected HashSet<int> exerciseUnitSets;
    protected PrizeDataAccess dbAccess = new PrizeDataAccess();
    protected void InitLables()
    {
        labels = new List<Label>();
        labels.Add(lblExMon1);
        labels.Add(lblExTue1);
        labels.Add(lblExWed1);
        labels.Add(lblExThu1);
        labels.Add(lblExFri1);
        labels.Add(lblExSat1);
        labels.Add(lblExSun1);
        labels.Add(lblExMon2);
        labels.Add(lblExTue2);
        labels.Add(lblExWed2);
        labels.Add(lblExThu2);
        labels.Add(lblExFri2);
        labels.Add(lblExSat2);
        labels.Add(lblExSun2);

        exerciseUnitSets = new HashSet<int>();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (PrizeMemberAuthUtils.CurrentUserLogin() != true)
            return;

        InitLables();

        int memberId = PrizeMemberAuthUtils.GetMemberID();
        using (DIYPTEntities db = new DIYPTEntities())
        {
            db.Database.Connection.Open();
            MemberExercisePlanWeek memberPlanWeek = (from c in db.MemberExercisePlanWeeks
                                                     where c.MemberId == memberId && c.Status.Equals("1")
                                                     select c).FirstOrDefault();

            if (memberPlanWeek == null)
                return;

            PrizeExercisePlanWeek dbWeek = (from c in db.PrizeExercisePlanWeeks
                                            where c.Id == memberPlanWeek.ExercisePlanWeekId
                                            && c.PrizeExercisePlan.Id == memberPlanWeek.ExercisePlanId
                                            select c).FirstOrDefault();

            LoadWeeklyInfo(memberId, dbWeek);

            //var log = new MemberVisitLogs();
            //log.UmbracoId = uMember.Id;
            //log.Page = HttpContext.Current.Request.Url.AbsolutePath;
            //log.CreatedOn = DateTime.Now;
            //log.MembersReference.EntityKey = new EntityKey("SydneyCatalystMemberEntities.Members", "Id", member.Id);
            //db.AddToMemberVisitLogs(log);
            //db.SaveChanges();

            db.Database.Connection.Close();
        }
    }

    protected void btnUpdateProgress_Click(object sender, EventArgs e)
    {
        using (DIYPTEntities db = new DIYPTEntities())
        {
            decimal weight = 0;
            if (txtWeight.Text != "" && decimal.TryParse(txtWeight.Text, out weight))
            {
                //var 
            }
        }
    }

    protected void LoadWeeklyInfo(int iMemberId, PrizeExercisePlanWeek dbWeek)
    {
        lblExercise.Text = dbWeek.Description;
        lblWeek.Text = dbWeek.Week.ToString();

        foreach (var lbl in labels)
            lbl.Text = PrizeConstants.STR_NO_TRAINNING;

        DbDataReader reader = dbAccess.GetMemberWeeklyInfo(dbWeek.Id);

        int DayTimeTypeId1 = 0;
        int DayTimeTypeId2 = 0;
        while (reader.Read())
        {
            int iWeek = reader.GetInt32(0);
            int iDayTimeType = (int)reader.GetInt32(3);
            if (DayTimeTypeId1 == 0)
            {
                lblExerciseName1.Text = reader.GetString(2);
                Image1.ImageUrl = reader.GetString(5);
                DayTimeTypeId1 = iDayTimeType;
            }
            if (DayTimeTypeId2 == 0 && DayTimeTypeId1 != iDayTimeType)
            {
                lblExerciseName2.Text = reader.GetString(2);
                Image2.ImageUrl = reader.GetString(5);
                DayTimeTypeId2 = iDayTimeType;
            }

            if (iWeek < labels.Count)
            {
                if (iDayTimeType == DayTimeTypeId2)
                    iWeek += 7;
                labels[iWeek].Text = reader.GetString(1);
            }
            exerciseUnitSets.Add((int)reader.GetInt32(4));
        }

        HtmlTableCell temp = (HtmlTableCell)FindControl("day" + (int)(DateTime.Now.DayOfWeek));
        HtmlTableCell tempe = (HtmlTableCell)FindControl("day" + (int)(DateTime.Now.DayOfWeek) + "e");
        HtmlTableCell tempee = (HtmlTableCell)FindControl("day" + (int)(DateTime.Now.DayOfWeek) + "ee");
        if (temp != null)
        {
            temp.Attributes.Add("style", "background-color: #eee");
            tempe.Attributes.Add("style", "background-color: #eee");
            tempee.Attributes.Add("style", "background-color: #eee");
        }
    }

    protected void LoadDailyInfo(int iMemberId, int iWeek, DIYPTEntities db)
    {
        foreach (int iUnitSetId in exerciseUnitSets)
        {
            DbCommand cmd = db.Database.Connection.CreateCommand();
            cmd.CommandText = "SELECT a.ExerciseDay,  d.UnitName, c.DayTimeTypeName, b.Exercise, b.Reps, " +
                " b.Rest, b.Weight, b.Tempo, b.Trainning_Set FROM " +
                " PrizeExerciseUnitForDays a, PrizeExerciseUnits b," +
                " PrizeExerciseDayTimeTypes c, PrizeExerciseUnitNames d " +
                " WHERE a.PrizeExercisePlanWeekId = " + iWeek + " AND b.Id = "+ iUnitSetId +
                " AND a.PrizeExerciseUnitId = b.Id " +
                " AND a.DayTimeTypeId = c.Id AND b.UnitNameId = d.Id" +
                " GROUP BY a.ExerciseDay ORDER BY a.ExerciseDay, a.sequence";
            DbDataReader reader = cmd.ExecuteReader();

            TableRow row = new TableRow();

            GridView gvExerciseUnit = new GridView();

            for (int i = 0; i < 7; i++)
            /*gvExerciseUnit.Columns.Add();

            gvDayTrainning.DataSource = reader;
            gvDayTrainning.DataBind();
            gvDayTrainning.Visible = true;*/

            HolderTable.Rows.Add(row);
        }
    }

    protected void CreateProgressGraph(int memberId, DIYPTEntities db)
    {
        var member = db.PrizeMembers.FirstOrDefault(m => m.UmbracoId == memberId);
        if (member != null)
        {
            string csName = "PopupScript";
            Type csType = this.GetType();
            ClientScriptManager csm = Page.ClientScript;

            if (!csm.IsStartupScriptRegistered(csType, csName))
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<script type='text/javascript'>            " + Environment.NewLine);

                sb.Append("google.setOnLoadCallback(drawChart);" + Environment.NewLine);

                sb.Append("function drawChart() {" + Environment.NewLine);
                sb.Append("var data = google.visualization.arrayToDataTable([" + Environment.NewLine);
                sb.Append("['WEEK', 'WEIGHT']," + Environment.NewLine);
                /* Chart Values here */
                sb.Append("[0, 65]," + Environment.NewLine);
                sb.Append("[3, 60]," + Environment.NewLine);
                sb.Append("[6, 59]," + Environment.NewLine);
                sb.Append("[9, 55]" + Environment.NewLine);
                sb.Append("]);" + Environment.NewLine);

                sb.Append("var options = {" + Environment.NewLine);
                sb.Append("title: 'Progress'," + Environment.NewLine);
                sb.Append("curveType: 'function'," + Environment.NewLine);
                sb.Append("hAxis:" + Environment.NewLine);
                sb.Append("{" + Environment.NewLine);
                sb.Append("title: 'Weeks'," + Environment.NewLine);
                sb.Append("viewWindow:" + Environment.NewLine);
                sb.Append("{" + Environment.NewLine);
                sb.Append("min: 0," + Environment.NewLine);
                sb.Append("max:" + Environment.NewLine);
                sb.Append("12" + Environment.NewLine);
                sb.Append("}," + Environment.NewLine);
                sb.Append("ticks: [0, 3, 6, 9, 12] // display labels every 25" + Environment.NewLine);
                sb.Append("}," + Environment.NewLine);
                sb.Append("vAxis:" + Environment.NewLine);
                sb.Append("{" + Environment.NewLine);
                sb.Append("minValue: 0," + Environment.NewLine);
                sb.Append("title: 'Weight (kg)'," + Environment.NewLine);
                sb.Append("viewWindow:" + Environment.NewLine);
                sb.Append("{" + Environment.NewLine);
                sb.Append("min:" + Environment.NewLine);
                sb.Append("0" + Environment.NewLine);
                sb.Append("}" + Environment.NewLine);

                sb.Append("}," + Environment.NewLine);
                sb.Append("legend: { position: 'out' }" + Environment.NewLine);
                sb.Append("};" + Environment.NewLine);

                sb.Append("var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));" + Environment.NewLine);

                sb.Append("chart.draw(data, options);" + Environment.NewLine);
                sb.Append("}" + Environment.NewLine);
                sb.Append("</script>" + Environment.NewLine);

                csm.RegisterStartupScript(csType, csName, sb.ToString());
            }
        }
    }
}
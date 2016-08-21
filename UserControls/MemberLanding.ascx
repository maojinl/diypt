<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MemberLanding.ascx.cs" Inherits="UserControls_MemberLanding" %>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/jscript"></script>

<script>
    function displayQuestion(question) {
        var q1 = document.getElementById('<%= q1.ClientID %>');
        var q2 = document.getElementById('<%= q2.ClientID %>');
        var q3 = document.getElementById('<%= q3.ClientID %>');
        var q4 = document.getElementById('<%= q4.ClientID %>');
        var q5 = document.getElementById('<%= q5.ClientID %>');
        var q6 = document.getElementById('<%= q6.ClientID %>');
        var q7 = document.getElementById('<%= q7.ClientID %>');

        q1.className = "hidden";
        q2.className = "hidden";
        q3.className = "hidden";
        q4.className = "hidden";
        q5.className = "hidden";
        q6.className = "hidden";
        q7.className = "hidden";

        switch (question) {
            case 1:
                q1.className = "shown";
                break;
            case 2:
                q2.className = "shown";
                break;
            case 3:
                q3.className = "shown";
                break;
            case 4:
                q4.className = "shown";
                break;
            case 5:
                q5.className = "shown";
                break;
            case 6:
                q6.className = "shown";
                break;
            case 7:
                q7.className = "shown";
                break;
        }
    }
</script>
         <script type="text/javascript" src="https://www.google.com/jsapi?autoload={
        'modules':[{
          'name':'visualization',
          'version':'1',
          'packages':['corechart']
        }]
      }"></script>

<script type="text/javascript">
//    google.setOnLoadCallback(drawChart);

//    function drawChart() {
//        var data = google.visualization.arrayToDataTable([
//['WEEK', 'WEIGHT'],
//[0, 65],
//[3, 60],
//[6, 59],
//[9, 55]
//        ]);

//        var options = {
//            title: 'Progress',
//            curveType: 'function',
//            hAxis: {
//                title: "Weeks",
//                viewWindow: {
//                    min: 0,
//                    max: 12
//                },
//                ticks: [0, 3, 6, 9, 12] // display labels every 25
//            },
//            vAxis: {
//                minValue: 0,
//                title: "Weight (kg)",
//                viewWindow: {
//                    min: 0
//                }
//            },
//            legend: { position: 'out' }
//        };

//        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

//        chart.draw(data, options);
//    }
</script>
<style type="text/css">
    .auto-style1 {
        width: 280px;
    }
    .auto-style2 {
        width: 249px;
    }
</style>
<br />
<br />
<br />
<div class="container">
    <h2>
        My Training diary</h2>
    <ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#home">PROGRESS STATS</a></li>
        <li><a data-toggle="tab" href="#menu1">EXERCISE PLAN</a></li>
        <li><a data-toggle="tab" href="#menu2">Daily Tasks</a></li>
        <li><a data-toggle="tab" href="#menu3">MEAL PLAN</a></li>
        <li><a data-toggle="tab" href="#menu4">NO PLAN</a></li>
        <li><a data-toggle="tab" href="#menu5">FINISHED PLAN</a></li>
    </ul>
    <div class="tab-content">
        <div id="home" class="tab-pane fade in active">
            <table border="0" width="100%">
                <tr>
                    <td>
                        <h3>
                            Current Weight</h3>
                    </td>
                    <td>
                        <h3>
                            Weight gain/loss</h3>
                    </td>
                    <td>
                        <h3>
                            Waist measurement</h3>
                    </td>
                </tr>
            </table>

            <script type="text/javascript" src="https://www.google.com/jsapi?autoload={
        'modules':[{
          'name':'visualization',
          'version':'1',
          'packages':['corechart']
        }]
      }"></script>

            <script type="text/javascript">
            </script>

            <div id="curve_chart" style="width: 900px; height: 500px">
            </div>
            <p>
                <asp:Button ID="Button14" class="add-new-button" runat="server" Text="Update Progress" />
                <div class="popup-bg">
                </div>
                <div class="popup-content">
                    <div class="popup-window" runat="server" id="PopUp">
                        <a href="#" class="close">X</a>
                        <h3>
                            Update progress</h3>
                        Weight
                        <asp:TextBox ID="txtWeight" runat="server"></asp:TextBox>
                        <br />
                        Waist
                        <asp:TextBox ID="txtWaist" runat="server"></asp:TextBox>
                        <br />
                        <asp:Button ID="btnUpdateProgress" runat="server" Text="Update" 
                            onclick="btnUpdateProgress_Click" />
                    </div>
                </div>
            </p>
        </div>
        <div id="menu1" class="tab-pane fade">
            <table width="800px">
                <tr>
                    <td class="exercise" id="wk" runat="server">
                        Week</td>
                    <td class="exercise" id="wkdetail" runat="server">
                       <asp:Label ID="lblWeek" runat="server"></asp:Label>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="exercise" id="ex" runat="server">
                        <br />
                        Exercise</td>
                    <td class="exercise" id="exDetail" runat="server">
                        <asp:Label ID="lblExercise" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <h3>
                Weekly Overview</h3>
            <table width="800px">
                <tr>
                    <td class="auto-style2" id="ex0" runat="server">
                        <br />
                        Exercise</td>
                    <td class="auto-style1" id="exDetail1" runat="server">
                        <asp:Label ID="lblExerciseName1" runat="server"></asp:Label>
                        <br />
                        <asp:Image ID="Image1" runat="server" />
                    </td>
                    <td class="exercise" id="exDetail2" runat="server">
                       <asp:Label ID="lblExerciseName2" runat="server"></asp:Label>
                        <br />
                        <asp:Image ID="Image2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" id="day1" runat="server">
                        Monday
                    </td>
                    <td class="auto-style1" id="day1e" runat="server">
                        <asp:Label ID="lblExMon1" runat="server"></asp:Label>
                    </td>
                    <td class="exercise" id="day1ee" runat="server">
                         <asp:Label ID="lblExMon2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" id="day2" runat="server">
                        Tuesday
                    </td>
                    <td class="auto-style1" id="day2e" runat="server">
                        <asp:Label ID="lblExTue1" runat="server"></asp:Label>
                    </td>
                    <td class="exercise" id="day2ee" runat="server">
                         <asp:Label ID="lblExTue2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" id="day3" runat="server">
                        Wednesday
                    </td>
                    <td class="auto-style1" id="day3e" runat="server">
                        <asp:Label ID="lblExWed1" runat="server"></asp:Label>
                    </td>
                    <td class="exercise" id="day3ee" runat="server">
                         <asp:Label ID="lblExWed2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" id="day4" runat="server">
                        Thursday
                    </td>
                    <td class="auto-style1" id="day4e" runat="server">
                        <asp:Label ID="lblExThu1" runat="server"></asp:Label>
                    </td>
                    <td class="exercise" id="day4ee" runat="server">
                         <asp:Label ID="lblExThu2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" id="day5" runat="server">
                        Friday
                    </td>
                    <td class="auto-style1" id="day5e" runat="server">
                        <asp:Label ID="lblExFri1" runat="server"></asp:Label>
                    </td>
                    <td class="exercise" id="day5ee" runat="server">
                         <asp:Label ID="lblExFri2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" id="day6" runat="server">
                        Saturday
                    </td>
                    <td class="auto-style1" id="day6e" runat="server">
                        <asp:Label ID="lblExSat1" runat="server"></asp:Label>
                    </td>
                    <td class="exercise" id="day6ee" runat="server">
                         <asp:Label ID="lblExSat2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" id="day0" runat="server">
                        Sunday
                    </td>
                    <td class="auto-style1" id="day0e" runat="server">
                        <asp:Label ID="lblExSun1" runat="server"></asp:Label>
                    </td>
                    <td class="exercise" id="day0ee" runat="server">
                         <asp:Label ID="lblExSun2" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>

            <asp:Table ID="HolderTable"  runat="server"></asp:Table>
            <br />
        </div>
        <div id="menu2" class="tab-pane fade">
            <table style="font-size: 9pt;" cellpadding=0 cellspacing=0>
                <tr>
                    <td align="left" style="width :560px; height :22px; vertical-align: top; text-align: left;" background ="">
                        </td>
                </tr>
                <tr>
                    <td style ="width :560px; " background ="" align="left">
                        <asp:DataList ID="DailyTasksList" runat="server" DataKeyField ="DailyTask" RepeatColumns="4" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <table align="left" cellpadding=0 cellspacing=0 style =" width :135px; height:158px;" >
                                    <tr align =center style =" width :135px; height:65px;font-size: 9pt; font-family: 宋体;">
                                        <td colspan="2"> <asp:Image ID="imageUnit" runat="server"  ImageUrl =<%#DataBinder.Eval(Container.DataItem,"GoodsUrl")%>/>
                                        </td>
                                    </tr>
                                    <tr align =center valign =bottom  style =" width :135px; height:11px;font-size: 9pt; font-family: 宋体;">
                                        <td colspan="2" align="center">
                                        <%%>
                                        </td>
                                    </tr>
                                    <tr align =center valign =bottom  style =" width :135px; height:11px;font-size: 9pt; font-family: 宋体;">
                                        <td align="center">
                                            reps</td>
                                        <td align="left">
                                            <%%></td>
                                    </tr>
                                    <tr align =center valign =bottom  style =" width :135px; height:11px;font-size: 9pt; font-family: 宋体;">
                                        <td align="center">
                                            task</td>
                                        <td align="left">
                                            <%%></td>
                                    </tr>
                                    <tr align =center valign =bottom  style =" width :135px; height:11px;font-size: 9pt; font-family: 宋体;">
                                        <td colspan="2" align =center >
                                   
                                            <asp:LinkButton ID="lnkbtnClass" runat="server" CommandName="detailSee" >详细</asp:LinkButton>
                                             <asp:LinkButton ID="lnkbtnBuy" runat="server" CommandName="buyGoods"  CommandArgument='<%#DataBinder.Eval(Container.DataItem,"GoodsWeight")+"|"+DataBinder.Eval(Container.DataItem,"MemberPrice") %>'>购买</asp:LinkButton>
                                          </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList></td>
                </tr>
            </table>
        </div>
        <div id="menu3" class="tab-pane fade">
            <h3>
                Meal plan</h3>
            <p>
                <img src="./Food.png" /></p>
        </div>

        <div id="menu4" class="tab-pane fade">
            <!-- 
If not in plan
-->
            Pick a plan
            <!-- 
Never done one = Questions
-->
        
                        <div id="q1" runat="server">
                            Have you done Y1?
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Button ID="btnQ1" runat="server" Text="Next" OnClientClick="displayQuestion(2); return false;" />
                        </div>
                        <div id="q2" runat="server" class="hidden">
                            Have you done Y2?
                            <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Button ID="btnQ2Back" runat="server" Text="Back" OnClientClick="displayQuestion(1); return false;" /><asp:Button
                                ID="Button1" runat="server" Text="Next" OnClientClick="displayQuestion(3); return false;" />
                        </div>
                        <div id="q3" runat="server" class="hidden">
                            Have you done Y3?
                            <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Button ID="Button2" runat="server" Text="Back" OnClientClick="displayQuestion(2); return false;" /><asp:Button
                                ID="Button3" runat="server" Text="Next" OnClientClick="displayQuestion(4); return false;" />
                        </div>
                        <div id="q4" runat="server" class="hidden">
                            Have you done Y4?
                            <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Button ID="Button4" runat="server" Text="Back" OnClientClick="displayQuestion(3); return false;" /><asp:Button
                                ID="Button5" runat="server" Text="Next" OnClientClick="displayQuestion(5); return false;" />
                        </div>
                        <div id="q5" runat="server" class="hidden">
                            Have you done Y5?
                            <asp:RadioButtonList ID="RadioButtonList5" runat="server">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Button ID="Button6" runat="server" Text="Back" OnClientClick="displayQuestion(4); return false;" /><asp:Button
                                ID="Button7" runat="server" Text="Next" OnClientClick="displayQuestion(6); return false;" />
                        </div>
                        <div id="q6" runat="server" class="hidden">
                            Have you done Y6?
                            <asp:RadioButtonList ID="RadioButtonList6" runat="server">
                                <asp:ListItem>Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:Button ID="Button8" runat="server" Text="Back" OnClientClick="displayQuestion(5); return false;" /><asp:Button
                                ID="Button9" runat="server" Text="Next" OnClientClick="displayQuestion(7); return false;" />
                        </div>
                        <div id="q7" runat="server" class="hidden">
                            <br />
                            <br />
                            <br />
                            We suggest you start with this plan:
                            <asp:Button ID="Button10" runat="server" Text="Back" OnClientClick="displayQuestion(6); return false;" /><asp:Button
                                ID="Button11" runat="server" Text="Start plan" />
                        </div>

        </div>
        <div id="menu5" class="tab-pane fade">
            <h3>
                Your next plan lined up is:</h3>
            <asp:Button ID="Button12" runat="server" Text="Start plan" />
        </div>
    </div>
    <!-- 
Done a plan before, select next plan
-->
    <p>
        <!-- 
If in plan
-->
        <br />
    </p>

    <script type="text/javascript">

        $(function() {
            $(".add-new-button").click(function(e) {
                e.preventDefault();
                $(".popup-bg").show();
                $(".popup-content").show();
            });
            $(".popup-bg").click(function() {
                $(".popup-bg").hide();
                $(".popup-content").hide();
            });
            $(".close").click(function(e) {
                e.preventDefault();
                $(".popup-bg").hide();
                $(".popup-content").hide();
            })
        });
    </script>

</div>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Project.Dashboard" MasterPageFile="~/SidePanel.Master" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Dashboard.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
</asp:Content>
    <asp:Content ID="c88" ContentPlaceHolderID="MainContent" runat="server">
        <div class="topbar">
            <h1>Dash Board</h1>
        </div> 
        <div class="info-cards">
            <div class="card">
            <div class="card-inner">
              <p class="text-main" style="color:dimgray;">Current Semester</p>
              <span class="material-icons-outlined">school</span>
            </div>
                
            <span class="text-main font-weight-bold">
                <asp:Label ID="currentSemesterLable" runat="server">
                 </asp:Label>
            </span>
          </div>
            <div class="card">
                <div class="card-inner">
                    <p class="text-main" style="color:dimgray";>Pending Requests</p>
                    <span class="material-icons-outlined">pending_actions</span>
                  </div>
                      <span class="text-main font-weight-bold">
                          <asp:Label ID="pendingRequestsLable" runat="server">
                            </asp:Label>
                      </span>
            </div>
        </div>


       
        <div class="graphs">
            <div class="graph-card">
                <p class="graph-title">Number of Registered Users</p>
                <div id="bar-chart-1"></div>
            </div>
            <div class="graph-card">
                <p class="graph-title">Requests</p>
                <div id="pie-chart-1"></div>
            </div>
        </div>

     <!--   
    <div class="grid-container">
        <main class="main-container">

        <div class="main-cards">

          <div class="card">
            <div class="card-inner">
              <p class="text-primary">PRODUCTS</p>
              <span class="material-icons-outlined text-blue">inventory_2</span>
            </div>
            <span class="text-primary font-weight-bold">249</span>
          </div>

          <div class="card">
            <div class="card-inner">
              <p class="text-primary">PURCHASE ORDERS</p>
              <span class="material-icons-outlined text-orange">add_shopping_cart</span>
            </div>
            <span class="text-primary font-weight-bold">83</span>
          </div>

          <div class="card">
            <div class="card-inner">
              <p class="text-primary">SALES ORDERS</p>
              <span class="material-icons-outlined text-green">shopping_cart</span>
            </div>
            <span class="text-primary font-weight-bold">79</span>
          </div>

          <div class="card">
            <div class="card-inner">
              <p class="text-primary">INVENTORY ALERTS</p>
              <span class="material-icons-outlined text-red">notification_important</span>
            </div>
            <span class="text-primary font-weight-bold">56</span>
          </div>

        </div>
        </main>

    </div>
        -->


    <!--Scripts-->
        
    <!--apex charts-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.45.0/apexcharts.min.js"></script>

    <script>
        var advisor_count = '<%=advisorCount()%>';
        var student_count = '<%=studentCount()%>';
        var barChartOptions = {
            series: [{
                //data: [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
                //should get reeal data from server
                data: [student_count, advisor_count]
            }],
            chart: {
                type: 'bar',
                height: 350,
                toolbar: { show: false },
            },
            colors: [
                "#246ddd",
                "#cc3d48",

            ],
            plotOptions: {
                bar: {
                    distributed: true,
                    borderRadius: 4,
                    horizontal: false,
                    columnWidth: '40%',
                }
            },
            dataLabels: {
                enabled: false
            },
            legend: {
                show: false,
            },
            xaxis: {
                categories: ['Students', 'Advisors'],
            },
            yaxis: {
                title: {
                    text: "Count",
                }
            },
            tooltip: {

                y: {
                    formatter: function (value) {
                        return value.toString(); // Assuming value is a number
                    }
                }
            }
        };

        var barChart1 = new ApexCharts(document.querySelector("#bar-chart-1"), barChartOptions);
        barChart1.render();
    </script>
    <script>
        var credit_count = <%=creditCount()%>;
        var course_count = <%=courseCount()%>;
        var barChartOptions1 = {
            series: [{
                //data: [400, 430, 448, 470, 540, 580, 690, 1100, 1200, 1380]
                //should get reeal data from server
                data: [credit_count, course_count]
            }],
            chart: {
                type: 'bar',
                height: 350,
                toolbar: { show: false },
            },
            colors: [
                "#846ddd",
                "#6c3d48",

            ],
            plotOptions: {
                bar: {
                    distributed: true,
                    borderRadius: 4,
                    horizontal: false,
                    columnWidth: '40%',
                }
            },
            dataLabels: {
                enabled: false
            },
            legend: {
                show: false,
            },
            xaxis: {
                categories: ['Credit Hours', 'Courses'],
            },
            yaxis: {
                title: {
                    text: "Count",
                }
            },
            tooltip: {
               
                y: {
                    formatter: function (value) {
                        return value.toString(); // Assuming value is a number
                    }
                }
            }
        };

        var pieChart1 = new ApexCharts(document.querySelector("#pie-chart-1"), barChartOptions1);
        pieChart1.render();
        localStorage.setItem('studentstatus', 'true');
        localStorage.setItem('advisorstatus', 'true');
    </script>
    </asp:Content>

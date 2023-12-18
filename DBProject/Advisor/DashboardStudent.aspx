<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashboardStudent.aspx.cs" Inherits="Project.DashboardStudent" MasterPageFile="~/Advisor/AdvSidePanel.Master" %>

<asp:Content ID="c1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Dashboard.css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
</asp:Content>
    <asp:Content ID="c88" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class-"content1">
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
                    <p class="text-main" style="color:dimgray";>Number of Students Associated</p>
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
        localStorage.setItem('advisorstatus', 'true');
    </script>
    </div>
    </asp:Content>

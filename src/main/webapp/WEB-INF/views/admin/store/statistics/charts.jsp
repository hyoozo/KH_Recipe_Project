<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="/resources/include/dist/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <div id="layoutSidenav_content">
         <div class="container-fluid px-4">
             <h1 class="mt-4">통계</h1>
             <div class="card mb-4">
                 <div class="card-body">
                     Chart.js is a third party plugin that is used to generate the charts in this template. The charts below have been customized - for further customization options, please visit the official
                     <a target="_blank" href="https://www.chartjs.org/docs/latest/">Chart.js documentation</a>
                     .
                 </div>
             </div>
             <div class="row">
                 <div class="col-lg-6">
                     <div class="card mb-4">
                         <div class="card-header">
                             <i class="fas fa-chart-bar me-1"></i>
                             Bar Chart Example
                         </div>
                         <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                         <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                     </div>
                 </div>
                 <div class="col-lg-6">
                     <div class="card mb-4">
                         <div class="card-header">
                             <i class="fas fa-chart-pie me-1"></i>
                             Pie Chart Example
                         </div>
                         <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                         <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                     </div>
                 </div>
             </div>
         </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/include/dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/include/dist/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/include/dist/assets/demo/chart-bar-demo.js"></script>
        <script src="/resources/include/dist/assets/demo/chart-pie-demo.js"></script>
    </body>
</html>

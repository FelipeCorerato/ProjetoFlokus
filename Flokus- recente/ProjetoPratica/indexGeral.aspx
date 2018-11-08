<%@ Page Title="" Language="C#" MasterPageFile="~/Cabecalho.Master" AutoEventWireup="true" CodeBehind="indexGeral.aspx.cs" Inherits="ProjetoPratica.indexGeral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="estilo.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="Content/jquery-3.3.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active" style="background-image: url(img/3.jpg); background-size: cover; width:100%; height:100%;">
      <img src="img/3.jpg" alt="">
    </div>

    <div class="item" style="background-image: url(img/4.jpg); background-size: cover; width:100%; height:100%;">
      <img src="img/4.jpg" alt="">
    </div>

    <div class="item" style="background-image: url(img/5.jpg); background-size: cover; width:100%; height:100%;">
      <img src="img/5.jpg" alt="">
    </div>

     <div class="item" style="background-image: url(img/6.jpg); background-size: cover; width:100%; height:100%;">
      <img src="img/6.jpg" alt="">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</asp:Content>

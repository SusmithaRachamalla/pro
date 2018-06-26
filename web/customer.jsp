<%-- 
    Document   : index
    Created on : Jul 30, 2017, 10:26:44 AM
    Author     : Admin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<title>Mining Competitors from Large Unstructured Datasets</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="../favicon.ico"> 
       
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
<link rel="stylesheet" href="w3.css">
<link rel="stylesheet" href="css.css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<style>
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
    width: auto;
    padding: 10px 18px;
    background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position:fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 10;
    right: 10;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
     justify-content: center;
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 40%; /* Could be more or less, depending on screen size */
}
.modal1 {
    display: none; /* Hidden by default */
    position:fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 10;
    right: 10;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
     justify-content: center;
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal1-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 40%; /* Could be more or less, depending on screen size */
}

.modal2 {
    display: none; /* Hidden by default */
    position:fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 10;
    right: 10;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
     justify-content: center;
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    padding-top: 60px;
}

/* Modal Content/Box */
.modal2-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
    border: 1px solid #888;
    width: 40%; /* Could be more or less, depending on screen size */
}
/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}
    
@keyframes animatezoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
}
</style>
<body class="w3-light-grey">

<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i>  Menu</button>
  <span class="w3-bar-item w3-center" align="center"> Mining Competitors from Large Unstructured Datasets</span>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
    </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong>Customer</strong></span><br>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
      <a href="#" class="w3-bar-item w3-button"><i class="fa fa-cog"></i></a>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="#"  class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-user fa fw"></i>  Overview</a>
    <a href="#" onclick="document.getElementById('id02').style.display='block'" class="w3-bar-item w3-button w3-padding"><i class="fa fa-home"></i>  Hotels</a>
    <a href="#" onclick="document.getElementById('id01').style.display='block'" class="w3-bar-item w3-button w3-padding"><i class="fa fa-video-camera "></i>  Camaras</a>
    <a href="#" onclick="document.getElementById('id03').style.display='block'" class="w3-bar-item w3-button w3-padding"><i class="fa fa-home"></i>  Restaurants</a>
    <a href="#" onclick="document.getElementById('id04').style.display='block'" class="w3-bar-item w3-button w3-padding"><i class="fa fa-coffee "></i>  Recipes</a>
   
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell "></i>  Logout</a>
   
  </div>
</nav>

<%
    int id=0;
    int rid=0;
    int res=0;
    int ca=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mining", "root", "root");
Statement st = conn.createStatement();
ResultSet rs=st.executeQuery("SELECT id FROM hotel");

if(rs.last()){
id=rs.getInt("id");
}

rs.close();

ResultSet rs1=st.executeQuery("SELECT id FROM recipes");

if(rs1.last()){
rid=rs1.getInt("id");
}

rs1.close();

ResultSet rs2=st.executeQuery("SELECT id FROM restaurant");

if(rs2.last()){
res=rs2.getInt("id");
}

rs2.close();
ResultSet rs3=st.executeQuery("SELECT Id FROM camara");

if(rs3.last()){
ca=rs3.getInt("Id");
}

rs3.close();


%>





<%
}
catch(Exception e){}
%>
<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>
  </header>

  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-red w3-padding-16">
        <div class="w3-left"><i class="fa fa-home w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><%=id%></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Hotels</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left"><i class="fa fa-video-camera w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><%=ca%></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Camara</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16">
        <div class="w3-left"><i class="fa fa-coffee w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><%=res%></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Restaurants</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-home w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><%=rid%></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Recipes</h4>
      </div>
    </div>
  </div>

  <div class="w3-panel">
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third">
        <h5>Recipes</h5>
        <img src="region.jpg" style="width:100%" alt="Google Regional Map">
      </div>
      <div class="w3-twothird">
        <h5>Feature</h5>
        <table class="w3-table w3-striped w3-white">
          <tr>
            <td><i class="fa fa-home w3-text-blue w3-large"></i></td>
            <td>Hotel</td>
            <td><i>06 Feature </i></td>
          </tr>
          <tr>
            <td><i class="fa fa-video-camera w3-text-red w3-large"></i></td>
            <td>Camara</td>
            <td><i>04 Feature</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-home w3-text-yellow w3-large"></i></td>
            <td>Restaurants</td>
            <td><i>12 Feature</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-coffee w3-text-red w3-large"></i></td>
            <td>Recipes</td>
            <td><i>07 Feature</i></td>
          </tr>
          <tr>
            <td><i class="fa fa-laptop w3-text-red w3-large"></i></td>
            <td>Processing Computation Time</td>
            <td><i>0.12 seconds</i></td>
          </tr>
     
        </table>
      </div>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>General</h5>
    <p align="justify">      In any competitive business, success is based on the ability to make an item more appealing to customers than the competition. In context of this task a number of questions arises : how do we formalize and quantify the competitiveness between two items? Who are the main competitors of a given item? What are the features of an item that most affect its competitiveness? Despite the impact and relevance of this problem to many domains, only a limited amount of work has been devoted to address this problem. This paper present a formal definition of the competitiveness between two items, based on the market segments that they can both cover. Our evaluation of competitiveness utilizes customer reviews, an abundant source of information that is available in a wide range of domains. We present efficient methods for evaluating competitiveness in large review datasets and address the natural problem of finding the top-k competitors of a given item. Finally, we evaluate the quality of our results and the scalability of our approach using multiple datasets from different domain.
</p>
    
  <!-- Footer -->


  <!-- End page content -->
</div>
  <div id="id02" class="modal2">
      
       <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="hotel1" method="post" > 
                                <h1>Hotel</h1> <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
     
                              <input type="text" id="case" name="myText" value="<%= getServletContext().getRealPath("/") %> " style="display:none">

                                <p> 
                                    <label for="name" class="uname" data-icon="u" > Query user Name </label>
                                    <input id="hotelname" name="name" required="required" type="text"                                     <input id="hotelname" name="name" required="required" type="text" placeholder="Customer name"/>
                                </p>
                              
                                <p> 
                                    Features
                                    </br>
                                </br>
                                <input type="checkbox" name="feauture[]" value="Bar"> Bar  &nbsp;&nbsp;
  <input type="checkbox" name="feauture[]" value="Breakfast" > Breakfast &nbsp;&nbsp;
   <input type="checkbox" name="feauture[]" value="Gym"> Gym &nbsp;&nbsp;
  <input type="checkbox" name="feauture[]" value="Parking" > Parking &nbsp;&nbsp;
  <input type="checkbox" name="feauture[]" value="Pool"> Pool </br>
  <input type="checkbox" name="feauture[]" value="Wi-Fi" > Wi-Fi &nbsp;&nbsp;
  
                                
                                
                                
                                
                                </p>
                                 
                                </br>
                                </br>
                              
                                <p class="login button"> 
                                    <input type="submit" value="Submit" /> 
                                     <input type="Reset" value="Cancel" />
								</p>
                               
                            </form>
                        </div>

                       
						
                    </div>
                </div>  
            </section>
        </div>
      

  


<div id="id04" class="modal">
  
      <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="recipes1" method="post" > 
                                <h1>Recipes Requirement</h1>  <span onclick="document.getElementById('id04').style.display='none'" class="close" title="Close Modal">&times;</span>
      <input type="text" id="case" name="myText" value="<%= getServletContext().getRealPath("/") %> " style="display:none">

                                <p> 
                                    <label for="name" class="uname" data-icon="u" > Query user Name </label>
                                    <input id="hotelname" name="name" required="required" type="text"                                     <input id="hotelname" name="name" required="required" type="text" placeholder="Customer name"/>
                                </p>
                                <p> 
                                    <label for="type" class="uname" > Recipes Type</label>
                                     <input id="recipesname" name="rtype" list="browsers" >
                        
                                     <datalist id="browsers" >
  <option value="Poultry">Poultry</option>
  <option value="Snacks">Snacks</option>
  <option value="Beef/Pork">Beef/Pork</option>
  <option value="Dessert">Dessert</option>
  
    <option value="Fish">Fish</option>
  <option value="Sides">Sides</option>
  <option value="Vegetarian">Vegetarian</option>
  <option value="Appetizers/Soups">Appetizers/Soups</option>
                                     </datalist>
                                                                           </p>
                               
                              
                                <p> 
                                    Features
                                    </br>
                                </br>
                                Nutritional
                                <table>
                                    <tr>
                                        <td>
                                       Calories:
                                      
                                       </br>
                                           <input id="recipesname" name="cal" list="browsers2" >
                                            <datalist id="browsers2" >
                                                   <option value=""  selected>Any</option>
                            <option value="50" >Under 50</option>
                            <option value="100" >Under 100</option>
                            <option value="150" >Under 150</option>
                            <option value="200" >Under 200</option>
                            <option value="250" >Under 250</option>
                            <option value="300" >Under 300</option>
                            <option value="350" >Under 350</option>
                            <option value="400" >Under 400</option>
                            <option value="450" >Under 450</option>
                            <option value="500" >Under 500</option>
                            <option value="550" >Under 550</option>
                            <option value="600" >Under 600</option>
                            <option value="650" >Under 650</option>
                            <option value="700" >Under 700</option>
                            <option value="750" >Under 750</option>
                                            </datalist>
                                        </td>
                                        <td>
                                            Fat:
                                            </br>
                                            <input id="recipesname" name="fat" list="browsers1" >
                                            <datalist id="browsers1" >
                                               <option value=""  selected>Any</option>
                            <option value="5" >Under 5 g</option>
                            <option value="10" >Under 10 g</option>
                            <option value="15" >Under 15 g</option>
                            <option value="20" >Under 20 g</option>
                            <option value="25" >Under 25 g</option>
                            <option value="30" >Under 30 g</option>
                            <option value="35" >Under 35 g</option>
                            <option value="40" >Under 40 g</option>
                            <option value="45" >Under 45 g</option>
                            <option value="50" >Under 50 g</option>
                            <option value="55" >Under 55 g</option>
                            <option value="60" >Under 60 g</option>
                            <option value="65" >Under 65 g</option>
                            <option value="70" >Under 70 g</option>
                            <option value="75" >Under 75 g</option> 
                                            </datalist>
                                        </td>
                                    </tr>
                                    
                                    
                                    <tr>
                                        <td>
                                       Carbs:
                                      
                                       </br>
                                           <input id="recipesname" name="Carbs" list="browsers3" >
                                            <datalist id="browsers3" >
                                                     <option value=""  selected>Any</option>
                            <option value="50" >Under 50 g</option>
                            <option value="100" >Under 100 g</option>
                            <option value="150" >Under 150 g</option>
                            <option value="200" >Under 200 g</option>
                            <option value="250" >Under 250 g</option>
                            <option value="300" >Under 300 g</option>
                            <option value="350" >Under 350 g</option>
                            <option value="400" >Under 400 g</option>
                            <option value="450" >Under 450 g</option>
                            <option value="500" >Under 500 g</option>
                            <option value="550" >Under 550 g</option>
                            <option value="600" >Under 600 g</option>
                            <option value="650" >Under 650 g</option>
                            <option value="700" >Under 700 g</option>
                            <option value="750" >Under 750 g</option>
                                            </datalist>
                                        </td>
                                        <td>
                                            Fiber:
                                            </br>
                                            <input id="recipesname" name="Fiber" list="browsers4" >
                                            <datalist id="browsers4" >
                                               <option value=""  selected>Any</option>
                            <option value="10" >Over 10 g</option>
                            <option value="20" >Over 20 g</option>
                            <option value="30" >Over 30 g</option>
                            <option value="40" >Over 40 g</option>
                            <option value="50" >Over 50 g</option>
                                            </datalist>
                                        </td>
                                    </tr>
                                    
                                    
                                       <tr>
                                        <td>
                                       Protein:
                                      
                                       </br>
                                           <input id="recipesname" name="Protein" list="browsers5" >
                                            <datalist id="browsers5" >
                                                   <option value=""  selected>Any</option>
                            <option value="10" >Over 10 g</option>
                            <option value="20" >Over 20 g</option>
                            <option value="30" >Over 30 g</option>
                            <option value="40" >Over 40 g</option>
                            <option value="50" >Over 50 g</option>
                                            </datalist>
                                        </td>
                                        <td>
                                            Dietary:
                                            </br>
                                            <input id="recipesname" name="dietary" list="browsers6" >
                                            <datalist id="browsers6" >
                                              <option value="" selected="">Any</option>
                            <option value="1">Vegetarian</option>
                            <option value="2">Vegan</option>
                            <option value="3">Lactose Free</option>
                            <option value="4">Gluten Free</option>
                            <option value="5">Low Fat</option>
                            <option value="6">Low Carb</option>
                            <option value="7">Sugar Free</option>
                                            </datalist>
                                        </td>
                                    </tr>
                                    
                                </table>
                       
                            </p>
                       
                         
                              
                                </br>
                                </br>
                              
                                <p class="login button"> 
                                    <input type="submit" value="Submit" /> 
                                     <input type="Reset" value="Cancel" />
								</p>
                               
                            </form>
                        </div>

                       
						
                    </div>
                </div>  
            </section>
</div>


<div id="id03" class="modal">
   <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="restaurant1" method="post"> 
                                <h1>Restaurant Requirement</h1>  <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
      <input type="text" id="case" name="myText" value="<%= getServletContext().getRealPath("/") %> " style="display:none">

                                <p> 
                                    <label for="name" class="uname" data-icon="u" > Query user Name </label>
                                    <input id="hotelname" name="name" required="required" type="text"                                     <input id="hotelname" name="name" required="required" type="text" placeholder="Customer name"/>
                                </p>
                                   
                                <p> 
                                    Features
                                    </br>
                                </br>
                                
                                <input type="checkbox" name="feauture[]" value="Indian"> Indian Food  &nbsp;&nbsp;
  <input type="checkbox" name="feauture[]" value="Chinese" > Chinese &nbsp;&nbsp;
   <input type="checkbox" name="feauture[]" value="Japanese"> Japanese Food &nbsp;&nbsp; &nbsp;
  </br>    
       </br> 
   <input type="checkbox" name="feauture[]" value="Korean" > Korean Food &nbsp;&nbsp;

   
     <input type="checkbox" name="feauture[]" value="American"> American Food &nbsp;&nbsp;
  <input type="checkbox" name="feauture[]" value="French"> French Food &nbsp;&nbsp;
  
                                
      </br>    
       </br> 
                
                                
                                <input type="checkbox" name="feauture[]" value="juice"> Fruit Juice  &nbsp;&nbsp;
  <input type="checkbox" name="feauture[]" value="tea/coffee" > Tea/Coffee &nbsp;&nbsp;
   <input type="checkbox" name="feauture[]" value="chicken"> Chicken variety &nbsp;&nbsp;
                               
      </br>    
       </br>  
  <input type="checkbox" name="feauture[]" value="Meat" > Meat variety &nbsp;&nbsp;
     <input type="checkbox" name="feauture[]" value="Soup"> Soup variety &nbsp;&nbsp;
  <input type="checkbox" name="feauture[]" value="Bakeryitem" > Bakery Items &nbsp;&nbsp;
                 
                                
                                </p>
                                  
                                </br>
                                </br>
                              
                                <p class="login button"> 
                                    <input type="submit" value="Submit" /> 
                                     <input type="Reset" value="Cancel" />
								</p>
                               
                            </form>
                        </div>

                       
						
                    </div>
                </div>  
            </section>  
    
    
</div>

  <div id="id01" class="modal">
  
  

        <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="camara1"  method="post" > 
                                <h1>Camara Requirement</h1>  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
     
                               <input type="text" id="case" name="myText" value="<%= getServletContext().getRealPath("/") %> " style="display:none">


                                <p> 
                                    <label for="name" class="uname" data-icon="u" > Query user Name </label>
                                    <input id="hotelname" name="name" required="required" type="text"                                     <input id="hotelname" name="name" required="required" type="text" placeholder="Customer name"/>
                                </p>
                                 <p> 
                                    <label for="company" class="uname" > Brand </label>
                                 
                                  <input id="camaraname" name="brand" list="browsers8" >
                                            <datalist id="browsers8" >
                                               <option value=""  selected>Any</option>
                            <option value="Nikon" >Nikon</option>
                            <option value="Kodak" >Kodak</option>
                            <option value="Sony" >Sony</option>
                            <option value="Olympus" >Olympus</option> 
                            <option value="Canon" >Canon</option>
                            <option value="Vivitar" >Vivitar</option>
                             <option value="KINGEAR" >KINGEAR</option>
                            <option value="eBasket" >eBasket</option> 
                            <option value="PowerLead" >PowerLead</option>
                            <option value="Samsung" >Samsung</option>
                             <option value="Ivation" >Ivation</option>
                            <option value="AbergBest" >Aberg Best</option> 
                            <option value="DigitalCamara" >Digital Camara</option>
                            <option value="SanDisk" >SanDisk</option>
                            <option value="CaseLogic" >Case Logic</option>
                                            </datalist>
                                 </p>
                                 
                               
                              
                                <p> 
                                    Features
                                </p>
                              
                               
                            
                               
   <p> 
                                    <label for="resolution" class="uname" > Resolution </label>
                                 
                                  <input id="camaraname" name="resolution" list="browsers2" >
                                            <datalist id="browsers2" >
                                               <option value=""  selected>Any</option>
                            <option value="11MP&Under" >11 MP & Under</option>
                            <option value="12to23 MP" >12 to 23 MP</option>
                            <option value="24to35 MP" >24 to 35 MP</option>
                            <option value="36MP&Above" >36 MP & Above</option> 

                                            </datalist>
                                 </p>
                              <p> 
                                    <label for="displaysize" class="uname" >Display Size</label>
                                 
                                  <input id="camaraname" name="dsize" list="browsers4" >
                                            <datalist id="browsers4" >
                                               <option value=""  selected>Any</option>
                            <option value="Under2Inches" >Under 2 Inches</option>
                            <option value="2to2.9Inches" >2 to 2.9 Inches</option>
                            <option value="3to3.9 Inches" >3 to 3.9 Inches</option>
                            <option value="4to4.9 Inches" >4 to 4.9 Inches</option> 
                             <option value="5to6.9 Inches" >5 to 6.9 Inches</option>
                            <option value="Over7Inches" >Over 7 Inches</option> 


                                            </datalist>
                                 </p> 
                                  <p> 
                                    <label for="zoom" class="uname" > Optical Zoom </label>
                                 
                                  <input id="camaraname" name="zoom" list="browsers3" >
                                            <datalist id="browsers3" >
                                               <option value=""  selected>Any</option>
                            <option value="3.9x&Under" >3.9x & Under</option>
                            <option value="4xto9.9x" >4x to 9.9x</option>
                            <option value="10xto19.9x" >10x to 19.9x</option>
                            <option value="20xto49.9x" >20x to 49.9x</option> 
 <option value="50x & Above" >50x & Above</option> 
                                            </datalist>
                                 </p> 
                                  
                                  
                                  <p> 
                                    <label for="camaraefeauture" class="uname" > Camara Feauture</label>
                                    </br>
                                  <input type="checkbox" name="camarafeauture[]" value="ImageStabilization" > Image Stabilization   </br>
    <input type="checkbox" name="camarafeauture[]" value="WirelessTechnology" > Wireless Technology   </br>
      <input type="checkbox" name="camarafeauture[]" value="Dustproof" > Dustproof  </br>
        <input type="checkbox" name="camarafeauture[]" value="Waterproof" > Waterproof   </br>
  
                                    
                               
                                 </p> 
                       
                                
                                </br>
                                </br>
                              
                                <p class="login button"> 
                                    <input type="submit" value="Submit" /> 
                                     <input type="Reset" value="Cancel" />
								</p>
                               
                            </form>
                        </div>

                       
						
                    </div>
                </div>  
            </section>
 
</div>

<script>
// Get the modal
var modal = document.getElementById('id01');
var modal1 = document.getElementById('id02');
var modal2 = document.getElementById('id03');
var modal3 = document.getElementById('id04');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        modal1.style.display="block"
        modal2.style.display="block"
        modal3.style.display="block"
    }
   else  if (event.target == modal1) {
        modal1.style.display = "none";
         modal.style.display="block"
        modal2.style.display="block"
        modal3.style.display="block"
    }
   else  if (event.target == modal2) {
        modal2.style.display = "none";
         modal1.style.display="block"
        modal.style.display="block"
        modal3.style.display="block"
    }
  else   if (event.target == modal3) {
        modal3.style.display = "none";
         modal1.style.display="block"
        modal2.style.display="block"
        modal.style.display="block"
    }
}
</script>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
    if (mySidebar.style.display === 'block') {
        mySidebar.style.display = 'none';
        overlayBg.style.display = "none";
    } else {
        mySidebar.style.display = 'block';
        overlayBg.style.display = "block";
    }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
}
</script>

</body>
</html>


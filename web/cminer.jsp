<%-- 
    Document   : index
    Created on : Jul 30, 2017, 10:26:44 AM
    Author     : Admin
--%>

<%@page import="java.time.Duration"%>
<%@page import="java.time.Instant"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.Blob"%>
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
 <style>
      table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 15px;
    font-family: "Times New Roman", Times, serif;
}
body{
     font-family: "Times New Roman", Times, serif;
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
      <span>Welcome, <strong>Admin</strong></span><br>
      <a href="#query" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i>  Queries</a>
      <a href="#pyramid" class="w3-bar-item w3-button"><i class="fa fa-user"></i>  Pyramid Finder</a>
      <a href="#cminer" class="w3-bar-item w3-button"><i class="fa fa-cog"></i>  Cminer</a>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
    <a href="#"  class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-user fa fw"></i>  Overview</a>
    <a href="cminer.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-home"></i> Mining Competitors in Hotels</a>
    <a href="camaracminer.jsp"  class="w3-bar-item w3-button w3-padding"><i class="fa fa-video-camera "></i>  Mining Competitors in Camaras</a>
    <a href="restaruntcminer.jsp"  class="w3-bar-item w3-button w3-padding"><i class="fa fa-home"></i>  Mining Competitors in Restaurants</a>
    <a href="recipecminer.jsp"  class="w3-bar-item w3-button w3-padding"><i class="fa fa-coffee "></i>  Mining Competitors in Recipes</a>
   
    <a href="index.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-bell "></i>  Logout</a>
   
  </div>
</nav>

<%
    int id1=0;
    int rid1=0;
    int res1=0;
    int ca1=0;
    int topk=0;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mining", "root", "root");
Statement st = conn.createStatement();
ResultSet rs=st.executeQuery("SELECT id FROM hotel");

if(rs.last()){
id1=rs.getInt("id");
}

rs.close();

ResultSet rs1=st.executeQuery("SELECT id FROM recipes");

if(rs1.last()){
rid1=rs1.getInt("id");
}

rs1.close();

ResultSet rs2=st.executeQuery("SELECT id FROM restaurant");

if(rs2.last()){
res1=rs2.getInt("id");
}

rs2.close();
ResultSet rs3=st.executeQuery("SELECT Id FROM camara");

if(rs3.last()){
ca1=rs3.getInt("Id");
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
          <h3><%=id1%></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Hotels</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left"><i class="fa fa-video-camera w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><%=ca1%></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Camara</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16">
        <div class="w3-left"><i class="fa fa-coffee w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><%=res1%></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Restaurants</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-home w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3><%=rid1%></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Recipes</h4>
      </div>
    </div>
  </div>

  <div class="w3-panel"  id="query">
    <%
  int overeall=0;
  String cal="";
    int id=0;
    int rid=0;
    int res=0;
    int ca=0;
Instant start = Instant.now();

try {
    
     Map<String,String> hotel1=new HashMap<String,String>(); 
      Map<String,String> hotel1ss=new HashMap<String,String>(); 
       Map<String,Integer> map=new HashMap<String,Integer>(); 
        Map< Long,String> common=new HashMap< Long,String>(); 
          
     ArrayList<String> lst = new ArrayList<String>();
    ArrayList<String> lst1 = new ArrayList<String>();
     ArrayList<String> hotel = new ArrayList<String>();
    ArrayList<String> lstc = new ArrayList<String>();
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mining", "root", "root");
Statement st = conn.createStatement();
PreparedStatement ps3=conn.prepareStatement("select * from hotel");
            out.print("<table  border=0>");          
            ResultSet rs=ps3.executeQuery();
            ResultSetMetaData rsmd5=rs.getMetaData(); 
            
                 while(rs.next())
            {                                                              

    hotel.add(rs.getString(2));
    hotel1.put(rs.getString(2),rs.getString(7));
       
}
                 
System.out.println(id);
rs.close();
int ns=0;
  
int l=0;
InputStream sImage;
PreparedStatement ps=conn.prepareStatement("select * from hotel1");
            out.print("<table  border=0>");          
            ResultSet rs1=ps.executeQuery();
            ResultSetMetaData rsmd=rs1.getMetaData(); 
              String ss;
           
                 while(rs1.next())
            {                                                              

    lst.add(rs1.getString(3));
    
   cal=cal+rs1.getString(3)+" ";
       
}
rs1.close();
Object[] st2 = lst.toArray();
      for (Object s : st2) {
        if (lst.indexOf(s) != lst.lastIndexOf(s)) {
            lst.remove(lst.lastIndexOf(s));
         }
      }
      
      %>
       
      <br>
      <br>
      <table align="center">
  <tr>
    <th width="15%">Query ID</th>
    <th width="15%">Segment Size</th>
    <th width="40%">Feature Of Interest</th>
  </tr>
      <%
      int kl=0;
      int nj=0;
      String[] wor = cal.split(" ");
 
		// clean duplicates
		for (int i = 0; i < wor.length; i++)
		{
			for (int j = 0; j < wor.length; j++)
			{
				if (wor[i].equals(wor[j]))
				{
					if (i != j)
						wor[i] = "";
 
				}
			}
		}
 
	
		System.out.println("Removing Duplicate words:\n");
		for (int i = 0; i < wor.length; i++)
		{
                    

 lstc.add(wor[i]);
			
		}
for (String temp : lst) {
	kl=kl+1;
        
        
    int i=0;
    PreparedStatement ps1=conn.prepareStatement("select * from hotel1 where feauture='"+temp+"'");
            out.print("<table  border=0>");          
            ResultSet rs2=ps1.executeQuery();
            ResultSetMetaData rsmd1=rs2.getMetaData(); 
           
           
                 while(rs2.next())
            {                                                              

    i=i+1;
    nj=nj+1;
                
}
rs2.close();
    
String test1 = temp; 
String s=test1.substring(0,1);
if(s.equalsIgnoreCase(","))
{
    test1=test1.substring(1);
}


%>

<tr> <td width="15%">q<%=kl%> </td>
    <td width="15%"><%=i%></td>
    <td width="40%"><%=test1%></td>
</tr>
  <%

map.put(temp,i);

    
		}
%>

    
</table>
</br>
  </div>
  <div class="w3-panel"  id="pyramid">
          <br>
      <br>
Common segments for Hotel pairs
    <br>
      <br>
<table align="center">
  <tr>
    <th width="20%">Hotel Pairs</th>
    <th width="20%">Common Segments</th>
    <th width="20%">Common %</th>
  </tr>
<%


int count=0;
//PyramidFinder Algorithm:
for (String temp : hotel) {
count=count+1;
int count1=0;
for (String temp2 : hotel) {
count1=count1+1;
if(count1>=count+1)
{
if(!temp.equalsIgnoreCase(temp2))
{
String value=temp+","+temp2;
String fe1="";
String fe2="";
String similar="";
int cc=0;
String commonsegment="";
for (Map.Entry<String, String> entry : hotel1.entrySet()) {

String ll=entry.getKey();
if(ll.equalsIgnoreCase(temp))
{
fe1=entry.getValue();
}

if(ll.equalsIgnoreCase(temp2))
{
fe2=entry.getValue();
}
	}
  List<String> wordsOfSecond = Arrays.asList(fe2.split(","));

    //split and compare each word of the first string           
    for (String word : fe1.split(",")) {
        if(wordsOfSecond.contains(word))
similar=similar+","+word;
          
    }

int fg=0;
for (Map.Entry<String, Integer> entry1 : map.entrySet()) {
fg=fg+1;
String ll=entry1.getKey();
int ll2=entry1.getValue();
int njv=0;
int naj=0;
 for (String word : ll.split(",")) {
       
njv=njv+1;
          
    }
String klo="";
List<String> wordsOfSecond1 = Arrays.asList(ll.split(","));
 for (String word :similar.split(",")) {
        if(wordsOfSecond1.contains(word))
klo=klo+","+word;
          
    }
if(!klo.equalsIgnoreCase(null))
{
for (String word : klo.split(",")) {
       
naj=naj+1;
          
    }
if(njv==naj)
{
cc=cc+ll2;
commonsegment=commonsegment+"q"+fg+",";
}

}

}
if(!commonsegment.equalsIgnoreCase(null) && cc!=0)
{

double total=(double)cc/nj;

String fgf=value+" "+commonsegment+" "+Math.round(total*100)+"%";
System.out.println(fgf);
  String kk="("+commonsegment+")";
if(kk.contains(",)"))
{
    kk=kk.replace(",)", ")");
    
} 
%>

<tr> <td width="20%"><%=value%> </td>
    <td width="20%"><%=kk%></td>
    <td width="20%"><%=Math.round(total*100)%>%</td>
</tr>
  <%
    
lst1.add(fgf);
common.put( Math.round(total*100) , value+" "+commonsegment);
}

}
}
}


}
%>

    
</table>
</br>
  </div>
  <div class="w3-panel"  id="cminer">
          <br>
      <br>
Result Cminer:
    <br>
      <br>
</br>

<table align="center">
  <tr>
    <th width="20%">Hotel Pairs</th>
    <th width="20%">Common Segments</th>
    <th width="20%">Common %</th>
  </tr>
<%
final boolean order = true;
Map<Long, String> map2 = new TreeMap<Long, String>(
                    new Comparator<Long>()
                    {

                        @Override
                        public int compare(Long first, Long second)
                        {

                            if(order)
                            {

                                return second.compareTo(first);
                            }
                            else
                            {
                                return first.compareTo(second);

                            }
                        }
                    });
for (Map.Entry<Long, String> comm : common.entrySet()) {

map2.put(comm.getKey(),comm.getValue());

}
for (Map.Entry<Long, String> m : map2.entrySet()) {
overeall=overeall+1;
}

//Cminer Algorithm:

int kd=30;

if(overeall<=kd)
{

   

for (Map.Entry<Long, String> m : map2.entrySet()) {


    String klui=String.valueOf(m.getKey())+"%";
     
   String palce="";
    String valoo=m.getValue();
    String[] hh=valoo.split(" ");
    
    String ew=hh[0];
    String fe=hh[1];
    for (String temp : lst1) {
String[] word1 = temp.split(" ");
String a=word1[0];
String b=word1[1];
String c=word1[2];
   if(c.equalsIgnoreCase(klui))
   {
       if(fe.equalsIgnoreCase(b))
       {
           palce=palce+a+",";
       }
   }
    }
    
    String[] words = palce.split(",");
 
		// clean duplicates
		for (int i = 0; i < words.length; i++)
		{
			for (int j = 0; j < words.length; j++)
			{
				if (words[i].equals(words[j]))
				{
					if (i != j)
						words[i] = "";
 
				}
			}
		}
 
		// show the output
 String njmp="";
		System.out.println("Removing Duplicate words:\n");
		for (int i = 0; i < words.length; i++)
		{
 
			if (words[i] != "")
			{
                            if(i==words.length-1)
                            {
  njmp=njmp+words[i];
                            }
                            else
                            {
                            njmp=njmp+words[i]+",\n";
                            }
				
 
			}
		}
    

    %>
<tr>
   
    <%
  String kk="("+fe+")";
if(kk.contains(",)"))
{
    kk=kk.replace(",)", ")");
    
} 
      topk=topk+1; 
%>
<td width="20%"><%=njmp%> </td>
<td width="20%"><%=kk%> </td>

     <td width="20%"><%=klui%> </td>
</tr>
    <%  

 ArrayList<String> xxx1 = new ArrayList<String>();
  ArrayList<String> sss1 = new ArrayList<String>();
 for (String temp : lst1) {
String[] word1 = temp.split(" ");
String a=word1[0];
String b=word1[1];
String c=word1[2];
   if(c.equalsIgnoreCase(klui))
   {
       if(!fe.equalsIgnoreCase(b))
       {
if(!sss1.contains(b))
{
sss1.add(b);
}
String jj=a+";"+b;
xxx1.add(jj);
}


         }
}

 for (String temp : sss1) {
String ll="";
 for (String temp1 : xxx1) {

String[] word1 = temp1.split(";");

if(temp.equalsIgnoreCase(word1[1]))
{
ll=ll+word1[0]+",";
}

}

 String[] wordss = ll.split(",");
 
		// clean duplicates
		for (int i = 0; i < wordss.length; i++)
		{
			for (int j = 0; j < wordss.length; j++)
			{
				if (wordss[i].equals(wordss[j]))
				{
					if (i != j)
						wordss[i] = "";
 
				}
			}
		}
 
		// show the output
 String njmps="";
		
		for (int i = 0; i < wordss.length; i++)
		{
 
			if (wordss[i] != "")
			{
                            if(i==wordss.length-1)
                            {
  njmps=njmps+wordss[i];
                            }
                            else
                            {
                            njmps=njmps+wordss[i]+",\n";
                            }
				
 
			}
		}




 
    %>
<tr>
   
    <%

      topk=topk+1; 
  String kk1="("+temp+")";
if(kk1.contains(",)"))
{
    kk1=kk1.replace(",)", ")");
    
} 
%>
<td width="20%"><%=njmps%> </td>
<td width="20%"><%=kk1%> </td>

     <td width="20%"><%=klui%> </td>
</tr>
    <%  
}

}


      

       }
   
    


   


       



else
{

%>

    

<%

int gg=0;
for (Map.Entry<Long, String> m : map2.entrySet()) {


    String klui=String.valueOf(m.getKey())+"%";
     
   String palce="";
    String valoo=m.getValue();
    String[] hh=valoo.split(" ");
    
    String ew=hh[0];
    String fe=hh[1];
    for (String temp : lst1) {
String[] word1 = temp.split(" ");
String a=word1[0];
String b=word1[1];
String c=word1[2];
   if(c.equalsIgnoreCase(klui))
   {
       if(fe.equalsIgnoreCase(b))
       {
           palce=palce+a+",";
       }
   }
    }
    
    String[] words = palce.split(",");
 
		// clean duplicates
		for (int i = 0; i < words.length; i++)
		{
			for (int j = 0; j < words.length; j++)
			{
				if (words[i].equals(words[j]))
				{
					if (i != j)
						words[i] = "";
 
				}
			}
		}
 
		// show the output
 String njmp="";
		System.out.println("Removing Duplicate words:\n");
		for (int i = 0; i < words.length; i++)
		{
 
			if (words[i] != "")
			{
                            if(i==words.length-1)
                            {
  njmp=njmp+words[i];
                            }
                            else
                            {
                            njmp=njmp+words[i]+",\n";
                            }
				
 
			}
		}
    
   gg=gg+1;    
   if(gg<kd)
{
 
    %>
<tr>
   
    <%
  String kk="("+fe+")";
if(kk.contains(",)"))
{
    kk=kk.replace(",)", ")");
    
} 
      topk=topk+1;    
%>
<td width="20%"><%=njmp%> </td>
<td width="20%"><%=kk%> </td>

     <td width="20%"><%=klui%> </td>
</tr>
    <%  
}

  ArrayList<String> xxx1 = new ArrayList<String>();
  ArrayList<String> sss1 = new ArrayList<String>();
 for (String temp : lst1) {
String[] word1 = temp.split(" ");
String a=word1[0];
String b=word1[1];
String c=word1[2];
   if(c.equalsIgnoreCase(klui))
   {
       if(!fe.equalsIgnoreCase(b))
       {
if(!sss1.contains(b))
{
sss1.add(b);
}
String jj=a+";"+b;
xxx1.add(jj);
}


         }
}

 for (String temp : sss1) {
String ll="";
 for (String temp1 : xxx1) {

String[] word1 = temp1.split(";");

if(temp.equalsIgnoreCase(word1[1]))
{
ll=ll+word1[0]+",";
}

}

 String[] wordss = ll.split(",");
 
		// clean duplicates
		for (int i = 0; i < wordss.length; i++)
		{
			for (int j = 0; j < wordss.length; j++)
			{
				if (wordss[i].equals(wordss[j]))
				{
					if (i != j)
						wordss[i] = "";
 
				}
			}
		}
 
		// show the output
 String njmps="";
		
		for (int i = 0; i < wordss.length; i++)
		{
 
			if (wordss[i] != "")
			{
                            if(i==wordss.length-1)
                            {
  njmps=njmps+wordss[i];
                            }
                            else
                            {
                            njmps=njmps+wordss[i]+",\n";
                            }
				
 
			}
		}



     gg=gg+1;
if(gg<kd)
{
 
    %>
<tr>
   
    <%

    topk=topk+1;   
  String kk="("+temp+")";
if(kk.contains(",)"))
{
    kk=kk.replace(",)", ")");
    
} 
%>
<td width="20%"><%=njmps%> </td>
<td width="20%"><%=kk%> </td>

     <td width="20%"><%=klui%> </td>
</tr>
    <%  
}

}


      

       }
   }
Instant end = Instant.now();
Duration timeElapsed = Duration.between(start, end);

            double seconds = timeElapsed.toMillis() / 1000.0;
%>
</table>
</br>
  </div>
<div id="result">
    <table> 
        <tr>  <th width="50" align="center"> Top K Count </th> <th width="50"> Seconds</th></tr>
        
        <tr>
            <td width="50" align="center"><%= topk%> </td>
            <td width="50" align="center"><%=seconds%> </td>
        </tr>
        
        <%  
            




}






       
   
     
    
  
    










catch(Exception e){}
%>


    </table>
    
<br>
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


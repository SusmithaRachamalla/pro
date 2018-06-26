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
<html lang="en">
<head>
  <title>Mining Competitors from Large Unstructured Datasets</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="css/jquery.min.js"></script>
  <script src="css/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 0;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
  </style>
</head>
<body>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.jsp">Home</a></li>
        <li><a href="colllection.jsp">Hotel</a></li>
        <li><a href="res.jsp">Restaurant</a></li>
        <li><a href="cam.jsp">Camara</a></li>
        <li><a href="rec.jsp">Recipes</a></li>
      </ul>
     
    </div>
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
ResultSet rs=st.executeQuery("SELECT id FROM restaurant");

if(rs.last()){
id=rs.getInt("id");

}
System.out.println(id);
rs.close();
int ns=0;

int l=0;
InputStream sImage;
PreparedStatement ps=conn.prepareStatement("select * from restaurant");
            out.print("<table  border=0>");          
            ResultSet rs1=ps.executeQuery();
            ResultSetMetaData rsmd=rs1.getMetaData(); 
              String ss;
       int k1o=0;    
                 while(rs1.next())
            {                                                              
               
       String path="gallery/"+rs1.getString(8);
   
       String[] jj=rs1.getString(7).split(",");
       String value="";
       for(String kk : jj)
       {
           value=value+kk+"\n,";
       }
       k1o=k1o+1;
       String kk=value+")";
if(kk.contains(",)"))
{
    kk=kk.replace(",)", "");
     
}
String test1 = kk; 
String s=test1.substring(0,1);
if(s.equalsIgnoreCase(","))
{
    test1=test1.substring(1);
}
       if(k1o==3)
       {
           
       k1o=0;
       

       
                      %>
 
 <br>

                     
   
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading" align ="center"><%=rs1.getString(2)%></div>
        <div class="panel-body"><img src="<%=path%>" class="img-responsive" style="width:200%" alt="Image"></div>
        <div class="panel-footer" align="center"><%=test1%></div>
      </div>
  
    </div>
       


    <%
}
else




  %>
 


                      
   
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading" align ="center"><%=rs1.getString(2)%></div>
        <div class="panel-body"><img src="<%=path%>" class="img-responsive" style="width:200%" alt="Image"></div>
        <div class="panel-footer" align="center"><%=test1%></div>
      </div>
  
    </div>
       


    <%
}

rs1.close();
}

catch(Exception e){}
%>



<br>



</body>
</html>

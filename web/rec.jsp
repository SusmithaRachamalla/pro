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
ResultSet rs=st.executeQuery("SELECT id FROM recipes");

if(rs.last()){
id=rs.getInt("id");

}
System.out.println(id);
rs.close();
int ns=0;

int l=0;
InputStream sImage;
PreparedStatement ps=conn.prepareStatement("select * from recipes");
            out.print("<table  border=0>");          
            ResultSet rs1=ps.executeQuery();
            ResultSetMetaData rsmd=rs1.getMetaData(); 
              String ss;
           
                 while(rs1.next())
            {                                                              
               
       String path="gallery/"+rs1.getString(12);
        StringBuilder str = new StringBuilder(rs1.getString(13));
      
      str.deleteCharAt(1);
       
                      %>
 



   
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading" align ="center"><%=rs1.getString(2)%></div>
        <div class="panel-body"><img src="<%=path%>" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer" align="center"><%=rs1.getString(13)%></div>
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

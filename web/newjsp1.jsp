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
<head>
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
}
</style>
</head>
<body>

<h2>The padding Property</h2>
<p>This property adds space between the border and the content in a table.</p>

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
System.out.println(id);
rs.close();
int ns=0;
   ArrayList<String> lst = new ArrayList<String>();
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
                
}
rs1.close();
Object[] st2 = lst.toArray();
      for (Object s : st2) {
        if (lst.indexOf(s) != lst.lastIndexOf(s)) {
            lst.remove(lst.lastIndexOf(s));
         }
      }
      
      %>
       
    <table align="center">
  <tr>
    <th width="100%" >Query ID</th>
    <th width="100%">Segment Size</th>
    <th width="100%">Feature Of Interest</th>
  </tr>
      <%
      int kl=0;
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
                
}

%>

 <tr>
    <td width="30%"><%=kl%></td>
    <td width="30%" ><%=i%></td>
    <td width="30%"><%=temp%></td>
  </tr>
  <%



    
		}
%>
  </table>
<%
   
}

catch(Exception e){}
%>


  
    
<br>



</body>
</html>
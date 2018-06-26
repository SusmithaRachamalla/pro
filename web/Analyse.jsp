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
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">Hotel</a></li>
        <li><a href="#">Restaurant</a></li>
        <li><a href="#">Camara</a></li>
        <li><a href="#">Recipes</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
      </ul>
    </div>
  </div>
</nav>
   
<%
  int overeall=0;
  String cal="";
    int id=0;
    int rid=0;
    int res=0;
    int ca=0;
try {
    
     Map<String,String> hotel1=new HashMap<String,String>();  
       Map<String,Integer> map=new HashMap<String,Integer>(); 
        Map< Long,String> common=new HashMap< Long,String>(); 
          
     ArrayList<String> lst = new ArrayList<String>();
    ArrayList<String> lst1 = new ArrayList<String>();
     ArrayList<String> hotel = new ArrayList<String>();
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
       
    <table align="center">
  <tr>
    <th width="30%">Query ID</th>
    <th width="30%">Segment Size</th>
    <th width="30%">Feature Of Interest</th>
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
                    
 overeall=overeall+1;
			
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
    


%>

<tr> <td width="30%">q<%=kl%> </td>
    <td width="30%"><%=i%></td>
    <td width="30%"><%=temp%></td>
</tr>
  <%

map.put(temp,i);

    
		}
%>

    
</table>
</br>
Common segments for Hotel pairs
<table align="center">
  <tr>
    <th width="30%">Hotel Pairs</th>
    <th width="30%">Common Segments</th>
    <th width="30%">Common %</th>
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
%>

<tr> <td width="30%"><%=value%> </td>
    <td width="30%">(<%=commonsegment%>)</td>
    <td width="30%"><%=Math.round(total*100)%>%</td>
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
Result Cminer:
</br>

<table align="center">
  <tr>
    <th width="30%">Hotel Pairs</th>
    <th width="30%">Common Segments</th>
    <th width="30%">Common %</th>
  </tr>
<%


//Cminer Algorithm:

int kd=30;

if(overeall<=kd)
{
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

       
%>
<td width="30%"><%=njmp%> </td>
<td width="30%"><%=fe%> </td>

     <td width="30%"><%=klui%> </td>
</tr>
    <%  


 for (String temp : lst1) {
String[] word1 = temp.split(" ");
String a=word1[0];
String b=word1[1];
String c=word1[2];
   if(c.equalsIgnoreCase(klui))
   {
       if(!fe.equalsIgnoreCase(b))
       {
          
    %>
<tr>
   
    <%

       
%>
<td width="30%"><%=a%> </td>
<td width="30%"><%=b%> </td>

     <td width="30%"><%=c%> </td>
</tr>
    <%  
}

       }
 



}


       
   }
} //end if


else
{

%>

    

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

       
%>
<td width="30%"><%=njmp%> </td>
<td width="30%"><%=fe%> </td>

     <td width="30%"><%=klui%> </td>
</tr>
    <%  
}

 for (String temp : lst1) {
String[] word1 = temp.split(" ");
String a=word1[0];
String b=word1[1];
String c=word1[2];
   if(c.equalsIgnoreCase(klui))
   {
       if(!fe.equalsIgnoreCase(b))
       {
           gg=gg+1;
if(gg<kd)
{
 
    %>
<tr>
   
    <%

       
%>
<td width="30%"><%=a%> </td>
<td width="30%"><%=b%> </td>

     <td width="30%"><%=c%> </td>
</tr>
    <%  
}

       }
   }
    }






       
   }
     
    
  
    
}

}









catch(Exception e){}
%>


    </table>
    
<br>



</body>
</html>

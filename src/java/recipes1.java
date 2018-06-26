
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author ISI7
 */
@MultipartConfig(maxFileSize = 16177215)  
@WebServlet(urlPatterns = {"/recipes1"})
public class recipes1 extends HttpServlet {
private String getFileName(final Part part) {
    final String partHeader = part.getHeader("content-disposition");
    
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, InstantiationException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
      String name=request.getParameter("name");
       
        String rtype=request.getParameter("rtype");
       
        String cal=request.getParameter("cal");
        
            String fat=request.getParameter("fat");
               String Carbs=request.getParameter("Carbs");
         String Fiber=request.getParameter("Fiber");
        String Protein=request.getParameter("Protein");
        
            String dietary=request.getParameter("dietary");
              
        
 
          String path=request.getParameter("myText");  

  
        String fe="";
        
        
  
        
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (IllegalAccessException ex) {
                Logger.getLogger(hotel.class.getName()).log(Level.SEVERE, null, ex);
            }
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/mining", "root", "root");
              String ov=rtype+","+cal+","+fat+","+Carbs+","+Fiber+","+Protein+","+dietary;
             String sql = "insert into recipes1 (name,rtype,cal,fat,carbs,fiber,protien,dietary,ovfeauture)values('"+name+"','"+rtype+"','"+cal+"','"+fat+"','"+Carbs+"', '"+Fiber+"', '"+Protein+"', '"+dietary+"','"+ov+"')";
           Statement st = con.createStatement();
        int s= st.executeUpdate(sql);     
          response.sendRedirect("customer.jsp");
            
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(recipes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(recipes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(recipes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(recipes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(recipes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(recipes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

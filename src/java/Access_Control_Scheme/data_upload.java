/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Access_Control_Scheme;

/**
 *
 * @author JAVA-JP
 */
import DBconnection.SQLconnection;
import Networks.DRIVE_Network;
import com.oreilly.servlet.MultipartRequest;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author java3
 */
public class data_upload extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    File file;
    final String filepath = "D:/";
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            MultipartRequest m = new MultipartRequest(request, filepath);
            String filekeyword = m.getParameter("filename");
            String policy = m.getParameter("policy");
            File file = m.getFile("fileToUpload");
            String filename = file.getName().toLowerCase();
            
          

            Connection con = SQLconnection.getconnection();

            BufferedReader br = new BufferedReader(new FileReader(filepath + filename));
            StringBuffer sb = new StringBuffer();
            String temp;

            while ((temp = br.readLine()) != null) {
                sb.append(temp);
                sb.append("\n"); 
            }

            KeyGenerator Attrib_key = KeyGenerator.getInstance("AES");
            Attrib_key.init(128);
            SecretKey secretKey = Attrib_key.generateKey();
            System.out.println("++++++++ key:"   + secretKey);
            
            long aTime = System.nanoTime();
            
            Encryption e = new Encryption();
            String encryptedtext = e.encrypt(sb.toString(), secretKey);
            
            long bTime = System.nanoTime();
            float encryptTime = (bTime - aTime) / 1000;
            System.out.println("Time taken to Encrypt File: " + encryptTime + " microseconds.");
            //storing encrypted file
            
            byte[] b = secretKey.getEncoded();
            String Dkey = Base64.encode(b);
            System.out.println("converted secretkey to string:" + Dkey);
            

            HttpSession user = request.getSession(true);
            String doname = user.getAttribute("doname").toString();
            String doid = user.getAttribute("doid").toString();
            String domail = user.getAttribute("domail").toString();

            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("current Date " + time);
            
            FileWriter fw = new FileWriter(file);
            fw.write(encryptedtext);
            int hash1 =encryptedtext.hashCode();
            fw.close();
            boolean status = new DRIVE_Network().upload(file);
            if (status) {

                Statement st = con.createStatement();
               
            System.out.println("Check------------------------------------------------------------------>>>>>");
            
                int i = st.executeUpdate("insert into do_files(doid, doname, enc_data, dkey, time, filekeyword, filename, data, enc_time, policy)values('" + doid + "','" + doname + "','" + encryptedtext + "','" + Dkey + "','" + time + "','" + filekeyword+ "','" + file.getName() + "','" + sb.toString() + "','"+ encryptTime +"','"+ policy +"')");
                if (i != 0) {
                    response.sendRedirect("File_upload.jsp?File_uploaded");

                } else {
                    response.sendRedirect("File_upload.jsp?Upload_failed");
                    System.out.println("Error in SQL Syntex");
                }
            } 
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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

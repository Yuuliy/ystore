/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.ProfileDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import model.Account;

/**
 *
 * @author Dell
 */
@MultipartConfig
@WebServlet(name = "userProfileServlet", urlPatterns = {"/profile"})
public class userProfileServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet userProfileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userProfileServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        List<Account> listAcc = new UserDAO().getUserAll();
//        request.setAttribute("listAcc", listAcc);
        request.getRequestDispatcher("view/user/profile.jsp").forward(request, response);
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
        String firstName_raw = request.getParameter("firstName");
        String lastName_raw = request.getParameter("lastName");
        String dob_raw = request.getParameter("dob");

        String gender_raw = request.getParameter("gender");
        String country_raw = request.getParameter("country");
        String address_raw = request.getParameter("address");
        String phone_raw = request.getParameter("phone");
        String email_raw = request.getParameter("email");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        int gender;
        try {
            gender = Integer.parseInt(gender_raw);
        } catch (NumberFormatException e) {
            gender = -1;
            System.out.println(e + "gender");
        }

        //upload ảnh
        Part file = request.getPart("avatar");

        String imageFileName = file.getSubmittedFileName(); // lấy ra file ảnh đã chọn

        System.out.println("selected image file name : " + imageFileName);

        String uploadPath = "C:/Users/Dell/Desktop/Learning/Project/Project/web/img/avatar/" + imageFileName;

        System.out.println("UploadPath: " + uploadPath);

        try {
            FileOutputStream fos = new FileOutputStream(uploadPath);
            InputStream is = file.getInputStream();

            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
        } catch (IOException e) {
            System.out.println(e);
        }
        if (a != null) {
            if ( firstName_raw != null) {
                a.getInfo().setFirstName(firstName_raw);
            }
            if ( lastName_raw != null) {
                a.getInfo().setLastName(lastName_raw);
            }
            if ( dob_raw != null) {
                a.getInfo().setBirthDay(Date.valueOf(dob_raw));
            }
            if ( gender != -1) {
                a.getInfo().setGender(gender);
            }
            if (country_raw != null) {
                a.getInfo().setCountry(country_raw);
            }
            if (address_raw != null) {
                a.getInfo().setAddress(address_raw);
            }
            if (phone_raw != null) {
                a.getInfo().setPhone(phone_raw);
            }
            if (email_raw != null) {
                a.setEmail(email_raw);
            }
            if (imageFileName != null && !imageFileName.equals("")) {
                a.getInfo().setAvatar("img/avatar/" + imageFileName);
            }
        }
        LocalDate curDate = java.time.LocalDate.now();

        if (session.getAttribute("account") != null) {
            session.removeAttribute("account");
        }

        session.setAttribute("account", a);
        ProfileDAO pd = new ProfileDAO();
        pd.changeProfile(a);
        response.sendRedirect("profile");
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

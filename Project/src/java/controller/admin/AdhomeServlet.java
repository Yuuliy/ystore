/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.AccountDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.List;
import model.Account;
import model.Order;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AdhomeServlet", urlPatterns = {"/admin-home"})
public class AdhomeServlet extends HttpServlet {

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
            out.println("<title>Servlet AdhomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdhomeServlet at " + request.getContextPath() + "</h1>");
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
        AccountDAO ad = new AccountDAO();
        int totalUser = ad.getTotalAccount();
        OrderDAO od = new OrderDAO();
        int totalOrder = 0;
        String action = request.getParameter("action");
        LocalDate currentDate = java.time.LocalDate.now();
        int curYear = currentDate.getYear();
        request.setAttribute("curYear", curYear);
        int year = curYear;
        int month = currentDate.getMonthValue();
        if (action != null) {
            String month_raw = request.getParameter("month");

            month =  Integer.parseInt(month_raw);
            request.setAttribute("month", month);

            String year_raw = request.getParameter("year");
            if (year_raw != null) {
                year = Integer.parseInt(year_raw);
                request.setAttribute("year", year);
            }
            
        }

        totalOrder = od.getTotalOrder(month, year);

        ProductDAO pd = new ProductDAO();
        int totalProduct = pd.getProductTotal();

        List<Order> listOrder = new OrderDAO().getNewOrder();
        List<Account> listacc = new AccountDAO().getAll();

        request.setAttribute("listacc", listacc);
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalOrder", totalOrder);
        request.setAttribute("totalUser", totalUser);
        request.getRequestDispatcher("view/admin/home.jsp").forward(request, response);
    }

    public static void main(String[] args) {
        List<Account> listacc = new AccountDAO().getAll();
        for (Account account : listacc) {
            System.out.println(account.getInfo().getAvatar());
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

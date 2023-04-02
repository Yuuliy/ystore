/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import model.Order;

/**
 *
 * @author Dell
 */
@WebServlet(name = "transactionListServlet", urlPatterns = {"/admin-transaction"})
public class transactionListServlet extends HttpServlet {

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
            out.println("<title>Servlet transactionListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet transactionListServlet at " + request.getContextPath() + "</h1>");
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
        String from_raw = request.getParameter("from");
        String to_raw = request.getParameter("to");
        String select_raw = request.getParameter("select");
        OrderDAO od = new OrderDAO();
        int id =0;
        String id_raw = request.getParameter("id");
        String status = request.getParameter("status");
        if (id_raw != null && status != null) {
            try {
                id = Integer.parseInt(id_raw);
                
            } catch (NumberFormatException e) {
                System.out.println(e);
            }
            od.changeOrderStatus(id,status);
        }
        List<Order> listOrder = new OrderDAO().getOrderList();
        if (from_raw != null && to_raw != null && select_raw != null) {
            listOrder  = new OrderDAO().getOrderListBySearch(Date.valueOf(from_raw),Date.valueOf(to_raw), select_raw);
        }


        
        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("view/admin/transactionList.jsp").forward(request, response);
    }
    public static void main(String[] args) {
        List<Order> listOrder  = new OrderDAO().getOrderListBySearch(Date.valueOf("2022-11-02"),Date.valueOf("2022-11-03"), "paid");
        for (Order order : listOrder) {
            System.out.println(order.getStatus());
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

        request.getRequestDispatcher("view/admin/transactionList.jsp").forward(request, response);

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

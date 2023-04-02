/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Product;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AddToCartHomeServlet", urlPatterns = {"/addtocarthome"})
public class AddToCartHomeServlet extends HttpServlet {

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
            out.println("<title>Servlet AddToCartHomeServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartHomeServlet at " + request.getContextPath() + "</h1>");
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
        ProductDAO pd = new ProductDAO();
        List<Product> prods = pd.getAllProducts();

        Cookie arr[] = request.getCookies();
        String txt = "";    // chuỗi lữu trữ id... của cart
        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt += item.getValue();
                    item.setMaxAge(0);
                    response.addCookie(item);
                }
            }
        }

        String id_raw = request.getParameter("id");
        String quantity_raw = request.getParameter("quantity");
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        int id = 0, quantity = 0;
        try {
            id = Integer.parseInt(id_raw);
            quantity = Integer.parseInt(quantity_raw);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        Product p = pd.getProductByProductID(id);
        Cart cart = new Cart(txt, prods);

        if (txt.isEmpty()) {
            if (quantity < p.getQuantity()) {
                txt = id + "_" + quantity + "/" + color + ":" + size;
            }

        } else if (cart.getItemByProductID(id) == null) {
            if (quantity < p.getQuantity()) {
                txt += "-" + id + "_" + quantity + "/" + color + ":" + size;
            }

        } else if ((cart.getQuantityByProductID(id) + quantity) >= p.getQuantity()) {
            // không thêm vào vì quá quantity trong kho
        } else {
            txt += "-" + id + "_" + quantity + "/" + color + ":" + size;
        }

        cart = new Cart(txt, prods);

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(24 * 60 * 60);
        response.addCookie(c);
        response.sendRedirect("home");
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

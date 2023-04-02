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
import model.Item;
import model.Product;

/**
 *
 * @author phanh
 */
@WebServlet(name = "CartProcessController", urlPatterns = {"/process"})
public class CartProcessController extends HttpServlet {

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
            out.println("<title>Servlet CartProcessController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartProcessController at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String id_raw = request.getParameter("id");
        String quantity_raw = request.getParameter("qty");
        String color = request.getParameter("color");
        String size = request.getParameter("size");

        ProductDAO pd = new ProductDAO();
        List<Product> list = pd.getAllProducts();
        Cookie arr[] = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie item : arr) {
                if (item.getName().equals("cart")) {
                    txt += item.getValue();
                }
            }
        }

        int id, quantity;
        try {
            id = Integer.parseInt(id_raw);
            quantity = Integer.parseInt(quantity_raw);

            Product p = pd.getProductByProductID(id);
            Cart c = new Cart(txt, list);

            if (quantity == 0) {
                c.removeItem(id);
            } else if (quantity <= p.getQuantity()) {
                c.getItemByProductID(id).setQuantity(quantity);
            }

            if (quantity != 0) {
                if (!color.equals(c.getItemByProductID(id).getColor())) {
                    c.getItemByProductID(id).setColor(color);
                }

                if (!size.equals(c.getItemByProductID(id).getSize())) {
                    c.getItemByProductID(id).setSize(size);
                }
            }

            List<Item> items = c.getItems();
            txt = "";

            if (items.size() > 0) {
                txt = items.get(0).getProduct().getProductID() + "_"
                        + items.get(0).getQuantity() + "/" + items.get(0).getColor() + ":" + items.get(0).getSize();
                for (int i = 1; i < items.size(); i++) {
                    txt += "-" + items.get(i).getProduct().getProductID() + "_"
                            + items.get(i).getQuantity() + "/" + items.get(i).getColor() + ":" + items.get(i).getSize();
                }
            }
            Cookie cookie = new Cookie("cart", txt);
            cookie.setMaxAge(2 * 24 * 60 * 60);
            response.addCookie(cookie);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }

        response.sendRedirect("cart");

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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.CategoryDAO;
import dal.ProducerDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;
import model.Category;
import model.Producer;
import model.Product;
import model.color;
import model.img;
import model.size;

/**
 *
 * @author Dell
 */
@MultipartConfig
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/update-product"})
public class UpdateProductServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        int id = 0;
        try {
            id = Integer.parseInt(id_raw);
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        List<Category> c = new CategoryDAO().getCategoryChild();
        request.setAttribute("cateList", c);
        Product p = new ProductDAO().getProductByProductID(id);
        request.setAttribute("product", p);
        List<Producer> pr = new ProducerDAO().getAll();
        request.setAttribute("producerList", pr);
        request.getRequestDispatcher("view/admin/UpdateProduct.jsp").forward(request, response);
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
        Product p = new Product();
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        ProducerDAO prd = new ProducerDAO();
        String id_raw = request.getParameter("productid");
        String proName_raw = request.getParameter("proName");
        String cateName_raw = request.getParameter("cateName");
        String producer_raw = request.getParameter("producer");
        String amount_raw = request.getParameter("amount");
        String quantity_raw = request.getParameter("quantity");
        String insurance_raw = request.getParameter("insurance");
        
        Part file = request.getPart("avatar");

        String imageFileName = file.getSubmittedFileName(); // lấy ra file ảnh đã chọn

        System.out.println("selected image file name : " + imageFileName);

        String uploadPath = "C:/Users/Dell/Desktop/Learning/Project/Project/web/usercss/images/" + imageFileName;

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
        int id = 0;
        int cateName = 0;
        int producer = 0;
        int quantity = 0;
        int insurance = 0;
        double amount = 0;
        try {
            id = Integer.parseInt(id_raw);
            cateName = Integer.parseInt(cateName_raw);
            producer = Integer.parseInt(producer_raw);
            amount = Double.parseDouble(amount_raw);
            quantity = Integer.parseInt(quantity_raw);
            insurance = Integer.parseInt(insurance_raw);

        } catch (NumberFormatException e) {
            System.out.println(e);
        }
        color c = new color(pd.getLastProductID() + 1, "", "", "", "", "");
        size s = new size(pd.getLastProductID() + 1, "", "", "", "");
        img i = new img(pd.getLastProductID() + 1,"usercss/images/"+ imageFileName, "", "", "");
        
        Category cate = cd.getCategoryByID(cateName);
        Producer prc = prd.getCategoryByID(producer);
        p.setProductID(id);
        p.setCategoryID(cateName);
        p.setProducerID(producer);
        p.setProductName(proName_raw);
        p.setPrice(amount);
        p.setQuantity(quantity);
        p.setColor(c);
        p.setInsurance(insurance);
        p.setSize(s);
        p.setImages(i);
        p.setCategories(cate);
        p.setProducer(prc);
        pd.updateProduct(p);
        response.sendRedirect("admin-productlist");
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

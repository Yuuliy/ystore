/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.CategoryDAO;
import dal.ProducerDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Product;
import model.Category;
import model.Producer;

/**
 *
 * @author Dell
 */
@WebServlet(name = "CategoryServlet", urlPatterns = {"/category"})
public class CategoryServlet extends HttpServlet {

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
            out.println("<title>Servlet CategoryServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryServlet at " + request.getContextPath() + "</h1>");
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
        String[] pid_raw = request.getParameterValues("pid");

        ProductDAO p = new ProductDAO();
        CategoryDAO c = new CategoryDAO();
        ProducerDAO pr = new ProducerDAO();

        List<Producer> listproducer = pr.getAll();
        request.setAttribute("listproducer", listproducer);

        List<Category> listc = c.getCategoryParent();
        request.setAttribute("listcategory", listc);

        String[] cid_raw = request.getParameterValues("cid");

        int[] cid = null;
        int[] pid = null;

        boolean[] cCheck, cCheck2, cCheck17, pdCheck = null;

        List<Category> listS = c.getCategoryByCID(1);
        List<Category> listS2 = c.getCategoryByCID(2);
        List<Category> listS17 = c.getCategoryByCID(17);

        if (pid_raw != null) {
            pid = new int[pid_raw.length];

            for (int i = 0; i < pid.length; i++) {
                pid[i] = Integer.parseInt(pid_raw[i]);
            }
            List<Producer> listpd = pr.getAll();
            pdCheck = new boolean[listpd.size()];
            for (int i = 0; i < pdCheck.length; i++) {
                if (isProducerCheck(listpd.get(i).getProducerID(), pid)) {
                    pdCheck[i] = true;
                } else {
                    pdCheck[i] = false;
                }
            }
            request.setAttribute("producerCheck", pdCheck);
        }

        if (cid_raw != null) {
            cid = new int[cid_raw.length];

            for (int i = 0; i < cid.length; i++) {
                cid[i] = Integer.parseInt(cid_raw[i]);
            }

            cCheck = new boolean[listS.size()];
            cCheck2 = new boolean[listS2.size()];
            cCheck17 = new boolean[listS17.size()];
            for (int i = 0; i < cCheck.length; i++) {
                if (isCategoryCheck(listS.get(i).getCategoryID(), cid)) {
                    cCheck[i] = true;
                } else {
                    cCheck[i] = false;
                }
            }
            for (int i = 0; i < cCheck2.length; i++) {
                if (isCategoryCheck(listS2.get(i).getCategoryID(), cid)) {
                    cCheck2[i] = true;
                } else {
                    cCheck2[i] = false;
                }
            }
            for (int i = 0; i < cCheck17.length; i++) {
                if (isCategoryCheck(listS17.get(i).getCategoryID(), cid)) {
                    cCheck17[i] = true;
                } else {
                    cCheck17[i] = false;
                }
            }

            request.setAttribute("categoryCheck", cCheck);
            request.setAttribute("categoryCheck2", cCheck2);
            request.setAttribute("categoryCheck17", cCheck17);
        }

        List<Product> list = p.getProductByCategoryIDPromax(cid);
        String search_raw = request.getParameter("search");
        if (search_raw != null) {
            list = p.getSearchProducts(search_raw);
            request.setAttribute("search", search_raw);
        }
        
        String sort = request.getParameter("sort");
        if(sort != null){
            if(sort.equalsIgnoreCase("name")){
                Collections.sort(list, new Comparator<Product>() {
                    @Override
                    public int compare(Product o1, Product o2) {
                        if(o1.getProductName().compareToIgnoreCase(o2.getProductName()) > 0){
                            return 1;
                        }
                        return -1;
                    }
                });
            }else if(sort.equalsIgnoreCase("price")){
                Collections.sort(list, new Comparator<Product>() {
                    @Override
                    public int compare(Product o1, Product o2) {
                        if(o1.getPrice() > o2.getPrice()){
                            return -1;
                        }
                        return 1;
                    }
                });
            }else if (sort.equalsIgnoreCase("price1")) {
                Collections.sort(list, new Comparator<Product>(){
                    @Override
                    public int compare(Product o1, Product o2) {
                        if(o1.getPrice() > o2.getPrice()){
                            return 1;
                        }
                        return -1;
                    }
                    
                });
            }
            request.setAttribute("sort", sort);
        }
        
        int page, numberPerPage = 6;
        String xpage = request.getParameter("page");
        int size = list.size();
        int numberOfPage = ((size % 6 == 0) ? (size / 6) : (size / 6 + 1));
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page - 1) * numberPerPage;
        end = Math.min(page * numberPerPage, size);

        List<Product> listByPage = p.getListByPage(list, start, end);
        request.setAttribute("listByPage", listByPage);
        request.setAttribute("page", page);
        request.setAttribute("numberPage", numberOfPage);

        if (cid_raw != null) {
            String cS = "";
            for (int i = 0; i < cid.length; i++) {
                if (i == cid.length - 1) {
                    cS += cid[i];
                } else {
                    cS += cid[i] + "&cid=";
                }
            }
            request.setAttribute("cS", cS);
        }

        request.setAttribute("listProduct", list);

        request.setAttribute("subCategoryCID1", listS);
        request.setAttribute("subCategoryCID2", listS2);
        request.setAttribute("subCategorytotebag", listS17);

        request.getRequestDispatcher("view/user/category.jsp").forward(request, response);
    }
    public static void main(String[] args) {
        
    }

    private boolean isCategoryCheck(int categoryID, int[] list) {
        if (list == null) {
            return false;
        } else {
            for (int i = 0; i < list.length; i++) {
                if (list[i] == categoryID) {
                    return true;
                }
            }
        }
        return false;
    }
    
    private boolean isProducerCheck(int producerID, int[] list) {
        if (list == null) {
            return false;
        } else {
            for (int i = 0; i < list.length; i++) {
                if (list[i] == producerID) {
                    return true;
                }
            }
        }
        return false;
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

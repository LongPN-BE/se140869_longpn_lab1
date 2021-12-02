/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.controllers.customers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longpn.products.ProductDAO;
import longpn.products.ProductDTO;
import longpn.utils.ProductUtils;

@WebServlet(name = "UpdateCartController", urlPatterns = {"/UpdateCartController"})
public class UpdateCartController extends HttpServlet {

    private static final String CART_PAGE = "cart.jsp";

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
        try {
            String productID = request.getParameter("productID");
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            ProductUtils util = new ProductUtils();
            HttpSession session = request.getSession();
            List<ProductDTO> productList = (List<ProductDTO>) session.getAttribute("CARTITEM");
            String msg = "";
            ProductDAO productDao = new ProductDAO();
            int oldQuantity = productDao.getOldQuantity(productID);
            if (newQuantity > oldQuantity) {
                msg = "The quantity not enough";
            } else {

                if (util.updateProduct(productList, productID, newQuantity)) {
                    msg = "Update success";
                } else {
                    msg = "Update fail";
                }
            }

            float total = util.totalPriceProduct(productList);
            session.setAttribute("TOTAL", total);
            request.setAttribute("UPDATE_MSG", msg);
        } catch (Exception e) {
            log("Error At UpdateCartController:" + e.toString());
        } finally {
            request.getRequestDispatcher(CART_PAGE).forward(request, response);
//            response.sendRedirect(CART_PAGE);
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

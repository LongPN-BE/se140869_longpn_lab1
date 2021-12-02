/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.controllers.customers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longpn.products.ProductDTO;
import longpn.utils.ProductUtils;


@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String SHOPPING_PAGE = "shopping.jsp";

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
        String url = SHOPPING_PAGE;
        try {
            HttpSession session = request.getSession(false);
            ProductUtils util = new ProductUtils();
            String productID = request.getParameter("productID");
            String nameProduct = request.getParameter("nameProduct");
            float price = Float.parseFloat(request.getParameter("price"));
            int newQuantity = 1;
            List<ProductDTO> listProduct = null;
            String msg = "";

            if (session.getAttribute("CARTITEM") == null) {
                listProduct = new ArrayList<>();

            } else {
                listProduct = (List<ProductDTO>) session.getAttribute("CARTITEM");
            }

            if (util.checkExistInList(listProduct, productID)) {
                int oldQuantity = util.getProQuantity(listProduct, productID);
                newQuantity += oldQuantity;
                util.updateProQuantity(listProduct, productID, newQuantity);
                msg = "Add successfull";
                url = "MainController?action=Search&search=";
                
            } else {
                ProductDTO productDTO = new ProductDTO(productID, nameProduct, price, newQuantity);
                listProduct.add(productDTO);
                msg = "Add successfull";
                url = "MainController?action=Search&search=";
            }
            
            
            float total = util.totalPriceProduct(listProduct);
            
           
            session.setAttribute("CARTITEM", listProduct);
            session.setAttribute("TOTAL", total);
            request.setAttribute("ADDTOCART_MSG", msg);
        } catch (Exception e) {
            log("Error At AddToCartController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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

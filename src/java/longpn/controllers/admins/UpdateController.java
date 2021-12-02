/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.controllers.admins;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longpn.lastupdate.LastUpdateDAO;
import longpn.lastupdate.LastUpdateDTO;
import longpn.products.ProductDAO;
import longpn.products.ProductDTO;
import longpn.users.UserDTO;


@WebServlet(name = "UpdateController", urlPatterns = {"/UpdateController"})
public class UpdateController extends HttpServlet {
    
    private static final String ERROR = "SearchController";
    private static final String SUCCESS = "SearchController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String msg = "";
            UserDTO user = (UserDTO) session.getAttribute("LOGIN");
            LastUpdateDAO lastUpdateDAO = new LastUpdateDAO();
            String productID = request.getParameter("productID");
            String nameProduct = request.getParameter("nameProduct");
            String image = request.getParameter("image");
            String description = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String createDate =request.getParameter("createDate");
            String expirationDate = request.getParameter("expirationDate");
            int categoryID = Integer.parseInt(request.getParameter("categoryID"));
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            ProductDAO productDAO = new ProductDAO();
            ProductDTO productDTO = new ProductDTO(productID, nameProduct, image, description, price, quantity, createDate, expirationDate, categoryID, status);
            boolean check = productDAO.updateProduct(productDTO);
            if(check){
                LastUpdateDTO lastUpdate = new LastUpdateDTO(user.getFullname(), "Update", "");
                lastUpdateDAO.insertLastUpdate(lastUpdate);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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

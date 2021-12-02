/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.controllers.admins;

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
import longpn.users.UserDTO;


@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

    private static final String ERROR = "error.html";
    private static final String USER_PAGE = "shopping.jsp";
    private static final String ADMIN_PAGE = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            String search = request.getParameter("search").trim();
            ProductDAO productDAO = new ProductDAO();

            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN");
            List<ProductDTO> list = null;

            //Paging
            int pageLoad;
            if (request.getParameter("page") == null) {
                pageLoad = 1;
            } else {
                pageLoad = Integer.parseInt(request.getParameter("page"));
            }
            double page = Math.ceil(productDAO.getCountAllProduct() / 15);
            request.setAttribute("page", page);
            if (user == null) {
                list = productDAO.getListProductForUser(search, pageLoad);
            } else if (user.isIsAdmin() == false) {
                list = productDAO.getListProductForUser(search, pageLoad);
            } else if (user.isIsAdmin() == true) {
                list = productDAO.getListProductForAdmin(search, pageLoad);
            }
            if (!list.isEmpty()) {
                request.setAttribute("LIST_PRODUCT", list);
                url = USER_PAGE;
                if (user.isIsAdmin() == true) {
                    url = ADMIN_PAGE;
                } else {
                    url = USER_PAGE;
                }
            }
        } catch (Exception e) {
            log("ERROR at SearchCakeController: " + e.getMessage());
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

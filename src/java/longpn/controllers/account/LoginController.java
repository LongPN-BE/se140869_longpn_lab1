/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.controllers.account;

import java.io.IOException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import longpn.lastupdate.LastUpdateDAO;
import longpn.users.UserDAO;
import longpn.users.UserDTO;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR = "error.html";
    private static final String ADMIN = "home.jsp";
    private static final String USER = "SearchController?search=";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        LastUpdateDAO lastUpdateDAO = new LastUpdateDAO();
        UserDAO userDAO = new UserDAO();
        String url = ERROR;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            UserDTO userDTO = userDAO.checkLogin(username, password);
            HttpSession session = request.getSession();

            if (userDTO != null) {
                session.setAttribute("LOGIN", userDTO);
                session.setAttribute("LAST_UPDATE", lastUpdateDAO.getLastUpdateUser());
                boolean isAdmin = userDTO.isIsAdmin();
                if (isAdmin == true) {
                    url = ADMIN;
                } else {
                    url = USER;
                }
            } else {
                url = ERROR;
            }

        } catch (Exception e) {
            log("ERROR at LoginController: " + e.getMessage());

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

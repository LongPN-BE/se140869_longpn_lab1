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
import longpn.orderdetails.OrderDetailDAO;
import longpn.orderdetails.OrderDetailsDTO;

@WebServlet(name = "ViewDetailsAdminController", urlPatterns = {"/ViewDetailsAdminController"})
public class ViewDetailsAdminController extends HttpServlet {
private static final String VIEW_DETAILS_ADMIN = "viewDetailsAdmin.jsp";
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
            String orderID = request.getParameter("orderID");
            HttpSession session = request.getSession();

            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            List<OrderDetailsDTO> listOrderDetails = null;
            listOrderDetails = orderDetailDAO.getListOrderDetails(orderID);
            session.setAttribute("LIST_ORDER_DETAILS_ADMIN", listOrderDetails);

        } catch (Exception e) {
            log("Error at ViewDetailsAdminController:" + e.toString());
        } finally {
            response.sendRedirect(VIEW_DETAILS_ADMIN);
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
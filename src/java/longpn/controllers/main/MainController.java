/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpn.controllers.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String SHOPPING_PAGE = "SearchController?search=";
    private static final String LOGIN_PAGE = "login.html";
    private static final String HOME_PAGE = "SearchController?search=";
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    private static final String SEARCH = "SearchController";

    private static final String UPDATE = "UpdateController";
    private static final String INSERT_PAGE = "insert.jsp";
    private static final String CART = "CartController";

    private static final String INSERT = "InsertController";
    private static final String ADDITEM = "AddToCartController";
    private static final String DELETE_CART = "DeleteCartController";
    private static final String UPDATE_CART = "UpdateCartController";
    private static final String CHECKOUT_CART = "CheckoutCartController";
    private static final String CHECKOUTNOTLOG_CART = "CheckoutCartNotLogController";
    private static final String VIEW_ORDER = "ViewOrderController";
    private static final String VIEW_DETAILS = "ViewDetailsController";
    private static final String VIEW_ORDER_ADMIN = "ViewOrderAdminController";
    private static final String ADMIN_PAGE = "home.jsp";
    private static final String VIEW_DETAILS_ADMIN = "ViewDetailsAdminController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("action");
        try {
            if (action == null) {
                url = SHOPPING_PAGE;
            } else if (action.equals("HomePage")) {
                url = HOME_PAGE;
            } else if (action.equals("LoginPage")) {
                url = LOGIN_PAGE;
            } else if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("Update")) {
                url = UPDATE;
            } else if (action.equals("insertPage")) {
                url = INSERT_PAGE;
            } else if (action.equals("Insert")) {
                url = INSERT;
            } else if (action.equals("ViewCart")) {
                url = CART;
            } else if (action.equals("addToCart")) {
                url = ADDITEM;
            } else if (action.equals("deleteCart")) {
                url = DELETE_CART;
            } else if (action.equals("updateCart")) {
                url = UPDATE_CART;
            } else if (action.equals("checkOutCart")) {
                url = CHECKOUT_CART;
            } else if (action.equals("CheckOutNotLog")) {
                url = CHECKOUTNOTLOG_CART;
            } else if (action.equals("ViewOrder")) {
                url = VIEW_ORDER;
            } else if (action.equals("ViewDetails")) {
                url = VIEW_DETAILS;
            } else if (action.equals("ViewOrderAdmin")) {
                url = VIEW_ORDER_ADMIN;
            } else if (action.equals("AdminHomePage")) {
                url = ADMIN_PAGE;
            } else if (action.equals("ViewDetailsAdmin")) {
                url = VIEW_DETAILS_ADMIN;
            }

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

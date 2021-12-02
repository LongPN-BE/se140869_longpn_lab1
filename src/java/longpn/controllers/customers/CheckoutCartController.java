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
import longpn.orderdetails.OrderDetailDAO;
import longpn.orderdetails.OrderDetailsDTO;
import longpn.orders.OrderDAO;
import longpn.orders.OrderDTO;
import longpn.products.ProductDAO;
import longpn.products.ProductDTO;
import longpn.users.UserDTO;
import longpn.utils.ProductUtils;

@WebServlet(name = "CheckoutCartController", urlPatterns = {"/CheckoutCartController"})
public class CheckoutCartController extends HttpServlet {

    private static final String SHIP_INFORMATION_PAGE = "shipInformation.html";
    private static final String HOME_PAGE = "SearchController?search=";
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
        String url = SHIP_INFORMATION_PAGE;
        try {

            ProductUtils util = new ProductUtils();
            HttpSession session = request.getSession(false);

            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            ProductDAO productDAO = new ProductDAO();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN");
            List<ProductDTO> listProduct = (List<ProductDTO>) session.getAttribute("CARTITEM");
            
            int newQuantity = Integer.parseInt(request.getParameter("quantity"));
            String productID = request.getParameter("productID");
            int oldQuantity = productDAO.getOldQuantity(productID);
            if (newQuantity > oldQuantity) {
              String  msg = "The quantity not enough";
              request.setAttribute("UPDATE_MSG", msg);
              url = CART_PAGE;
            } else {
                if (user == null) {
                    url = SHIP_INFORMATION_PAGE;
                } else {
                    String orderCode = util.getAlphaNumericString(10);
                    if (orderDAO.checkOrderIdIsExist(orderCode)) {
                        orderCode = util.getAlphaNumericString(11);
                    }
                    float total = (float) session.getAttribute("TOTAL");
                    OrderDTO orderDTO = new OrderDTO(orderCode, user.getFullname(), user.getPhoneNo(),
                            user.getEmail(), user.getAddress(), "", total, user.getUserID());

                    if (orderDAO.saveOrderForLogin(orderDTO)) {
                        for (int i = 0; i < listProduct.size(); i++) {
                            OrderDetailsDTO orderDetailsDTO = new OrderDetailsDTO(orderCode, listProduct.get(i).getProductID(),
                                    listProduct.get(i).getQuantity(), listProduct.get(i).getPrice());
                            //Save Product into OrderDetails
                            if (orderDetailDAO.saveOrderDetail(orderDetailsDTO)) {
                                int newQuantity01 = listProduct.get(i).getQuantity();
                                int oldQuantity01 = productDAO.getOldQuantity(listProduct.get(i).getProductID());
                                int totalQuantity = oldQuantity01 - newQuantity01;
                                productDAO.updateProductQuantity(listProduct.get(i).getProductID(), totalQuantity);
                            }
                        }
                        url = HOME_PAGE;
                        session.setAttribute("CARTITEM", null);
                    } else {
                        url = CART_PAGE;
                    }
                }
            }

        } catch (Exception e) {
            log("Error At CheckoutCart:" + e.toString());
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
